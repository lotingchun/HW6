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
  String UserId = request.getParameter("UserId");
  String password = request.getParameter("password");
%>
<HTML>
<HEAD><TITLE>登入畫面</TITLE></HEAD>
<BODY >
  <% if(rs !=null){
    while(rs.next()){
    if(UserId.equals(rs.getString("UserId"))){
    if(password.equals(rs.getString("password"))){
    request.setCharacterEncoding("UTF-8");
    String name=rs.getString("name") ;
    String birthday=rs.getString("birthday") ;
    String memo=rs.getString("memo") ; %>

    <h3 class="box-title">登入成功</h3>
    <p>帳號：<%=UserId%></p>
    <p>用戶姓名：<%=name%></p>
    <p>密碼：<%=password%></p>
    <p>生日：<%=birthday%></p>
    <p>memo：<%=memo%></p>
    <button class="btn btn-primary" onclick="window.open('index.html','_self')">回到上一頁</button>
            <% }else{ %>
              <h2>可能打錯帳密喔!!</h2>
              <button class="btn btn-primary" onclick="window.open('index.html','_self')">回到上一頁</button>
              <p>還沒有帳號嗎↓</p>
              <button class="btn btn-primary" onclick="window.open('create.html','_self')">創立新帳號</button>
            <%}
          }}}
           if(UserId.equals("")||password.equals("")){
           %>
           <h2>可能打錯帳密喔!!</h2>
           <button class="btn btn-primary" onclick="window.open('index.html','_self')">回到上一頁</button>
           <p>還沒有帳號嗎↓</p>
           <button class="btn btn-primary" onclick="window.open('create.html','_self')">創立新帳號</button>
           <%}%>

</BODY>
</HTML>
