package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class AssessController {

	
	@Autowired
	
	// 교수평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	@GetMapping("/assess/professor/getProfessorAssessList")
	public String getAssessPfList() {
		
		return "/assess/professor/getProfessorAssessForm";
	}
	
	// 교수평가 폼 불러오기
	@GetMapping("/assess/professor/getProfessorAssessForm")
	public String getAssessPfForm() {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfForm 진입");
		
		return "/assess/professor/getProfessorAssessForm";
	}
	
	
}
