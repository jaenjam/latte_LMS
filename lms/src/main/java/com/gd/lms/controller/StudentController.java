package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.MajorService;
import com.gd.lms.service.StudentService;
import com.gd.lms.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired MajorService majorService;
	
	// 학생 회원가입 form
	@GetMapping("/addStudent")
	public String addStudent(Model model) {
		
		// 디버깅
		System.out.println("addStudent get(form)");
		
		// major_no용 리스트
		List<Map<String,Object>> majorList = majorService.getMajorList();
		// model에 저장하기
		model.addAttribute("majorList",majorList);

		
		return "addStudent";
	}
	
	
	// 학생 회원가입 action
	@PostMapping("/addStudent")
	public String addStudent(Student student, Model model ) {
		
		//  ┌그 값을 담음		 ┌서비스에 메서드를 실행시킴
		int insertStudent = studentService.addStudent(student);
		// model에 해당 값을 저장
		model.addAttribute("addStudent", insertStudent);
		
		System.out.println("addStudent post");
		
		return "home";		
	}
	
	
	// 학생 로그인 form
	@PostMapping("StudentForm")
	public String loginstudent(Student studnet, Model model) {
		
		// 서비스의 getStudent 실행
		Student loginstudent = studentService.getStudent(studnet);
		
		// model에 저장하기
		model.addAttribute("StudentId", loginstudent);
		
		return "home";
	}
	
}