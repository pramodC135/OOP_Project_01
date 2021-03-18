<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><fieldset>
<legend><h1>Apply Leave</h1></legend>
<div class=lForm>
<form action="applyLeave" method="post">
		<table>


			<tr>		<!-- Row 2-->
				<td>Employee ID :</td>
				<td><input type="text" name="eId" placeholder="EM *** *** ***" value="<%=session.getAttribute("userName")%>" required></td>
				
			</tr>

			<tr>		<!-- Row 5 -->
				<td>Leave Type :</td>
				<td>
				<select class="form-control" name="lType" id="lType">
			        <option value="earned" selected="selected">Earned</option>
			        <option value="noPay">No Pay</option>
			
		        </select>
				
				</td>
			</tr>
			

			<tr>		<!-- Row 7 -->
				<td>Description :</td>
				<td><input type="text" name="description" value="" required></td>
				
			</tr>

			<tr>		<!-- Row 9 -->
				<td>Starting Date :</td>
				<td><input type="date" name="sDate" value="" required></td>
				<td>
				</td>
			</tr>
			<tr>		<!-- Row 10 -->
				<td>End Date :</td>
				<td><input type="date" name="eDate" value="" required></td>
			
			</tr>
			<tr>
				<td><input type="reset" name="reset" value="Reset"></td>
				<td><input type="submit" name="submit" value="Submit"></td>
			</tr>

		</table>
	</form>
	</div>	<!-- End lForm --></fieldset>
	</center>
</body>
</html>