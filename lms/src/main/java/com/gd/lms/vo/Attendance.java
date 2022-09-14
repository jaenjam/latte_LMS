package com.gd.lms.vo;

import lombok.Data;

@Data
public class Attendance {
	
	private int attendanceNo; // 출결관리번호
	private int studentNo; // 학생번호
	private int subjectApproveNo; // 과목승인번호
	private String attendanceDate; // 출석일
	private String attendanceState; // 출결상태
	private String attendanceEtc; // 비고

}
