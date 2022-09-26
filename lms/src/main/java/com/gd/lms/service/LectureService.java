package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.LectureMapper;
import com.gd.lms.vo.Lecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
	@Autowired
	private LectureMapper lectureMapper;
	
	
	// 강의하는 과목의 과제 리스트 긁어오기
	public List<Map<String, Object>> getLectureListProf(int subjectApproveNo) {
		log.debug(TeamColor.KHW +"강의리스트셀렉 진입");	
		return lectureMapper.selectLectureListPro(subjectApproveNo);
	}

	
	// 강의하는 과목의 과제 조회수증가
	public int updatelectureHit(int lectureNo) {
		log.debug(TeamColor.KHW +"조회수카운트서비스 진입");		
		return lectureMapper.lectureHit(lectureNo);
	}
	
	// 강의하는 과목의 과제 상세보기
	public Lecture getLectureOne(int lectureNo) {
		log.debug(TeamColor.KHW +"강의자료상세보기 서비스 진입");
		return lectureMapper.selectLectureOnePro(lectureNo); 
	}
	
	// 강의하는 과목의 과제 작성하기
	public int addLecture(Lecture lecture) {
		log.debug(TeamColor.KHW +"강의하는 과목의 과제 작성하기 서비스 진입");
		return lectureMapper.insertLectureOne(lecture);
	}
}
