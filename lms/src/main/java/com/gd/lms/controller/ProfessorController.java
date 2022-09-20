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

import com.gd.lms.service.ProfessorService;
import com.gd.lms.vo.Professor;

import lombok.extern.slf4j.Slf4j;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;

@Slf4j
@Controller
public class ProfessorController {
	@Autowired
	ProfessorService professorService;
	@Autowired
	MajorService majorService;

	// 로그인폼
	@GetMapping("loginForm")
	public String professorLogin() {

		log.debug(TeamColor.JJY + "[Controller] loginForm Get실행");
		return "loginForm";
	}

	// 로그인 액션
	@PostMapping("/ProfessorForm")
	public String professorLogin(Professor professor, Model model, HttpServletRequest request) {

		log.debug(TeamColor.JJY + "[Controller] loginForm Post실행");

		String result = "";

		HttpSession session = request.getSession();

		Professor professorLogin = professorService.getProfessor(professor);
		model.addAttribute("ProfessorId", professorLogin);

		log.debug(TeamColor.JJY + "[Controller] professorLogin의 model:" + professorLogin);

		if (professorLogin == null) {
			log.debug(TeamColor.JJY + "로그인실패 ! professorLogin값이 null");
			result = "/loginForm";
		} else {
			log.debug(TeamColor.JJY + "로그인성공");
			// 세션에 로그인시 받은값 저장
			session.setAttribute("No", professorLogin.getProfessorNo());
			session.setAttribute("Name", professorLogin.getProfessorName()); // student,employee랑 같이 공유할거임
			session.setAttribute("MajorNo", professorLogin.getMajorNo());
			session.setAttribute("professorRegiNo", professorLogin.getProfessorRegiNo());
			session.setAttribute("professorAge", professorLogin.getProfessorAge());
			session.setAttribute("professorGender", professorLogin.getProfessorGender());
			session.setAttribute("professorTelephone", professorLogin.getProfessorTelephone());
			session.setAttribute("professorEmail", professorLogin.getProfessorEmail());
			session.setAttribute("professorAddress", professorLogin.getProfessorAddress());
			session.setAttribute("professorDetailAddress", professorLogin.getProfessorDetailAddress());
			session.setAttribute("professorState", professorLogin.getProfessorState());

			log.debug(TeamColor.JJY + "professorNo : " + session.getAttribute("No")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorAge : " + session.getAttribute("professorAge")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorDetailAddress : " + session.getAttribute("professorDetailAddress")); // 값
																														// 출력되는지
																														// 확인
			log.debug(TeamColor.JJY + "professorRegiNo : " + session.getAttribute("professorRegiNo")); // 값 출력되는지 확인

			result = "/home";
		}
		return result;
	}

	// 교수회원가입 form
	@GetMapping("/professor/signupProfessorForm")
	public String addProfessor(Model model) {
		log.debug(TeamColor.JJY + "[Controller] addProfessor get실행");

		List<Map<String, Object>> majorList = majorService.getMajorList();
		model.addAttribute("majorList", majorList);

		log.debug(TeamColor.JJY + "[Controller] addProfessor의 model:" + majorList);

		return "/professor/signupProfessorForm";
	}

	// 교수회원가입 action
	@PostMapping("/addProfessor")
	public String addProfessor(Professor professor, Model model) {

		int insertProfessor = professorService.addProfessor(professor);
		model.addAttribute("addProfessor", insertProfessor);

		log.debug(TeamColor.JJY + "[Controller] addProfessor post실행");

		return "loginForm";
	}

	// 교수상세보기
	@GetMapping("/professorOne")
	public String ProfessorOne(Professor professor, Model model, HttpServletRequest request,@RequestParam("No") int professorNo) {

		log.debug(TeamColor.JJY + "[Controller] ProfessorOne Get실행");

		List<Map<String, Object>> professorOne = professorService.getProfessorOne(professorNo);
		model.addAttribute("professorOne", professorOne);

		return "/professor/professorOne";
	}

}
