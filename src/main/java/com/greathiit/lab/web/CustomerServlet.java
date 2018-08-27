package com.greathiit.lab.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.greathiit.lab.entity.Customer;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.CustomerService;

@Controller
@RequestMapping("/CustomerServlet")
public class CustomerServlet {
	@Autowired
	private CustomerService customerService;
	@RequestMapping("/findAllCust")
	@ResponseBody
	public boolean findAllCust(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		List<Customer> customers=customerService.findCustmoerAll();
		Fenpage page =new Fenpage(currentPage,customers.size());
		customers=customerService.fenpage(page);
		session.setAttribute("customers",customers );
		session.setAttribute("page", page);
	    return true;
	}
    @PostMapping("/addCustomer")
    @ResponseBody
    public boolean handleFormUpload(HttpSession session,Customer customer, @RequestParam(value="file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
        	  if(!file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).equals("jpg")) {
        		  return false;       		  
        	  }
            String path=session.getServletContext().getRealPath("headImg"+"/"+customer.getCustId()+".jpg");
            File localfile=new File(path);
            file.transferTo(localfile);
            customer.setCustImg("headImg"+"/"+customer.getCustId()+".jpg");   
            return customerService.insertCustomer(customer);
        }
        customer.setCustImg("headImg/default.jpg");
        return customerService.insertCustomer(customer);
    }
    @RequestMapping("/deleteCust")
	@ResponseBody
	public boolean deleteCust(Integer custId) {
	    return customerService.deleteCustomerBycustId(custId);
	}
    @RequestMapping("/updateCustBeforeSelect")
	@ResponseBody
	public boolean updateCustBeforeSelect(HttpSession session,Integer custId) {
    	session.setAttribute("customer", customerService.selectCustomeByCustId(custId));
    	return true;
	}
    @RequestMapping("/updateCust")
	@ResponseBody
	public boolean updateCust(HttpSession session,Customer customer, @RequestParam(value="file") MultipartFile file) throws IllegalStateException, IOException {
    	if (!file.isEmpty()) {
      	  if(!file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).equals("jpg")) {
      		  return false;       		  
      	  }
          String path=session.getServletContext().getRealPath("headImg"+"/"+customer.getCustId()+".jpg");
          File localfile=new File(path);
          file.transferTo(localfile);
          customer.setCustImg("headImg"+"/"+customer.getCustId()+".jpg");   
          return customerService.updateCustomer(customer);
      }
      return customerService.updateCustomer(customer);
	}
    
    
    
    
}
