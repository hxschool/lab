package com.greathiit.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.LaboratoryMapper;
import com.greathiit.lab.entity.Laboratory;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.web.pojo.LaborAndCustomerAndDepartPovo;


@Service
public class LaborService {
	@Autowired
	private LaboratoryMapper laboratoryMapper;
	public List<LaborAndCustomerAndDepartPovo> selectAllLabor() {
		return laboratoryMapper.selectLaborAll();
	}
	public boolean insertLabor(Laboratory laboratory) {
		Integer result=0;
		result=laboratoryMapper.selectByLabId(laboratory.getLabId());
		if(result!=0) {
			return false;
		}
		result=laboratoryMapper.insert(laboratory);
		if(result==0) {
			return false;
		}
		return true;
	}
	public boolean deleteLabor(Integer labId) {
		Integer result=0;
		result = laboratoryMapper.deleteLabor(labId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public LaborAndCustomerAndDepartPovo selectLaborByLaborId(int labId) {
		return laboratoryMapper.selectLaborByLaborId(labId);
	}
	public boolean updateLabor(Laboratory laboratory) {
		Integer result=0;
		result = laboratoryMapper.updateByPrimaryKey(laboratory);
		if(result==0) {
			return false;
		}
		return true;	
	}
	public List<LaborAndCustomerAndDepartPovo> fenPage(Fenpage page) {
		return laboratoryMapper.Fenpage(page);
	}
	public Integer laborCount() {
		return laboratoryMapper.countByExample(null);
	}
	public List<Laboratory> selectLaborBylaborUser(Integer labId){
		return laboratoryMapper.selectLaborBylaborUser(labId);
	}
}
