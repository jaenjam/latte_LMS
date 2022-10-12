package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.AssessService;
import com.gd.lms.service.AttendanceService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.ProfessorAssess;
import com.gd.lms.vo.RegisterCart;
import com.gd.lms.vo.SubjectApprove;
import com.gd.lms.vo.SubjectAssess;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/register")
@Slf4j
public class RegisterApiController {

	
	@Autowired
	RegisterService registerservice;
	
	@Autowired
	AssessService assessservice;
	
	@Autowired AttendanceService attendanceService; 
	
	// 수강신청시 학생학번에 따른 담긴 수강목록 불러오기
	@GetMapping("/get/MyRegisterCart")
	public List<Map<String, Object>> getMyRegisterCart(HttpServletRequest request) {
		log.debug(TeamColor.KHW +"getMyRegisterCart 진입(기존카트리스트)?");
		// 세션사용하기위해 선언
		HttpSession session = request.getSession();
		
		int studentNo = (Integer)session.getAttribute("No");
		
		
		
		return registerservice.getMyRegisterCart(studentNo);
	}
	
	
	// 수강신청시 학점에 따른 과목 이름 불러오기 (레파지토리 사용)
	//			/api/register + /get/subjectName >>> 실제는 이 주소로 주고받음
	@GetMapping("/get/subjectName/{subjectCredit}") // 이건 ajax통신할떄 주는 url과 같아야함 
	public List<SubjectApprove> getSubjectName(@PathVariable int subjectCredit) {
		// └ SubjectApproveRepositoy 에서 정의한 그값
		
		return registerservice.getSubjectName(subjectCredit);
	}
	
	
	// 수강신청 바구니에 담기
	@PostMapping("/add/registerCart/{subjectApproveNo}")
	public String addRegisterCart(@PathVariable int subjectApproveNo
		, HttpServletRequest request
		) {
		log.debug(TeamColor.KHW +"addRegisterCart 진입?");
		
		HttpSession session = request.getSession();
		
		int studentNo = (Integer)session.getAttribute("No");
		
		RegisterCart registercart = new RegisterCart();
		registercart.setStudentNo(studentNo);
		registercart.setSubjectApproveNo(subjectApproveNo);
		
		
		int result = registerservice.checkRegisterCart(registercart);
		
		if(result !=0) {
			log.debug(TeamColor.KHW +"중복! : " + result );		
			Error err = new Error();
			throw err;
		} else {
			log.debug(TeamColor.KHW +"중복된 결과 없음 : " + result);
			registerservice.insertRegisterCart(registercart);
		}
		
		return "success";
		
	}
	
	
	// 수강신청 바구니에서 삭제하기
	@PostMapping("/delete/registerCart/{subjectApproveNo}")
	public String removeRegisterCart(@PathVariable int subjectApproveNo
			, HttpServletRequest request) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"removeRegisterCart 진입");
		
		// 세션사용하기 위해 선언
		HttpSession session = request.getSession();
		
		int studentNo = (Integer)session.getAttribute("No");
		
		// vo 객체 생성 및 값 지정
		RegisterCart registercart = new RegisterCart();
		registercart.setStudentNo(studentNo);
		registercart.setSubjectApproveNo(subjectApproveNo);
		
		registerservice.removeRegisterCart(registercart);
		
		return "success";
	}
	
	
	// 수강신청하기 (register디비에 인서트 및 registr_cart 딜리트)
	@PostMapping("/add/register/{subjectApproveNo}")
	public String insertRegister(@PathVariable int subjectApproveNo
			, HttpServletRequest request) {
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"insertRegister 진입");
		
		// 세션사용하기 위해 선언
		HttpSession session = request.getSession();
				
		int studentNo = (Integer)session.getAttribute("No");
		
		// vo 객체 생성 및 값 지정
		RegisterCart registercart = new RegisterCart();
		registercart.setStudentNo(studentNo);
		registercart.setSubjectApproveNo(subjectApproveNo);
		
		// register 인서트
		log.debug(TeamColor.KHW +"register 인서트 진입");
		// selectkey를 이용한 바로 생성된 오토인크리먼트 받아오기
		int regNo = registerservice.insertRegister(registercart);
		log.debug(TeamColor.KHW + "오토인크리먼트 : " + regNo);
		
		// register_cart 딜리트
		log.debug(TeamColor.KHW +"register_cart 딜리트 진입");
		registerservice.removeRegisterCart(registercart);
		
		// vo 객체 생성 및 값 지정
		ProfessorAssess professorassess = new ProfessorAssess();
		professorassess.setRegisterNo(regNo);
		professorassess.setSubjectApproveNo(subjectApproveNo);
		log.debug(TeamColor.KHW +"professorassess 객체확인 : " + professorassess);
		
		// 수강신청에 따른 교수평가 인서트
		log.debug(TeamColor.KHW +"수강신청에 따른 교수평가 인서트 진입");
		assessservice.addProfessorA(professorassess);
		
		
		// vo 객체 생성 및 값 지정
		SubjectAssess subjectassess = new SubjectAssess();
		subjectassess.setRegisterNo(regNo);
		subjectassess.setSubjectApproveNo(subjectApproveNo);
		log.debug(TeamColor.KHW +"subjectassess 객체확인 : " + subjectassess);
		
		// 수강신청에 따른 과목평가 인서트
		log.debug(TeamColor.KHW +"수강신청에 따른 과목평가 인서트 진입");
		assessservice.addSubjectA(subjectassess);
		
		
		//개별 수강신청에 따른 시간표 자동생성
		log.debug(TeamColor.LJE + "RegisterApiController insertRegister autoInsertAttendance");
		
		//int row = attendanceService.autoInsertAttendance(studentNo, subjectApproveNo, attendanceDate);
		
		
		
		return "success";
	}




}	
