package com.bean;

import java.sql.*;
import java.lang.*;

public class Connect {
    static String dbuser="root";  //数据库用户名
    static String dbpass="root";  //数据库密码
    String driverstr = "com.mysql.cj.jdbc.Driver";  //连接驱动
    static String url="jdbc:mysql://localhost:3306/Book?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    private Connection conn=null;
    private Statement stmt=null;
    public Connect()//连接数据库
    {
        try {
            Class.forName(driverstr);
            conn = DriverManager.getConnection(url, dbuser, dbpass);
            stmt = conn.createStatement();
        }
        catch (Exception e){
            System.out.println("无法连接数据库");
        }
    }
    public boolean isuser(String user,String passwd)//判断数据库中是否有该用户
    {
        ResultSet rs = null;
        String s = "SELECT * from users where ID='"+user+"' and passwd=md5('"+passwd+"')";//使用sql中的md5函数进行加密，否则密码会大小写不分
        try {
            rs = stmt.executeQuery(s);//执行查询语句并返回结果
            if(rs.next())
            {
                return true;
            }
            else
                {
                    return false;
                }
        }
        catch (Exception e) {
            return false;
        }
    }
    public int execupdate(String s)//更新数据库数据
    {
        int result = 0;
        try
        {
            result = stmt.executeUpdate(s);
        }
        catch (Exception e)
        {
            System.out.println("更新错误");
        }
        return result;
    }
    public ResultSet execquary(String s)//查询数据库数据
    {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(s);
        }
        catch (Exception e)
        {
            System.out.println("查询错误");
        }
        return rs;
    }
    public boolean exec(String s)//执行语句，insert
    {
        boolean result = false;
        try {
            stmt.execute(s);
            result=true;
        }
        catch (Exception e)
        {
            result=false;
            System.out.println("语句执行错误");
        }
        return result;
    }
    public String getPermission(String username)//得到用户权限，权限保存在数据库中
    {
        String s = "call getpermission("+username+");";//sql中的函数
        String ps="user";
        ResultSet rs=null;
        try {
            rs = stmt.executeQuery(s);
            if (rs.next())
            {
                System.out.println(rs.getString(1));
                ps = rs.getString(1);
                return ps;
            }
            else
                return ps;
        }
        catch (Exception e)
        {
            System.out.println("权限看错误");
        }
        return "error";
    }
    public void close()//关闭连接
    {
        try{
            stmt.close();
            conn.close();
        }
        catch(Exception e){}
    }
}
