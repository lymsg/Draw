package com.project.draw.dto;

public class RaffleReplyPageListDto {
	private String rCode;
	private int startNo;
	
	
	public RaffleReplyPageListDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public RaffleReplyPageListDto(String rCode, int startNo) {
		super();
		this.rCode = rCode;
		this.startNo = startNo;
	}


	public String getrCode() {
		return rCode;
	}


	public void setrCode(String rCode) {
		this.rCode = rCode;
	}


	public int getStartNo() {
		return startNo;
	}


	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	
	

}
