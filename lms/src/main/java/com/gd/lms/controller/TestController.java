package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.gd.lms.repository.TestRepository;
import net.bytebuddy.implementation.bind.MethodDelegationBinder;
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
	public String addTest(Model model, int subjectApproveNo, String testName) {

		Test testt = repository.findByTestNameAndSubjectApproveSubjectApproveNo(testName, subjectApproveNo);
		log.debug(TeamColor.JJY + "test checking 값 : " + subjectApproveNo + "  " + testName);
		log.debug(TeamColor.JJY + "test checking 값 : " + testt);
		if (testt == null) {
			testService.addTest(subjectApproveNo, testName);
		} else {

		}

		log.debug(TeamColor.JJY + "insertTest 값 : " + model);

		return "/test/multipleTestForm";
	}

	// 시험지출제하기(1)Form
	@GetMapping("/test/multipleTestForm")
	public String multipleTestForm() {

		return "/test/multipleTestForm";
	}

	// 시험지출제하기(2) action
	@PostMapping("/addMultipleTest")
	public String addMultipleTest(Model model, @RequestParam("testNo") int testNo,
			@RequestParam("multiplechoiceAnswer") int multiplechoiceAnswer,
			@RequestParam("multiplechoiceScore") String multiplechoiceQuestion,
			@RequestParam("multiplechoiceQuestion") String multiplechoiceScore,
			@RequestParam("multiplechoiceNo") int multiplechoiceNo,
			@RequestParam("multipleTestExampleNo") String multipleTestExampleNo,
			@RequestParam("multipleTestExampleContent") String multipleTestExampleContent) {

		testService.addMultipleTest(testNo, multiplechoiceQuestion, multiplechoiceAnswer, multiplechoiceScore);	
		
		//MultipleTest no값 가져오기
		
		
		testService.addMultipleTestExample(multiplechoiceNo, multipleTestExampleNo, multipleTestExampleContent);

		return "redirect:/test/result";
	}
 
}
