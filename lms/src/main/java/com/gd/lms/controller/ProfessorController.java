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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.service.ProfessorService;
import com.gd.lms.vo.Professor;
import com.gd.lms.vo.ProfessorImg;

import lombok.extern.slf4j.Slf4j;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;

@Controller
@Transactional
@Slf4j
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
			// 로그인 성공시 세션에 로그인시 받은값 저장
			session.setAttribute("user", "professor"); // user에 넣어주기
			session.setAttribute("No", professorLogin.getProfessorNo()); // 사번
			session.setAttribute("Name", professorLogin.getProfessorName()); // 이름
			session.setAttribute("MajorNo", professorLogin.getMajorNo()); // 전공
			session.setAttribute("professorRegiNo", professorLogin.getProfessorRegiNo());// 주민번호
			session.setAttribute("professorAge", professorLogin.getProfessorAge());// 나이
			session.setAttribute("professorGender", professorLogin.getProfessorGender());// 성별
			session.setAttribute("professorTelephone", professorLogin.getProfessorTelephone());// 전화번호
			session.setAttribute("professorEmail", professorLogin.getProfessorEmail());// 이메일
			session.setAttribute("professorAddress", professorLogin.getProfessorAddress());// 주소
			session.setAttribute("professorDetailAddress", professorLogin.getProfessorDetailAddress());// 상세주소
			session.setAttribute("professorRoom", professorLogin.getProfessorRoom());// 교수실
			session.setAttribute("salaryNo", professorLogin.getSalaryNo());
			session.setAttribute("professorState", professorLogin.getProfessorState());// 재직상태

			log.debug(TeamColor.JJY + "professorNo : " + session.getAttribute("No")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorAge : " + session.getAttribute("professorAge")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorDetailAddress : " + session.getAttribute("professorDetailAddress")); // 값
																														// 출력되는지
																														// 확인
																														// //
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
		model.addAttribute("majorList", majorList); // 회원가입할때 학과추가 select로

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
	@GetMapping("/getProfessorOne")
	public String ProfessorOne(Professor professor, Model model, HttpServletRequest request,
			@RequestParam("No") int professorNo) {

		log.debug(TeamColor.JJY + "[Controller] ProfessorOne Get실행");

		List<Map<String, Object>> professorOne = professorService.getProfessorOne(professorNo);
		model.addAttribute("professorOne", professorOne);
		log.debug(TeamColor.JJY + "professorOne : " + professorOne);
		
		return "/professor/getProfessorOne";
	}

	// 교수사진등록하기 (Form)
	@GetMapping("/professor/addProfessorImgForm")
	public String addProfessorImg(Model model) {
		log.debug(TeamColor.JJY + "[Controller] addProfessorImg get실행");
		
		return "/professor/addProfessorImgForm";
	}

	// 교수사진등록하기 (Action) 첨부파일 업로드
	@PostMapping("/addProfessorImg")
	public String addProfessorImg(ProfessorImg professorImg, Model model, MultipartFile[] uploadFile) {

		log.debug(TeamColor.JJY + "[Controller] addProfessorImg post실행");

		return "/professor/getProfessorOne";
	}

	// 교수목록
	@GetMapping("/professor/professorList")
	public String professorList(Model model) {

		log.debug(TeamColor.JJY + "[Controller] professorList실행");

		List<Map<String, Object>> professorList = professorService.getProfessorList();

		model.addAttribute("professorList", professorList);
		log.debug(TeamColor.JJY + "professorList값 : " + professorList);

		return "/professor/professorList";
	}
}
