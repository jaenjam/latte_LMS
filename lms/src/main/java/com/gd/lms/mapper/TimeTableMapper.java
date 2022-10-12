package com.gd.lms.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimeTableMapper {

	// 학생시간표:월
	Map<String, Object> selectStudentTimeTableMon(int studentNo);
	
	// 학생시간표:화
	Map<String, Object> selectStudentTimeTableTue(int studentNo);
	
	// 학생시간표:수
	Map<String, Object> selectStudentTimeTableWed(int studentNo);
	
	// 학생시간표:목
	Map<String, Object> selectStudentTimeTableThu(int studentNo);
	
	// 학생시간표:금
	Map<String, Object> selectStudentTimeTableFri(int studentNo);
	
	
	
	// 교수시간표:월
	Map<String, Object> selectProfessorTimeTableMon(int professorNo);
	
	// 교수시간표:화
	Map<String, Object> selectProfessorTimeTableTue(int professorNo);
	
	// 교수시간표:수
	Map<String, Object> selectProfessorTimeTableWed(int professorNo);
	
	// 교수시간표:목
	Map<String, Object> selectProfessorTimeTableThu(int professorNo);
	
	// 교수시간표:금
	Map<String, Object> selectProfessorTimeTableFri(int professorNo);
}
