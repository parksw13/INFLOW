package com.TEAM_INFLOW.INFLOW.bean;

import java.sql.Timestamp;

public class sr_Bean {
	int sr_num;
	String sr_writer;
	String sr_title;
	String sr_contents;
	Timestamp sr_date;
	int sr_count;
	String sr_upload;
	
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public String getSr_writer() {
		return sr_writer;
	}
	public void setSr_writer(String sr_writer) {
		this.sr_writer = sr_writer;
	}
	public String getSr_title() {
		return sr_title;
	}
	public void setSr_title(String sr_title) {
		this.sr_title = sr_title;
	}
	public String getSr_contents() {
		return sr_contents;
	}
	public void setSr_contents(String sr_contents) {
		this.sr_contents = sr_contents;
	}
	public Timestamp getSr_date() {
		return sr_date;
	}
	public void setSr_date(Timestamp sr_date) {
		this.sr_date = sr_date;
	}
	public int getSr_count() {
		return sr_count;
	}
	public void setSr_count(int sr_count) {
		this.sr_count = sr_count;
	}
	public String getSr_upload() {
		return sr_upload;
	}
	public void setSr_upload(String sr_upload) {
		this.sr_upload = sr_upload;
	}
	
}
