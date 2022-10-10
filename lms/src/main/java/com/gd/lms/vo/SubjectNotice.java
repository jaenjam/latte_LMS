package com.gd.lms.vo;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;


@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class SubjectNotice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int subjectNoticeNo; //과목공지사항번호
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "subject_approve_no")
	private SubjectApprove subjectApprove; //과목승인번호
	
	
	private String subjectNoticeTitle; //공지사항제목
	private String subjectNoticeContent; //공지사항내용
	private int count; //공지사항조회수
	private String createDate; //공지사항작성일
	private String updateDate; //공지사항수정일
}
