package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.LectureFile;

@Mapper
public interface LectureMapper {

	// 강의하는 과목의 과제 리스트 긁어오기 (교수의)
	List<Map<String, Object>> selectLectureListPro(int professorNo);
	
	// 강의하는 과목의 과제 조회수 증가
	int lectureHit(int lectureNo);
	
	// 강의하는 과목의 과제 상세보기
	Map<String, Object> selectLectureOnePro(int lectureNo);
	
	// 강의하는 과목의 과제 작성
	int insertLectureOne(Lecture lecture);
		
	// 강의하는 과목의 과제 파일 첨부를 하기 위해 값 찾기
	int selectLectureNo(Lecture lecture);
		
	// 강의하는 과목의 과제 파일 추가하기
	int insertLecturefile(LectureFile lectuefile);
	
	// 강의하는 과목의 과제 수정
	int updateLectureOne(int lectureNo);	
	
	// 강의하는 과목의 과제 파일 수정
	int updateLectureFile(int lectureNo);
	
	// 강의하는 과목의 과제 삭제
	int deleteLectureOne(int lectureNo);
	
	// 강의하는 과목의 과제 파일 삭제
	int deleteLectureFileOne(int lectureFileNo);
	
}
