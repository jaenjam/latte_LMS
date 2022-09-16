package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.mapper.StudentMapper;
import com.gd.lms.vo.Student;

@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	// 학생로그인
	public Student getStudent(Student student) {
		Student loginstudent = studentMapper.loginstudent(student);
		
		return loginstudent;
	}
	
	 // 학생 회원가입
	 public int addStudent(Student student) {
		 System.out.println("Student srvice");		 
		 
		 return studentMapper.insertStudent(student);
	 }
	
}
