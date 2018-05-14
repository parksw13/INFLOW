package com.TEAM_INFLOW.INFLOW.bean;

import java.sql.Timestamp;

public class nb_Bean {
	int nb_num;
	String nb_writer;
	String nb_title;
	String nb_contents;
	Timestamp nb_date;
	int nb_count;
	
	public int getNb_num() {
		return nb_num;
	}
	public void setNb_num(int nb_num) {
		this.nb_num = nb_num;
	}
	public String getNb_writer() {
		return nb_writer;
	}
	public void setNb_writer(String nb_writer) {
		this.nb_writer = nb_writer;
	}
	public String getNb_title() {
		return nb_title;
	}
	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}
	public String getNb_contents() {
		return nb_contents;
	}
	public void setNb_contents(String nb_contents) {
		this.nb_contents = nb_contents;
	}
	public Timestamp getNb_date() {
		return nb_date;
	}
	public void setNb_date(Timestamp nb_date) {
		this.nb_date = nb_date;
	}
	public int getNb_count() {
		return nb_count;
	}
	public void setNb_count(int nb_count) {
		this.nb_count = nb_count;
	}
}
