package com.gd.lms.vo;

import lombok.Data;

@Data
public class SubjectAssess {
	private int subjectAssessNo; //과목만족도평가번호
	private int registerNo; //개별수강신청번호
	private int subjectAsssessScore; //만족도평가점수
	private String studentAssessCk; //만족도평가점수
	private String subjectAssessContent; // 만족도평가내용
	private int subjectApproveNo; // 과목승인넘버 
}
