package com.project.draw.dto;

public class RaffleUploadDto {
	private int ruId;
	private String ruDate;
	private String ruName;
	private String ruNameEng;
	private String ruStory;
	private String ruCode;
	private String ruReleaseDate;
	private String ruPrice;
	private String ruImage;
	private String ruOnoffline;
	
	public RaffleUploadDto() {
		super();
	}

	public RaffleUploadDto(int ruId, String ruDate, String ruName, String ruNameEng, String ruStory, String ruCode,
			String ruReleaseDate, String ruPrice, String ruImage, String ruOnoffline) {
		super();
		this.ruId = ruId;
		this.ruDate = ruDate;
		this.ruName = ruName;
		this.ruNameEng = ruNameEng;
		this.ruStory = ruStory;
		this.ruCode = ruCode;
		this.ruReleaseDate = ruReleaseDate;
		this.ruPrice = ruPrice;
		this.ruImage = ruImage;
		this.ruOnoffline = ruOnoffline;
	}

	public int getRuId() {
		return ruId;
	}

	public void setRuId(int ruId) {
		this.ruId = ruId;
	}

	public String getRuDate() {
		return ruDate;
	}

	public void setRuDate(String ruDate) {
		this.ruDate = ruDate;
	}

	public String getRuName() {
		return ruName;
	}

	public void setRuName(String ruName) {
		this.ruName = ruName;
	}

	public String getRuNameEng() {
		return ruNameEng;
	}

	public void setRuNameEng(String ruNameEng) {
		this.ruNameEng = ruNameEng;
	}

	public String getRuStory() {
		return ruStory;
	}

	public void setRuStory(String ruStory) {
		this.ruStory = ruStory;
	}

	public String getRuCode() {
		return ruCode;
	}

	public void setRuCode(String ruCode) {
		this.ruCode = ruCode;
	}

	public String getRuReleaseDate() {
		return ruReleaseDate;
	}

	public void setRuReleaseDate(String ruReleaseDate) {
		this.ruReleaseDate = ruReleaseDate;
	}

	public String getRuPrice() {
		return ruPrice;
	}

	public void setRuPrice(String ruPrice) {
		this.ruPrice = ruPrice;
	}

	public String getRuImage() {
		return ruImage;
	}

	public void setRuImage(String ruImage) {
		this.ruImage = ruImage;
	}

	public String getRuOnoffline() {
		return ruOnoffline;
	}

	public void setRuOnoffline(String ruOnoffline) {
		this.ruOnoffline = ruOnoffline;
	}
	
	
}
