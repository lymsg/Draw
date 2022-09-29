package com.project.draw.dto;

import java.sql.Timestamp;

public class HeartDto {
	
	private int hNum;
	private int hiBoardNum;
	private String hiId;
	private String hiImagePath;
	private String hId;
	private Timestamp hDate;
	
	
	
	public HeartDto() {
		super();
	}



	public HeartDto(int hNum, int hiBoardNum, String hiId, String hiImagePath, String hId, Timestamp hDate) {
		super();
		this.hNum = hNum;
		this.hiBoardNum = hiBoardNum;
		this.hiId = hiId;
		this.hiImagePath = hiImagePath;
		this.hId = hId;
		this.hDate = hDate;
	}



	public int gethNum() {
		return hNum;
	}



	public void sethNum(int hNum) {
		this.hNum = hNum;
	}



	public int gethiBoardNum() {
		return hiBoardNum;
	}



	public void sethiBoardNum(int hiBoardNum) {
		this.hiBoardNum = hiBoardNum;
	}



	public String getHiId() {
		return hiId;
	}



	public void setHiId(String hiId) {
		this.hiId = hiId;
	}



	public String getHiImagePath() {
		return hiImagePath;
	}



	public void setHiImagePath(String hiImagePath) {
		this.hiImagePath = hiImagePath;
	}



	public String gethId() {
		return hId;
	}



	public void sethId(String hId) {
		this.hId = hId;
	}



	public Timestamp gethDate() {
		return hDate;
	}



	public void sethDate(Timestamp hDate) {
		this.hDate = hDate;
	}



	public HeartDto(int hiBoardNum, String hiId, String hiImagePath, String hId, Timestamp hDate) {
		super();
		this.hiBoardNum = hiBoardNum;
		this.hiId = hiId;
		this.hiImagePath = hiImagePath;
		this.hId = hId;
		this.hDate = hDate;
	}



	public HeartDto(int hiBoardNum, String hiId, String hiImagePath, String hId) {
		super();
		this.hiBoardNum = hiBoardNum;
		this.hiId = hiId;
		this.hiImagePath = hiImagePath;
		this.hId = hId;
	}



	public HeartDto(String hiImagePath, String hId) {
		super();
		this.hiImagePath = hiImagePath;
		this.hId = hId;
	}



	public HeartDto(int hiBoardNum, String hId) {
		super();
		this.hiBoardNum = hiBoardNum;
		this.hId = hId;
	}



	public HeartDto(int hNum, int hiBoardNum) {
		super();
		this.hNum = hNum;
		this.hiBoardNum = hiBoardNum;
	}


}