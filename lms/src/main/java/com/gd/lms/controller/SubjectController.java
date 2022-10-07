package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.SubjectService;
import com.gd.lms.vo.Subject;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class SubjectController {

	@Autowired
	SubjectService subjectService;
	
	// 과목추가 form
	@GetMapping("/employee/subject/addSubject")
	public String addSubject() {

		return "/employee/subject/addSubject";

	}
	
	
	//과목추가 action
	@PostMapping("/addSubject")
	public String addSubject(Subject subject) {
		log.debug(TeamColor.CSJ + "subjectController.addSubject 실행");
		
		subjectService.addSubject(subject);
		log.debug(TeamColor.CSJ+"subject : " + subject.toString());
		
		return "redirect:/employee/detail/subjectList";
		

	
}


}
