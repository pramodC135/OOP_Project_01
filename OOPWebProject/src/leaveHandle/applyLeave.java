package leaveHandle;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.dbConnect;
import model.leave;

/**
 * Servlet implementation class applyLeave
 */
@WebServlet("/applyLeave")
public class applyLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public applyLeave() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		leave le=new leave();
		le.seteId(request.getParameter("eId"));
		le.setlType(request.getParameter("lType"));
		le.setDescription(request.getParameter("description"));
		le.setsDate(request.getParameter("sDate"));
		le.seteDate(request.getParameter("eDate"));
		System.out.print(le.geteId());
		System.out.print(le.getlType());	
		System.out.print(le.getDescription());		
		System.out.print(le.getsDate());		
		System.out.print(le.geteDate());	
		dbConnect db=new dbConnect();
		try {
			db.applyLeaveDb(request,response,le);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
