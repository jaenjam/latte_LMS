package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.LectureService;
import com.gd.lms.service.StudentLectureHomeworkService;
import com.gd.lms.vo.StudentHomework;

import lombok.extern.slf4j.Slf4j;

@RestController
@ResponseBody
@RequestMapping("/api/notstudent")
@Slf4j
public class StudentLectureHomeworkApiController {

	@Autowired
	LectureService lectureservice;
	
	@Autowired
	StudentLectureHomeworkService studentlecturehomeworkservice;
	
	
	@PostMapping("/modify/studentLectureHomeworkStuList")
	public String modifystudentLectureHomeworkStuList(StudentHomework studenthomework) throws Exception {
		// 해당컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"교수의 학생과제제출일람 ajax 통신 modifystudentLectureHomeworkStuList 진입 성공");
		
		
		log.debug(TeamColor.KHW +"studenthomework : " + studenthomework);
		int result = studentlecturehomeworkservice.updateStudentHomeworkStuall(studenthomework);
		
		if(result !=0) {
			log.debug(TeamColor.KHW +"성공");
			return "ok";
		} else {
			log.debug(TeamColor.KHW +"실패");
			return "fail";
		}
	
	}
}