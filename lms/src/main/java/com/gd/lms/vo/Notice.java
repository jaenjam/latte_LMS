package com.gd.lms.vo;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;

@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Notice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int noticeNo; // 공지사항의 번호
	private String noticeTitle; // 공지제목
	private String noticeContent; // 공지내용
	private String noticeWriter; // 작성자
	private int count; // 조회수
	private String createDate; // 작성일
	private String updateDate; // 수정일
}
