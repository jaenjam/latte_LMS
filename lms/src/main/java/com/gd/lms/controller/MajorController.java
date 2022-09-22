package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;
import com.gd.lms.vo.Major;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MajorController {
	
	@Autowired MajorService majorService;
	
	//전공목록
	@GetMapping("/major/majorList")
	public String majorList(Model model) {
		
		log.debug(TeamColor.JJY +"MajorController.majorList실행");
		
		List<Map<String,Object>> majorList = majorService.getMajorList();
		
		model.addAttribute("majorList",majorList);
		log.debug(TeamColor.JJY +("majorController majorList값 : " + majorList));
			
		return "/major/majorList"; // major폴더안에 majorList보여주기
	}
	
	// 전공추가Form
	@GetMapping("/major/addMajor")
	public String addMajor() {
		log.debug(TeamColor.JJY + ("majorController addMajor Get실행"));
		
		return "/major/addMajor"; // major폴더안에 addMajor보여주기
	}
	
	// 전공추가 Action
	@PostMapping("/addMajor")
	public String addMajor(Major major) {
		log.debug(TeamColor.JJY + ("majorController addMajor Post실행"));
		majorService.addMajor(major);
		
		return "redirect:/major/majorList"; // addMajor실행해서 추가시켜주기
	}
	
}
