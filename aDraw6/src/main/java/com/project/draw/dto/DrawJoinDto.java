package com.project.draw.dto;

import java.sql.Timestamp;

public class DrawJoinDto {
	private String pid;
	private String ppw;
	private String pemail;
	private String pname;
	private String pphone;
	private Timestamp pdate;
	private String auth;
	public DrawJoinDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DrawJoinDto(String pid, String ppw, String pemail, String pname, String pphone, Timestamp pdate,
			String auth) {
		super();
		this.pid = pid;
		this.ppw = ppw;
		this.pemail = pemail;
		this.pname = pname;
		this.pphone = pphone;
		this.pdate = pdate;
		this.auth = auth;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPpw() {
		return ppw;
	}
	public void setPpw(String ppw) {
		this.ppw = ppw;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
}
	
	