package com.gd.lms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class MainController {

	
		// 상단 헤더 누를 시 메인접근
		@GetMapping("/home")
		public String gomain(HttpServletRequest request) {
			// 해당컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"메인 이동");
			
			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();	
			
			if(session.getAttribute("user") !=null) {
				return "/home";
			} else {
				log.debug(TeamColor.KHW + "로그인 만료되었습니다!");				
			return "/loginForm";
			}
		}
}
