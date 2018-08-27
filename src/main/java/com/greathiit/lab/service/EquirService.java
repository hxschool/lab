package com.greathiit.lab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.EquipmentMapper;
import com.greathiit.lab.dao.LaboratoryMapper;
import com.greathiit.lab.entity.Equipment;
import com.greathiit.lab.entity.EquipmentType;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.web.pojo.EuqAndEquType;
import com.greathiit.lab.web.pojo.LaborAndEqurment;

@Service
public class EquirService {
	@Autowired
	EquipmentMapper equirMapper;
	@Autowired
	LaboratoryMapper laboratoryMapper;
	public List<LaborAndEqurment>  findLaborAndEqurmentAll(Fenpage page) {
		List<LaborAndEqurment> laborAndEqurments=laboratoryMapper.selectLabIdAndName(page);
		if(laborAndEqurments.size()==0) {
			return null;
		}
		List<LaborAndEqurment> laborAndEqurments2=new ArrayList<>();
		for (LaborAndEqurment laborAndEqurment2 : laborAndEqurments) {
			 Integer count = equirMapper.selectTypeCountEquipment(laborAndEqurment2.getLabId());
			 Integer typeCount = equirMapper.selectCountEquipment(laborAndEqurment2.getLabId());
			 if(count==null) {
				 count=0;
			 }
			 if(typeCount==null) {
				 typeCount=0;
			 }
			 laborAndEqurments2.add(new LaborAndEqurment(laborAndEqurment2.getLabId(), laborAndEqurment2.getLabName(), laborAndEqurment2.getLabRoom(), count, typeCount));		 
		}
		return laborAndEqurments2;
	}
	public List<EuqAndEquType> selectEquAllByLabId(Integer labId,Fenpage page){
		return equirMapper.selectEquAllByLabId(labId,page);
	}
	public Integer equipmentCount(Integer labor_id) {
		return equirMapper.selectCountEquipment(labor_id);
	}
	public boolean InsertEquipment(Equipment equipment) {
		Integer result=0;
		if(equirMapper.selectCountEquipmentByEquId(equipment.getEquId())!=0) {
			return false;
		}
		result=equirMapper.insert(equipment);
		if(result==0) {
			return false;
		}
		return true;
	}
	public Integer selectTypeCountByid(Integer laborId) {
		return equirMapper.selectTypeCountEquipment(laborId);
	}
	public boolean deleteEquipment(String equId) {
		Integer result=0;
		result=equirMapper.deleteEquipmentByEquId(equId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public Equipment selectEquipmentByEquId(String equId) {
		return equirMapper.selectEquipmentByEquId(equId);
	}
	public boolean updateEquipment(Equipment equipment) {
		Integer result=0;
		result=equirMapper.selectCountEquipmentByEquId(equipment.getEquId());
		if(result>=2) {
			return false;
		}
		result=equirMapper.updateByPrimaryKey(equipment);
		if(result==0) {
			return false;
		}
		return true;
	}
}