package com.gd.lms.vo;

import lombok.Data;

@Data //동아리사진첨부
public class ClubImg {
	
	private String clubNo; //동아리코드
	private String contentType; //파일타입
	private String fileName; //현재파일이름
	private String originFileName; // 기존파일이름
	private String createDate;
	private String updateDate;

}
