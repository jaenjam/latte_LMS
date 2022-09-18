package com.gd.lms.service;

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
	
}
