package com.TEAM_INFLOW.INFLOW.bean;

import java.sql.Timestamp;

public class attended_Bean {
	private String class_name;
	private String student_id;
	private Timestamp attended_date1;
	private String attended_date2;
	private int attended_state;

	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public Timestamp getAttended_date1() {
		return attended_date1;
	}
	public void setAttended_date1(Timestamp attended_date1) {
		this.attended_date1 = attended_date1;
	}
	public String getAttended_date2() {
		return attended_date2;
	}
	public String setAttended_date2(String attended_date2) {
		return this.attended_date2 = attended_date2;
	}
	public int getAttended_state() {
		return attended_state;
	}
	public void setAttended_state(int attended_state) {
		this.attended_state = attended_state;
	}

}