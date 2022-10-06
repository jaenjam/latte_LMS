package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.ProfessorAssess;

@Mapper
public interface AssessMapper {

	
	//
	int insertPa(int studentNo);
	//
	int insertSa(int studentNo);
	
	// 교수평가 메뉴 누를 시 교수평가 List 불러오기 (학번 기준)
	List<Map<String,Object>> selectAssessList(int studentNo);
	
	// 이후 평가하기를 누를시 그 특정 과목을 맡은 교수평가 폼 불러오기
	List<Map<String,Object>> selectAssessPfOne(int registerNo);
	
	// 별점기반 교수 평가 입력 
	int insertAssessPfOne(int registerNo, int professorAssessScore, String professorAssessContent);

	// 관리자가 수강 과목기준으로 학생 List 보기
	List<Map<String,Object>> selectAssessStudentList(int subjectApproveNo);
	
	// 관리자가 확인 후 평가여부 Y로 수정
	int updateAssessPf(int registerNo);	
	
	// 과목평가 메뉴 누를 시 교수평가 List 불러오기 (학번 기준)
	List<Map<String,Object>> selectSubjectAssessList(int studentNo);
	
	
	// 별점기반 과목 평가 입력
	int insertAssessSbOne(int registerNo, int professorAssessScore, String professorAssessContent);


}
