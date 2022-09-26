package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectMapper {
	
	//과목목록
	List<Map<String, Object>> selectSubjectList();
}
