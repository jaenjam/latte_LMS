package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.gd.lms.repository.TestRepository;
import net.bytebuddy.implementation.bind.MethodDelegationBinder;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.TestService;
import com.gd.lms.vo.Test;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;

import javax.management.ValueExp;

@Slf4j
@Controller
@Transactional
public class TestController {

	@Autowired
	TestService testService;
	@Autowired
	TestRepository repository;
	@Autowired RegisterService registerService;
	
	// 객관식 시험지
	@GetMapping("/test/doMultipleTest")
	public String doMultipleTest(Model model,int testNo) {
		
		log.debug(TeamColor.JJY + "multipleTest실행");
		
		List<Map<String,Object>> testOne = testService.getTestOne(testNo);
		model.addAttribute("testOne",testOne);
		
		log.debug(TeamColor.JJY + "multipleTest model 값 : " + model);
		
		return "/test/doMultipleTest";
	}
	
	// 수강하는과목 시험지리스트 확인하기
	@GetMapping("/test/doTest")
	public String TestList(Model model, HttpServletRequest request) {
		
		log.debug(TeamColor.JJY + "testController TestList(시험지 리스트)실행");
		
		// 로그인 시 세션에 학번이 저장되므로 사용해주기
		HttpSession session =  request.getSession();
		int studentNo = (Integer)session.getAttribute("No");
		 
		List<Map<String,Object>> testList = testService.getTestList(studentNo);
		model.addAttribute("testList",testList);
		
		// model에 값 제대로 들어가있나 확인
		log.debug(TeamColor.JJY+"model 값 testList >> : " + model);
		
		return "/test/doTest";
	}
	
	// 시험지 상세보기
	@GetMapping("/test/TestOne")
	public String TestOne(Model model) {
		
		log.debug(TeamColor.JJY + "professorController TestOne(시험지 상세보기)실행");
		
			
		return "redirect:/test/TestOne";
		
	}

	// 수강된 강의 리스트
	@GetMapping("/test/testList")
	public String testList(Model model, HttpServletRequest request, HttpSession session) {

		List<Map<String, Object>> subjectApproveList = testService.getSubjectApproveList();
		model.addAttribute("subjectApproveList", subjectApproveList);

		// 승인된 과목정보들이 다 들어가있음
		log.debug(TeamColor.JJY + "subjectApproveList 값 : " + model);

		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);
		
		log.debug(TeamColor.LJE + "TestController testList myRegisterListProf : " + myRegisterListProf);
		
		return "/test/testList";
	}

	// 시험지출제하기(1)Form
	@GetMapping("/test/multipleTest")
	public String addTest(@RequestParam("subjectApproveNo") int subjectApproveNo, Model model) {
		model.addAttribute("subjectApproveNo", subjectApproveNo);
		return "/test/multipleTest";
	}

	// 시험지출제하기(1)Action
	@PostMapping("/addTest")
	public String addTest(Model model, int subjectApproveNo, String testName, HttpSession session) {

		Test testt = repository.findByTestNameAndSubjectApproveSubjectApproveNo(testName, subjectApproveNo);

		session.setAttribute("testName", testName);
		session.setAttribute("subjectApproveNo", subjectApproveNo);
		if (testt == null) {
			return "redirect:/test/multipleTestForm?subjectApproveNo="+subjectApproveNo;
		} else {
			return "redirect:/test/testList";
		}

	}

	// 시험지출제하기(1)Form
	@GetMapping("/test/multipleTestForm")
	public String multipleTestForm(Model model, HttpSession session) {
		model.addAttribute("subjectApproveNo",session.getAttribute("subjectApproveNo"));
		model.addAttribute("testName", session.getAttribute("testName"));
		return "/test/multipleTestForm";
	}

	// 시험지출제하기(2) action
	@PostMapping("/addMultipleTest")
	public String addMultipleTest(Model model, @RequestParam("multiplechoiceAnswer") int multiplechoiceAnswer,
			@RequestParam("multiplechoiceScore") String multiplechoiceQuestion,
			@RequestParam("multiplechoiceQuestion") String multiplechoiceScore,
			@RequestParam("multipleTestExampleNo") String multipleTestExampleNo,
			@RequestParam("multipleTestExampleContent") String multipleTestExampleContent) {


		
		//MultipleTest no값 가져오기


		return "redirect:/test/result";
	}
 
}
