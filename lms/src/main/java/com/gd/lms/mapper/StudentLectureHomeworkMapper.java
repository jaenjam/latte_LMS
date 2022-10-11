package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.StudentHomework;
import com.gd.lms.vo.StudentHomeworkFile;

@Mapper
public interface StudentLectureHomeworkMapper {

	
	// 해당강의 듣는 학생 넘버추출
	List selectStudents(int subjectApproveNo);
	
	// 수강 학생들에게 데이터 자동생성 
	int insertAllStudentHomework(StudentHomework studenthomework);
	
	// 학생이 본인이 수강하는 과목의 과제 리스트 보기
	List<Map<String, Object>> selectMyLecureHomeworkList(int subjectApproveNo);
	
	// 학생이 수강하는 과목의 과제 제출
	int insertLectureHomework(StudentHomework studenthomework);
	
	// 강의하는 과목의 과제파일첨부를 위해 값 찾기
	int selectLectureHomeworkPf(StudentHomework studenthomework);
	
	// 학생이 수강하는 과목의 과제 파일 첨부하기
	int insertLectureHomeworkfile(StudentHomeworkFile studenthomeworkfile);
	
	// 학생이 수강하는 과목의 과제 수정하기
	// 학생이 수강하는 과목의 과제 파일 수정하기 
	
	// 학생이 수강하는 과목의 과제 삭제하기
	// 학생이 수강하는 과목의 과제 파일 삭제하기 


	// 교수가 자기 강의 수강하는 학생들의 과제 제출 여부 리스트로 보기


	// 학생의 과제 제출 후 교수가 뷰에서 ck를 Y로 바꿔주기
	int updateStudentHomeworkSubmitCk(int lectureNo);
	
	// 교수의 제출 과제 평가; 점수매기기
	int udpateStudentHomeworkScore(int lectureNo);
	
	// 교수가 제출일람에서 수정하는 경우
	//	└ 두개 다 업데이트
	int updateLectureHomeworkall(StudentHomework studenthomework);
		
}
