package com.gd.lms.vo;

import lombok.Data;

@Data
public class Faq {
	
	
	private int faqNo; // 자주묻는질문 자체 넘버
	private String faqTitle; // 자주묻는질문 제목
	private String faqContent; // 자주묻는질문 내용
	private String createDate; // 생성일
	private String updateDate; // 수정일
	
	
	
}
