package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.service.EmployeeService;
import com.gd.lms.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired EmployeeService employeeservice;
	
	//관리자회원가입 form
	@GetMapping("/addEmployee")
	public String addEmployee() {
		
		System.out.println("addEmployee get");
		return "addEmployee";
	}
	
	//관리자회원가입 action
	@PostMapping("addEmployee")
	public String addEmployee(Employee employee, Model model) {
		
		int insertEmployee = employeeservice.addEmployee(employee);
		model.addAttribute("addemployee",insertEmployee);
		
		System.out.println("addEmployee post");
		
		return "result";
	}

}
