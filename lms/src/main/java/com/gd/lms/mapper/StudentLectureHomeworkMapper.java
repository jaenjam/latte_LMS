package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentLectureHomeworkMapper {

	// 학생이 본인이 수강하는 과목의 과제 리스트 보기
	List<Map<String, Object>> selectMyLecureHomeworkList(int subjectApproveNo);
	
	// 학생이 수강하는 과목의 과제 제출
	int insertLectureHomework();
	
	// 학생이 수강하는 과목의 과제 파일 첨부하기
	
	// 학생이 수강하는 과목의 과제 수정하기
	// 학생이 수강하는 과목의 과제 파일 수정하기 
	
	// 학생이 수강하는 과목의 과제 삭제하기
	// 학생이 수강하는 과목의 과제 파일 삭제하기 


	// 교수가 자기 강의 수강하는 학생들의 과제 제출 여부 리스트로 보기


	// 학생의 과제 제출 후 교수가 뷰에서 ck를 Y로 바꿔주기
	int updateStudentHomeworkSubmitCk(int lectureNo);
	
	// 교수의 제출 과제 평가; 점수매기기
	int udpateStudentHomeworkScore(int lectureNo);
}
