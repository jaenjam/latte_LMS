package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class SubjectAppoveController {

	//@Autowired subjectAppoveService subjectAppoveService;

	// 승인과목 메인 진입 (승인과목메인진입은 왼쪽 사이드바에서 주체에 따라 구분된 강의를 눌러 들어옴)
	@GetMapping("/subjectApprove/subjectApproveMain")
	public String getsubjectApproveMain() {
		
		return "/subjectApprove/subjectApproveMain";
	}
}
