package com.gd.lms.vo;

import lombok.Data;

@Data
public class Community {
	
	private int communityNo; // 커뮤니티번호
	private int studentNo; // 학생사번
	private String communityTitle; // 제목
	private String communityContent; // 내용
	private int count; // 조회수
	private String createDate; // 생성일
	private String updateDate; // 수정일

}
