package com.gd.lms.vo;

import lombok.Data;

@Data
public class ProfessorAssess {
	private int professorAssessNo; // 번호
	private int registerNo; // 개별수강신청번호
	private int professorAssessScore; // 만족도점수
	private String professorAssessContent;
	private String professorAssessCk; // 만족도 검사 제출여부; 디폴트N
	private int subjectApproveNo; // 과목승인코드 
}
