package dbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Employee;
import model.leave;
import payroll.checkSalary;
/**
 * Servlet implementation class dbConnect
 */
@WebServlet("/dbConnect")
public class dbConnect{
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection con=null;
		
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","root");
			

		return con;
		
	}
	
	
	///////////////////////////////////////////////////////////////////////////////start admin//////////////////////////////////////////////////////////////
	public void loginControl(HttpServletRequest request,HttpServletResponse response,String userName,String userPassword) throws ClassNotFoundException, SQLException, ServletException, IOException {
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select password,position from employee where empId='"+userName+"'");
		boolean result=rs.next();

		if(result) {
			String password=rs.getString(1);
			String position=rs.getString(2);
			if(userPassword.equals(password)) {
			
				if(position.equals("admin")) {
					
					HttpSession session=request.getSession();
					session.setAttribute("userName", userName);
					request.getRequestDispatcher("home.jsp").forward(request,response);
				}else if(position.equals("manager")) {
					
				
					HttpSession session=request.getSession();
					session.setAttribute("userName", userName);
					request.getRequestDispatcher("managerPage.jsp").forward(request,response);
					
				}else if(position.equals("workers")){
					HttpSession session=request.getSession();
					session.setAttribute("userName", userName);
					request.getRequestDispatcher("workerHome.jsp").forward(request,response);			

				}
			}else {
				String msg="Invalid User ID OR Password";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}
		}else {
		
			String msg="Invalid User ID OR Password";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("login.jsp").forward(request,response);
			
		}
		
		
		
	}
	
	public static void forgetPassword(HttpServletRequest request,HttpServletResponse response,String id,String existPass,String password) throws ClassNotFoundException, SQLException, ServletException, IOException {
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select empId,password from employee where empId='"+id+"'");
		boolean result=rs.next();
		if(result) {
		
		String dbUser=(String)rs.getString(1);
		String dbPassword=rs.getString(2);
		dbConnect.getConnection().close();

	
			
		
	if((dbPassword.equals(existPass))&&(dbUser.equals(id))) {
			String q="update employee set password=? where empId=?";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
		
		
			pa.setString(1,password);
			pa.setString(2,id);

		
	
		
			pa.execute();
			String msg="Password reset success";
			request.setAttribute("msg", msg);
		request.getRequestDispatcher("login.jsp").forward(request,response);
		dbConnect.getConnection().close();
	}}else {
		String msg="Invalid Content";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("login.jsp").forward(request,response);
	

	}
	

	
		
	
}
		
	

		
		
		
	
	
	
	
	
	public static void employeeCount() throws ClassNotFoundException, SQLException {
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet count=st.executeQuery("select count(name) from employee");
		java.sql.Statement st1=dbConnect.getConnection().createStatement();
		ResultSet rs=st1.executeQuery("select * from employee");
		if (rs != null) 
		{
		  rs.beforeFirst();
		  rs.last();
		  Employee.idCount = rs.getRow();
		}
		
		
	}
	
	public static void addEmployee(HttpServletRequest request,HttpServletResponse response,Employee emp) throws IOException, SQLException,java.sql.SQLException, ClassNotFoundException, ServletException{
		
		try {
			String q="insert into employee(name,nic,gender,phone,age,address,position,email,password,regDate) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
			dbConnect.employeeCount();
			long currentDate=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(currentDate);  
			
			//pa.setString(1,Integer.toString(Employee.id));
			pa.setString(1,emp.geteName());
			pa.setString(2,emp.geteNIC());
			pa.setString(3,emp.geteGender());
			pa.setString(4,emp.getePhone());
			pa.setString(5,emp.geteAge());
			pa.setString(6,emp.geteAddress());
			pa.setString(7,emp.getePosition());
			pa.setString(8,emp.geteEmail());
			pa.setString(9,emp.getePassword());
			pa.setString(10,String.valueOf(date));
			pa.execute();
			dbConnect.employeeCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error:"+e);
		}
		request.getRequestDispatcher("home.jsp").forward(request,response);
		
		
	}

	
	public static void employeeDetail(HttpServletRequest request,HttpServletResponse response, String result) throws IOException, SQLException,java.sql.SQLException, ClassNotFoundException, ServletException{
		
		ArrayList<Employee> employeeSet=new ArrayList<>();
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select * from employee where empId='"+result+"' OR name like '"+result+"%' OR regDate like '"+result+"%' OR updateDate like '"+result+"%'");
		
		while(rs.next()) {
			Employee emp=new Employee();
		emp.seteID(rs.getString(1));	
	
		emp.seteName(rs.getString(2));	
	
		emp.seteNIC(rs.getString(3));	

		emp.seteGender(rs.getString(4));	

		emp.setePhone(rs.getString(5));	

		emp.seteAge(rs.getString(6));	

		emp.seteAddress(rs.getString(7));	
	
		emp.setePosition(rs.getString(8));	
	
		emp.seteEmail(rs.getString(9));	
		
		emp.setePassword(rs.getString(10));	
		
		emp.seteRegDate(rs.getString(11));
		
		emp.seteUpdateDate(rs.getString(12));
		
		employeeSet.add(emp);
		}
	
		request.setAttribute("employeeSet",employeeSet);	
		request.getRequestDispatcher("search.jsp").forward(request,response);
	

	}
	
	public static void dateRange(HttpServletRequest request,HttpServletResponse response, String startDate,String endDate,String dateType) throws IOException, SQLException,java.sql.SQLException, ClassNotFoundException, ServletException{
		ArrayList<Employee> employeeSet=new ArrayList<>();
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select * from employee where "+dateType+" between '"+startDate+"' and '"+endDate+"'");
		
		while(rs.next()) {
			Employee emp=new Employee();
		emp.seteID(rs.getString(1));	
	
		emp.seteName(rs.getString(2));	
	
		emp.seteNIC(rs.getString(3));	

		emp.seteGender(rs.getString(4));	

		emp.setePhone(rs.getString(5));	

		emp.seteAge(rs.getString(6));	

		emp.seteAddress(rs.getString(7));	
	
		emp.setePosition(rs.getString(8));	
	
		emp.seteEmail(rs.getString(9));	
		
		emp.setePassword(rs.getString(10));	
		
		emp.seteRegDate(rs.getString(11));
		
		emp.seteUpdateDate(rs.getString(12));
		
		employeeSet.add(emp);
		}
	
		request.setAttribute("employeeSet",employeeSet);	
		request.getRequestDispatcher("search.jsp").forward(request,response);
	

	}
	
	
	
	
	
	
	
	
	
	public static void detailForEdit(HttpServletRequest request,HttpServletResponse response, String result) throws IOException, SQLException,java.sql.SQLException, ClassNotFoundException{
		try {
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select * from employee where empId='"+result+"'");
		rs.next();
		request.setAttribute("ID",rs.getString(1));	
		
		request.setAttribute("name",rs.getString(2));	
	
		request.setAttribute("nic",rs.getString(3));	

		request.setAttribute("gender",rs.getString(4));	

		request.setAttribute("phone",rs.getString(5));	

		request.setAttribute("age",rs.getString(6));	

		request.setAttribute("address",rs.getString(7));	
	
		request.setAttribute("position",rs.getString(8));	
	
		request.setAttribute("email",rs.getString(9));	
		
		request.setAttribute("password",rs.getString(10));

		
		
		request.getRequestDispatcher("update.jsp").forward(request,response);
		
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void storeEditDetails(HttpServletRequest request, HttpServletResponse response, Employee emp) throws ServletException, IOException, SQLException, ClassNotFoundException {

		String q="update employee set name=?,nic=?,gender=?,phone=?,age=?,address=?,position=?,email=?,password=?,updateDate=? where empId=?";
		PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
		long currentDate=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(currentDate);  
		
		pa.setString(1,emp.geteName());
		pa.setString(2,emp.geteNIC());
		pa.setString(3,emp.geteGender());
		pa.setString(4,emp.getePhone());
		pa.setString(5,emp.geteAge());
		pa.setString(6,emp.geteAddress());
		pa.setString(7,emp.getePosition());
		pa.setString(8,emp.geteEmail());
		pa.setString(9,emp.getePassword());
		pa.setString(10,String.valueOf(date));
		pa.setString(11,emp.eID);
		
		pa.execute();
		dbConnect.employeeCount();
		request.getRequestDispatcher("home.jsp").forward(request,response);
	}
	
	public void DeleteDetails(HttpServletRequest request, HttpServletResponse response, String result) throws ServletException, IOException, SQLException, ClassNotFoundException {
		String q="delete from employee where empID=?";
		PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
		pa.setString(1,result);
		pa.execute();
		dbConnect.employeeCount();
		request.getRequestDispatcher("home.jsp").forward(request,response);
	}
	
	/////////////////////////////////////////////////////////////////endAdmin//////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////payroll////////////////////////////////////////////////////////////////////////////////////////
	
	
	public void getSalaryDetails(HttpServletRequest request, HttpServletResponse response, String empID) throws ServletException, IOException, SQLException, ClassNotFoundException {
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select  e.empId,e.name,e.position,s.basicSalary,datediff(curdate(),e.regDate) as workDate from employee e,salary s where e.empId=s.empID and s.empID='"+empID+"'");
		rs.next();
		Employee empSl=new Employee();
		empSl.seteID(rs.getString(1));	
		empSl.seteName(rs.getString(2));	
		empSl.setePosition(rs.getString(3));
		empSl.setEsalary(rs.getDouble(4));
		double dayDiff=rs.getDouble(5);
		
		System.out.println(empSl.geteID());
		System.out.println(empSl.geteName());
		
		System.out.println(empSl.getePosition());
		
		System.out.println(empSl.getEsalary());
		
		System.out.println(dayDiff);
		
		checkSalary cS=new checkSalary();
		cS.calcBonus(request, response, empSl,dayDiff);
		

		
	
		
	}
	public void AutoaddSalary(HttpServletRequest request, HttpServletResponse response,String empID) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select basicSalary from salary where empID='"+empID+"'");
	//	boolean result=rs.next();
		if(rs.next()) {	
			
			dbConnect dbCon=new dbConnect();
			dbCon.getSalaryDetails(request, response,empID);
			
		}else {
		
	
		dbConnect.addSalary(request,response,empID);
		}
	}
	public static void deleteSalary(HttpServletRequest request, HttpServletResponse response,String empID) throws SQLException, ClassNotFoundException, ServletException, IOException {
		String q="delete from salary where empID=?;";
		PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
		pa.setString(1,empID);
		pa.execute();

		
		addSalary(request,response,empID);
	}
	
	public static void addSalary(HttpServletRequest request, HttpServletResponse response,String empID) throws SQLException, ClassNotFoundException, ServletException, IOException {
		java.sql.Statement st=dbConnect.getConnection().createStatement();
		ResultSet rs=st.executeQuery("select position from employee where empID='"+empID+"'");
	
		rs.next();	
		String position=rs.getString(1);


	dbConnect.getConnection().close();
	double basicsalary=0;
	
			if(position.equals("admin")) {
				basicsalary=20000.00;
			}else if(position.equals("manager")) {
				basicsalary=30000.00;
			}else {
				basicsalary=15000.00;
			}
			String q="insert into salary(empID,basicSalary) values(?,?)";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
			pa.setString(1,empID);
			pa.setDouble(2,basicsalary);
			pa.execute();
			dbConnect dbCon=new dbConnect();
			dbCon.getSalaryDetails(request, response,empID);
		
	
	
	}
	
////////////////////////////////////////////////////////////////////////endPayroll////////////////////////////
///////////////////////////////////////////////////////////////////////startLeave/////////////////////////////
	
		public static void applyLeaveDb(HttpServletRequest request, HttpServletResponse response,leave le) throws SQLException, ClassNotFoundException, ServletException, IOException {
			String q="insert into leaveapply(empID,lType,description,applyDate,sDate,eDate) values(?,?,?,?,?,?)";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
			long currentDate=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(currentDate);  
			
			pa.setString(1,le.geteId());
			pa.setString(2,le.getlType());
			pa.setString(3,le.getDescription());
			pa.setDate(4,date);
			pa.setString(5,le.getsDate());
			pa.setString(6,le.geteDate());
			pa.execute();	
			request.getRequestDispatcher("workerHome.jsp").forward(request,response);
		}
		
		public static void leaveDelete(HttpServletRequest request, HttpServletResponse response,String result) throws SQLException, ClassNotFoundException, ServletException, IOException {
			String q="delete from leaveapply where leID=?;";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
			pa.setString(1,result);
			pa.execute();
	
			request.getRequestDispatcher("viewLeaveDetails.jsp").forward(request,response);
		
		}
		public static void leaveConfirm(HttpServletRequest request, HttpServletResponse response,String leID,leave le) throws SQLException, ClassNotFoundException, ServletException, IOException {
			String q="insert into leaveconfirm(leaveID,employeeID,confirmDate,sDate,eDate) values(?,?,?,?,?)";
			PreparedStatement pa=dbConnect.getConnection().prepareStatement(q);
			long currentDate=System.currentTimeMillis();  
			java.sql.Date date=new java.sql.Date(currentDate);  
			
			pa.setString(1,leID);
			pa.setString(2,le.geteId());
			pa.setDate(3,date);
			pa.setString(4,le.getsDate());
			pa.setString(5,le.geteDate());
			pa.execute();	
			leaveDelete(request, response, leID);
		}
	
	
}

