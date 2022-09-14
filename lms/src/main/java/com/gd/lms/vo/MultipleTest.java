package com.gd.lms.vo;



import lombok.Data;

@Data
public class MultipleTest {
	private int multiplechoiceNo; // 객관식문제의 문제번호
	private int testNo; // 시험번호
	private String multiplechoiceQuestion; // 문제
	private int multiplechoiceAnswer; // 정답
	private int multiplechoiceScore; // 점수
	private String createDate; // 생성일
	private String updateDate; // 수정일
 }
