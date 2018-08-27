package com.greathiit.lab.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greathiit.lab.entity.Equipment;
import com.greathiit.lab.entity.Furniture;
import com.greathiit.lab.entity.Laboratory;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.FurnitureService;
import com.greathiit.lab.service.FurnitureTypeService;
import com.greathiit.lab.service.LaborService;
import com.greathiit.lab.web.pojo.FunAndFunType;
import com.greathiit.lab.web.pojo.LaborAndEqurment;

@Controller
@RequestMapping("/LaborAndFunServlet")
public class LaborAndFunServlet {
	@Autowired
	private FurnitureService furnitureService;
	@Autowired
	private LaborService laborService;
	@Autowired
	private FurnitureTypeService furnitureTypeService;
	@RequestMapping("/findAllFun")
	@ResponseBody
	public boolean findAllFun(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		System.out.println(currentPage);
		Fenpage page =new Fenpage(currentPage,laborService.laborCount());
		page.setCurrentPage(currentPage);
		List<LaborAndEqurment> laborAndEqurments=furnitureService.findLaborAndFurnitureAll(page);
		session.setAttribute("laborAndEqurments", laborAndEqurments );
		session.setAttribute("page", page);
		return true;
	}
	@RequestMapping("/findAllFunByLabId")
	@ResponseBody
	public boolean findAllFunByLabId(HttpSession session,Integer labId,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		Integer result=furnitureService.selectTypeCountByid(labId);
		if(result==null) {
			result=0;
		}
		Fenpage page =new Fenpage(currentPage,result);
		List<FunAndFunType> Furnitures = furnitureService.selectFurnitureAllByLabId(labId, page);
		Laboratory laboratory=laborService.selectLaborByLaborId(labId);
		session.setAttribute("laboratory", laboratory);
		session.setAttribute("Furnitures", Furnitures);
		session.setAttribute("page", page);
		return true;
	}
	@RequestMapping("/addFunBeforeSelect")
	@ResponseBody
	public boolean addFunBeforeSelect(HttpSession session,Integer labId) {
		session.setAttribute("Funtypes", furnitureTypeService.findAllReal());
		return true;
	}
	@RequestMapping("/addfun")
	@ResponseBody
	public boolean addfun(Furniture furniture) {		
		return furnitureService.InsertFurniture(furniture);
	}
	@RequestMapping("/deleteFun")
	@ResponseBody
	public boolean deleteFun(String funId) {		
		return furnitureService.deleteFurniture(funId);
	}
	@RequestMapping("/updatefunBeforeSelect")
	@ResponseBody
	public boolean updatefunBeforeSelect(HttpSession session,String funId) {	
		session.setAttribute("Furniture", furnitureService.selectFurnitureByFunId(funId));
		session.setAttribute("Funtypes", furnitureTypeService.findAllReal());
		return true;
	}
	@RequestMapping("/updateFun")
	@ResponseBody
	public boolean updateFun(Furniture furniture) {	
		return furnitureService.updateFurniture(furniture);
	}
	
}
