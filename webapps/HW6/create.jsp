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
  database.connectDB();
  database.query("select * from list;");
  ResultSet rs = database.getRS();
  request.setCharacterEncoding("UTF-8");
  String UserId = request.getParameter("UserId");
  String name = request.getParameter("name");
  String password = request.getParameter("password");
  String birthday = request.getParameter("birthday");
  String memo=request.getParameter("memo");
  String message="";
  if(UserId != null && name != null && password != null && birthday != null&& birthday != memo){
    database.connectDB();
    database.insertData(UserId,name,password,birthday,memo);
    message="註冊成功";
    }else{
    message="註冊失敗";
    }
%>
<HTML>
<HEAD><TITLE>註冊</TITLE>
<style>
body {
  background: url("images/photo1.jpg") no-repeat center center fixed;
  background-size: cover;
  font-size: 20px;
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  margin: 0;
  color: 	#000000;
}
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
      <h4 class="page-title"><%=message%></h4> </div>
      帳號：<%=UserId%><br>
      用戶姓名：<%=name%><br>
      密碼：<%=password%><br>
      生日：<%=birthday%><br>
      memo：<%=memo%><br>
      <button class="btn btn-primary" onclick="window.open('index.html','_self')">確定</button>
</BODY>
</HTML>
