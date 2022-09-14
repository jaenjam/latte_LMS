package com.gd.lms.vo;

import lombok.Data;

@Data //학생과제제출 파일
public class StudentHomeworkFile {
	
	private int pfHomeworkNo; //과제번호
	private int studentNo; //학번
	private String homeworkFileName;// 현재 파일이름
	private String homeworkOriginName;//기존 파일이름
	private String homeworkFileType; //파일타입
	private int homeworkFileSize; //파일크기
	private String createDate;
	private String updateDate;

}
