package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.TestService;
import com.gd.lms.vo.MultipleTest;
import com.gd.lms.vo.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	
	@Autowired RegisterService registerService;
	@Autowired TestService testService; 
	
	//시험지출제하기(1)Form
	@GetMapping("/test/addTestForm")
	public String addTest(){
		
	log.debug(TeamColor.JJY+"addTestForm Get실행");
		
	return "/test/addTestForm";	
	}
	
	//시험지출제하기(1)Action
	@PostMapping("/addTest")
	public String addTest(Test test,Model model) {
		
		log.debug(TeamColor.JJY+"addTestForm Post실행");
		
		int insertTest = testService.addTest(test);
		model.addAttribute("addTest",insertTest);
		
		return "redirect:/test/multipleTestForm/";
	}
	
	//시험지출제하기(2)Form
	@GetMapping("/test/multipleTestForm/")
	public String multipleTestForm(MultipleTest multipleTest) {
		
		log.debug(TeamColor.JJY+"multipleTestForm실행");
		
		return "/test/multipleTestForm";
	}

}
