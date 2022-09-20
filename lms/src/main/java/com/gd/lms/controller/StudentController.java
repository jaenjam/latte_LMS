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
		//${StudentId.studentNo}
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 model:" +model);
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 loginstudent:" +loginstudent);
		
	
		if (loginstudent == null) { // 로그인시 null값이면 >>> 쿼리에서 맞는 값을 찾지 못했다면
			log.debug(TeamColor.KHW +"로그인 실패");
			return "loginForm";	// 로그인화면으로
			
		} else {// 로그인시 null값이 아니라면 >>> 쿼리에서 맞는 값을 찾았다면
			
			// 세션에 저장하기
					session.setAttribute("No", loginstudent.getStudentNo() );
			
					session.setAttribute("Name", loginstudent.getStudentName() );
					
					session.setAttribute("studentMajor", loginstudent.getMajorNo() );
					
					 session.setAttribute("studentRegiNo", loginstudent.getStudentRegiNo() );
					 
					 session.setAttribute("studentAge", loginstudent.getStudentAge() );
					   
					 session.setAttribute("studentGender", loginstudent.getStudentGender() );
					  
					 session.setAttribute("studentTelephone", loginstudent.getStudentTelephone());
					 
					 session.setAttribute("studentEmail", loginstudent.getStudentEmail() );
					 
					session.setAttribute("studentAddress", loginstudent.getStudentAddress() );
					  
					session.setAttribute("studentDetailAddress",
					 loginstudent.getStudentDetailAddress() );

					session.setAttribute("studentState", loginstudent.getStudentState() );
	
					session.setAttribute("user", "student");
				
			// 디버깅
			log.debug(TeamColor.KHW+session.getAttribute("studentMajor")); // 세션에 값 저장되는지 확인용으로 랜덤 하나	
			log.debug(TeamColor.KHW +session.getAttribute("studentNo"));
			
			log.debug(TeamColor.KHW +session.getAttribute("studentRegiNo"));
			log.debug(TeamColor.KHW +session.getAttribute("studentAddress"));
			log.debug(TeamColor.KHW +session.getAttribute("studentState"));
			log.debug(TeamColor.KHW +session.getAttribute("user"));
			log.debug(TeamColor.KHW +"로그인 성공");
			return "home"; // 성공시 main이동
		}
	}
	
	
	// 학생정보 상세보기 FORM (비밀번호입력전)
	//@RequestMapping(value="/student/getStudentOne", method = {RequestMethod.GET, RequestMethod.POST})
	@GetMapping("/getStudentOne") 
	public String getStudentOne(Student student, Model model, HttpServletRequest request, @RequestParam("No") int studentNo) {
		
		List<Map<String, Object>> studentOne = studentService.getStudentOne(studentNo);
		//디버그
		log.debug(TeamColor.KHW +studentOne);
		
		
		model.addAttribute("StudentIdd", studentOne);
		
		//디버그
		log.debug(TeamColor.KHW +model);
		log.debug(TeamColor.KHW +studentNo);
		return "/student/getStudentOne";
	}
	
	
	// 학생정보 수정전 비밀번호확인 FORM
	@GetMapping("/modifyStudentPass")
	public String pageLock() {
		
		log.debug(TeamColor.KHW +"비밀번호확인폼으로 이동");
		return "/student/modifyStudentPass";
	}
	
	// 학생정보 수정전 비밀번호확인입력 Action
	@PostMapping("/modifyStudentPass")
	public String pageLock(Student student, Model model, HttpServletRequest request, @RequestParam("studentPass") String studentPass) {
		
		log.debug(TeamColor.KHW +"비밀번호확인 적용 액션");
		
		// 이전페이지에서 입력된 비밀번호와 히든으로 넘겨받은 아이디를 입력받아 쿼리 실행시킨 것을 담기
		List<Map<String, Object>> studentOneAfterPass= studentService.getStudentOneAfterPass(student);
		
		// 디버그
		log.debug(TeamColor.KHW +studentOneAfterPass);
		
		// 모델에 담기
		model.addAttribute("studentOneAfterPass", studentOneAfterPass);
		
		// 디버그
		log.debug(TeamColor.KHW +model);
		
		
		return "/student/getStudentOneAfterPass";
	}
	
	
	
	// 학생정보 상세보기 FORM (비밀번호입력후)
	@GetMapping("/getStudentOneAfterPass")
	public String modifyStudentOne(Student student, Model model, HttpServletRequest request, @RequestParam("studentPass") String studentPass) {
		
		// 이전페이지에서 입력된 비밀번호와 히든으로 넘겨받은 아이디를 입력받아 쿼리 실행시킨 것을 담기
		List<Map<String, Object>> studentOneAfterPass= studentService.getStudentOneAfterPass(student);
		
		// 디버그
		log.debug(TeamColor.KHW +studentOneAfterPass);
		
		// 모델에 담기
		model.addAttribute("studentOneAfterPass", studentOneAfterPass);
		
		// 디버그
		log.debug(TeamColor.KHW +model);
		
		
		return "student/getStudentOneAfterPass";
	}
	
	
	// 학생정보 상세보기 수정 ACTION
	
}
