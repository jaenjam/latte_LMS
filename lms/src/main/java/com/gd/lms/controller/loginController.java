package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.loginService;
import com.gd.lms.vo.Professor;


@Controller
public class loginController {
	@Autowired loginService loginservice;
	
	@GetMapping("/loginForm")// 처음 로그인폼 들어가기
	public String professorlogin() {
		return "loginForm";
	}
	
	
	
	@PostMapping("/loginForm") // 버튼 누를경우 액션은 이곳으로
	public String professorlogin(Professor professor, Model model) {
		
		Professor loginprofessor = loginservice.getProfessor(professor);
		model.addAttribute("ProfessorId", loginprofessor);
		
		return "result";
	}
	
	
}
