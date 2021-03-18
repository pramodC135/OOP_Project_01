<%@page import="model.leave"%>
<%@page import="dbConnection.dbConnect"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>Leave Id</th>
			<th>Employee Id</th>
			<th>Confirm Date</th>
			<th>Starting Date </th>
			<th>Ending Date</th>
		</tr>
		<tr>
		<%
	try{	
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select * from leaveconfirm order by employeeID asc");
		
		while(rs.next()) {
		
			%>
			
			
			<td><%String ID=rs.getString(1);
					out.println(ID);	%></td>
			
			<td><%=rs.getString(2)%></td>
		
			<td><%=rs.getString(3) %></td>
			
			<td><%=rs.getString(4) %></td>
			
			<td><%=rs.getString(5) %></td>
			

		</tr>
				
				<%

		
		}	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		%>
				
</table>
</body>
</html>