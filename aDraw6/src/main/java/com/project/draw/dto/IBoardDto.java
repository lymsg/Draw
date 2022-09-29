package com.project.draw.dto;

import java.sql.Timestamp;

public class IBoardDto {
	
	private int iBoardNum;
	private String iId;
	private String iText;
	private String iImagePath;
	private String iModelName;
	private int iHeart;
	private Timestamp iDate;
	private int iHit;
	
	
	
	
	
	public IBoardDto() {
		super();
	}

	public IBoardDto(String iId, int iBoardNum) {
		super();
		this.iId = iId;
		this.iBoardNum = iBoardNum;
	}
	public IBoardDto(String iId, String iText, String iImagePath, String iModelName) {
		super();
		this.iId = iId;
		this.iText = iText;
		this.iImagePath = iImagePath;
		this.iModelName = iModelName;
	}
	public IBoardDto(int iBoardNum, String iId, String iText, String iImagePath, String iModelName) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
		this.iText = iText;
		this.iImagePath = iImagePath;
		this.iModelName = iModelName;
	}
	public IBoardDto(int iBoardNum, String iId, String iText, String iModelName) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
		this.iText = iText;
		this.iModelName = iModelName;
	}
	public IBoardDto(int iBoardNum, String iId, String iImagePath) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
		this.iImagePath = iImagePath;
	}
	public IBoardDto(int iBoardNum, String iImagePath) {
		super();
		this.iBoardNum = iBoardNum;
		this.iImagePath = iImagePath;
	}
	public IBoardDto(int iBoardNum, String iId, String iText, String iImagePath, String iModelName, int iHeart,
			int iHit) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
		this.iText = iText;
		this.iImagePath = iImagePath;
		this.iModelName = iModelName;
		this.iHeart = iHeart;
		this.iHit = iHit;
	}

	public IBoardDto(int iBoardNum, String iId, String iText, String iImagePath, String iModelName, int iHeart,
			Timestamp iDate, int iHit) {
		super();
		this.iBoardNum = iBoardNum;
		this.iId = iId;
		this.iText = iText;
		this.iImagePath = iImagePath;
		this.iModelName = iModelName;
		this.iHeart = iHeart;
		this.iDate = iDate;
		this.iHit = iHit;
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

	public int getiHeart() {
		return iHeart;
	}

	public void setiHeart(int iHeart) {
		this.iHeart = iHeart;
	}

	public Timestamp getiDate() {
		return iDate;
	}

	public void setiDate(Timestamp iDate) {
		this.iDate = iDate;
	}

	public int getiHit() {
		return iHit;
	}

	public void setiHit(int iHit) {
		this.iHit = iHit;
	}



}
