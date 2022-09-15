package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Professor;

@Mapper
public interface ProfessorMapper {
	Professor professerLogin(Professor professor);
}
