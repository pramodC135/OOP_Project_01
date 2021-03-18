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
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
 <link href="css/bootstrap.min.css" rel="stylesheet">

 <link href="css/dashboard.css" rel="stylesheet">
<script src="jquery.min.js"></script>
     
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
            <li class="active"><a href="register.jsp">Add Employee<span class="sr-only">(current)</span></a></li>
            <li><a href="search.jsp">Update Deatails</a></li>
            <li><a href="logOut.jsp">Sign Out</a></li>
 		</ul>
        </div>
        </div>
        </div>

<table class="table table-striped">
<tr><th style="width :20%">
</th>
<th style="width :80%">

  <form class="form-horizontal" action="addEmployee" method="post"  id="reg_form">
    <fieldset>
      
      <!-- Form Name -->
      <legend> Personal Information </legend>
    
    
   
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Full Name</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="first_name" placeholder="Full Name" class="form-control"  type="text">
          </div>
        </div>
      </div>
      
      
            <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">NIC (V/v)</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input name="nic" placeholder="000-000-0000" class="form-control" min="0000000000" type="text"  maxlength="10" >
          </div>
        </div>
      </div>
      
      
    <div class="form-group">
        <label class="col-md-4 control-label">Gender</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  
   <div class="btn btn-default">
   	<input type="radio" name="gender" value="Male" checked="checked">Male
   </div>
   <div class="btn btn-default">
   	<input type="radio" name="gender" value="Female">Female
   </div>   
   </div>             
        </div>
      </div>
      
      
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Phone No</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <input name="phone" placeholder="(000)000-0000" class="form-control" type="text" maxlength="10">
          </div>
        </div>
      </div>
      
      
           
      <div class="form-group">
        <label class="col-md-4 control-label">Age</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input name="age" placeholder="Age" class="form-control" min="18" type="text" maxlength="2" required="required">
          </div>
        </div>
      </div> 
      
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">Address</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input name="address" placeholder="Address" class="form-control" type="text">
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
            <input name="email" placeholder="E-Mail Address" class="form-control"  type="text">
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
</th></tr></table>

<!-- PrefixFree -->
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

 <script src="js/index.js"></script>

    




</body>
</html>