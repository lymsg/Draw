package com.project.draw.dto;

import java.sql.Timestamp;

public class RaffleReplyDto {
	private int rId;
	private String rUserId;
	private String rContent;
	private Timestamp rDate;
	private int rLike;
	private int rGroup;
	private int rStep;
	private int rIndent;
	private String rCode;
	
	
	public RaffleReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public RaffleReplyDto(String rUserId, String rContent, String rCode) {
		super();
		this.rUserId = rUserId;
		this.rContent = rContent;
		this.rCode = rCode;
	}


	public RaffleReplyDto(int rId, String rUserId, String rContent, Timestamp rDate, int rLike, int rGroup, int rStep,
			int rIndent, String rCode) {
		super();
		this.rId = rId;
		this.rUserId = rUserId;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rLike = rLike;
		this.rGroup = rGroup;
		this.rStep = rStep;
		this.rIndent = rIndent;
		this.rCode = rCode;
	}
	


	public int getrId() {
		return rId;
	}


	public void setrId(int rId) {
		this.rId = rId;
	}


	public String getrUserId() {
		return rUserId;
	}


	public void setrUserId(String rUserId) {
		this.rUserId = rUserId;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public Timestamp getrDate() {
		return rDate;
	}


	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}


	public int getrLike() {
		return rLike;
	}


	public void setrLike(int rLike) {
		this.rLike = rLike;
	}


	public int getrGroup() {
		return rGroup;
	}


	public void setrGroup(int rGroup) {
		this.rGroup = rGroup;
	}


	public int getrStep() {
		return rStep;
	}


	public void setrStep(int rStep) {
		this.rStep = rStep;
	}


	public int getrIndent() {
		return rIndent;
	}


	public void setrIndent(int rIndent) {
		this.rIndent = rIndent;
	}


	public String getrCode() {
		return rCode;
	}


	public void setrCode(String rCode) {
		this.rCode = rCode;
	}


	
}
