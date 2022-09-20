package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IndividualSubject {
	
	// 교수의 개별수강확인
	List<Map<String,Object>> selectIndividualSubjectProf(int professorNo);
	
	// 학생의 개별수강확인
	
}
