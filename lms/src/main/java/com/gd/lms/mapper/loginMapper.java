package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Professor;

@Mapper
public interface loginMapper {
	Professor loginProfesser(Professor professor);
}
