package com.project.draw.dto;

import java.sql.Timestamp;

public class CmBoardDto {
	
	private int cmIBNum;
	private int cmNum;
	private String cmId;
	private String cmText;
	private Timestamp cmDate;
	
	
	
	
	
	public CmBoardDto() {
		super();
	}





	public CmBoardDto(int cmIBNum, int cmNum, String cmId, String cmText, Timestamp cmDate) {
		super();
		this.cmIBNum = cmIBNum;
		this.cmNum = cmNum;
		this.cmId = cmId;
		this.cmText = cmText;
		this.cmDate = cmDate;
	}





	public int getCmIBNum() {
		return cmIBNum;
	}





	public void setCmIBNum(int cmIBNum) {
		this.cmIBNum = cmIBNum;
	}





	public int getCmNum() {
		return cmNum;
	}





	public void setCmNum(int cmNum) {
		this.cmNum = cmNum;
	}





	public String getCmId() {
		return cmId;
	}





	public void setCmId(String cmId) {
		this.cmId = cmId;
	}





	public String getCmText() {
		return cmText;
	}





	public void setCmText(String cmText) {
		this.cmText = cmText;
	}





	public Timestamp getCmDate() {
		return cmDate;
	}





	public void setCmDate(Timestamp cmDate) {
		this.cmDate = cmDate;
	}





	public CmBoardDto(int cmIBNum, int cmNum, String cmId, String cmText) {
		super();
		this.cmIBNum = cmIBNum;
		this.cmNum = cmNum;
		this.cmId = cmId;
		this.cmText = cmText;
	}





	public CmBoardDto(int cmIBNum, String cmId, String cmText) {
		super();
		this.cmIBNum = cmIBNum;
		this.cmId = cmId;
		this.cmText = cmText;
	}





	
}
