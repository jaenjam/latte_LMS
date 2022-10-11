package com.gd.lms.vo;

import lombok.Data;

@Data
public class SubjectNoticeFile { // 과목공지사항파일
	
	
	private int subjectNoticeFileNo; // 자체 고유번호
	private int subjectNoticeNo; // 참고하는 공지사항번호
	private String subjectNoticeFileName; //파일이름
	private String subjectNoticeOriginName; //원래이름
	private String contentType; //컨텐츠타입
	private String createDate; // 생성날짜
	private String updateDate; // 수정날짜
}
