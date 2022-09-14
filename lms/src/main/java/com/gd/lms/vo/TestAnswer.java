package com.gd.lms.vo;

import lombok.Data;

@Data
public class TestAnswer {
	private int multiplechoiceNo; //문제번호
	private int studentNo; //학생학번
	private int answerSelect; //선택한답
	private int answerScore; //점수
}
