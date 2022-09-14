package com.gd.lms.vo;

import lombok.Data;

@Data //교수과제 제출
public class ProfessorHomework {

	private int pfHomeworkNo; //과제생성번호
	private int subjectApproveNo; //과목승인번호
	private String pfHomeworkTitle; //과제 제목
	private String pfHomeworkContent; //과제 내용
	private String createDate; //작성일
	private String updateDate; //수정일
	
	
}
