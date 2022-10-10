package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureFileMapper {

	// 강의강좌파일 디비 지우기
	int deleteLectureFile(int lectureNo);
}
