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
import com.gd.lms.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeStatusController {
	@Autowired EmployeeService employeeService;
	@Autowired ProfessorService professorService;
	@Autowired StudentService studentService;
	
	
	
	//재직/재학 상태 - 학생리스트 보여주기
	@GetMapping("/employee/status/studentStatus")
	public String studentStatusList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeStatusController studentStatusList");
		
		//studentStatusList에 저장
		List<Map<String, Object>> studentStatusList =  studentService.getStudentStatusList();
		
		//List에 담은 값은 model에 넣어 저장
		model.addAttribute("studentStatusList", studentStatusList);
		
		//model값 출력
		log.debug(TeamColor.LJE + "EmployeeStatusController studentStatusList model값 : " + studentStatusList);
		
		//employee/status/studentStatus로
		return "/employee/status/studentStatus";
	}
	
	//재직/재학 상태 - 교수리스트 보여주기
	@GetMapping("/employee/status/professorStatus")
	public String professorStatusList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeStatusController professorStatusList");
		
		//professorStatusList에 저장
		List<Map<String, Object>> professorStatusList =  professorService.getProfessorStatusList();
		
		//List에 담은 값은 model에 넣어 저장
		model.addAttribute("professorStatusList", professorStatusList);
		
		//model값 출력
		log.debug(TeamColor.LJE + "EmployeeStatusController professorStatusList model값 : " + professorStatusList);
		
		//employee/status/professorStatus로
		return "/employee/status/professorStatus";
	}
	
	
	//재직/재학 상태 - 관리자리스트 보여주기
	@GetMapping("/employee/status/employeeStatus")
	public String EmployeeStatusList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeStatusController subEmployeeStatusList");
		
		//EmployeeStatusList에 저장
		List<Map<String, Object>> EmployeeStatusList =  employeeService.getEmployeeStatusList();
		
		//List에 담은 값은 model에 넣어 저장
		model.addAttribute("EmployeeStatusList", EmployeeStatusList);
		
		//model값 출력
		log.debug(TeamColor.LJE + "EmployeeStatusController EmployeeStatusList model값 : " + EmployeeStatusList);
		
		//employee/status/EmployeeStatus로
		return "/employee/status/employeeStatus";
	}
}
