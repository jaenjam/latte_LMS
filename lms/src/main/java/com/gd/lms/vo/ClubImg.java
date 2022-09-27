package com.gd.lms.vo;

import lombok.Data;

@Data //동아리사진첨부
public class ClubImg {
	
	private int clubImgNo; //동아리사진번호
	private String clubNo; //동아리코드
	private String contentType; //파일타입
	private String fileName; //파일이름
	private String createDate;
	private String updateDate;

}
