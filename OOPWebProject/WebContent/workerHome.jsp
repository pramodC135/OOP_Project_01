<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	 	body{
 	margin:0;
 	padding:0;
 	
 	background-size: cover;
 	font-family: garamond;
 	overflow-x:hidden;
 	}
 	.header{ 
	   width: auto;  
	   height: 50px;    
	   background-color: #eee; 
	   opacity: 0.6;
    filter: alpha(opacity=60);
    border-bottom: 1px solid gray; 
	  }

.container{

    width:1115px;
    height:200px;
    padding-left:100px;
    padding-right:100px;
    padding-top: 20px;
    position: relative;
}
.slideShow{
    width:1115px;
    height:300px;
    padding-left:250px;
    padding-right:100px;
    position: relative;
    padding-top:2px;
}
footer{    
	    width: 100%; 
	    margin: auto;  
	    height: 20px; 
	    background-color: gray;
	    color: white;  
	    text-align: center; 
	    padding: 5px; 
	    float: left;  
	  }
</style> 
</head>
<body><%if(session.getAttribute("userName")==null)
				response.sendRedirect("login.jsp");
			 %>
<div class="header">

</div>
<center>
<div class="sideMenu">
    

 
 	<h4><a href="applyLeave.jsp">Apply Leave</a></h4><br/> 
 	<h4><a href="checkSalary.jsp">Check Salary</a></h4> <br/>
 	<h4><a href="leaveConfirmList.jsp">View Leave Confirm List</a></h4> <br/> 
 	<h4><a href="logOut.jsp">Log Out</a></h4> <br/> 
    
</div> 
</center>
</center> 
 <center>   
 <div class="footer">
   <footer>
        Copyright @ Company private Ltd, 2018 - All rights Reserved
    </footer>
</div>    <!-- end footer -->  
</center>
</body>
</html>