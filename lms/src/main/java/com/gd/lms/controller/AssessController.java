package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.AssessService;
import com.gd.lms.vo.ProfessorAssess;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class AssessController {

	
	@Autowired AssessService assessservice;
	
	// 교수평가 메뉴 누를 시 교수평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	@GetMapping("/assess/professor/getProfessorAssessList")
	public String getAssessPfList(Model model,
			@RequestParam("studentNo") int studentNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfList 진입");
		
		log.debug(TeamColor.KHW +"학번 : " + studentNo);
		
		model.addAttribute("registerList", assessservice.assessList(studentNo));
		
		return "/assess/professor/getProfessorAssessList";
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	@GetMapping("/assess/professor/getProfessorAssessForm")
	public String getAssessPfForm(Model model,
			@RequestParam("registerNo") int registerNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfForm 진입");
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessPfOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getProfessorAssessForm";
	}
	
	
	// 별점 입력후 반영 Action
	@PostMapping("/assess/professor/getProfessorAssessForm")
	public String addAssessPfOne(@RequestParam("rate") int professorAssessScore
			, @RequestParam("reviewTextarea") String professorAssessContent
			, @RequestParam("registerNo") int registerNo
			, Model model
			) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 addAssessPfOne 진입");
		
		// 받아온 값 확인
		log.debug(TeamColor.KHW + "점수 : " + professorAssessScore);
		log.debug(TeamColor.KHW + "평가내용 : " + professorAssessContent);
		model.addAttribute("AssessPfOne", assessservice.addAssessPfOne(registerNo, professorAssessScore, professorAssessContent));
		
		
		return "/assess/professor/getProfessorAssessForm";
	}
	
}
