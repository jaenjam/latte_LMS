package com.gd.lms.vo;

import lombok.Data;

@Data //장학
public class Scholar {
	private int scholarNo; //장학코드
	private String scholarName; //장학명
	private String scholarContent; //장학내용
	private String scholarPrice; //장학금액
	private String createDate;
	private String updateDate;
	
	
	

}
