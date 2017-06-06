<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/4104029031","4104029031","Ss4104029031!");
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM list WHERE " +
                    "UserId = ?");
            ps.setString(1,request.getParameter("UserId"));
            ResultSet res = ps.executeQuery();
            if(res.first()){
                out.print("帳號已被使用");
            }else{
                out.print("帳號可使用");
            }
        }catch (Exception e){
            System.out.println(e);
        }
%>
