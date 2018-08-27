package com.greathiit.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.DepartmentMapper;
import com.greathiit.lab.entity.Department;
@Service
public class DepartService {
	@Autowired
	DepartmentMapper departmentMapper;
	public List<Department> findDepartAll(){
		return departmentMapper.selectByExample(null);
	}
	public boolean insertDepart(Department department) {
		Integer result=0;
		result=departmentMapper.selectCountDepartById(department.getDepartId());
		if(result!=0) {
			return false;
		}
		result=departmentMapper.insert(department);
		if(result==0) {
			return false;
		}
		return true;
	}
	public boolean deleteDepartByDepartId(Integer departId) {
		Integer result=0;
		result = departmentMapper.deleteByDepartId(departId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public Department selectDepartBydepartId(int departId) {
		return departmentMapper.selectDepartByDepartId(departId);
	}
	public boolean updateDepart(Department department) {
		Integer result=0;
		result=departmentMapper.selectCountDepartById(department.getDepartId());
		if(result>=2) {
			return false;
		}
		result=departmentMapper.updateByPrimaryKey(department);
		if(result==0) {
			return false;
		}
		return true;
	}
}
