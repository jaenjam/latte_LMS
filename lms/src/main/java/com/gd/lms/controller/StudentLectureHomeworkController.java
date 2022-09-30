package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.StudentLectureHomeworkService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentLectureHomeworkController {
	@Autowired StudentLectureHomeworkService studentlecturehomeworkservice;
	
	// 학생이 본인이 수강하는 과제 리스트 보기 (처음 폼 불러오기)
	@GetMapping("/lecture/lectureStudentHomework/getlectureHomeworkList")
	public String getStudentLectureHomeworList(
			@RequestParam("subjectApproveNo") int subjectApproveNo
			, Model model) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"StudentLectureHomeworkController의 과제List 진입");
		
		log.debug(TeamColor.KHW +"넘겨받은 값 subjectApproveNo : " + subjectApproveNo);
		
		
		// 서비스 실행 & 객체에 넣어주기
		List<Map<String, Object>> LectureHomeworList
		= studentlecturehomeworkservice.getLecureHomeworkList(subjectApproveNo);
		
		// 해당 값을 모델에 다시 저장 >>> view에서 받기 위함
		model.addAttribute("LectureHomeworList", LectureHomeworList);
		
		return "/lecture/lectureStudentHomework/getlectureHomeworkList";
	}
	
}
