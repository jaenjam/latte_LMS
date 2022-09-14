package com.gd.lms.vo;


import lombok.Data;

@Data
public class LectureFile {
	private int lecturefileNo; // 강의자료파일 파일번호
	private int lectureNo; // 강의자료 번호
	private String lectureFilename; // 강의자료파일에서 저장된이름
	private String lectureOriginname; // 기존파일이름
	private String lectureType; // 파일형식
	private int lectureSize; // 파일사이즈
}
