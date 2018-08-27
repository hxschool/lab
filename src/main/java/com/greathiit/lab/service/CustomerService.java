package com.greathiit.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greathiit.lab.dao.CustomerMapper;
import com.greathiit.lab.entity.Customer;
import com.greathiit.lab.page.Fenpage;
@Service
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	public List<Customer> findCustmoerAll() {
		return customerMapper.selectByExample(null);
	}
	public boolean insertCustomer(Customer customer) {
		Integer result=0;
		result=customerMapper.selectByCustId(customer.getCustId());
		if(result!=0) {
			return false;
		}
		result=customerMapper.insert(customer);
		if(result==0) {
			return false;
		}
		return true;
	}
	public boolean deleteCustomerBycustId(Integer custId) {
		Integer result=0;
		result=customerMapper.deleteByCustId(custId);
		if(result!=0) {
			return true;
		}
		return false;
	}
	public Customer selectCustomeByCustId(Integer custId) {
		return customerMapper.selectCustomeByCustId(custId);
	}
	public boolean updateCustomer(Customer customer) {
		Integer result=0;
		result=customerMapper.selectByCustId(customer.getCustId());
		if(result>=2) {
			return false;
		}
		result=customerMapper.updateByPrimaryKey(customer);
		if(result==0) {
			return false;
		}
		return true;
	}
	public List<Customer> fenpage(Fenpage page) {
		return customerMapper.Fenpage(page);
	}
	public boolean login(Customer customer) {
		Integer result=customerMapper.selectCustIdAndCustPasswd(customer);
		if(result>0) {
			return true;
		}
		return false;
	}
}
