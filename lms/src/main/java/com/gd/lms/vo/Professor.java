package com.gd.lms.vo;

import lombok.Data;

@Data
public class Professor {
	private int prifessorNo; // 교수사번(아이디)
	private String professorPass; // 교수비밀번호
	private int majorNo; // 학과코드
	private String professorName; // 이름
	private String professorRegiNo; // 주민번호
	private int professorAge; // 나이
	private String professorGender; // 성별
	private String professorTelephone; // 전화번호
	private String professorEmail; // 이메일
	private String professorAddress; // 주소
	private String professorDetailAddress; // 상세주소
	private String professorRoom; // 교수실
	private String professorState; // 재직상태
	private int salaryNo; // 연봉등급
}
