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
import com.gd.lms.vo.SubjectAssess;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class AssessService {

	@Autowired
	AssessMapper assessmapper;
	
	
	// 학생이 수강신청시 교수평가 인서트
	public int addProfessorA(ProfessorAssess professorassess) {
		log.debug(TeamColor.KHW +"학생이 수강신청시 교수평가 인서트 서비스 진입");
	
		return assessmapper.insertProfessorA(professorassess);
	}
	
	// 학생이 수강신청시 과목평가 인서트
	public int addSubjectA(SubjectAssess subjectassess) {
		log.debug(TeamColor.KHW +"학생이 수강신청시 과목평가 인서트 서비스 진입");
	
		return assessmapper.insertSubjectA(subjectassess);
	}
	
	
	// 학생이 교수평가 메뉴 누를 시 교수평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	public List<Map<String, Object>> assessList(int studentNo) {
		log.debug(TeamColor.KHW +"평가리스트셀렉 진입");
		
		return assessmapper.selectAssessList(studentNo);
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	public List<Map<String, Object>> assessFormPf(int professorAssessNo) {
		log.debug(TeamColor.KHW +"상세보기 서비스 진입");
		
		return assessmapper.selectAssessPfOne(professorAssessNo);
	}
	
	
	// 별점입력후 반영 Action
	public int modifyAssessPfOne( int professorAssessScore, String professorAssessContent, String professorAssessCk, int professorAssessNo) {
		log.debug(TeamColor.KHW +"별점업데이트  서비스 진입");	
		
		return assessmapper.updateAssessPfOne( professorAssessScore, professorAssessContent, professorAssessCk, professorAssessNo);
	}
	

	/// 과목평가 시작
	// 학생이 과목평가 메뉴 누를 시 과목평가 List 불러오기(수강중인 강의 리스트 불러오는 느낌)
	public List<Map<String, Object>> selectSubjectAssessList(int studentNo) { 
		log.debug(TeamColor.KHW +"과목평가리스트셀렉 진입");
		
		return assessmapper.selectSubjectAssessList(studentNo);
	}
	
	
	// 이후 평가하기를 누를시 그 특정 과목 평가 폼 불러오기
	public List<Map<String, Object>> assessFormSb(int subjectAssessNo) {
		log.debug(TeamColor.KHW +"상세보기 서비스 진입");
		
		return assessmapper.selectAssessSbOne(subjectAssessNo);
	}
	
	// 별점입력후 반영 Action
	public int modifyAssessSbOne( int subjectAsssessScore, String subjectAssessContent, String subjectAssessCk, int subjectAssessNo) {
		log.debug(TeamColor.KHW +"별점업데이트  서비스 진입");	
		log.debug(TeamColor.KHW+"subjectAssessNo : " +subjectAssessNo);
		
		return assessmapper.updateAssessSbOne( subjectAsssessScore, subjectAssessContent, subjectAssessCk, subjectAssessNo);
	}
	
	
	
	
	
	// 관리자가 메인메뉴에서 전체 과목평가리스트 불러오기
	
	// y변경
	
	
	
}
