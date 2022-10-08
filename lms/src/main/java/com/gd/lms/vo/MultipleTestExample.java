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
public class MultipleTestExample {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int exampleNo; // 문제번호

	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "multiplechoice_no")
	private MultipleTest multipleTest;

	private String multipleTestExampleNo;

	private String multipleTestExampleContent; // 문제내용
	private String createDate; // 작성일
	private String updateDate; // 수정일
}
