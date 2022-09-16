package com.gd.lms.controller;

import java.util.List;

import java.util.Map;

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
	
	
	
	
	//관리자로그인 form
		@GetMapping("login")
		public String loginEmployee() {
			
			System.out.println("loginEmployee get");
			
			return "loginForm";
		}
		
	//메인페이지
		@GetMapping("/index")
		public String index() {
			return "index"; 
		}
		
	//관리자로그인 action
		@PostMapping("EmployeeForm")
		public String loginEmployee(Employee employee, Model model) {
			
			Employee loginEmployee = employeeservice.loginEmployee(employee);
			List<Map<String,Object>> employeeList = employeeservice.getEmployeeList();
			
			model.addAttribute("loginEmployee", loginEmployee);
			model.addAttribute("employeeList", employeeList);
			
			System.out.println("loginEmployee post");
			System.out.println("employeeList get");
			
			return "index";
	

}
		
		
	//관리자 정보수정 form
		@GetMapping("/modifyEmployee")
		public String modifyEmployee(Model model, Employee employee) {
			model.addAttribute("e", employee);
			System.out.println(model);
			
			return "redirect:/employeeList";
		
		
		}
		
	
}
