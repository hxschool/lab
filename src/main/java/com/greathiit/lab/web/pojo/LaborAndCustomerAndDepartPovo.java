package com.greathiit.lab.web.pojo;

import org.springframework.stereotype.Component;

import com.greathiit.lab.entity.Laboratory;

public class LaborAndCustomerAndDepartPovo extends Laboratory{
	private String departId;
	private String departName;
	private String custId;
	private String custName;
	public String getDepartId() {
		return departId;
	}
	public void setDepartId(String departId) {
		this.departId = departId;
	}
	public String getDepartName() {
		return departName;
	}
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	@Override
	public String toString() {
		return "LaborAndCustomerAndDepartPovo [departId=" + departId + ", departName=" + departName + ", custId="
				+ custId + ", custName=" + custName + super.toString()+"]";
	}
	
	

	
}
