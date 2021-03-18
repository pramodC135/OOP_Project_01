<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="addDeleteProject" method="post">
		<table>


			<tr>		<!-- Row 2-->
				<td>Project Name :</td>
				<td><input type="text" name="projectId"  value="" required></td>
				
			</tr>

			<tr>		<!-- Row 7 -->
				<td>Title :</td>
				<td><input type="text" name="title" value="" required></td>
				
			</tr>

			<tr>		<!-- Row 9 -->
				<td>Starting Date :</td>
				<td><input type="date" name="startDate" value="" required></td>
				<td>
				</td>
			</tr>
			<tr>		<!-- Row 10 -->
				<td>End Date :</td>
				<td><input type="date" name="endDate" value="" required></td>
			
			</tr>
			<tr>
				<td><input type="reset" name="reset" value="Reset"></td>
				<td><input type="submit" name="submit" value="Submit"></td>
			</tr>

		</table>
	</form>

</center>

</body>
</html>