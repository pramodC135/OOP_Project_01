<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="CheckPayroll" method = "GET">

<table>
	<tr>
	<td>ID:</td>
	<td><%=request.getAttribute("geteId") %></td>
	</tr>
		
		<tr>
	<td>Name:</td>
	<td><%=request.getAttribute("geteName") %></td>
	</tr>
	
		<tr>
	<td>Position:</td>
	<td><%=request.getAttribute("getePosition") %></td>
	</tr>
	
		<tr>
	<td>Basic Salary:</td>
	<td><%=request.getAttribute("getEsalary") %></td>
	</tr>
	
	<tr>
	<td>Bonus:</td>
	<td><%=request.getAttribute("bonus") %></td>
	</tr>
		<tr>
	<td>Salary of the month:</td>
	<td><%=request.getAttribute("totSalary") %></td>
	</tr>


</table>


 <%
    String name=request.getParameter("name");
    String emp=request.getParameter("emp");
    String position=request.getParameter("position");
    String bSal=request.getParameter("bSal");
    String bonus=request.getParameter("bonus");
    String Sal=request.getParameter("Sal"); 
  

    %>

   
</form>
</body>
</html>