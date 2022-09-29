package com.project.draw.dto;

import org.springframework.beans.factory.annotation.Autowired;

public class MyIBoardDto {
	
	
	private String iId;
	private String iIntroduce;
	private String iProfilePath;
	private int iTotalHeart;
	
	
	
	public MyIBoardDto() {
		super();
	}
	public MyIBoardDto(String iId, String iIntroduce, String iProfilePath, int iTotalHeart) {
		super();
		this.iId = iId;
		this.iIntroduce = iIntroduce;
		this.iProfilePath = iProfilePath;
		this.iTotalHeart = iTotalHeart;
	}
	public String getiId() {
		return iId;
	}
	public void setiId(String iId) {
		this.iId = iId;
	}
	public String getiIntroduce() {
		return iIntroduce;
	}
	public void setiIntroduce(String iIntroduce) {
		this.iIntroduce = iIntroduce;
	}
	public String getiProfilePath() {
		return iProfilePath;
	}
	public void setiProfilePath(String iProfilePath) {
		this.iProfilePath = iProfilePath;
	}
	public int getiTotalHeart() {
		return iTotalHeart;
	}
	public void setiTotalHeart(int iTotalHeart) {
		this.iTotalHeart = iTotalHeart;
	}

	public MyIBoardDto(String iId, String iIntroduce, String iProfilePath) {
		super();
		this.iId = iId;
		this.iIntroduce = iIntroduce;
		this.iProfilePath = iProfilePath;
	}
	public MyIBoardDto(String iId, String iProfilePath) {
		super();
		this.iId = iId;
		this.iProfilePath = iProfilePath;
	}
	public MyIBoardDto(String iId, String iIntroduce, int iTotalHeart) {
		super();
		this.iId = iId;
		this.iIntroduce = iIntroduce;
		this.iTotalHeart = iTotalHeart;
	}



}
