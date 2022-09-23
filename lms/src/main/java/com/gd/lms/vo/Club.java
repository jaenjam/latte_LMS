package com.gd.lms.vo;

import lombok.Data;

@Data
public class Club {
	
	private String clubNo; // 동아리코드
	private String clubName; // 동아리명
	private String clubContent; //동아리내용
	private String clubRoom; // 동아리방
	private int professorNo; // 담당교수
	private String createDate;
	private String updateDate;

}
