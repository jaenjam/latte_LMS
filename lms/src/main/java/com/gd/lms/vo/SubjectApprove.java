package com.gd.lms.vo;

import lombok.Data;

@Data
public class SubjectApprove {
	private int subjcetApproveNo; //과목승인번호
	private int majorNo; //학과명
	private String subjcetNo; //과목번호
	private int professorNo; //교수사번
	private int year; //년도
	private int semester; //학기
	private String startDate; //개강일
	private String endDate; //종강일
	private int totalDate; //총수업일수
	private String approveActive; //개설과목승인
	private String subjectRoom; //강의실
	private String day; //요일
	private int startTime; //시작시간
	private int endTime; //종료시간
	
	
}
