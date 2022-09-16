package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.ProfessorService;
import com.gd.lms.vo.Professor;
import com.gd.lms.service.MajorService;


@Controller
public class ProfessorController {
	@Autowired ProfessorService professorService;
	@Autowired MajorService majorService;
	
	
	//교수회원가입 form
		@GetMapping("/addProfessor")
		public String addProfessor(Model model) {
			System.out.println("addProfessor get실행");
			
			List<Map<String,Object>> majorList = majorService.getMajorList();
			model.addAttribute("majorList",majorList);
			
			return "addProfessor";
		}
		
		//교수회원가입 action
		@PostMapping("/addProfessor")
		public String addProfessor(Professor professor,Model model) {
			
			int insertProfessor = professorService.addProfessor(professor);
			model.addAttribute("addProfessor",insertProfessor);
			
			System.out.println("addProfessor post실행");
			
			return "loginForm";
		}
		
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
			
			return "home";
			
		}
}
