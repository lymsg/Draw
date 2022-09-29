package com.project.draw.dto;

import java.sql.Timestamp;

public class Servey1Dto {
	
	private String season;
	
	private String userAge;
	private int userM;
	private int userW;
	
	private Timestamp uDate;
	
	
	
	
	public Servey1Dto() {
		super();
	}




	public Servey1Dto(String season, String userAge, int userM, int userW, Timestamp uDate) {
		super();
		this.season = season;
		this.userAge = userAge;
		this.userM = userM;
		this.userW = userW;
		this.uDate = uDate;
	}




	public String getSeason() {
		return season;
	}




	public void setSeason(String season) {
		this.season = season;
	}




	public String getUserAge() {
		return userAge;
	}




	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}




	public int getUserM() {
		return userM;
	}




	public void setUserM(int userM) {
		this.userM = userM;
	}




	public int getUserW() {
		return userW;
	}




	public void setUserW(int userW) {
		this.userW = userW;
	}




	public Timestamp getuDate() {
		return uDate;
	}




	public void setuDate(Timestamp uDate) {
		this.uDate = uDate;
	}





}
/*
create table serveyBoard (
userAge varchar2(50),
userM number(4),
userW number(4),
uDate date default sysdate
);
*/