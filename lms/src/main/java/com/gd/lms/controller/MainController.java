package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.service.ProfessorService;
import com.gd.lms.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class MainController {

	@Autowired ProfessorService professorService;
	@Autowired StudentService studentService;
	@Autowired EmployeeService employeeService;
	
		// 상단 헤더 누를 시 메인접근
		@GetMapping("/home")
		public String gomain(HttpServletRequest request, Model model, int No) {
			// 해당컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"메인 이동");
			
			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();	
			
			//professorImg에 넣어주기
			List<Map<String,Object>> professorImg = professorService.getProfessorImg(No);
			
			//professorImg에 값 저장해주기
			model.addAttribute("professorImg", professorImg);

			log.debug(TeamColor.LJE + "MainController gomain professorImg : " + professorImg);
			
			
			//studentImg에 넣어주기
			List<Map<String, Object>> studentImg = studentService.getStudentImg(No);
			
			model.addAttribute("studentImg", studentImg);
			
			log.debug(TeamColor.LJE + "MainController gomain studentImg : " + studentImg);
			
			
			//employeeImg에 넣어주기
			List<Map<String, Object>> employeeImg = employeeService.getEmployeeImg(No);
			
			//employeeImg에 값 저장해주기
			model.addAttribute("employeeImg", employeeImg);
			
			log.debug(TeamColor.LJE + "MainController gomain model값 출력 : " + model);
			
			
			if(session.getAttribute("user") !=null) {
				return "/home";
			} else {
				log.debug(TeamColor.KHW + "로그인 만료되었습니다!");				
			return "/loginForm";
			}
		}
}
