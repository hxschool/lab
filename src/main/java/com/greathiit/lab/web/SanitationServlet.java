package com.greathiit.lab.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greathiit.lab.entity.Sanitation;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.LaborService;
import com.greathiit.lab.service.SanitationService;
import com.greathiit.lab.web.pojo.LaborAndSan;

@Controller
@RequestMapping("/SanitationServlet")
public class SanitationServlet {
	@Autowired
	private LaborService laborService;
	@Autowired
	private SanitationService sanitationService;
	@RequestMapping("/addSanBeforeSelect")
	@ResponseBody
	public boolean addSanBeforeSelect(HttpSession session) {
		session.setAttribute("laboratorys", laborService.selectAllLabor());
		return true;
	}
	@RequestMapping("/addSanitation")
	@ResponseBody
	public boolean add(HttpSession session,Sanitation sanitation) {	
		return sanitationService.insertSanitation(sanitation);
	}
	@RequestMapping("/findAllSan")
	@ResponseBody
	public boolean findAllEqu(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		Fenpage page =new Fenpage(currentPage,laborService.selectAllLabor().size());		
		List<LaborAndSan> laborAndSans=sanitationService.findLaborAndSanAll(page);
		session.setAttribute("laborAndSans", laborAndSans );
		session.setAttribute("page", page);
		return true;
	}

}
