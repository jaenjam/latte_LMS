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
public class Test {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int testNo;

	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "subject_approve_no")
	private SubjectApprove subjectApprove;

	private String testName;
	private String createDate;
	private String updateDate;

	@ToString.Exclude
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "test")
	private List<MultipleTest> multipleTestList;
}
