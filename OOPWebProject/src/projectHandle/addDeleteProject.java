package projectHandle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.dbConnect;

/**
 * Servlet implementation class addDeleteProject
 */
@WebServlet("/addDeleteProject")
public class addDeleteProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDeleteProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		try {
			String pID=request.getParameter("projectId");
			String q="delete from projectlist where projectid=?;";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
			pa.setString(1,pID);
			
			pa.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			request.getRequestDispatcher("managerPage.jsp").forward(request,response);
		
		}
		
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
			try {
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","root");
		String q="insert into projectlist(projectName,startDate,endDate)values(?,?,?)";
		PreparedStatement pa=con.prepareStatement(q);


		pa.setString(1,request.getParameter("title"));
		pa.setDate(2,Date.valueOf(request.getParameter("startDate")));
		pa.setDate(3,Date.valueOf(request.getParameter("endDate")));

		pa.execute();
		request.getRequestDispatcher("managerPage.jsp").forward(request,response);
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Error:"+e);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		

	}
	

}
