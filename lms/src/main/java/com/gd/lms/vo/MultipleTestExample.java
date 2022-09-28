package com.gd.lms.vo;


import lombok.Data;

@Data
public class MultipleTestExample {
	private String multipleTestExampleNo; // 보기번호 4지선다
	private int multiplechoiceNo; // 문제번호
	private int multipleTestExampleContent; // 문제내용
	private String createDate; // 작성일
	private String updateDate; // 수정일
}
