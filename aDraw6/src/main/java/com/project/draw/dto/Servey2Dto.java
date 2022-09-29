package com.project.draw.dto;

import java.sql.Timestamp;

public class Servey2Dto {
	
	private String season;
	
	private String brandName;
	private int bPercent;
	
	private Timestamp uDate;
	
	
	public Servey2Dto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Servey2Dto(String season, String brandName, int bPercent, Timestamp uDate) {
		super();
		this.season = season;
		this.brandName = brandName;
		this.bPercent = bPercent;
		this.uDate = uDate;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getbrandName() {
		return brandName;
	}

	public void setbrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getbPercent() {
		return bPercent;
	}

	public void setbPercent(int bPercent) {
		this.bPercent = bPercent;
	}

	public Timestamp getuDate() {
		return uDate;
	}

	public void setuDate(Timestamp uDate) {
		this.uDate = uDate;
	}

}
