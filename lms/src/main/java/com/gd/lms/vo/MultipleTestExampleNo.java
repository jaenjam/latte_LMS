package com.gd.lms.vo;


import lombok.Data;

@Data
public class MultipleTestExampleNo {
	private int multipleTestExampleNo; // 보기번호
	private int multiplechoiceNo; // 문제번호
	private int multipleTestExampleContent; // 문제내용
	private String createDate; // 작성일
	private String updateDate; // 수정일
}
