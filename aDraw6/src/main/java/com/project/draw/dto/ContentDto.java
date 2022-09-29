package com.project.draw.dto;

public class ContentDto {
	
	
	private String brand;
	private String name;
	private String image;
	private int price;
	private String limit;
	private String pdate;
	private int pno;
	private String pbuyer;
	public ContentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContentDto(String brand, String name, String image, int price, String limit, String pdate, int pno,String pbuyer) {
		super();
		this.brand = brand;
		this.name = name;
		this.image = image;
		this.price = price;
		this.limit = limit;
		this.pdate = pdate;
		this.pno = pno;
		this.pbuyer = pbuyer;
	}
	public ContentDto(String name, int price, String pbuyer) {
		super();
		this.name = name;
		this.price = price;
		this.pbuyer = pbuyer;
	}
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getprice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	public String getPbuyer() {
		return pbuyer;
	}
	public void setPbuyer(String pbuyer) {
		this.pbuyer = pbuyer;
	}
	
	
	
	
	
	
}
