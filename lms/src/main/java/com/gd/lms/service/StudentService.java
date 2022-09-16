package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.mapper.StudentMapper;
import com.gd.lms.vo.Student;

@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	public Student getStudent(Student student) {
		Student loginstudent = studentMapper.loginstudent(student);
		
		return loginstudent;
	}
}
