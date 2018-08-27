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

import com.greathiit.lab.entity.FurnitureType;
import com.greathiit.lab.page.Fenpage;
import com.greathiit.lab.service.FurnitureTypeService;

@Controller
@RequestMapping("/FurnTypeServlet")
public class FurnTypeServlet {
	@Autowired
	private FurnitureTypeService furnitureTypeService;
	@RequestMapping("/findAllfun")
	@ResponseBody
	public boolean findAllfun(HttpSession session,@RequestParam(value="currentPage",required=false,defaultValue="0")Integer currentPage) {
		Fenpage page =new Fenpage(currentPage,furnitureTypeService.selectFurnitureTypeCount());
		List<FurnitureType> furnitureTypes=furnitureTypeService.findAllFurnitureType(page);
		session.setAttribute("FurnitureTypes", furnitureTypes);
		session.setAttribute("page", page);
		return true;
	}
	@RequestMapping("/addFurnitureType")
	@ResponseBody
	public boolean addEquipment(HttpSession session,FurnitureType furnitureType, @RequestParam(value="file") MultipartFile file) throws IllegalStateException, IOException {
        if (!file.isEmpty()) {
      	  if(!file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).equals("jpg")) {
      		  return false;       		  
      	  }
          String path=session.getServletContext().getRealPath("funtypeImg"+"/"+furnitureType.getFuntypeId()+".jpg");
          File localfile=new File(path);
          file.transferTo(localfile);
          furnitureType.setFuntypeImg("funtypeImg"+"/"+furnitureType.getFuntypeId()+".jpg");
          return furnitureTypeService.insertFurnitureType(furnitureType);
      }
        furnitureType.setFuntypeImg("funtypeImg/default.jpg");
      return furnitureTypeService.insertFurnitureType(furnitureType);
	}
	@RequestMapping("/deleteFurnitureType")
	@ResponseBody
	public boolean deleteFurnitureType(String funtypeId){
       return furnitureTypeService.deleteFurnitureType(funtypeId);
	}
	@RequestMapping("/updateFurnitureTypeBeforeSelect")
	@ResponseBody
	public boolean updateFurnitureTypeBeforeSelect(HttpSession session,String funtypeId) {
        session.setAttribute("funType", furnitureTypeService.selectFurnitureTypeByFuntypeId(funtypeId));
        return true;
	}
	@RequestMapping("/updatefunType")
	@ResponseBody
	public boolean updateFuntype(HttpSession session,FurnitureType furnitureType, @RequestParam(value="file") MultipartFile file) throws IllegalStateException, IOException {
        if (!file.isEmpty()) {
        	  if(!file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1).equals("jpg")) {
        		  return false;       		  
        	  }
            String path=session.getServletContext().getRealPath("funtypeImg"+"/"+furnitureType.getFuntypeId()+".jpg");
            File localfile=new File(path);
            file.transferTo(localfile);
            furnitureType.setFuntypeImg("funtypeImg"+"/"+furnitureType.getFuntypeId()+".jpg");
            return furnitureTypeService.updateFurnitureType(furnitureType);
        }
        return furnitureTypeService.updateFurnitureType(furnitureType);
	}

}
