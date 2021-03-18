package leaveHandle;
import model.leave;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.dbConnect;

/**
 * Servlet implementation class leaveConfirmDelete
 */
@WebServlet("/leaveConfirmDelete")
public class leaveConfirmDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public leaveConfirmDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String result=request.getParameter("leaveID");

		
		
		dbConnect db=new dbConnect();
		

		try {
			db.leaveDelete(request,response,result);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String result=request.getParameter("leaveID");
		leave le=new leave();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		Connection	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","root");
		java.sql.Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from leaveapply where leID='"+result+"'");
		rs.next();
		String leID= rs.getString(1);	
		
			le.seteId(rs.getString(2));	
	
			le.setlType(rs.getString(3));	

			le.setDescription(rs.getString(4));	

			le.setCurrentDate(rs.getString(5));	

			le.setsDate(rs.getString(6));	

			le.seteDate(rs.getString(7));	
	
System.out.println(le.getCurrentDate());
System.out.println(le.getDescription());
System.out.println(le.geteDate());		
System.out.println(le.geteId());		
System.out.println(le.getlType());		
System.out.println(le.getsDate());	

	dbConnect db=new dbConnect();
		

	
			
			db.leaveConfirm(request,response,leID,le);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		
		
		}

}
