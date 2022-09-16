package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Professor;

@Mapper
public interface ProfessorMapper {
	
	// 교수로그인
	Professor professerLogin(Professor professor);

	// 교수추가 (회원가입)
	int insertProfessor(Professor professor);
}
