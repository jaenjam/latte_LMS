package com.gd.lms.controller;

import java.io.UnsupportedEncodingException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.StudentLectureHomeworkService;
import com.gd.lms.vo.StudentHomework;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentLectureHomeworkController {
	@Autowired StudentLectureHomeworkService studentlecturehomeworkservice;
	
	@Autowired RegisterService registerservice;
	
	// 학생이 본인이 수강하는 과제 리스트 보기 (처음 폼 불러오기)
	@GetMapping("/lecture/lectureStudentHomework/getlectureHomeworkStuList")
	public String getStudentLectureHomeworList(
			@RequestParam("subjectApproveNo") int subjectApproveNo
			, HttpServletRequest request
			, Model model) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"StudentLectureHomeworkController의 과제List 진입");
		
		log.debug(TeamColor.KHW +"넘겨받은 값 subjectApproveNo : " + subjectApproveNo);
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();
		session.getAttribute("No");
		String user = (String) session.getAttribute("user");
		
		// 사이드바를 위한 서비스실행
		if(user == "professor") { // 교수면 이거			
			List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
			// myRegisterListProf확인
			model.addAttribute("myRegisterListProf", myRegisterListProf);
			
			log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
		
		}
		else if (user == "student") { // 학생이면 이거
			List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
	
			model.addAttribute("myRegisterListStu", myRegisterListStu);
			
			log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
			
		}
		
		// 서비스 실행 & 객체에 넣어주기
		List<Map<String, Object>> LectureHomeworList
		= studentlecturehomeworkservice.getLecureHomeworkList(subjectApproveNo);
		
		// 해당 값을 모델에 다시 저장 >>> view에서 받기 위함
		model.addAttribute("LectureHomeworList", LectureHomeworList);
		
		return "/lecture/lectureStudentHomework/getlectureHomeworkStuList";
	}
	
	
	
	
	// 그 바로 과목으로 연결된 과제 제출화면으로 이동(바로 과제제출 ㄱㄱ)
	@GetMapping("/lecture/lectureStudentHomework/submitHomework")
	public String getStudentLectureHomework(Model model
			, @RequestParam("lectureNo") int lectureNo
			, StudentHomework studenthomework
			, HttpServletRequest request
			) {
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"StudentLectureHomeworkController의 과제작성(제출)하기 진입");
		
		log.debug(TeamColor.KHW +"lectureNo : " + lectureNo);
		
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();
		session.getAttribute("No");
		String user = (String) session.getAttribute("user");
		
		// 사이드바를 위한 서비스실행
		if(user == "professor") { // 교수면 이거			
			List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
			// myRegisterListProf확인
			model.addAttribute("myRegisterListProf", myRegisterListProf);
			
			log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
		
		}
		else if (user == "student") { // 학생이면 이거
			List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
	
			model.addAttribute("myRegisterListStu", myRegisterListStu);
			
			log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
			
		}
		
		
		model.addAttribute("lectureNo", lectureNo );
				
		return "/lecture/lectureStudentHomework/submitHomework";
	}
	
	
	// 학생이 과제제출하기
	@PostMapping("/lecture/lectureStudentHomework/submitHomework")
	public String getStudentLectureHomework(Model model
			, @RequestParam("lectureNo") int lectureNo
			, StudentHomework studenthomework
			, @RequestParam("file") MultipartFile[] studentHomeworkFile
			, RedirectAttributes rttr
			, HttpServletRequest request) throws UnsupportedEncodingException  {
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"과제작성(제출)하기 Action 진입");

		
		log.debug(TeamColor.KHW + "studenthomework : " + studenthomework);
		log.debug(TeamColor.KHW + "studentHomeworkFile : " + studentHomeworkFile);
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();
		session.getAttribute("No");
		
		// 왼쪽 사이드바 메뉴를 위한 
		registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
		
		//int result = studentlecturehomeworkservice.addLecture(lecture, lectureFile, request);
				
		// studentHomeworkService를 실행하여 form에서 입력받은 sql의 값 insert
		int result = studentlecturehomeworkservice.submitHomework(studenthomework, studentHomeworkFile, request, lectureNo);
	
		
		// 디버깅
		log.debug(TeamColor.KHW +"studentlecturehomeworkservice.submitHomework 실행결과 " + result);
		
		if (result !=0) {// 1일시 과제제출 성공
			log.debug(TeamColor.KHW +"과제제출 성공!");
			rttr.addFlashAttribute("result", "과제 등록에 성공했습니다!");
			
			
			return "redirect:/lecture/lectureStudentHomework/submitHomework="+lectureNo;
		
		} else {
			log.debug(TeamColor.KHW +"과제작성 실패!");
			rttr.addFlashAttribute("result", "과제 등록에 실패했습니다!");
			
			return  "redirect:/lecture/lectureStudentHomework/submitHomework="+lectureNo;
		}
	}
	
	
}
