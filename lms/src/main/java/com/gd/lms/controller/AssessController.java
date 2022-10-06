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
	
	// 학생의 교수평가 -----------------------------------------------------
	// 학생이 교수평가 메뉴 누를 시 교수평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
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
			, ProfessorAssess professorassess
			) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 addAssessPfOne 진입");
		
		// 받아온 값 확인
		log.debug(TeamColor.KHW + "점수 : " + professorAssessScore);
		log.debug(TeamColor.KHW + "평가내용 : " + professorAssessContent);
		model.addAttribute("AssessPfOne", assessservice.addAssessPfOne(registerNo, professorAssessScore, professorAssessContent));
		
		
		return "redirect:/assess/professor/getProfessorAssessForm?registerNo="+professorassess.getRegisterNo();
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	@GetMapping("/assess/professor/getProfessorAssessFormOne")
	public String getAssessPfFormOne(Model model,
			@RequestParam("registerNo") int registerNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfFormOne 진입");
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessPfOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getProfessorAssessFormOne";
	}
	
	
	
	
	// 학생의 과목평가 -----------------------------------------------------
	
	// 학생이 과목평가 메뉴 누를 시 과목평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	@GetMapping("/assess/subject/getSubjectAssessList")
	public String getAssessSbList(Model model,
			@RequestParam("studentNo") int studentNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfList 진입");
		
		log.debug(TeamColor.KHW +"학번 : " + studentNo);
		
		model.addAttribute("registerList", assessservice.selectSubjectAssessList(studentNo));
		
		return "/assess/subject/getSubjectAssessList";
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목 평가 폼 불러오기
	@GetMapping("/assess/professor/getSubjectrAssessForm")
	public String getAssessSbForm(Model model
			, @RequestParam("registerNo") int registerNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfForm 진입");
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessSbOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getSubjectAssessForm";
	}
	
	
	// 상세보기를 누를 시 one 불러오기
	@GetMapping("/assess/professor/getSubjectAssessFormOne")
	public String getAssessSbFormOne(Model model
			, @RequestParam("registerNo") int registerNo) {
		
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfFormOne 진입");
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessSbOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getSubjectAssessFormOne";
	}
	
	// 별점 입력후 반영 Action
	
	
	
	/*
	// 관리자가 메인메뉴에서 전체 과목평가리스트 불러오기
	@GetMapping("/assess/employee/getProfessorAssessListTotal")
	public String getAssessPfTotalList(Model model
			, @RequestParam("subjectApproveNo") int subjectApproveNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfTotalList 진입");
		
		// 받아온 subjectApproveNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + subjectApproveNo);
		model.addAttribute("AssessPfTotalList", assessservice.assessFormPf(registerNo));
		return "/assess/employee/getProfessorAssessListTotal";
	}
	*/
	
	
	// -------------------------------- 관리자 메뉴 시작
	
	// 전체 평가리스트 보기
	
	
}
