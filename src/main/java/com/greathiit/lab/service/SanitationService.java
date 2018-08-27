package com.greathiit.lab.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.LaboratoryMapper;
import com.greathiit.lab.dao.SanitationMapper;
import com.greathiit.lab.entity.Sanitation;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.web.pojo.LaborAndEqurment;
import com.greathiit.lab.web.pojo.LaborAndSan;

@Service
public class SanitationService {
	@Autowired
	private SanitationMapper sanitationMapper;
	@Autowired
	private LaboratoryMapper laboratoryMapper;
	public boolean insertSanitation(Sanitation sanitation) {
		Integer result=0;
		result=sanitationMapper.selectSanCountBysanId(sanitation.getSanId());
		if(result!=0) {
			return false;
		}
		result=sanitationMapper.insert(sanitation);
		if(result==0) {
			return false;
		}
		return true;
	}
	public List<LaborAndSan>  findLaborAndSanAll(Fenpage page) {
		List<LaborAndSan> LaborAndSans=laboratoryMapper.selectLabIdAndNameToLaborAndSan(page);
		if(LaborAndSans.size()==0) {
			return null;
		}
		List<LaborAndSan> LaborAndSans2=new ArrayList<>();
		for (LaborAndSan LaborAndSan2 : LaborAndSans) {
			Integer newFen=sanitationMapper.seletcNewFen(LaborAndSan2.getLabId());
			Integer avgFen=sanitationMapper.selectCountSanFen(LaborAndSan2.getLabId());
			if(newFen==null) {
				newFen=0;
			}
			if(avgFen==null) {
				avgFen=0;
			}
			LaborAndSan2.setSanFen(newFen);			
			LaborAndSan2.setSanAvgfen(avgFen);
			LaborAndSans2.add(LaborAndSan2);
		}
		//Collections.sort(LaborAndSans2);
		return LaborAndSans2;
	}
	public Integer selectCountSan() {
		return sanitationMapper.selectCountSan();
	}
}
