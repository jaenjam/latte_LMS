package com.gd.lms.vo;

import lombok.Data;

@Data
public class Major {
	private int majorNo; // 학과코드
	private String majorName; // 학과명
	private String majorIntroduceHeader; // 전공소개제목
	private String majorIntroduce; // 전공소개단락
	private String majorSubject; // 전공과목
	private String majorRoom; // 학과방
	private String createDate; // 만든날짜
	private String updateDate; // 수정날짜
}
