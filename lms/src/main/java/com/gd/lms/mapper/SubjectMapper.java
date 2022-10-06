package com.gd.lms.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Subject;



@Mapper
public interface SubjectMapper {
	
	
	// 동아리 추가
	int insertSubject(Subject subject);

	
	
	//과목목록
	List<Map<String, Object>> selectSubjectList();
}
