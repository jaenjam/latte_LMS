package com.gd.lms.vo;

import lombok.Data;

@Data
public class Lecture {
	private int lectureNo; // 강의자료 번호
	private int subjectApproveNo; // 과목승인번호
	private String lectureTitle; // 강의자료 제목
	private String lectureContent; // 강의자료 내용
	private String createDate; // 작성일
	private String updateDate; // 수정일
}
