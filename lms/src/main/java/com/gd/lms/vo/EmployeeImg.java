package com.gd.lms.vo;

import lombok.Data;

@Data
public class EmployeeImg {
	
	private int employeeNo; // 사번
	private String filename; // 현재파일이름
	private String originFilename; // 기존파일이름
	private String contentType; // 파일형식
	private String createDate; // 생성일
	private String updateDate; // 수정일

}
