package com.greathiit.lab.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greathiit.lab.entity.Customer;
import com.greathiit.lab.service.CustomerService;
import com.greathiit.lab.service.LaborService;

@Controller
@RequestMapping("/loginServlet")
public class LoginServlet {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private LaborService laborService;
	@RequestMapping("/login")
	@ResponseBody
	public boolean login(HttpSession session ,Customer customer,String custPasswd) {
		customer.setCustPasswd(custPasswd);
		if(!customerService.login(customer)) {
			return false;
		}
		session.setAttribute("loginCustomer", customerService.selectCustomeByCustId(customer.getCustId()));
		session.setAttribute("loginLaboratorys", laborService.selectLaborBylaborUser(customer.getCustId()));
		return true;	
	}
	@RequestMapping("/exitMethod")
	@ResponseBody
	public boolean exitMethod(HttpSession session) {
		session.invalidate();
		return true;	
	} 

}
