package com.greathiit.lab.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greathiit.lab.entity.Laboratory;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.CustomerService;
import com.greathiit.lab.service.DepartService;
import com.greathiit.lab.service.LaborService;
import com.greathiit.lab.web.pojo.LaborAndCustomerAndDepartPovo;

@Controller
@RequestMapping("/LaborServlet")
public class LaborServlet {
	
	@Autowired
	private LaborService laborService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private DepartService departService;
	@RequestMapping("/findAllLaber")
	@ResponseBody
	public int findAllLaber(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		// TODO Auto-generated method stub
		List<LaborAndCustomerAndDepartPovo> laborAll=laborService.selectAllLabor();
		Fenpage page =new Fenpage(currentPage,laborAll.size());
		laborAll=laborService.fenPage(page);
		session.setAttribute("laborAll", laborAll);
		session.setAttribute("page", page);
		return 1;
	}
	@RequestMapping("/addLabor")
	@ResponseBody
	public int addLaborBeforeSelect(HttpSession session) {//添加实验室之前的查询操作
		session.setAttribute("customers", customerService.findCustmoerAll());
		session.setAttribute("departs", departService.findDepartAll());
		return 1;
	}
	@RequestMapping("/insertLabor")
	@ResponseBody
	public boolean addLabor(HttpSession session,Laboratory laboratory) {//添加实验室之前的查询操作
		boolean result = laborService.insertLabor(laboratory);
		return result;
	}
	@RequestMapping("/deleteLabor")
	@ResponseBody
	public boolean deleteLabor(Integer labId) {//添加实验室之前的查询操作
		boolean result = laborService.deleteLabor(labId);
		return result;
	}
	@RequestMapping("/updateLaborBeforeSelect")
	@ResponseBody
	public boolean updateLaborBeforeSelect(HttpSession session,Integer labId) {//添加实验室之前的查询操作
		session.setAttribute("customers", customerService.findCustmoerAll());
		session.setAttribute("departs", departService.findDepartAll());		
		session.setAttribute("lcdPovo",laborService.selectLaborByLaborId(labId));
		return true;
	}
	@RequestMapping("/updateLabor")
	@ResponseBody
	public boolean updateLabor(Laboratory laboratory) {
		boolean result = laborService.updateLabor(laboratory);
		return result;
	}
	
	
}
	
