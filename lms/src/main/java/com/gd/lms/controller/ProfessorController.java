package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.ProfessorService;
import com.gd.lms.vo.Professor;


@Controller
public class ProfessorController {
	@Autowired ProfessorService professorService;
	
	//로그인폼
	@GetMapping("loginForm")
	public String professorLogin() {
		return "loginForm";
	}
	
	//로그인 액션
	@PostMapping("ProfessorForm")
	public String professorLogin(Professor professor, Model model) {
		
		Professor professorLogin = professorService.getProfessor(professor);
		model.addAttribute("ProfessorId", professorLogin);
		
		return "result";
		
	}
}
