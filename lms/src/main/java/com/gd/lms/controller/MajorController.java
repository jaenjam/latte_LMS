package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MajorController {
	
	@Autowired MajorService majorService;
	
	//전공목록
	@GetMapping("/major/majorList")
	public String majorList(Model model) {
		
		log.debug(TeamColor.CSJ +"MajorController.majorList실행");
		
		List<Map<String,Object>> majorList = majorService.getMajorList();
		
		model.addAttribute("majorList",majorList);
		log.debug(TeamColor.CSJ +("majorController majorList값 : " + majorList));
		
		
		return "/major/majorList"; // major폴더안에 majorList보여주기
	}
	
}
