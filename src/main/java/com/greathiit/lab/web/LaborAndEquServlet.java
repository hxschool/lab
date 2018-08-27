package com.greathiit.lab.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greathiit.lab.entity.Equipment;
import com.greathiit.lab.entity.Laboratory;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.EquiTypeService;
import com.greathiit.lab.service.EquirService;
import com.greathiit.lab.service.LaborService;
import com.greathiit.lab.web.pojo.EuqAndEquType;
import com.greathiit.lab.web.pojo.LaborAndEqurment;

@Controller
@RequestMapping("/LaborAndEquServlet")
public class LaborAndEquServlet {
	@Autowired
	private EquirService equirService;
	@Autowired
	private LaborService laborService;
	@Autowired
	private EquiTypeService equiTypeService;
	@RequestMapping("/findAllEqu")
	@ResponseBody
	public boolean findAllEqu(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		Fenpage page =new Fenpage(currentPage,laborService.laborCount());
		List<LaborAndEqurment> laborAndEqurments=equirService.findLaborAndEqurmentAll(page);
		session.setAttribute("laborAndEqurments", laborAndEqurments );
		session.setAttribute("page", page);
		return true;
	}
	@RequestMapping("/findAllEquByLabId")
	@ResponseBody
	public boolean findAllEquByLabId(HttpSession session,Integer labId,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		Integer result=equirService.selectTypeCountByid(labId);
		if(result==null) {
			result=0;
		}
		Fenpage page =new Fenpage(currentPage,result);
		List<EuqAndEquType> equipments = equirService.selectEquAllByLabId(labId, page);
		Laboratory laboratory=laborService.selectLaborByLaborId(labId);
		session.setAttribute("laboratory", laboratory);
		session.setAttribute("equipments", equipments);
		session.setAttribute("page", page);
		return true;
	}
	@RequestMapping("/addEquBeforeSelect")
	@ResponseBody
	public boolean addEquBeforeSelect(HttpSession session,Integer labId) {
		session.setAttribute("Funtypes", equiTypeService.findAllReal());
		return true;
	}
	@RequestMapping("/addEqu")
	@ResponseBody
	public boolean addEqu(Equipment equipment) {		
		return equirService.InsertEquipment(equipment);
	}
	@RequestMapping("/deleteEqu")
	@ResponseBody
	public boolean deleteEqu(String equId) {		
		return equirService.deleteEquipment(equId);
	}
	@RequestMapping("/updateEquBeforeSelect")
	@ResponseBody
	public boolean updateEquBeforeSelect(HttpSession session,String equId) {	
		session.setAttribute("Equipment", equirService.selectEquipmentByEquId(equId));
		session.setAttribute("Funtypes", equiTypeService.findAllReal());
		return true;
	}
	@RequestMapping("/updateEqu")
	@ResponseBody
	public boolean updateEqu(Equipment equipment) {	
		return equirService.updateEquipment(equipment);
	}
	
	
}
