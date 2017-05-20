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

%>
<HTML>
<HEAD><TITLE>查詢畫面</TITLE>

<style>
body {
	background: url("images/photo1.jpg") no-repeat center center fixed;
	background-size: cover;
	font-size: 16px;
	font-family: 'Lato', sans-serif;
	font-weight: 300;
	margin: 0;
	color: 	#000000;
}
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #00AA55}

th {
    background-color: #4CAF50;
    color: white;
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
<body>
  <table>
  <tr>
   <td>帳號</td>
    <td>用戶姓名</td>
    <td>密碼</td>
    <td>生日</td>
    <td>memo</td>
       </tr>

  <% if(rs !=null){
    while(rs.next()){
    request.setCharacterEncoding("UTF-8");
    String name=rs.getString("name") ;
    String UserId = rs.getString("UserId");
    String password=rs.getString("password");
    String birthday=rs.getString("birthday");
    String memo=rs.getString("memo") ;

    %>
  <tr>
    <td><%=UserId%></td>
    <td><%=name%></td>
    <td><%=password%></td>
    <td><%=birthday%></td>
    <td><%=memo%></td>
  </tr>
   <%}}%>
</table>



 <button class="btn btn-primary" onclick="window.open('index.html','_self')">回到上一頁</button>

</BODY>
</HTML>
