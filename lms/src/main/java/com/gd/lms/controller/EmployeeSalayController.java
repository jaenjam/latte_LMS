package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.service.ProfessorService;
import com.gd.lms.service.SalaryService;
import com.gd.lms.vo.Employee;
import com.gd.lms.vo.Professor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeSalayController {
	@Autowired EmployeeService employeeService;
	@Autowired ProfessorService professorService;
	@Autowired SalaryService salaryService;
	
	//연봉자체관리
	@GetMapping("/employee/salary/salaryList")
	public String salaryList(Model model) {
		
		log.debug(TeamColor.JJY + "EmployeeSalaryController ->  salaryList실행");
		
		List<Map<String,Object>> salaryList = salaryService.getSalaryList();
		model.addAttribute("salaryList",salaryList);
		
		log.debug(TeamColor.JJY + "salaryList model 값 확인 : " + model);
		
		return "/employee/salary/salaryList";
	}
	
	//연봉관리 - 교수리스트 보여주기
	@GetMapping("/employee/salary/professorSalary")
	public String professorSalaryList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController professorSalaryList 실행");
				
		//professorSalaryList에 저장
		List<Map<String, Object>> professorSalaryList = professorService.getProfessorSalaryList();
		
		List<Map<String, Object>> salaryList = salaryService.getSalaryList();
		
		model.addAttribute("salaryList",salaryList);
		
		//List에 담은 값을 model에 넣어 저장
		model.addAttribute("professorSalaryList", professorSalaryList);
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController professorSalaryList라는 model값 확인 : " + professorSalaryList);
				
		
		//employee/salary/professorSalary 페이지로
		return "/employee/salary/professorSalary";
	}
	
	//연봉관리 - 액션
	@PostMapping("/salaryProfesorAction")
	public String salaryProfesorAction(Professor professor) {
		
		//controller실행 여부 확인하기
		log.debug(TeamColor.JJY+"EmployeeSalayController -> salaryProfessorAction 실행");
		
		//row값이 1이면 쿼리 작동 성공!
		int row = salaryService.modifySalaryProfessor(professor);
		log.debug(TeamColor.JJY +"row : " + row);
		
		// 쿼리 변경되면 연봉리스트가 다시 보이게 redirect주기!
		return "redirect:/employee/salary/professorSalary";
	}
	
	//연봉관리 - 서브관리자리스트 보여주기
	@GetMapping("/employee/salary/subEmployeeSalary")
	public String subEmployeeSalaryList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeSalaryController subEmployeeSalaryList 실행");
				
		//subEmployeeSalaryList에 저장
		List<Map<String, Object>> subEmployeeSalaryList = employeeService.getsubEmployeeSalaryList();
		
		List<Map<String, Object>> salaryList = salaryService.getSalaryList();
		
		model.addAttribute("salaryList",salaryList);
		
		//List에 담은 값을 model에 저장
		model.addAttribute("subEmployeeSalaryList", subEmployeeSalaryList);
		
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
			List<Map<String, Object>> salaryList = salaryService.getSalaryList();
			
			model.addAttribute("salaryList",salaryList);
			
			//List에 담은 값을 model에 저장
			model.addAttribute("employeeSalaryList", employeeSalaryList);
			
			//employeeSalaryList 에 담긴 값 확인
			log.debug(TeamColor.LJE + "EmployeeSalaryController employeeSalaryList값 :" + employeeSalaryList);
			System.out.println("model : " + model);
				
			//employee/salary/employeeSalary 페이지로
			return "employee/salary/employeeSalary";
		}
		
		//연봉관리 - 액션 (총관리자 / 서브관리자)
		@PostMapping("/salaryEmployeeAction")
		public String salaryEmployeeAction(Employee employee,String employeeActive) {
			
			log.debug(TeamColor.JJY+"EmployeeSalayController -> salaryEmployeeAction 실행");
			
			int row = salaryService.modifySalaryEmployee(employee);
			log.debug(TeamColor.JJY +"row : " + row);
			
			
			if(employeeActive.equals("총관리자")) {
				return  "redirect:/employee/salary/employeeSalary";
			} else {
				return "redirect:/employee/salary/subEmployeeSalary";
			}
			
		}
	
}
