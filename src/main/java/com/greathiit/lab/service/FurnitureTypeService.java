package com.greathiit.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.FurnitureTypeMapper;
import com.greathiit.lab.entity.FurnitureType;
import com.greathiit.lab.page.Fenpage;

@Service
public class FurnitureTypeService {
	@Autowired
	private FurnitureTypeMapper furnitureTypeMapper;
	public List<FurnitureType> findAllFurnitureType(Fenpage page) {
		return furnitureTypeMapper.fenPage(page);
	}
	public Integer selectFurnitureTypeCount() {
		return furnitureTypeMapper.countByExample(null);
	}
	public boolean insertFurnitureType(FurnitureType furnitureType) {
		Integer result=0;
		result=furnitureTypeMapper.selectFurnitureTypeCountByFuntypeId(furnitureType.getFuntypeId());
		if(result!=0) {
			return false;
		}
		result=furnitureTypeMapper.insert(furnitureType);
		if(result==0) {
			return false;
		}
		return true;
	}
	public boolean deleteFurnitureType(String funtypeId) {
		Integer result=0;
		result=furnitureTypeMapper.deleteFurnitureTypeByFuntypeId(funtypeId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public FurnitureType selectFurnitureTypeByFuntypeId(String funtypeId) {
		return furnitureTypeMapper.selectFurnitureTypeByFuntypeId(funtypeId);
	}
	public boolean updateFurnitureType(FurnitureType furnitureType) {
		Integer result=0;
		result=furnitureTypeMapper.selectFurnitureTypeCountByFuntypeId(furnitureType.getFuntypeId());
		if(result>=2) {
			return false;
		}
		result=furnitureTypeMapper.updateByPrimaryKey(furnitureType);
		if(result==0) {
			return false;
		}
		return true;
	}
	public List<FurnitureType> findAllReal(){//真实的查询所有信息
		return furnitureTypeMapper.selectByExample(null);
	}
}
