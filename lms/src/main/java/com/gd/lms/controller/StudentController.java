package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;
import com.gd.lms.service.StudentService;
import com.gd.lms.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired MajorService majorService;
	
	// 학생 회원가입 form
	@GetMapping("/student/signupStudentForm")
	public String addStudent(Model model) {
		
		// 디버깅
		System.out.println("addStudent get(form)");
		log.debug(TeamColor.KHW+ "StudentController의 addStudent get(form)");
		
		// major_no용 리스트
		List<Map<String,Object>> majorList = majorService.getMajorList();
		// model에 저장하기
		model.addAttribute("majorList",majorList);

		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 majorList:" +majorList);
		
		return "/student/signupStudentForm";
	}
	
	
	// 학생 회원가입 action
	@PostMapping("/addStudent")
	public String addStudent(Student student, Model model ) {
		
		//  ┌그 값을 담음		 ┌서비스에 메서드를 실행시킴
		int insertStudent = studentService.addStudent(student);
		// model에 해당 값을 저장
		model.addAttribute("addStudent", insertStudent);
		
		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 addStudent의 model:" +model);
		return "loginForm";		
	}
	
	
	// 학생 로그인 action
	@PostMapping("/StudentForm")
	public String loginstudent(Student studnet, Model model) {
		
		// 서비스의 getStudent 실행
		Student loginstudent = studentService.getStudent(studnet);
		
		// model에 저장하기
		model.addAttribute("StudentId", loginstudent);

		
		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 model:" +model);
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 loginstudent:" +loginstudent);
		
		
		if (loginstudent == null) {
			log.debug(TeamColor.KHW +"로그인 실패");
			return "loginForm";			
		} else {
			
			log.debug(TeamColor.KHW +"로그인 성공");
			return "home";
		}
	}
	

}
