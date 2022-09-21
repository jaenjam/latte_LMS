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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {

		@Autowired LectureService lectureService;
		
		
		// 강의자료 목록 (교수가)
		@GetMapping("/lecture/lectureList")
		public String lectureList(Model model, @RequestParam("professorNo") int professorNo) {
			log.debug(TeamColor.KHW +"LectureController의 lectureList 진입");
			
			// 교수사번 입력되어 얻은 쿼리문을 lectureList에 담기
			List<Map<String,Object>> lectureList = lectureService.getLectureListProf(professorNo);
			
			// 해당 값을 모델에 저장(view에서 띄우기 위함)
			model.addAttribute("lectureList", lectureList);
			
			return "/lecture/lectureList";
		}
		
}
