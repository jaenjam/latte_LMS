package com.gd.lms.vo;

import lombok.Data;

@Data //학생과제제출 파일 >>> Lecture 에 대해 제출함
public class StudentHomeworkFile {
	
	private int pfHomeworkNo; //과제번호
	private int studentNo; //학번
	private String homeworkFileName;// 현재 파일이름
	private String homeworkOriginName;//기존 파일이름
	private String homeworkFileType; //파일타입
	private String createDate;
	private String updateDate;

}
