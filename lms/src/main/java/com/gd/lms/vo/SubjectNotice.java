package com.gd.lms.vo;

import lombok.Data;

@Data
public class SubjectNotice {
	private int subjectNoticeNo; //과목공지사항번호
	private int subjectApproveNo; //과목승인번호
	private String sbNoticeTitle; //공지사항제목
	private String sbNoticeContext; //공지사항내용
	private int count; //공지사항조회수
	private String createDate; //공지사항작성일
	private String updateDate; //공지사항수정일
}
