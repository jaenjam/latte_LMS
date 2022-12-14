package com.gd.lms.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
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
public class Professor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int professorNo; // 교수사번(아이디)

	private String professorPass; // 교수비밀번호
	private int majorNo; // 학과코드
	private String professorName; // 이름
	private String professorRegiNo; // 주민번호
	private int professorAge; // 나이
	private String professorGender; // 성별
	private String professorTelephone; // 전화번호
	private String professorEmail; // 이메일
	private String professorAddress; // 주소
	private String professorDetailAddress; // 상세주소
	private String professorRoom; // 교수실
	private String professorState; // 재직상태
	private String professorAccount; //계정상태
	private String createDate; // 생성일
	private String updateDate; // 수정일
	private String salaryNo; // 연봉등급
}
