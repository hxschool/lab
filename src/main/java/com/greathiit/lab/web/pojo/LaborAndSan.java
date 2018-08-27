package com.greathiit.lab.web.pojo;

import java.util.Date;

import com.greathiit.lab.entity.Laboratory;

public class LaborAndSan extends Laboratory implements Comparable<LaborAndSan> {
	private String sanId;
	private Integer sanAvgfen;
	private Date sanDate;
	private Integer sanFen;
	private String sanDesc;
	public Date getSanDate() {
		return sanDate;
	}
	public void setSanDate(Date sanDate) {
		this.sanDate = sanDate;
	}
	public String getSanDesc() {
		return sanDesc;
	}
	public void setSanDesc(String sanDesc) {
		this.sanDesc = sanDesc;
	}
	public String getSanId() {
		return sanId;
	}
	public void setSanId(String sanId) {
		this.sanId = sanId;
	}
	public Integer getSanAvgfen() {
		return sanAvgfen;
	}
	public void setSanAvgfen(Integer sanAvgfen) {
		this.sanAvgfen = sanAvgfen;
	}
	public Integer getSanFen() {
		return sanFen;
	}
	public void setSanFen(Integer sanFen) {
		this.sanFen = sanFen;
	}
	@Override
	public int compareTo(LaborAndSan o) {
		// TODO Auto-generated method stub
		int i=this.getSanAvgfen()-o.getSanAvgfen();
		return i;
	}
	
}
