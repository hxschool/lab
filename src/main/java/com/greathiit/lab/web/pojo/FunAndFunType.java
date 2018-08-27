package com.greathiit.lab.web.pojo;

import com.greathiit.lab.entity.Furniture;

public class FunAndFunType extends Furniture{
	private String funtypeId;
	private String funtypeImg;
	private String funtypeName;
	public String getFuntypeId() {
		return funtypeId;
	}
	public void setFuntypeId(String funtypeId) {
		this.funtypeId = funtypeId;
	}
	public String getFuntypeImg() {
		return funtypeImg;
	}
	public void setFuntypeImg(String funtypeImg) {
		this.funtypeImg = funtypeImg;
	}
	public String getFuntypeName() {
		return funtypeName;
	}
	public void setFuntypeName(String funtypeName) {
		this.funtypeName = funtypeName;
	}
	

}
