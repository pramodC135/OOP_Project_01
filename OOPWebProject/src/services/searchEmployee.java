package services;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.dbConnect;

/**
 * Servlet implementation class searchEmployee
 */
@WebServlet("/searchEmployee")
public class searchEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public searchEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String startDate=request.getParameter("startDate");
    	String endDate=request.getParameter("endDate");
    	String dateType=request.getParameter("dateType");
    	dbConnect db=new dbConnect();
    	
    	try {
			db.dateRange(request,response,startDate,endDate,dateType);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result=request.getParameter("searchEmp");
		dbConnect db=new dbConnect();
		
		

			try {
				db.employeeDetail(request,response,result);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
