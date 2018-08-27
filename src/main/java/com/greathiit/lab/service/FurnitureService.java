package com.greathiit.lab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.FurnitureMapper;
import com.greathiit.lab.dao.LaboratoryMapper;
import com.greathiit.lab.entity.Equipment;
import com.greathiit.lab.entity.Furniture;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.web.pojo.FunAndFunType;
import com.greathiit.lab.web.pojo.LaborAndEqurment;

@Service
public class FurnitureService {
	@Autowired
	FurnitureMapper furnitureMapper;
	@Autowired
	LaboratoryMapper laboratoryMapper;
	public List<LaborAndEqurment>  findLaborAndFurnitureAll(Fenpage page) {
		List<LaborAndEqurment> laborAndEqurments=laboratoryMapper.selectLabIdAndName(page);
		if(laborAndEqurments.size()==0) {
			return null;
		}
		List<LaborAndEqurment> laborAndEqurments2=new ArrayList<>();
		for (LaborAndEqurment laborAndEqurment2 : laborAndEqurments) {
			 Integer count = furnitureMapper.selectTypeCountFurniture(laborAndEqurment2.getLabId());
			 Integer typeCount = furnitureMapper.selectCountFurniture(laborAndEqurment2.getLabId());
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
	public List<FunAndFunType> selectFurnitureAllByLabId(Integer labId,Fenpage page){
		return furnitureMapper.selectFunAndFunTypeAllByLabId(labId, page);
	}
	public Integer furnitureCount(Integer labor_id) {
		return furnitureMapper.selectCountFurniture(labor_id);
	}
	public boolean InsertFurniture(Furniture furniture) {
		Integer result=0;
		if(furnitureMapper.selectCountFurnitureByFunId(furniture.getFunId())!=0) {
			return false;
		}
		result=furnitureMapper.insert(furniture);
		if(result==0) {
			return false;
		}
		return true;
	}
	public Integer selectTypeCountByid(Integer laborId) {
		return furnitureMapper.selectTypeCountFurniture(laborId);
	}
	public boolean deleteFurniture(String funId) {
		Integer result=0;
		result=furnitureMapper.deleteFurnitureByFunId(funId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public Furniture selectFurnitureByFunId(String funId) {
		return furnitureMapper.selectFurnitureByFunId(funId);
	}
	public boolean updateFurniture(Furniture furniture) {
		Integer result=0;
		result=furnitureMapper.selectCountFurnitureByFunId(furniture.getFunId());
		if(result>=2) {
			return false;
		}
		result=furnitureMapper.updateByPrimaryKey(furniture);
		if(result==0) {
			return false;
		}
		return true;
	}
}
