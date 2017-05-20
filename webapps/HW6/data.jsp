<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id = "database" class = "com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029031" />
  <jsp:setProperty property="user" name="database" value="4104029031" />
  <jsp:setProperty property="password" name="database" value="Ss4104029031!" />
</jsp:useBean>
<%
  request.setCharacterEncoding("UTF-8");
  if((session.getAttribute("UserId") == null) || (session.getAttribute("UserId") == "")){
    %>
    你沒有登入喔!<br/>
    <%response.setHeader("Refresh","1, URL = index.html");
  }else{
    %>
    <h1 id="title" class="hidden"><span id="logo">WELCOME <span><%=session.getAttribute("UserId")%></span></span></h1>


    <center><button class="btn btn-primary" onclick="window.open('logout.jsp','_self')">登出</button></center>
  <%}
  database.connectDB();
  database.query("select * from list;");
  ResultSet rs = database.getRS();
  String UserId=(String)session.getAttribute("UserId");
%>
<html lang="en">
  	<meta charset="utf-8">
<HEAD>
  <TITLE>登入畫面</TITLE>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

  <link rel="stylesheet" href="css/animate.css">
  <!-- Custom Stylesheet -->
  <link rel="stylesheet" href="css/style.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <style>
  .btn-primary{
      background-color: #4CAF50;
      color: white;
      border: 2px solid #4CAF50;
  }

  .btn-primary:hover {
      background-color:white;
      color:black;
  }
    </style>
</HEAD>
<BODY>
  <% if(rs.next()){
    if(UserId.equals(rs.getString("UserId"))){
    request.setCharacterEncoding("UTF-8");
    String password=rs.getString("password") ;
    String name=rs.getString("name") ;
    String birthday=rs.getString("birthday") ;
    String memo=rs.getString("memo") ;
    %>
    <h3 class="box-title">資料畫面</h3>
    <p>帳號：<%=UserId%></p>
    <p>用戶姓名：<%=name%></p>
    <p>密碼：<%=password%></p>
    <p>生日：<%=birthday%></p>
    <p>memo：<%=memo%></p>
     <button class="btn btn-primary" onclick="window.open('logout.jsp','_self')">登出</button>
            <%}}%>


</BODY>
</html>
