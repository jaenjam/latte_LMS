package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.vo.Employee;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeservice;

	
	// 관리자 정보수정 form
	@GetMapping("/modifyEmployee")
	public String modifyEmployee(Model model, Employee employee) {
		model.addAttribute("e", employee);

		log.debug(TeamColor.CSJ + "EmployeeController의 modifyEmployee:" + model);

		return "redirect:/employeeList";

	}

	// 관리자회원가입 form
	@GetMapping("/employee/signupEmployeeForm")
	public String addEmployee() {

		log.debug(TeamColor.CSJ + "EmployeeController의 addEmployee get");

		return "/employee/signupEmployeeForm";
	}

	// 관리자회원가입 action
	@PostMapping("/addEmployee")
	public String addEmployee(Employee employee, Model model) {

		int row = employeeservice.addEmployee(employee);
		model.addAttribute("addemployee", row);

		log.debug(TeamColor.CSJ + "EmployeeController의 addEmployee post:" + model);

		// 실패시에 입력폼으로 리다이렉트
		if (row == 0) {
			return "redirect:/employee/signupEmployeeForm";
		}
		// 해당하는 뷰 페이지로 이동
		return "redirect:/loginForm";
	}

	// 관리자로그인 action
	@PostMapping("/EmployeeForm")
		public String loginEmployee(Employee employee, Model model , HttpServletRequest request) {
			
			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();
			
			Employee loginEmployee = employeeservice.loginEmployee(employee);
			
			model.addAttribute("employeeId", loginEmployee);
			
			log.debug(TeamColor.CSJ+"EmployeeController의 loginEmployee model:" +model);
			log.debug(TeamColor.CSJ+"EmployeeController의 loginEmployee loginEmployee:" +loginEmployee);
			
			//계정 정보가 없으면 로그인 실패
			if(loginEmployee == null) {
				log.debug(TeamColor.CSJ+"EmployeeController.login : "+"로그인 실패");
				
				return "/loginForm";
			
			
		} else {
	         session.setAttribute("No", loginEmployee.getEmployeeNo());
	         session.setAttribute("employeePass", loginEmployee.getEmployeePass());
	         session.setAttribute("Name", loginEmployee.getEmployeeName());
	         session.setAttribute("employeeRegiNo", loginEmployee.getEmployeeRegiNo());
	         session.setAttribute("employeeAge", loginEmployee.getEmployeeAge());
	         session.setAttribute("employeeGender", loginEmployee.getEmployeeGender());
	         session.setAttribute("employeeTelephone", loginEmployee.getEmployeeTelephone());
	         session.setAttribute("employeeEmail", loginEmployee.getEmployeeEmail());
	         session.setAttribute("employeeAddress", loginEmployee.getEmployeeAddress());
	         session.setAttribute("employeeDetailAddress", loginEmployee.getEmployeeDetailAddress());
	         session.setAttribute("employeeActive", loginEmployee.getEmployeeActive());
	         session.setAttribute("user", "employee");

	         
			 log.debug(TeamColor.CSJ +"EmployeeController.login :" + "로그인 성공");
			 
			
			return "home";
			
		}
}
	
	
		// 관리자 상세보기
		@GetMapping("/getEmployeeOne")
		public String getEmployeeOne(HttpServletRequest request, @RequestParam("No") int employeeNo, Model model) {

			List<Map<String, Object>> employeeOne = employeeservice.getEmployeeOne(employeeNo);

			
			log.debug(TeamColor.CSJ+ "EmployeeController의 employeeOne" + employeeOne);

			return "/employee/getEmployeeOne";

		}

}
