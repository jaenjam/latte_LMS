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
	//int insertLectureOne(Lecture lecture);
	int insertLectureOne(int subjectApproveNo, String lectureTitle, String lectureContent);	
	
	// 강의하는 과목의 과제 파일 첨부를 하기 위해 값 찾기
	//int selectLectureNo(Lecture lecture);
	int selectLectureNo(String lectureTitle, String lectureContent, int subjectApproveNo);	
	
	// 강의하는 과목의 과제 파일 추가하기
	int insertLecturefile(LectureFile lectuefile);
	
	// 강의하는 과목의 과제 수정
	int updateLectureOne(Lecture lecture);	
	
	// 기존 파일 정보 가져오기
	String selectLectureFileExis(int lectureNo);	
	
	// 강의하는 과목의 과제 파일 수정
	int updateLectureFile(LectureFile lectureFile);
	
	// 강의하는 과목의 과제 삭제
	int deleteLectureOne(int lectureNo);
	
	// 강의하는 과목의 과제 파일 삭제
	int deleteLectureFileOne(int lectureFileNo);

	
	// 교수메뉴 시작
	// 교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인
	List<Map<String, Object>> selectLectureTotalList(int lectureNo);
	
}
