package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureMapper {

	// 강의리스트 긁어오기 (교수가)
	List<Map<String, Object>> selectLectureListPro(int professorNo);
	
}
