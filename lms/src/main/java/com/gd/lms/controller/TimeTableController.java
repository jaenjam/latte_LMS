package com.gd.lms.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.TimeTableService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class TimeTableController {

	@Autowired TimeTableService timetableService;

	@GetMapping("/timetable/studentTimeTable")
	public String studentTimeTable(Model model, int studentNo) {
	
		//학생 시간표 : 월
		Map<String, Object> Mon = timetableService.getStudentTimeTableMon(studentNo);
		
		model.addAttribute("Mon", Mon);
		
		log.debug(TeamColor.LJE + "TimeTableController studentTimeTable studentTimeTable 월요일 수업 값 확인 : " + Mon);
		
		
		//학생 시간표 : 화
		Map<String, Object> Tue = timetableService.getStudentTimeTableTue(studentNo);
		
		model.addAttribute("Tue", Tue);
		
		log.debug(TeamColor.LJE + "TimeTableController studentTimeTable studentTimeTable 화요일 수업 값 확인 : " + Tue);
		
		
		//학생 시간표 : 수
		Map<String, Object> Wed = timetableService.getStudentTimeTableWed(studentNo);
		
		model.addAttribute("Wed", Wed);
		
		log.debug(TeamColor.LJE + "TimeTableController studentTimeTable studentTimeTable 수요일 수업 값 확인 : " + Wed);
		
		
		//학생 시간표 : 목
		Map<String, Object> Thu = timetableService.getStudentTimeTableThu(studentNo);
		
		model.addAttribute("Thu", Thu);
		
		log.debug(TeamColor.LJE + "TimeTableController studentTimeTable studentTimeTable 목요일 값 확인 : " + Thu);
		
		
		//학생 시간표 : 금
		Map<String, Object> Fri = timetableService.getStudentTimeTableFri(studentNo);
		
		model.addAttribute("Fri", Fri);
		
		log.debug(TeamColor.LJE + "TimeTableController studentTimeTable studentTimeTable 금요일 값 확인 : " + Fri);
		
		return "/timetable/studentTimeTable";
	}

}
