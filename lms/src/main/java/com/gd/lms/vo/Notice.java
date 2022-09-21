package com.gd.lms.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo; // 공지사항의 번호
	private String noticeTitle; // 공지제목
	private String noticeContent; // 공지내용
	private String noticeWriter; // 작성자
	private int count; // 조회수
	private String createDate; // 작성일
	private String updateDate; // 수정일
}
