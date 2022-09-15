package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.service.MajorService;

@Controller
public class MajorController {
	
	@Autowired MajorService majorService;
	
	//전공목록
	@GetMapping("/majorList")
	public String majorList(Model model) {
		
		System.out.println("MajorController.majorList실행");
		
		List<Map<String,Object>> majorList = majorService.getMajorList();
		
		model.addAttribute("majorList",majorList);
		System.out.println("majorController majorList값 : " + majorList);
		
		return "majorList";
	}
	
}
