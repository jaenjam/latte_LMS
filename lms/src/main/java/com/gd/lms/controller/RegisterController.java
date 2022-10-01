package com.gd.lms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.RegisterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class RegisterController {
	@Autowired RegisterService registerservice;
	
	// 수강바구니에 들어가는 수강신청폼 (학생의)
	@GetMapping("/register/getRegisterForm")
	public String getRegisterForm(HttpServletRequest request) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"RegisterController의 RegisterForm 진입");
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();	
		
		
		// 학생이거나
		if( session.getAttribute("user") != "student") {
			log.debug(TeamColor.KHW +"학생이 아닙니다");
			
			return "home";
		}
		// 해당 기간이 아니면 아웃(이건 학사일정 만들고 나서 시도)
		
		
		return "/register/getRegisterForm";
	}
	
}
