package com.gd.lms.vo;

import lombok.Data;

@Data //교수 이미지
public class ProfessorImg {
	
	private int ProfessorNo; //교수 사번
	private String contentType; //파일형식
	private String fileName; //현재파일이름
	private String originFileName; //기존파일이름
	private String createDate; //작성일
	private String updateDate; //수정일
	
	
	
	
	
}
