package com.greathiit.lab.web.pojo;

import com.greathiit.lab.entity.Equipment;

public class EuqAndEquType extends Equipment{
	private String equtypeId;
	private String equtypeImg;
	private String equtypeName;
	public String getEqutypeId() {
		return equtypeId;
	}
	public void setEqutypeId(String equtypeId) {
		this.equtypeId = equtypeId;
	}
	public String getEqutypeImg() {
		return equtypeImg;
	}
	public void setEqutypeImg(String equtypeImg) {
		this.equtypeImg = equtypeImg;
	}
	public String getEqutypeName() {
		return equtypeName;
	}
	public void setEqutypeName(String equtypeName) {
		this.equtypeName = equtypeName;
	}
}
