package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.LectureService;
import com.gd.lms.vo.Lecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {

		@Autowired LectureService lectureService;
		
		
		// 강의자료 목록 (교수가)
		@GetMapping("/lecture/getLectureList")
		public String getlectureList(Model model, @RequestParam("No") int professorNo) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"LectureController의 lectureList 진입");
			
			// 조회수 증가 service 실행
			//lectureService.lectureHit(lecturerNo);
			
			// 리스트 긁어오는 service 실행 >>> 교수사번 입력되어 얻은 쿼리문을 lectureList에 담기
			List<Map<String,Object>> lectureList = lectureService.getLectureListProf(professorNo);
			
			// 해당 값을 모델에 저장(view에서 띄우기 위함)
			model.addAttribute("lectureList", lectureList);
			
			// 디버그
			log.debug(TeamColor.KHW+lectureList);
			
			return "/lecture/getLectureList";
		}
		
		// 강의자료 상세보기
		@GetMapping("/lecture/getLectureOne")
		public String getlectureListOne(Model model, Lecture lecture ,@RequestParam("lectureNo") int lectureNo) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"LectureController의 lectureOne 진입");
			
			// 조회수 증가 service 실행
			lectureService.updatelectureHit(lectureNo);
			
			// 게시판 상세보기 긁어오기 및 lectureOne에 저장
			Lecture lectureOne = lectureService.getLectureOne(lectureNo);
			
			// model에 다시 저장
			model.addAttribute("lectureOne", lectureOne);
			
			return "/lecture/getLectureOne";
		}
		
		
		
}
