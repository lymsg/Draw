package com.project.draw.dto;

import java.sql.Timestamp;

public class LoadBoardDto {
	
	
	private int iBoardNum;
	private String iId;
	private String iText;
	private String iImagePath;
	private String iModelName;
	private Timestamp iDate;
	
	private String iProfilePath;

	public LoadBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoadBoardDto(int iBoardNum, String iId, String iText, String iImagePath, String iModelName, Timestamp iDate,
			String iProfilePath) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
		this.iText = iText;
		this.iImagePath = iImagePath;
		this.iModelName = iModelName;
		this.iDate = iDate;
		this.iProfilePath = iProfilePath;
	}

	public int getiBoardNum() {
		return iBoardNum;
	}

	public void setiBoardNum(int iBoardNum) {
		this.iBoardNum = iBoardNum;
	}

	public String getiId() {
		return iId;
	}

	public void setiId(String iId) {
		this.iId = iId;
	}

	public String getiText() {
		return iText;
	}

	public void setiText(String iText) {
		this.iText = iText;
	}

	public String getiImagePath() {
		return iImagePath;
	}

	public void setiImagePath(String iImagePath) {
		this.iImagePath = iImagePath;
	}

	public String getiModelName() {
		return iModelName;
	}

	public void setiModelName(String iModelName) {
		this.iModelName = iModelName;
	}

	public Timestamp getiDate() {
		return iDate;
	}

	public void setiDate(Timestamp iDate) {
		this.iDate = iDate;
	}

	public String getiProfilePath() {
		return iProfilePath;
	}

	public void setiProfilePath(String iProfilePath) {
		this.iProfilePath = iProfilePath;
	}

	public LoadBoardDto(String iId, String iText, String iImagePath, String iModelName, Timestamp iDate,
			String iProfilePath) {
		super();
		this.iId = iId;
		this.iText = iText;
		this.iImagePath = iImagePath;
		this.iModelName = iModelName;
		this.iDate = iDate;
		this.iProfilePath = iProfilePath;
	}

	public LoadBoardDto(String iId, int iBoardNum) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
	}


	
}