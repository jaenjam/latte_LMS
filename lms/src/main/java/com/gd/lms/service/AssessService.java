package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.AssessMapper;
import com.gd.lms.repository.SubjectApproveRepository;
import com.gd.lms.vo.ProfessorAssess;
import com.gd.lms.vo.Register;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class AssessService {

	@Autowired
	AssessMapper assessmapper;
	
	// 학생이 교수평가 메뉴 누를 시 교수평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	public List<Map<String, Object>> assessList(int studentNo) {
		log.debug(TeamColor.KHW +"평가리스트셀렉 진입");
		
		return assessmapper.selectAssessList(studentNo);
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	public List<Map<String, Object>> assessFormPf(int reigisterNo) {
		log.debug(TeamColor.KHW +"상세보기 서비스 진입");
		
		return assessmapper.selectAssessPfOne(reigisterNo);
	}
	
	
	// 별점 입력후 반영 Action
	public int addAssessPfOne(int registerNo, int professorAssessScore, String professorAssessContent) {
		log.debug(TeamColor.KHW +"별점추가  서비스 진입");
		
		return assessmapper.insertAssessPfOne(registerNo, professorAssessScore, professorAssessContent);
	}


	// 학생이 과목평가 메뉴 누를 시 과목평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	public List<Map<String, Object>> selectSubjectAssessList(int studentNo) { 
		log.debug(TeamColor.KHW +"과목평가리스트셀렉 진입");
		
		return assessmapper.selectSubjectAssessList(studentNo);
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목 평가 폼 불러오기
	
	
	
	
	
	
	
	
	// 관리자가 메인메뉴에서 전체 과목평가리스트 불러오기
	
	// y변경
	
	
	
}
