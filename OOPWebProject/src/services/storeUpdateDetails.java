package services;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.dbConnect;
import model.Employee;

/**
 * Servlet implementation class storeUpdateDetails
 */
@WebServlet("/storeUpdateDetails")
public class storeUpdateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public storeUpdateDetails() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Employee emp=new Employee();
		emp.eID=String.valueOf(Employee.id);
		emp.seteName(request.getParameter("first_name"));
		emp.seteNIC(request.getParameter("nic"));
		emp.seteGender(request.getParameter("gender"));
		emp.setePhone(request.getParameter("phone"));
		emp.seteAge(request.getParameter("age"));
		emp.seteAddress(request.getParameter("address"));
		emp.setePosition(request.getParameter("position"));
		emp.seteEmail(request.getParameter("email"));
		emp.setePassword(request.getParameter("password"));
		System.out.println(emp.geteID());
		Employee.lastUpdateName=emp.geteName();
		
		dbConnect db=new dbConnect();
		
			try {
				db.storeEditDetails(request,response,emp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		
		
		
	}

}
