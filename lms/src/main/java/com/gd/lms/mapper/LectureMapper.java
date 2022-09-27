package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.LectureFile;

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
		
	// 강의하는 과목의 과제 파일첨부를 하기 위해 값 찾기
	int selectLectureNo(Lecture lecture);
	
	// 강의하는 과목의 과제 파일첨부
	int insertLecturefile(LectureFile lecturefile);
	
	// 강의하는 과목의 과제 수정
	int updateLectureOne(int lectureNo);
	
	// 강의하는 과목의 과제 삭제
	int deleteLectureOne(int lectureNo);
	
}
