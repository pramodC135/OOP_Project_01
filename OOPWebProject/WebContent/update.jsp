<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dbConnection.dbConnect"%>
<%@page import="model.Employee"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="jquery.min.js"></script>
 <style type="text/css">
 	body{
 	margin:0;
 	padding:0;
	 background-color: #eee;
 	background-size: cover;
 	font-family: sans-serif;
 	}
 
 </style>  

<title>Insert title here</title>
</head>

<body class="w3-light-grey" data-gr-c-s-loaded="true">
<%	if(session.getAttribute("userName")==null)
				response.sendRedirect("login.jsp");
			 %>


 
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1600px">


  <!-- Grid -->
  <div class="w3-row w3-padding w3-border">

    <!-- Blog entries -->
    <div class="w3-col l12 s12">
    
      <!-- Blog entry -->
      <div class="w3-container w3-white w3-margin w3-padding-large">
        
          <h2 style="text-align: center"> Upadate Form</h2>
          <br>
          <div class="select-boxes">
    
  <div class="container">
<div class="col-lg-9">
	        <br>
			<br>

  <form class="form-horizontal" action="storeUpdateDetails" method="post"  id="reg_form">
    <fieldset>
      <%
      Employee.id=Integer.valueOf((String)request.getAttribute("ID")); 
      	request.setAttribute("ID",(String)request.getAttribute("ID"));
      %>
      <!-- Form Name -->
      <div>ID:<%out.print((String)request.getAttribute("ID"));%></div>
      <legend> Personal Information :<%out.print((String)request.getAttribute("name"));%></legend>
     
	

    
    
   
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Full Name</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="first_name" placeholder="Full Name" class="form-control"  type="text" value="<%out.print((String)request.getAttribute("name"));%>">
          </div>
        </div>
      </div>
      
      
            <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">NIC (V/v)</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input name="nic" placeholder="000-000-0000" class="form-control" type="text" value="<%out.print((String)request.getAttribute("nic")); %>">
          </div>
        </div>
      </div>
      
      
    <div class="form-group">
        <label class="col-md-4 control-label">Gender</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  
 <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <select name="gender" class="form-control selectpicker" >
              <option value="Male" selected="selected" >Male</option>
              <option value="Female">Female</option>
                        
            </select>
          </div>  
   </div>             
        </div>
      </div>
      
      
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Phone No</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <input name="phone" placeholder="(000)000-0000" class="form-control" type="text" value="<% out.print((String)request.getAttribute("phone")); %>">
          </div>
        </div>
      </div>
      
      
           
      <div class="form-group">
        <label class="col-md-4 control-label">Age</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input name="age" placeholder="Age" class="form-control" type="text" value="<%out.print((String)request.getAttribute("age")); %>">
          </div>
        </div>
      </div> 
      
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Address</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input name="address" placeholder="Address" class="form-control" type="text" value="<%out.print((String)request.getAttribute("address")); %>">
          </div>
        </div>
      </div>

      
      <!-- Select Basic -->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Position</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <select name="position" class="form-control selectpicker" >
              <option value="workers" selected="selected" >Worker</option>
              <option value="manager">Manager</option>
              <option value="admin">Admin</option>
              
            </select>
          </div>
        </div>
      </div>
        
     
       </fieldset>
       	<legend> Account information </legend>
        <fieldset>
        <!-- Text input-->
      <div class="form-group">
        <label class="col-md-4 control-label">E-Mail</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input name="email" placeholder="E-Mail Address" class="form-control"  type="text" value="<%out.print((String)request.getAttribute("email")); %>">
          </div>
        </div>
      </div>
      
      
        <div class="form-group has-feedback">
            <label for="password"  class="col-md-4 control-label">
                    Password
                </label>
                <div class="col-md-6  inputGroupContainer">
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input class="form-control" id="userPw" type="password" placeholder="password" 
                       name="password" data-minLength="5"
                       data-error="some error"
                       value=<%out.print((String)request.getAttribute("password")); %>
                       required/>
                <span class="glyphicon form-control-feedback"></span>
                <span class="help-block with-errors"></span>
                </div>
             </div>
        </div>
        
                <div class="form-group has-feedback">
            <label for="confirmPassword"  class="col-md-4 control-label">
                   Confirm Password
                </label>
                 <div class="col-md-6  inputGroupContainer">
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="Confirm password" 
                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                       data-match-error="some error 2"
                       value=<%out.print((String)request.getAttribute("password")); %>
                       required/>
                <span class="glyphicon form-control-feedback"></span>
                <span class="help-block with-errors"></span>
      			 </div>
             </div>
        </div>
      


     
  
      <!-- Button -->
      <div class="form-group">
        <label class="col-md-4 control-label" ></label>
        <div class="text-center" >
         
          <button type="submit" class="btn btn-primary btn-block" >Submit <span class="glyphicon glyphicon-send"></span></button>
       
        </div>
      </div>
    </fieldset>
  </form>
</div>

</div>

<!-- PrefixFree -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

 <script src="js/index.js"></script>

    </div>

          
            
      </div>
      
    </div>

  </div>

</div>



</body>
</html>