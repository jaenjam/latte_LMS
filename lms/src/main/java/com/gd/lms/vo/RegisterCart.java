package com.gd.lms.vo;

import lombok.Data;

@Data
public class RegisterCart {
	// 수강신청장바구니
	
	private int registerCartNo; //수강신청번호
	private int studentNo; //학번
	private int subjectApproveNo; //승인과목코드
	private String createDate; //작성일
	private String updateDate; //수정일
	

}
