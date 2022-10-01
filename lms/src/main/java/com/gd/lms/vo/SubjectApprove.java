package com.gd.lms.vo;

import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class SubjectApprove {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int subjectApproveNo; //과목승인번호

	private int majorNo; //학과명
	
	@ToString.Exclude
	@ManyToOne // N:1관계 , professor_no를 통해 professor가져오기
	@JoinColumn(name = "subject_no")	
	private Subject subject; //과목번호

	@ToString.Exclude
	@ManyToOne // N:1관계 , professor_no를 통해 professor가져오기
	@JoinColumn(name = "professor_no")
	private Professor professor; //관계설정

	private int year; //년도
	private String semester; //학기
	private String startDate; //개강일
	private String endDate; //종강일
	private int totalDate; //총수업일수
	private String approveActive; //개설과목승인
	private String subjectRoom; //강의실
	private String day; //요일
	private int startTime; //시작시간
	private int endTime; //종료시간

	
	
}
