package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.service.ProfessorService;
import com.gd.lms.service.SalaryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeSalayController {
	@Autowired EmployeeService employeeService;
	@Autowired ProfessorService professorService;
	@Autowired SalaryService salaryService;
	
	//연봉관리 - 교수리스트 보여주기
	@GetMapping("/employee/salary/professorSalary")
	public String professorSalaryList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController professorSalaryList 실행");
				
		//professorSalaryList에 저장
		List<Map<String, Object>> professorSalaryList = professorService.getProfessorSalaryList();
		
		//List에 담은 값을 model에 넣어 저장
		model.addAttribute("professorSalaryList", professorSalaryList);
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController professorSalaryList라는 model값 확인 : " + professorSalaryList);
				
		
		//employee/salary/professorSalary 페이지로
		return "/employee/salary/professorSalary";
	}
	
	
	//연봉관리 - 서브관리자리스트 보여주기
	@GetMapping("/employee/salary/subEmployeeSalary")
	public String subEmployeeSalaryList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController subEmployeeSalaryList 실행");
				
		//subEmployeeSalaryList에 저장
		List<Map<String, Object>> subEmployeeSalaryList = employeeService.getsubEmployeeSalaryList();
		
		List<Map<String, Object>> salaryList = salaryService.getSalaryList();
		
		//List에 담은 값을 model에 저장
		model.addAttribute("subEmployeeSalaryList", subEmployeeSalaryList);
		
		model.addAttribute("salaryList",salaryList);
		
		//subEmployeeSalaryList 에 담긴 값 확인
		log.debug(TeamColor.LJE + "EmployeeSalaryController subEmployeeSalaryList값 :" + subEmployeeSalaryList);
		
		
		//employee/salary/subEmployeeSalary 페이지로
		return "employee/salary/subEmployeeSalary";
	}
	
	
	//연봉관리 - 총관리자리스트 보여주기
	@GetMapping("/employee/salary/employeeSalary")
	public String employeeSalaryList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController employeeSalaryList 실행");
				
		//employeeSalaryList에 저장
		List<Map<String, Object>> employeeSalaryList = employeeService.getEmployeeSalaryList();
		
		//List에 담은 값을 model에 저장
		model.addAttribute("employeeSalaryList", employeeSalaryList);
		
		//employeeSalaryList 에 담긴 값 확인
		log.debug(TeamColor.LJE + "EmployeeSalaryController employeeSalaryList값 :" + employeeSalaryList);
			
		//employee/salary/employeeSalary 페이지로
		return "employee/salary/employeeSalary";
	}
	
}
