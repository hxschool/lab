package com.greathiit.lab.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.greathiit.lab.entity.EquipmentType;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.EquiTypeService;

@Controller
@RequestMapping("/EquiTypeServlet")
public class EquiTypeServlet {
	@Autowired
	private EquiTypeService equiTypeService;
	@RequestMapping("/findAllEqu")
	@ResponseBody
	public boolean findAllEqu(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		Fenpage page =new Fenpage(currentPage,equiTypeService.selectEquipmentTypeCount());
		List<EquipmentType> EquipmentTypes=equiTypeService.findAllEquipmentType(page);
		session.setAttribute("EquipmentTypes", EquipmentTypes );
		session.setAttribute("page", page);
		return true;
	}
	@RequestMapping("/addEquipment")
	@ResponseBody
	public boolean addEquipment(HttpSession session,EquipmentType equipmentType, @RequestParam(value="file") MultipartFile file) throws IllegalStateException, IOException {
        if (!file.isEmpty()) {
      	  if(!file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).equals("jpg")) {
      		  return false;       		  
      	  }
          String path=session.getServletContext().getRealPath("EqutypeImg"+"/"+equipmentType.getEqutypeId()+".jpg");
          File localfile=new File(path);
          file.transferTo(localfile);
          equipmentType.setEqutypeImg("EqutypeImg"+"/"+equipmentType.getEqutypeId()+".jpg"); 
          return equiTypeService.insertEquipmentType(equipmentType);
      }
        equipmentType.setEqutypeImg("EqutypeImg/default.jpg");
      return equiTypeService.insertEquipmentType(equipmentType);
	}
	@RequestMapping("/deleteEquType")
	@ResponseBody
	public boolean deleteEquType(String equtypeId){
       return equiTypeService.deleteEquipmentType(equtypeId);
	}
	@RequestMapping("/updateEquTypeBeforeSelect")
	@ResponseBody
	public boolean updateEquTypeBeforeSelect(HttpSession session,String equtypeId) {
        session.setAttribute("EquType", equiTypeService.selectEquipmentTypeByequtypeId(equtypeId));
        return true;
	}
	@RequestMapping("/updateEquType")
	@ResponseBody
	public boolean updateCust(HttpSession session,EquipmentType equipmentType, @RequestParam(value="file") MultipartFile file) throws IllegalStateException, IOException {
        if (!file.isEmpty()) {
        	  if(!file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).equals("jpg")) {
        		  return false;       		  
        	  }
            String path=session.getServletContext().getRealPath("EqutypeImg"+"/"+equipmentType.getEqutypeId()+".jpg");
            File localfile=new File(path);
            file.transferTo(localfile);
            equipmentType.setEqutypeImg("EqutypeImg"+"/"+equipmentType.getEqutypeId()+".jpg"); 
            return equiTypeService.updateEquipmentType(equipmentType);
        }
        return equiTypeService.updateEquipmentType(equipmentType);
	}
	
}
