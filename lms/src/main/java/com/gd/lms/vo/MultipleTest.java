package com.gd.lms.vo;



import lombok.*;
import lombok.experimental.Accessors;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
public class MultipleTest {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int multiplechoiceNo; // 객관식문제의 문제번호

	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "test_no")
	private Test test; // 시험번호

	private String multiplechoiceQuestion; // 문제

	private int multiplechoiceAnswer; // 정답

	private int multiplechoiceScore; // 점수

	private String createDate; // 생성일

	private String updateDate; // 수정일

	@ToString.Exclude
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "multipleTest")
	private List<MultipleTestExample> multipleTestExampleList;
 }
