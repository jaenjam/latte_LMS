package com.gd.lms.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Employee;
import com.gd.lms.vo.EmployeeImg;

@Mapper
public interface EmployeeMapper {
	
	//관리자 수
	int selectEmployeeCount();
	
	//관리자사진유무
	List<Map<String, Object>> selectEmployeeImg(int employeeNo);
	
	//재직상태 - 관리자 리스트
	List<Map<String, Object>> EmployeeStatus();
	
	//연봉관리 - 서브관리자 연봉 수정폼
	List<Map<String, Object>> subEmployeeSalaryList();
	
	//연봉관리 - 관리자 연봉 수정폼
	List<Map<String, Object>> employeeSalaryList();
	
	// 상세관리 - 서브관리자리스트
	List<Map<String, Object>> subEmployeeList();

	// 관리자 정보수정에서 사진등록
	int insertEmployeeImg(EmployeeImg employeeImg);

	// 관리자 정보수정
	int updateEmployee(Employee employee);

	// 관리자 정보 상세보기 (비밀번호 입력 후)
	List<Map<String, Object>> selectEmployeeOneAfterPass(Employee employee);

	// 관리자정보 상세보기
	List<Map<String, Object>> selectEmployeeOne(int employeeNo);

	// 관리자 목록
	List<Map<String, Object>> selectEmployeeList();

	// 사번중복검사
	int employeeNoCheck(int employeeNo) throws Exception;

	// 관리자 회원가입
	int insertEmployee(Employee employee);

	// 관리자 로그인
	Employee getEmployee(Employee employee);

	//관리자 사진 수정
	int updateEmployeeImg(EmployeeImg employeeImg);
}
