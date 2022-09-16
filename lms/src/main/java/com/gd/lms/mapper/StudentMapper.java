package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Student;

@Mapper
public interface StudentMapper {
	
	// 학생로그인
	Student loginstudent(Student student);
	
	// 학생추가 (회원가입)
	int insertStudent(Student student);
}
