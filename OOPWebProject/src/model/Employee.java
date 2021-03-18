package model;

public class Employee {
	public static int id;
	public static int idCount;
	public static String lastUpdateName;

	public String eID;
	public String getEmpID() {
		return empID;
	}
	public void setEmpID(String empID) {
		this.empID = empID;
	}
	private String empID;
	private String eName;
	private String eNIC;
	private String eEmail;
	private String ePhone;
	private String eAge;
	private String eGender;
	private String eAddress;
	private String ePosition;
	private String ePassword;
	private Double esalary;

	public Double getEsalary() {
		return esalary;
	}
	public void setEsalary(Double esalary) {
		this.esalary = esalary;
	}
	private String eRegDate;
	private String eUpdateDate;



/*	public static String createId() {
		id=id+1;
		eID=String.valueOf(id);
		return eID; 
	}*/
	public String geteID() {
		return eID;
	}
	public void seteID(String eID) {
		this.eID = eID;
	}
	
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geteEmail() {
		return eEmail;
	}
	public void seteEmail(String eEmail) {
		this.eEmail = eEmail;
	}
	public String geteNIC() {
		return eNIC;
	}
	public void seteNIC(String eNIC) {
		this.eNIC = eNIC;
	}
	public String geteGender() {
		return eGender;
	}
	public void seteGender(String eGender) {
		this.eGender = eGender;
	}
	public String geteAge() {
		return eAge;
	}
	public void seteAge(String eAge) {
		this.eAge = eAge;
	}
	public String geteAddress() {
		return eAddress;
	}
	public void seteAddress(String eAddress) {
		this.eAddress = eAddress;
	}
	public String getePosition() {
		return ePosition;
	}
	public void setePosition(String ePosition) {
		this.ePosition = ePosition;
	}
	public String getePassword() {
		return ePassword;
	}
	public void setePassword(String ePassword) {
		this.ePassword = ePassword;
	}
	
	public String getePhone() {
		return ePhone;
	}
	public void setePhone(String ePhone) {
		this.ePhone = ePhone;
	}
	
	public String geteRegDate() {
		return eRegDate;
	}
	public void seteRegDate(String eRegDate) {
		this.eRegDate = eRegDate;
	}
	public String geteUpdateDate() {
		return eUpdateDate;
	}
	public void seteUpdateDate(String eUpdateDate) {
		this.eUpdateDate = eUpdateDate;
	}

	
	/*public String EmployeeDetail() {
		return 	("Name				 :"+eName+
				"E-mail				 :"+eEmail+
				"NIC				 :"+eNIC +
				"Gender				 :"+eGender+
				"Age				 :"+eAge+
				"Address			 :"+eAddress+
				"Position			 :"+ePosition+
				"Password			 :"+ePassword);
	}*/
	
}
