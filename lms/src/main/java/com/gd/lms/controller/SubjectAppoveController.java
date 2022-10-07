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
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.SubjectApproveService;
import com.gd.lms.vo.SubjectApprove;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class SubjectAppoveController {

	// @Autowired subjectAppoveService subjectAppoveService;
	@Autowired
	RegisterService registerService;
	@Autowired
	SubjectApproveService subjectApproveService;

	// 승인과목 메인 진입 (승인과목메인진입은 왼쪽 사이드바에서 주체에 따라 구분된 강의를 눌러 들어옴)
	@GetMapping("/subjectApprove/subjectApproveMain")
	public String getsubjectApproveMain(Model model, HttpServletRequest request,
			@RequestParam("subjectApproveNo") int subjectApproveNo) {

		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW + "SubjectAppoveController의 승인과목메인진입 컨트롤러 실행");

		// 세션 사용하기위해 선언 & 디버깅
		HttpSession session = request.getSession();
		log.debug(TeamColor.KHW + "SubjectAppoveController의 받아온 subjectApproveNo : " + subjectApproveNo);

		// 이전 페이지에서 쿼리스트링으로 받아온 subjectApproveNo 세션저장 & 디버깅
		session.setAttribute("subjectApproveNo", subjectApproveNo);
		log.debug(TeamColor.KHW + subjectApproveNo);

		Map<String, Object> MyRegister = registerService.getRegisterInfo(subjectApproveNo);

		model.addAttribute("MyRegister", MyRegister);

		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService
				.getMyRegisterListProf((int) session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);

		log.debug(TeamColor.LJE + "SubjectApproveController getsubjectApproveMain myRegisterListProf : "
				+ myRegisterListProf);

		// 교수 출석페이지 구동을 위한 (승인된 수업듣는 학생리스트 출력)
		List<Map<String, Object>> registerStudentList = registerService.getRegisterStudentList(subjectApproveNo);

		// registerStudent 안에 넣기
		model.addAttribute("registerStudentList", registerStudentList);

		log.debug(TeamColor.LJE + "SubjectApproveController getsubjectApproveMain registerStudent : "
				+ registerStudentList);

		return "/subjectApprove/subjectApproveMain";
	}

	// 관리자의 승인과목 정보 수정
	@PostMapping("/modifySubjectApprove")
	public String modifySubjectApprove(int year, String semester, String approveActive, String subjectRoom, String day, int startTime, int endTime,int subjectApproveNo) {

		log.debug(TeamColor.CSJ + "modifySubjectApproveController실행");

		// row가 1이면 성공! 0이면 실패!

		int row = subjectApproveService.modifySubjectApprove(year, semester, approveActive, subjectRoom, day, startTime, endTime, subjectApproveNo);
		log.debug(TeamColor.CSJ + "row값 (subjectApproveService Active값) : " + row);

		return "redirect:/employee/detail/subjectApproveList";
	}

	// 교수가 신청하면 승인목록으로 넘어감
	@PostMapping("/addSubjectApprove")
	public String addSubjectApprove(int majorNo, String subjectNo, int professorNo, String startDate, String endDate) {

		log.debug(TeamColor.JJY + "addSubjectApprove실행");

		int row = subjectApproveService.addSubjectApprove(majorNo, subjectNo, professorNo, startDate, endDate);

		log.debug(TeamColor.JJY + "insertApprove row값 확인 :" + row);

		return "redirect:/employee/detail/subjectList";
	}

}
