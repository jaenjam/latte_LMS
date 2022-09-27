package com.gd.lms.vo;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;

@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Lecture {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lectureNo; // 강의자료의 번호
	
	
	//private int lectureNo; // 강의자료 번호
	private int subjectApproveNo; // 과목승인번호
	private String lectureTitle; // 강의자료 제목
	private String lectureContent; // 강의자료 내용
	private String createDate; // 작성일
	private String updateDate; // 수정일
	private int count; // 조회수
}
