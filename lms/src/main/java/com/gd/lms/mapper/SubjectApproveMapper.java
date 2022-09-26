package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectApproveMapper {

	//승인과목목록
	List<Map<String, Object>> selectSubjectApproveList();
}
