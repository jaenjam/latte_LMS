package com.gd.lms.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.RegisterService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class SubjectAppoveController {

	//@Autowired subjectAppoveService subjectAppoveService;
	@Autowired RegisterService registerService;

	// 승인과목 메인 진입 (승인과목메인진입은 왼쪽 사이드바에서 주체에 따라 구분된 강의를 눌러 들어옴)
	@GetMapping("/subjectApprove/subjectApproveMain")
	public String getsubjectApproveMain( Model model, HttpServletRequest request, @RequestParam("subjectApproveNo") int subjectApproveNo) {
		
		// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+"SubjectAppoveController의 승인과목메인진입 컨트롤러 실행");
				

			// 세션 사용하기위해 선언 & 디버깅
			HttpSession session =  request.getSession();			
			log.debug(TeamColor.KHW+"SubjectAppoveController의 받아온 subjectApproveNo : " + subjectApproveNo);
				
			// 이전 페이지에서 쿼리스트링으로 받아온 subjectApproveNo 세션저장 & 디버깅
			session.setAttribute("subjectApproveNo", subjectApproveNo);		
			log.debug(TeamColor.KHW + subjectApproveNo);
				
			Map<String, Object> MyRegister = registerService.getRegisterInfo(subjectApproveNo);
				
				
			model.addAttribute("MyRegister", MyRegister);
				
				
			return "/subjectApprove/subjectApproveMain";
	}
}
