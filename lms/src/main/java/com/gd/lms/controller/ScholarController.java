package com.gd.lms.controller;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.ScholarService;
import com.gd.lms.vo.Scholar;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ScholarController {
	
	@Autowired ScholarService scholarService;
	
	//장학목록
	@GetMapping("/scholar/scholarList")
	public String scholarList(Model model) {
		
		log.debug(TeamColor.CSJ +"ScholarController.scholarList");
		
		List<Map<String,Object>> scholarList = scholarService.getScholarList();
		
		model.addAttribute("scholarList",scholarList);
		log.debug(TeamColor.CSJ +("scholarController.scholarList : " + scholarList));
			
		return "/scholar/scholarList"; 
	}
	
	// 장학 추가 form
	@GetMapping("/scholar/addScholar")
	public String addScholar() {
		log.debug(TeamColor.CSJ + ("scholarController.addScholar form"));
		
		return "/scholar/addScholar";
	}
	
	// 장학 추가 action
	@PostMapping("/addScholar")
	public String addScholar(Scholar scholar) {
		log.debug(TeamColor.CSJ + ("scholarController addScholar action"));
		scholarService.addScholar(scholar);
		
		return "redirect:/scholar/scholarList"; 
	}
	
}
