package com.gd.lms.vo;

import lombok.Data;

@Data
public class Employee {

	private int employeeNo; // 직원사번
	private String employeePass; // 직원비밀번호
	private String employeeName; // 이름
	private String employeeRegiNo; // 주민번호
	private int employeeAge; // 나이
	private String employeeGender; // 성별
	private String employeeTelephone; // 전화번호
	private String employeeEmail; // 이메일
	private String employeeAddress; // 주소
	private String employeeDetailAddress; // 상세주소
	private String employeeState; // 재직상태
	private String employeeActive; // 총관리자 / 서브관리자
	private String createDate; // 생성일
	private String updateDate; // 수정일
	private String salaryNo; // 연봉등급
}
