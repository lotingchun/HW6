<%
session.setAttribute("UserId",null);
session.invalidate();
response.sendRedirect("index.html");
%>
