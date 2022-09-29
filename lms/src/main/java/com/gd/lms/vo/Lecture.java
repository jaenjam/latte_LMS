package com.gd.lms.vo;

import javax.persistence.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;


import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Lecture {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lectureNo; // 강의자료의 번호

	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "subject_approve_no")
	private SubjectApprove subjectApprove;

	private String lectureTitle; // 강의자료 제목
	private String lectureContent; // 강의자료 내용
	private String createDate; // 작성일
	private String updateDate; // 수정일
	private int count; // 조회수




}
