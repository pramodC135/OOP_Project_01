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
			<th>Leave Id(LI)</th>
			<th>Employee Id(EM)</th>
			<th>Leave Type</th>
			<th>Description</th>
			<th>Apply Date</th>
			<th>Starting Date </th>
			<th>Ending Date</th>
		</tr>
		<tr>
		<%
	try{	
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select * from leaveapply order by applyDate asc");
		
		while(rs.next()) {
		
			%>
			
			
			<td><%String ID=rs.getString(1);
					out.println(ID);	%></td>
			
			<td><%=rs.getString(2)%></td>
		
			<td><%=rs.getString(3) %></td>
			
			<td><%=rs.getString(4) %></td>
			
			<td><%=rs.getString(5) %></td>
			
			<td><%=rs.getString(6) %></td>
				
			<td><%=rs.getDate(7) %></td>
				
				<td><form method="POST" action="leaveConfirmDelete">
				<input type="hidden" name="leaveID" value="<%=ID %>"/>
				 <input type="submit" value= "Confirm" class="select-button" /> 
				 </form></td>
		
				 <td><form method="get" action="leaveConfirmDelete">
				<input type="hidden" name="leaveID" value="<%=ID %>"/>
				 <input type="submit" value= "Delete" class="select-button" /> 
				 </form></td></tr>
				
				<%

		
		}	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		%>
				
</table>


</body>
</html>