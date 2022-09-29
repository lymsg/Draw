package com.project.draw.dto;

public class UserDto {
	
	private String uname;
	private int uaccount;
	private String ubuy;
	
	
	public UserDto(String uname, int uaccount, String ubuy) {
		super();
		this.uname = uname;
		this.uaccount = uaccount;
		this.ubuy = ubuy;
	}
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUaccount() {
		return uaccount;
	}
	public void setUaccount(int uaccount) {
		this.uaccount = uaccount;
	}
	public String getUbuy() {
		return ubuy;
	}
	public void setUbuy(String ubuy) {
		this.ubuy = ubuy;
	}
	
	
	
	
	
}
