<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<div class "headline"><fieldset>
<legend>
<h1>Check Salary</h1></legend>
</div>
<center>
<form action="checkSalary" method="post">
		<table>


			<tr>
				<td>Employee ID :</td>
				<td><input type="text" name="emp" value="<%=session.getAttribute("userName")%>"></td>

			</tr>

			<tr>
				<td><input type="reset" name="cancel" value="Cancel"></td>
				<td><button type="submit">Submit</button> </td>
			</tr>

		</table>
		 
	</form>
	</center></fieldset>
</body>
</html>