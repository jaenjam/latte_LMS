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

	// 넘겨받은 approveNo 기준으로 강의정보 셀렉하기 & 학생 교수 상관없이 (특정 수강강의 메인용)
	Map<String,Object> selectRegisteInfo(int subjectApproveNo);
}
