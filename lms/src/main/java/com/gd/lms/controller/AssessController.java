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

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.AssessService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.ProfessorAssess;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class AssessController {

	
	@Autowired AssessService assessservice;
	
	@Autowired RegisterService registerservice;
	
	
	// 학생의 교수평가 -----------------------------------------------------
	// 학생이 교수평가 메뉴 누를 시 교수평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	@GetMapping("/assess/professor/getProfessorAssessList")
	public String getAssessPfList(Model model
			, HttpServletRequest request
			, @RequestParam("studentNo") int studentNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfList 진입");
		
		log.debug(TeamColor.KHW +"학번 : " + studentNo);
		
		
		// 세션 사용하기위해 선언 & 디버깅
		HttpSession session = request.getSession();
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
		
		
		
		model.addAttribute("registerList", assessservice.assessList(studentNo));
		model.getAttribute("registerList").toString();
		return "/assess/professor/getProfessorAssessList";
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	@GetMapping("/assess/professor/getProfessorAssessForm")
	public String getAssessPfForm(Model model
			, HttpServletRequest request
			, @RequestParam("registerNo") int registerNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfForm 진입");
		
		
		// 세션 사용하기위해 선언 & 디버깅
		HttpSession session = request.getSession();
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
		
		
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessPfOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getProfessorAssessForm";
	}
	
	
	// 별점 입력후 반영 Action
	@PostMapping("/assess/professor/getProfessorAssessForm")
	public String addAssessPfOne(@RequestParam("rate") int professorAssessScore
			, @RequestParam("reviewTextarea") String professorAssessContent
			, @RequestParam("registerNo") int registerNo
			, Model model
			, HttpServletRequest request
			, ProfessorAssess professorassess
			) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 addAssessPfOne 진입");
		
		
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
		
		
		
		
		// 받아온 값 확인
		log.debug(TeamColor.KHW + "점수 : " + professorAssessScore);
		log.debug(TeamColor.KHW + "평가내용 : " + professorAssessContent);
		model.addAttribute("AssessPfOne", assessservice.addAssessPfOne(registerNo, professorAssessScore, professorAssessContent));
		
		
		return "redirect:/assess/professor/getProfessorAssessForm?registerNo="+professorassess.getRegisterNo();
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	@GetMapping("/assess/professor/getProfessorAssessFormOne")
	public String getAssessPfFormOne(Model model
			, HttpServletRequest request	
			, @RequestParam("registerNo") int registerNo) {
		
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfFormOne 진입");
		
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
		
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessPfOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getProfessorAssessFormOne";
	}
	
	
	
	
	// 학생의 과목평가 -----------------------------------------------------
	
	// 학생이 과목평가 메뉴 누를 시 과목평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	@GetMapping("/assess/subject/getSubjectAssessList")
	public String getAssessSbList(Model model
			, HttpServletRequest request
			, @RequestParam("studentNo") int studentNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfList 진입");
		
		

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
		
		
		
		
		log.debug(TeamColor.KHW +"학번 : " + studentNo);
		
		model.addAttribute("registerList", assessservice.selectSubjectAssessList(studentNo));
		log.debug(TeamColor.KHW +model.getAttribute("registerList").toString());
		return "/assess/subject/getSubjectAssessList";
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목 평가 폼 불러오기
	@GetMapping("/assess/subject/getSubjectrAssessForm")
	public String getAssessSbForm(Model model
			, HttpServletRequest request
			, @RequestParam("registerNo") int registerNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfForm 진입");
		
		

		// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();
			session.getAttribute("No");
			String user = (String) session.getAttribute("user");
			
			// 사이드바를 위한 서비스실행
			 if (user == "student") { // 학생이면 이거
				List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
		
				model.addAttribute("myRegisterListStu", myRegisterListStu);
				
				log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
				
			} else if (user == "professor") {
				List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
				// myRegisterListProf확인
				model.addAttribute("myRegisterListProf", myRegisterListProf);
				
				log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
				return "/home";
			} else {
				log.debug(TeamColor.KHW + "관리자는 이 페이지에 들어올 수 없습니다");
				return "/home";
			}
		
		
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessSbOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/subject/getSubjectAssessForm";
	}
	
	
	// 상세보기를 누를 시 one 불러오기
	@GetMapping("/assess/professor/getSubjectAssessFormOne")
	public String getAssessSbFormOne(Model model
			, HttpServletRequest request	
			, @RequestParam("registerNo") int registerNo) {
		
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfFormOne 진입");
		
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();
		session.getAttribute("No");
		String user = (String) session.getAttribute("user");
		
		// 사이드바를 위한 서비스실행
		 if (user == "student") { // 학생이면 이거
			List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
	
			model.addAttribute("myRegisterListStu", myRegisterListStu);
			
			log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
			
		} else if (user == "professor") {
			List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
			// myRegisterListProf확인
			model.addAttribute("myRegisterListProf", myRegisterListProf);
			
			log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
			return "/home";
		} else {
			log.debug(TeamColor.KHW + "관리자는 이 페이지에 들어올 수 없습니다");
			return "/home";
		}
	
		
		
		// 받아온 registerNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + registerNo);
		model.addAttribute("AssessSbOne", assessservice.assessFormPf(registerNo));
		
		return "/assess/professor/getSubjectAssessFormOne";
	}
	
	// 별점 입력후 반영 Action
	
	
	
	/*
	// 관리자가 메인메뉴에서 전체 과목평가리스트 불러오기
	@GetMapping("/assess/employee/getProfessorAssessListTotal")
	public String getAssessPfTotalList(Model model
			, @RequestParam("subjectApproveNo") int subjectApproveNo) {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"AssessController의 getAssessPfTotalList 진입");
		
		// 받아온 subjectApproveNo 확인
		log.debug(TeamColor.KHW +"승인과목넘버 :" + subjectApproveNo);
		model.addAttribute("AssessPfTotalList", assessservice.assessFormPf(registerNo));
		return "/assess/employee/getProfessorAssessListTotal";
	}
	*/
	
	
	// -------------------------------- 관리자 메뉴 시작
	
	// 전체 평가리스트 보기
	
	
}
