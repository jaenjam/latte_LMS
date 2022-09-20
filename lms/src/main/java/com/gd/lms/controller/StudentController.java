package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;
import com.gd.lms.service.StudentService;
import com.gd.lms.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired MajorService majorService;
	
	// 학생 회원가입 form
	@GetMapping("/student/signupStudentForm")
	public String addStudent(Model model) {
		
		// 디버깅
		System.out.println("addStudent get(form)");
		log.debug(TeamColor.KHW+ "StudentController의 addStudent get(form)");
		
		// major_no용 리스트
		List<Map<String,Object>> majorList = majorService.getMajorList();
		// model에 저장하기
		model.addAttribute("majorList",majorList);

		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 majorList:" +majorList);
		
		return "/student/signupStudentForm";
	}
	
	
	// 학생 회원가입 action
	@PostMapping("/addStudent")
	public String addStudent(Student student, Model model ) {
		
		//  ┌그 값을 담음		 ┌서비스에 메서드를 실행시킴
		int insertStudent = studentService.addStudent(student);
		// model에 해당 값을 저장
		model.addAttribute("addStudent", insertStudent);
		
		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 addStudent의 model:" +model);
		return "loginForm";		
	}
	
	
	// 학생 로그인 action
	@PostMapping("/StudentForm")
	public String loginstudent(Student student, Model model, HttpServletRequest request) {
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();	
		
		// 서비스의 getStudent 실행
		Student loginstudent = studentService.getStudent(student);
		
		// model에 저장하기
		model.addAttribute("StudentId", loginstudent);

		
		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 model:" +model);
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 loginstudent:" +loginstudent);
		
	
		if (loginstudent == null) { // 로그인시 null값이면 >>> 쿼리에서 맞는 값을 찾지 못했다면
			log.debug(TeamColor.KHW +"로그인 실패");
			return "loginForm";	// 로그인화면으로
			
		} else {// 로그인시 null값이 아니라면 >>> 쿼리에서 맞는 값을 찾았다면
			
			// 세션에 저장하기
			int studentNo = Integer.parseInt(request.getParameter("studentNo"));
					session.setAttribute("studentNo", loginstudent.getStudentNo() );
			
			String studentName = request.getParameter("studentName");
					session.setAttribute("studentName", loginstudent.getStudentName() );
					
			String studentMajor = request.getParameter("studentName");
					session.setAttribute("studentMajor", loginstudent.getMajorNo() );
					
			String studentRegiNo = request.getParameter("studentRegiNo");
					 session.setAttribute("studentRegiNo", loginstudent.getStudentRegiNo() );
					 
			//int studentAge = Integer.parseInt(request.getParameter("studentAge"));
			//		 session.setAttribute("studentAge", loginstudent.getStudentAge() );
					   
			String studentGender = request.getParameter("studentGender");
					 session.setAttribute("studentGender", loginstudent.getStudentGender() );
					  
			String studentTelephone = request.getParameter("studentTelephone");
					 session.setAttribute("studentTelephone", loginstudent.getStudentTelephone());
					 
			String studentEmail = request.getParameter("studentEmail");
					 session.setAttribute("studentEmail", loginstudent.getStudentEmail() );
					 
			String studentAddress = request.getParameter("studentAddress");
					session.setAttribute("studentAddress", loginstudent.getStudentAddress() );
					  
			String studentDetailAddress = request.getParameter("studentDetailAddress");
					session.setAttribute("studentDetailAddress",
					 loginstudent.getStudentDetailAddress() );

			String studentState = request.getParameter("studentState");
					session.setAttribute("studentState", loginstudent.getStudentState() );

			String user = request.getParameter("user");		
					session.setAttribute("user", "student");
				
			// 디버깅
			log.debug(TeamColor.KHW+session.getAttribute("studentMajor")); // 세션에 값 저장되는지 확인용으로 랜덤 하나	
			log.debug(TeamColor.KHW +studentNo);			
			log.debug(TeamColor.KHW +"로그인 성공");
			return "home"; // 성공시 main이동
		}
	}
	
	
	// 학생정보 상세보기 FORM
	//@RequestMapping(value="/student/getStudentOne", method = {RequestMethod.GET, RequestMethod.POST})
	@GetMapping("/getStudentOne") 
	public String getStudentOne(Student student, Model model, HttpServletRequest request, @RequestParam("studentNo") int studentNo) {
		
		List<Map<String, Object>> studentOne = studentService.getStudentOne(studentNo);
		
		model.addAttribute("StudentId", studentOne);
		
		//디버그
		log.debug(TeamColor.KHW +model);
		log.debug(TeamColor.KHW +studentNo);
		return "/student/getStudentOne";
	}
}
