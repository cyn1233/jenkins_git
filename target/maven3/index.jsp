<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" %>
<html>
<head><title>TomcatA</title></head>
<body>

<table align="centre" border="1">
    <tr>
        <td>Session ID</td>
        <td><%= session.getId() %></td>
    </tr>
    <tr>
        <td>Created on</td>
        <td><%= session.getCreationTime() %></td>
    </tr>
</table>
</body>
</html>
sessionID:<%=session.getId()%>
<br>
SessionIP:<%=request.getServerName()%>
<br>
SessionPort:<%=request.getServerPort()%>
<%
    out.println("This is Tomcat Server A");
%>
Server Info:<% out.println(request.getLocalAddr() + " : " + request.getLocalPort()+"<br>");%>
