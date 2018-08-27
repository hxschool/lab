package com.greathiit.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.EquipmentTypeMapper;
import com.greathiit.lab.entity.EquipmentType;
import com.greathiit.lab.page.Fenpage;

@Service
public class EquiTypeService {
	@Autowired
	private EquipmentTypeMapper equipmentTypeMapper;
	public List<EquipmentType> findAllEquipmentType(Fenpage page) {
		return equipmentTypeMapper.fenPage(page);
	}
	public Integer selectEquipmentTypeCount() {
		return equipmentTypeMapper.countByExample(null);
	}
	public boolean insertEquipmentType(EquipmentType equipmentType) {
		Integer result=0;
		result=equipmentTypeMapper.selectEquipmentTypeById(equipmentType.getEqutypeId());
		if(result!=0) {
			return false;
		}
		result=equipmentTypeMapper.insert(equipmentType);
		if(result==0) {
			return false;
		}
		return true;
	}
	public boolean deleteEquipmentType(String equtypeId) {
		Integer result=0;
		result=equipmentTypeMapper.deleteequipmentTypeByEqutypeId(equtypeId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public EquipmentType selectEquipmentTypeByequtypeId(String equtypeId) {
		return equipmentTypeMapper.selectEquipmentTypeByEqutypeId(equtypeId);
	}
	public boolean updateEquipmentType(EquipmentType equipmentType) {
		Integer result=0;
		result=equipmentTypeMapper.selectEquipmentTypeById(equipmentType.getEqutypeId());
		if(result>=2) {
			return false;
		}
		result=equipmentTypeMapper.updateByPrimaryKey(equipmentType);
		if(result==0) {
			return false;
		}
		return true;
	}
	public List<EquipmentType> findAllReal() {
		return equipmentTypeMapper.selectByExample(null);
	}
}
