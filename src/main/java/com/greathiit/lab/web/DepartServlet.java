package com.greathiit.lab.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greathiit.lab.entity.Department;
import com.greathiit.lab.service.DepartService;

@Controller
@RequestMapping("/DepartServlet")
public class DepartServlet {
	@Autowired
	private DepartService departService;
	@RequestMapping("/findAllDepart")
	@ResponseBody
	private boolean findAllDepart(HttpSession session ) {
		session.setAttribute("departs", departService.findDepartAll());
		return true;
	}
	@RequestMapping("/insertDepart")
	@ResponseBody
	private boolean addDeoart(HttpSession session ,Department department) {
		return departService.insertDepart(department);
	}
	@RequestMapping("/deleteDepart")
	@ResponseBody
	private boolean deleteDepart(HttpSession session ,Integer departId ) {
		return departService.deleteDepartByDepartId(departId);
	}
	@RequestMapping("/updateDepartBeforeSelect")
	@ResponseBody
	private boolean updateDepartBeforeSelect(HttpSession session ,Integer departId ) {
		session.setAttribute("depart", departService.selectDepartBydepartId(departId));
		return true;
	}
	@RequestMapping("/updateDepart")
	@ResponseBody
	private boolean updateDepart(Department department) {
		return departService.updateDepart(department);
	}
	
	

}
