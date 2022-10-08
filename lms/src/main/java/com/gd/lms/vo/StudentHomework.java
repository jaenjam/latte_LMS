package com.gd.lms.vo;

import lombok.Data;

@Data //학생과제 제출
public class StudentHomework {
	
	private int pfHomeworkNo; // 학생의 고유과제번호
	private int studentNo; // 학번
	private int lectureNo; // 교수가낸 과제번호
	private String homeworkTitle; // 제출할 과제명
	private String homeworkContent; //제출한 과제내용
	private String studentSubmitCk; //제출여부
	private int score;// 점수
	

}
