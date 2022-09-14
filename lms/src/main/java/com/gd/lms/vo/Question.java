package com.gd.lms.vo;

import lombok.Data;

@Data //질문
public class Question {

	private int questionNo; // 번호
	private int studentNo; // 작성자
	private String questionTitle; // 제목
	private String questionContent; //내용
	private String createDate; //작성일
	private String updateDate; //수정일
	
}
