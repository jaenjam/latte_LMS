package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.ProfessorAssess;
import com.gd.lms.vo.SubjectAssess;

@Mapper
public interface AssessMapper {

	
	// 교수평가 인서트
	
	int insertProfessorA(ProfessorAssess professorassess);
	
	// 과목평가 인서트
	int insertSubjectA(SubjectAssess subjectassess);
	
	// 교수평가
	// 교수평가 메뉴 누를 시 교수평가 List 불러오기 (학번 기준)
	List<Map<String,Object>> selectAssessList(int studentNo);
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	List<Map<String,Object>> selectAssessPfOne(int professorAssesNo);
	
	// 별점기반 교수 평가 입력 
	int insertAssessPfOne(int registerNo, int professorAssessScore, String professorAssessContent);

	// 별점기반 교수평가 입력(업데이트
	int updateAssessPfOne( int professorAssessScore, String professorAssessContent, String professorAssessCk , int professorAssessNo);
	
	
	
	// 과목평가
	//이후 평가하기를 누를시 그 특정 과목을 맡은 과목평가 폼 불러오기
	List<Map<String,Object>> selectAssessSbOne(int subjectAssessNo);
	
	// 별점기반 과목평가 입력(업데이트)
	int updateAssessSbOne(int subjectAsssessScore, String subjectAssessContent,  String subjectAssessCk, int subjectAssessNo);
	
	
	
	// 관리자가 수강 과목기준으로 학생 List 보기
	List<Map<String,Object>> selectAssessStudentList(int subjectApproveNo);
	
	// 관리자가 확인 후 평가여부 Y로 수정 >> 필요없음 자동 Y업데이트
	int updateAssessPf(int registerNo);	
	
	// 과목평가 메뉴 누를 시 교수평가 List 불러오기 (학번 기준)
	List<Map<String,Object>> selectSubjectAssessList(int studentNo);
	
	
	// 별점기반 과목 평가 입력
	int insertAssessSbOne(int registerNo, int professorAssessScore, String professorAssessContent);


}
