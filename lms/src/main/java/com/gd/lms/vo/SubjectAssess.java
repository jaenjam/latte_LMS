package com.gd.lms.vo;

import lombok.Data;

@Data
public class SubjectAssess {
	private int studentAssessNo; //과목만족도평가번호
	private int registerNo; //개별수강신청번호
	private int sAssessScore; //만족도평가점수
}
