package com.gd.lms.vo;

import lombok.Data;

@Data
public class Subject {
	private String subjectNo; //과목코드
	private String subjectName; //과목명
	private String subjectState; //개설상태
	private int subjectCredit; //학점
	private String subjectMajor; //전필여부
	private String createDate; //개설날짜
	private String endDate; //폐강날짜
}
