package com.greathiit.lab.web.pojo;

public class LaborAndEqurment {
	 private Integer labId;
	 private String labName;
	 private String labRoom;
	 private Integer count;
	 private Integer typeCount;
	 public LaborAndEqurment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LaborAndEqurment(Integer labId, String labName, String labRoom, Integer count, Integer typeCount) {
		super();
		this.labId = labId;
		this.labName = labName;
		this.labRoom = labRoom;
		this.count = count;
		this.typeCount = typeCount;
	}
	 public String getLabRoom() {
		return labRoom;
	}
	public void setLabRoom(String labRoom) {
		this.labRoom = labRoom;
	}
	public Integer getLabId() {
		return labId;
	}
	public void setLabId(Integer labId) {
		this.labId = labId;
	}
	public String getLabName() {
		return labName;
	}
	public void setLabName(String labName) {
		this.labName = labName;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getTypeCount() {
		return typeCount;
	}
	public void setTypeCount(Integer typeCount) {
		this.typeCount = typeCount;
	}
	 


}
