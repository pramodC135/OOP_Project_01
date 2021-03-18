package payroll;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.Double;
import dbConnection.dbConnect;
import model.Employee;

/**
 * Servlet implementation class checkSalary
 */
@WebServlet("/checkSalary")
public class checkSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkSalary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String empID=request.getParameter("emp");

    	dbConnect db=new dbConnect();
    	
    	try {
			db.deleteSalary(request,response,empID);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
	
	public void calcBonus(HttpServletRequest request, HttpServletResponse response,Employee empSl,Double dayDiff) throws ServletException, IOException {
		System.out.println(empSl.geteID());
		System.out.println(empSl.geteName());
		
		System.out.println(empSl.getePosition());
		
		System.out.println(empSl.getEsalary());
		
		System.out.println(dayDiff);
		Double bonus,totSalary;
		if(dayDiff>14600) {
			bonus=(empSl.getEsalary()*25/100);
		}else if(dayDiff>7300) {
			bonus=(empSl.getEsalary()*15/100);
		}else if (dayDiff>3650) {
			bonus=(empSl.getEsalary()*10/100);
		}else {
			bonus=0.00;			
		}
			totSalary=empSl.getEsalary()+bonus;
			
			request.setAttribute("geteId", empSl.geteID());
			request.setAttribute("geteName", empSl.geteName());
			request.setAttribute("getePosition", empSl.getePosition());
			request.setAttribute("getEsalary", empSl.getEsalary());	
			request.setAttribute("bonus", bonus);
			request.setAttribute("totSalary", totSalary);
			
			request.getRequestDispatcher("showSalary.jsp").forward(request,response);	
			
		}
		
	}


