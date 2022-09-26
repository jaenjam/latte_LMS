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
import com.gd.lms.service.SubjectApproveService;
import com.gd.lms.service.SubjectService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeDetailController {
	@Autowired EmployeeService employeeService;
	@Autowired ProfessorService professerService;
	@Autowired StudentService studentService;
	@Autowired SubjectService 	subjectService;
	@Autowired SubjectApproveService subjectApproveService;

	
	//상세관리 - 승인과목리스트 보여주기
	@GetMapping("/employee/detail/subjectApproveList")
	public String subjectApproveList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeDetailController subjectApproveList 실행");
		
		//list<String>에 넣어주기
		List<Map<String, Object>> subjectApproveList = subjectApproveService.selectSubjectApproveList();
		
		//subjectApproveList 저장
		model.addAttribute("subjectApproveList",subjectApproveList);
		
		//subjectApproveList 에 담긴 값 확인
		log.debug(TeamColor.LJE + "EmployeeDetailController subjectApproveList값 :" + subjectApproveList);
				
		//employee/detail/subjectApproveList 페이지로
		return "/employee/detail/subjectApproveList";
	}
	
	
	//상세관리 - 과목리스트 보여주기
	@GetMapping("/employee/detail/subjectList")
	public String subjectList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "EmployeeDetailController.subjectList 실행");
		
		//map으로 뽑아와서 list에 넣어주기
		List<Map<String, Object>> subjectList = subjectService.getSubjectList();
		
		//studentList에 넣어준다.
		model.addAttribute("subjectList" ,subjectList);
		
		//subjectList에 넣어주기
		log.debug(TeamColor.LJE + "EmployeeDetailController subjectList값 :" + subjectList);
		
		//employee/detail/subjectList 페이지로
		return "/employee/detail/subjectList";
	}	
	
	//상세관리 - 학생리스트 보여주기
	@GetMapping("/employee/detail/studentList")
	public String studentList(Model model) {
		
		//디버깅코드 출력
		log.debug(TeamColor.LJE + "EmployeeDetailController studentList 실행");
		
		//studentService에 있는 getStudentList 가져오기
		List<Map<String, Object>> studentList = studentService.getStudentList();
		
		//studentList에 넣어준다.
		model.addAttribute("studentList" ,studentList);		
		
		log.debug(TeamColor.LJE + "EmployeeDetailController subEmployeeList 실행한 값 : " + studentList);
			
		return "employee/detail/studentList";
	}
	
	
	//상세관리 - 교수리스트 보여주기
	@GetMapping("/employee/detail/professorList")
	public String professorList(Model model) {
		
		//디버깅코드 출력
		log.debug(TeamColor.LJE + "EmployeeDetailController professorList 실행");
				
		//professorServcie에 있는 getProfessorList 가져오기
		List<Map<String,Object>> professorList = professerService.getProfessorList();
		
		//professorList에 넣어준다.
		model.addAttribute("professorList" ,professorList);
		
		log.debug(TeamColor.LJE + "EmployeeDetailController subEmployeeList 실행한 값 : " + professorList);
		
		//employee/detail/professorList 페이지로
		return "employee/detail/professorList";
	}
	
	
	//상세관리 - 서브관리자리스트 보여주기
	@GetMapping("/employee/detail/subEmployeeList")
	public String subEmployeeList(Model model) {
		
		//디버깅코드 출력
		log.debug(TeamColor.LJE + "EmployeeDetailController subEmployeeList 실행");
		
		//map에 넣어주고 list에 넣어 출력하기 위해서
		List<Map<String, Object>> subEmployeeList = employeeService.getsubEmployeeList();
		
		//subEmployeeList에 넣어주기
		model.addAttribute("subEmployeeList",subEmployeeList);
		
		log.debug(TeamColor.LJE + "EmployeeDetailController subEmployeeList 실행한 값 : " + subEmployeeList);
		
		//employee/detail/subEmployeeList 페이지로
		return "employee/detail/subEmployeeList";
	}
}
