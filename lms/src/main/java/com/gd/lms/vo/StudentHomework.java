package com.gd.lms.vo;

import lombok.Data;

@Data //학생과제 제출
public class StudentHomework {
	
	private int pfHomeworkNo; //과제번호
	private int studentNo; //학번
	private String homeworkTitle; //과제명
	private String homeworkContent; //과제내용
	private String studentSubmitCk; //제출여부
	private int score;// 점수
	

}
