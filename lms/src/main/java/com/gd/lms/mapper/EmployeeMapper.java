package com.gd.lms.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Employee;

@Mapper
public interface EmployeeMapper {
	
	//관리자 정보수정
	int updateEmployee(Employee employee);

	//관리자 정보 상세보기 (비밀번호 입력 후)
	List<Map<String, Object>>selectEmployeeOneAfterPass(Employee employee);
	
	// 관리자정보 상세보기
	List<Map<String, Object>> selectEmployeeOne(int employeeNo);

	// 관리자 목록
	List<Map<String, Object>> selectEmployeeList();

	// 관리자 회원가입
	int insertEmployee(Employee employee);

	// 관리자 로그인
	Employee getEmployee(Employee employee);

}
