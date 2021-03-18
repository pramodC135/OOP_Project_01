<%@page import="model.Employee"%>
<%@page import="services.addEmployee"%>
<%@page import="dbConnection.dbConnect"%>
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
 <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/dashboard.css" rel="stylesheet">
</head>
<body><%	if(session.getAttribute("userName")==null)
				response.sendRedirect("login.jsp");
dbConnect.employeeCount(); %>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          
        </div>
        
      </div>
    </nav>
<br>
<br>
<br>


<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="home.jsp">Dashboard <span class="sr-only">(current)</span></a></li>
            <li><a href="register.jsp">Add Employee</a></li>
            <li><a href="search.jsp">Update Deatails</a></li>
            <li><a href="logOut.jsp">Sign Out</a></li>
 		</ul>
        </div>
        </div>
        </div>
 <!-- counts***************************************************************************************** -->
  <table class="table">
<tr><th style="width :25%">
</th>
<th style="width :80%">
  
  <div class="row">
                    <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">No. of Employees</h3>
                            <ul class="list-inline two-part">
                                <li>
                                    <div id="sparklinedash"></div>
                                </li>
                                <li class="text-right"><i class="ti-arrow-up text-success"></i> <span class="counter text-success"><h2><%=Employee.idCount%></h2></span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">Last Update Name</h3>
                            <ul class="list-inline two-part">
                                <li>
                                    <div id="sparklinedash2"></div>
                                </li>
                                <li class="text-right"><i class="ti-arrow-up text-purple"></i> <span class="counter text-purple"><h2><%
                                																							if(Employee.lastUpdateName==null)
                                																								out.println("");
                                																							else
                                																								out.println(Employee.lastUpdateName);%><h2></span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 col-xs-12" style="background-color: #777">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">Welcome :<%=session.getAttribute("userName")%></h3>
                            <ul class="list-inline two-part">
                                <li>
                                    <div id="sparklinedash3"></div>
                                </li>
                                <li class="text-right"><i class="ti-arrow-up text-info"></i> <span class="counter text-info">   </span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                </th>
</tr></table>
<!-- end Counts *************************************************************************** -->
       


<table class="table table-striped">
<tr><th style="width :16%">
</th>
<th style="width :80%">
<h2 class="sub-header">Employees</h2>
          <div class="table-responsive">
            <table class="table table-striped" style="width: 100%">
            
          
		<tr>
			<th style="width :5%">ID</th>
			<th style="width :15%">Name</th>
			<th style="width :10%">NIC</th>
			<th style="width :8%">Gender</th>
			<th style="width :10%">Phone Number</th>
			<th style="width :4%">Age</th>
			<th style="width :15%">Address</th>
			<th style="width :8%">Position</th>
			<th style="width :15%">Email</th>
		</tr>
		<%
		try{
		
			java.sql.Statement st=dbConnect.getConnection().createStatement();
			ResultSet rs=st.executeQuery("select * from employee order by name asc");


			while(rs.next()) {
			
		
				%>
	
				<tr>
				<td><%=rs.getString(1)%></td>
				
				<td><%=rs.getString(2)%></td>
			
				<td><%=rs.getString(3) %></td>
				
				<td><%=rs.getString(4) %></td>
				
				<td><%=rs.getString(5) %></td>
				
				<td><%=rs.getString(6) %></td>
					
				<td><%=rs.getString(7) %></td>
				
				<td><%=rs.getString(8)	%></td>
				
				<td><%=rs.getString(9) %></td>
				
			
				</tr>
		<% 
			
			}
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}

		
		%>
		
	
	</table>
</div>

</th>
</tr></table>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>