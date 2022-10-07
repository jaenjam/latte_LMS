package com.gd.lms.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.TimeTableMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TimeTableService {
	@Autowired TimeTableMapper timetableMapper;
	
	//학생 시간표:월
	public Map<String, Object> getStudentTimeTableMon(int studentNo){
		log.debug(TeamColor.LJE + "TimeTableService getStudentTimeTable 월요일 실행");
		
		return timetableMapper.selectStudentTimeTableMon(studentNo);
	}
	
	//학생 시간표:화
	public Map<String, Object> getStudentTimeTableTue(int studentNo){
		log.debug(TeamColor.LJE + "TimeTableService getStudentTimeTable 화요일 실행");
		
		return timetableMapper.selectStudentTimeTableTue(studentNo);
	}
	
	
	//학생 시간표:수
	public Map<String, Object> getStudentTimeTableWed(int studentNo){
		log.debug(TeamColor.LJE + "TimeTableService getStudentTimeTable 수요일 실행");
		
		return timetableMapper.selectStudentTimeTableWed(studentNo);
	}
	
	//학생 시간표:목
	public Map<String, Object> getStudentTimeTableThu(int studentNo){
		log.debug(TeamColor.LJE + "TimeTableService getStudentTimeTable 목요일 실행");
		
		return timetableMapper.selectStudentTimeTableThu(studentNo);
	}
	
	//학생 시간표:금
	public Map<String, Object> getStudentTimeTableFri(int studentNo){
		log.debug(TeamColor.LJE + "TimeTableService getStudentTimeTable 금요일 실행");
		
		return timetableMapper.selectStudentTimeTableFri(studentNo);
	}
}
