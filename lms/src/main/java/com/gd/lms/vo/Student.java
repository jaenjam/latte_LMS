package com.gd.lms.vo;

import lombok.Data;

@Data //학생
public class Student {
	
	private int studentNo; //학번
	private String studentPass; //비밀번호
	private int majorNo; // 학과코드
	private String studentName; //학생이름
	private String studentRegiNo; //주민번호
	private int studentAge; //나이
	private String studentGender; //성별
	private String studentTelephone; //전화번호
	private String studentEmail; //이메일
	private String studentAddress; //주소
	private String studentDetailAddress; //상세주소
	private String studentState; //학적상태
	private String studentTop; //과대표 여부
	private String studentAccount; //계정상태
	private String createDate; //생성일
	private String updateDate; //수정일
	private String clubNo; //동아리코드
	private int scholarNo; //장학코드
	
}
