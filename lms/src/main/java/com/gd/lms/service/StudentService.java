package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.StudentMapper;
import com.gd.lms.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	// 학생로그인
	public Student getStudent(Student student) {
		Student loginstudent = studentMapper.loginstudent(student);
		
		log.debug(TeamColor.KHW+ "StudentService의 loginstudent");
		return loginstudent;
	}
	
	 // 학생 회원가입
	 public int addStudent(Student student) {
		 System.out.println("Student srvice");		 
		 
		log.debug(TeamColor.KHW+ "StudentService의 addStudent");
		 return studentMapper.insertStudent(student);
	 }
	 
	 // 학생정보상세보기
	 public List<Map<String, Object>> getStudentOne(int studentNo){
		 return studentMapper.selectStudentOne(studentNo);
	 }
	
	// 학생정보 상세보기(비밀번호 입력 후)
	 public List<Map<String, Object>> getStudentOneAfterPass(Student student){
		 return studentMapper.selectStudentOneAfterPass(student);
	 };
	 
}