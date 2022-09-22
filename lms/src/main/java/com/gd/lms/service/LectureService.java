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
	
	// 강의자료 리스트 긁어오기
	public List<Map<String, Object>> getLectureListProf(int professorNo) {
		log.debug(TeamColor.KHW +"강의리스트셀렉 진입");	
		return lectureMapper.selectLectureListPro(professorNo);
	}

	
	// 클릭시 조회수증가
	public int updatelectureHit(int lectureNo) {
		log.debug(TeamColor.KHW +"조회수카운트서비스 진입");		
		return lectureMapper.lectureHit(lectureNo);
	}
	
	// 강의자료 상세보기
	public Lecture getLectureOne(int lectureNo) {
		log.debug(TeamColor.KHW +"강의자료상세보기 서비스 진입");
		return lectureMapper.selectLectureOnePro(lectureNo); 
	}
}
