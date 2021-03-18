package services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.dbConnect;
import model.Employee;

/**
 * Servlet implementation class addEmployee
 */
@WebServlet("/addEmployee")
public class addEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
	
		Employee emp=new Employee();
		emp.seteName(request.getParameter("first_name"));
		emp.seteNIC(request.getParameter("nic"));
		emp.seteGender(request.getParameter("gender"));
		emp.setePhone(request.getParameter("phone"));
		emp.seteAge(request.getParameter("age"));
		emp.seteAddress(request.getParameter("address"));
		emp.setePosition(request.getParameter("position"));
		emp.seteEmail(request.getParameter("email"));
		emp.setePassword(request.getParameter("password"));
		Employee.lastUpdateName=emp.geteName();
		
		
		dbConnect db=new dbConnect();
		
			
				try {
					db.addEmployee(request,response,emp);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
	}

}
