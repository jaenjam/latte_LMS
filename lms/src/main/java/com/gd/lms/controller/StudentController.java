package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.StudentService;
import com.gd.lms.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
	
	@PostMapping("StudentForm")
	public String loginstudent(Student studnet, Model model) {
		
		Student loginstudent = studentService.getStudent(studnet);
		model.addAttribute("StudentId", loginstudent);
		
		return "result";
	}
}
