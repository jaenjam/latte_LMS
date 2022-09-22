package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegisterMapper {

	// 학생의 나의강의실 리스트 >>> sidebar용
	List<Map<String,Object>> selectStudentMyRegisterList(int studentNo);

	// 교수의 강의리스트 >>> sidebar용
	List<Map<String,Object>> selectProfessorMyRegisterList(int professorNo);
}
