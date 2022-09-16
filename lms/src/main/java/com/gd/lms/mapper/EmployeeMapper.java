package com.gd.lms.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Employee;

@Mapper
public interface EmployeeMapper {
	
	// 관리자 회원가입
	int insertEmployee(Employee employee);
	
	// 관리자 로그인
	Employee getEmployee(Employee employee);
	
	//관리자 목록
	List<Map<String,Object>> selectEmployeeList();
	

}
