package com.gd.lms.vo;



import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Subject {	// 전체 과목
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String subjectNo; //과목코드
	
	
	
	private String subjectName; //과목명
	private String subjectState; //개설상태
	
	private int subjectCredit; //학점
	
	
	
	private String subjectMajor; //전필여부
	private String createDate; //개설날짜
	private String endDate; //폐강날짜
}
