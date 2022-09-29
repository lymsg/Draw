package com.project.draw.dto;

public class RaffleInfoUploadDto {
	private int id;
	private String ruCode;
	private String logo;
	private String store;
	private String storeUrl;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	
	public RaffleInfoUploadDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RaffleInfoUploadDto(int id, String ruCode, String logo, String store, String storeUrl, String startDate,
			String startTime, String endDate, String endTime) {
		super();
		this.id = id;
		this.ruCode = ruCode;
		this.logo = logo;
		this.store = store;
		this.storeUrl = storeUrl;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRuCode() {
		return ruCode;
	}

	public void setRuCode(String ruCode) {
		this.ruCode = ruCode;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getStoreUrl() {
		return storeUrl;
	}

	public void setStoreUrl(String storeUrl) {
		this.storeUrl = storeUrl;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
