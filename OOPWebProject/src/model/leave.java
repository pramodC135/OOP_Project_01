package model;

import java.sql.Date;

public class leave {
	public static String leaveID;
	private String eId;
	private String lType;
	private String description;

	private String currentDate;

	private String sDate; 
	private String eDate;
	
	
	public String getCurrentDate() {
		return currentDate;
	}
	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}
	public String geteId() {
		return eId;
	}
	public void seteId(String eId) {
		this.eId = eId;
	}
	
	public String getlType() {
		return lType;
	}
	public void setlType(String lType) {
		this.lType = lType;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	
}
