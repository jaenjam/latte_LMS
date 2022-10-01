package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Register;

@Mapper
public interface RegisterMapper {

	
// 1. 학생의 수강신청
	// 1-1. 수강신청할 때 승인과목 리스트 불러오기
	
	// 1-2. 장바구니(registerCart)에 담기
	int insertRegisterCart();
	
	// 1-3. 장바구니(registerCart)에 담긴 내용 수정
	int updateRegisterCart(int studentNo);
	
	// 1-4. 장바구니(registerCart)에 담긴 내용 삭제-일부만
	int deleteRegisterCart(Register register);
	
	// 1-45. 장바구니(registerCart)에 담긴 내용 삭제-전체 다
	int deleteRegisterCartAll(int studentNo);
	
	// 1-5. 수강신청 완료 >> register에 최종 제출 & >>> 이때 장바구니 삭제(1-45)
	int insertRegister(int studentNo);
	
	// 1-6. 수강신청 완료 >> register에 최종 제출시 미반영된 create_date update
	int updateRegisterCreateDate(int studentNo);
	
	// 학생의 나의강의실 리스트 >>> sidebar용
	List<Map<String,Object>> selectStudentMyRegisterList(int studentNo);

	// 교수의 강의리스트 >>> sidebar용
	List<Map<String,Object>> selectProfessorMyRegisterList(int professorNo);

	// 넘겨받은 approveNo 기준으로 강의정보 셀렉하기 & 학생 교수 상관없이 (특정 수강강의 메인용)
	Map<String,Object> selectRegisteInfo(int subjectApproveNo);
}
