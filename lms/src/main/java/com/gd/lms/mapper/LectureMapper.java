package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Lecture;

@Mapper
public interface LectureMapper {

	// 강의하는 과목의 과제 리스트 긁어오기 (교수의)
	List<Map<String, Object>> selectLectureListPro(int professorNo);
	
	// 강의하는 과목의 과제 조회수 증가
	int lectureHit(int lectureNo);
	
	// 강의하는 과목의 과제 상세보기
	Lecture selectLectureOnePro(int lectureNo);
	
	// 강의하는 과목의 과제 작성
	int insertLectureOne(Lecture lecture);
	
}
