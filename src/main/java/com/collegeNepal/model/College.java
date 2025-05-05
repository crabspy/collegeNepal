package com.collegeNepal.model;

public class College {
	private int collegeID;
	private String collegeName;
	private String collegeAddress;
	private String collegeType;
	private String affiliatedUnivercity;
	
	//constructers
	public College() {}

	public College(int collegeID, String collegeName, String collegeAddress, String collegeType,
			String affiliatedUnivercity) {
		super();
		this.collegeID = collegeID;
		this.collegeName = collegeName;
		this.collegeAddress = collegeAddress;
		this.collegeType = collegeType;
		this.affiliatedUnivercity = affiliatedUnivercity;
	}

	public int getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(int collegeID) {
		this.collegeID = collegeID;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getCollegeAddress() {
		return collegeAddress;
	}

	public void setCollegeAddress(String collegeAddress) {
		this.collegeAddress = collegeAddress;
	}

	public String getCollegeType() {
		return collegeType;
	}

	public void setCollegeType(String collegeType) {
		this.collegeType = collegeType;
	}

	public String getAffiliatedUnivercity() {
		return affiliatedUnivercity;
	}

	public void setAffiliatedUnivercity(String affiliatedUnivercity) {
		this.affiliatedUnivercity = affiliatedUnivercity;
	}
	
	
}
