package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.SignupService;
import com.gd.lms.vo.Professor;

@Controller
public class SignupController {
	
	@Autowired SignupService signupservice;
	
	//교수회원가입 Form
	@GetMapping("/addProfessor")
	public String addProfessor() {
		
		System.out.println("addProfessor get 실행");
		return "addProfessor";
	}
	
	//교수회원가입 Action
	@PostMapping("addProfessor")
	public String addProfessor(Professor professor) {
		
		System.out.println("addProfessor post 실행");
		
		return "redirect:/addProfessor";
	}

}
