<%@page import="dbConnection.dbConnect"%>
<%@page import="model.Employee"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
 <link href="css/bootstrap.min.css" rel="stylesheet">

 <link href="css/dashboard.css" rel="stylesheet">
<script src="jquery.min.js"></script>
     
<style>
#tableMy {
    position: absolute;
    left: 215px;
}
</style>
</head>
<body><%	if(session.getAttribute("userName")==null)
				response.sendRedirect("login.jsp");
			%>

<nav class="navbar navbar-inverse navbar-fixed-top">

    </nav>
<br>
<br>
<br>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        

          <ul class="nav nav-sidebar">
            <li><a href="home.jsp">Dashboard </a></li>
            <li ><a href="register.jsp">Add Employee</a></li>
            <li class="active"><a href="search.jsp">Update Deatails<span class="sr-only">(current)</span></a></li>
            <li><a href="logOut.jsp">Sign Out</a></li>
 		</ul>
        </div>
        </div>
        </div>
<div id="tableMy">
<table class="table table-striped" style="width :100%">
<tr><th style="width :50">
</th>
<th style="width :50">

<div style="float :right">

<form action="searchEmployee" method="post">
<div class="container">
	<div class="form-group">
		<div class="col-sm-5">
			<div class="input-group">
				<input type="text" name="searchEmp" class="form-control" placeholder="Search">
				
				<div class ="input-group-btn">
					<button type="submit" value="search" class="btn btn-default"><span class="glayphicon-search"></span>Search</button>
				</div>
			</div>
		
		</div>
	</div>
	</div></form></div><br><div>
	<table class="table table-bordered table-striped" style="width: 90%">
		<tr>
			<th style="width :5%">ID</th>
			<th style="width :15%">Name</th>
			<th style="width :15%">NIC</th>
			<th style="width :5%">Gender</th>
			<th style="width :15%">Phone Number</th>
			<th style="width :8%">Age</th>
			<th style="width :15%">Address</th>
			<th style="width :10%">Position</th>
			<th style="width :15%">Email</th>
			<th style="width :10%">Reg. Date</th>
			<th style="width :10%">Update Date</th>
		</tr>
		<%
		try{
			ArrayList<Employee> empList= (ArrayList<Employee>)request.getAttribute("employeeSet");	

				for(Employee em: empList) {
				%>
				<tr>
				<td><%=em.geteID()%></td>
				
				<td><%=em.geteName()%></td>
			
				<td><%=em.geteNIC() %></td>
				
				<td><%=em.geteGender() %></td>
				
				<td><%=em.getePhone() %></td>
				
				<td><%=em.geteAge()%></td>
					
				<td><%=em.geteAddress()%></td>
				
				<td><%=em.getePosition()%></td>
				
				<td><%=em.geteEmail() %></td>
				
				<td><%=em.geteRegDate() %></td>
								
				<td><%if(em.geteUpdateDate()==null)
							out.println("Not Update");
				    	else 
				    		out.println(em.geteUpdateDate());
						%></td>
					
					
				<td><form method="POST" action="updateEmployee">
				<input type="hidden" name="employeeID" value="<%=em.geteID()%>"/>
				 <input type="submit" value= "Edit" class="select-button" /> 
				 </form></td>
				 <%if(!(em.geteID().equals(session.getAttribute("userName")))){ %>
				 <td><form method="POST" action="deleteEmployee">
				<input type="hidden" name="employeeID" value="<%=em.geteID()%>"/>
				 <input type="submit" value= "Delete" class="select-button" /> 
				 </form></td>
				<%} %>
				</tr>
				
				
		<%
		
			}
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		%>
		
	
	</table>
</div>
<div style="float :right">

<form action="searchEmployee" method="get">
<div class="container">
	<div class="form-group">
		<div class="">
			<div class="input-group"><table>

			<tr><th><input type="text" name="startDate" class="form-control" placeholder="YYYY-MM-DD" style="width :200%"></th>
				<th><input type="text" name="endDate" class="form-control" placeholder="YYYY-MM-DD" style="width :200%"></th>
				<th><div>
				 <div class="form-check" style="width :10%">
    						<input name="dateType" type="radio" class="with-gap" value="regDate"  checked>
   										 <label for="radio106">Registered Dates</label>
					</div>
				</th><th style="width :10%">
					<div class="form-check">
 						   <input name="dateType" type="radio" class="with-gap" value="updateDate">
  									     <label for="radio107">Updated Date</label>
					</div>
   				</div>
   				</th>
   				
   				
				<th><div class ="input-group-btn" style="width :10%">
					<button type="submit" value="search" class="btn btn-default"><span class="glayphicon-search"></span>Search</button></th></tr>
				</table></div>
			</div>
		
		</div>
	</div>
	</div></form></div>
</th></tr></table></div>

<!-- PrefixFree -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

 <script src="js/index.js"></script>
</body>
</html>