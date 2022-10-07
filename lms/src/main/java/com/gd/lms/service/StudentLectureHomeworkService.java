package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.LectureMapper;
import com.gd.lms.mapper.StudentLectureHomeworkMapper;
import com.gd.lms.vo.StudentHomework;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class StudentLectureHomeworkService {
	
	@Autowired 
	StudentLectureHomeworkMapper studentlecturehomeworkmapper;
	@Autowired
	private LectureMapper lectureMapper;
	
	// 학생이 본인이 수강하는 과목의 과제 리스트 보기
	public List<Map<String, Object>> getLecureHomeworkList(int subjectApproveNo) {
		
		log.debug(TeamColor.KHW + "과제리스트보기 서비스 진입");
		
		return studentlecturehomeworkmapper.selectMyLecureHomeworkList(subjectApproveNo);
	}
	
	// 학생이 수강하는 과목의 과제 제출
	public int submitHomework() {
		log.debug(TeamColor.KHW + "학생이 수강하는 과목의 과제 제출 서비스 진입");
		
		return studentlecturehomeworkmapper.insertLectureHomework();
	}
	
	// 학생이 수강하는 과목의 과제 파일 첨부하기
	
	// 학생이 수강하는 과목의 과제 수정하기
	// 학생이 수강하는 과목의 과제 파일 수정하기 
	
	// 학생이 수강하는 과목의 과제 삭제하기
	// 학생이 수강하는 과목의 과제 파일 삭제하기 


	
	// 교수메뉴 시작-------------------------------------------------------
	// 교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인
		public List<Map<String, Object>> getLectureTotalList (int lectureNo) {
			log.debug(TeamColor.KHW + "교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인 서비스 실행");
			
			return lectureMapper.selectLectureTotalList(lectureNo);
		}

	// 학생의 과제 제출 후 교수가 뷰에서 ck를 Y로 바꿔주기
	public int updateStudentHomeworkSubmitCk(int lectureNo) {
		log.debug(TeamColor.KHW + "학생의 과제 제출 후 교수가 뷰에서 ck를 Y로 바꿔주기 서비스 진입");
		
		return studentlecturehomeworkmapper.updateStudentHomeworkSubmitCk(lectureNo);
	}
	
	// 교수의 제출 과제 평가 >> ck / 점수 수정 서비스
	public int updateStudentHomeworkStuall(StudentHomework studenthomework) {
		log.debug(TeamColor.KHW + "학생의 과제 제출 후 교수가 교수의 제출 과제 평가 >> ck / 점수 수정 서비스 진입");
		
		
		return studentlecturehomeworkmapper.updateLectureHomeworkall(studenthomework);
	}
	
}
