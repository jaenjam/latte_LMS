package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Student;

@Mapper
public interface StudentMapper {
	
	// 학생로그인
	Student loginstudent(Student student);
	
	// 학생추가 (회원가입)
	int insertStudent(Student student);
	
	// 학생정보 상세보기
	List<Map<String, Object>> selectStudentOne(int studentNo);
}
