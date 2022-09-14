package com.gd.lms.vo;

import lombok.Data;

@Data
public class Answer {
	
	private int answerNo; // 대답번호
	private int questionNo; // 질문번호
	private String answerTitle; // 글제목
	private String answerContent; //글내용
	private String answerWriter; // 작성자
	private String createDate; // 작성일
	private String updateDate; // 수정일

}
