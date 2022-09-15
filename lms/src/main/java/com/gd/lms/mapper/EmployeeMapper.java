package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Employee;

@Mapper
public interface EmployeeMapper {
	
	// 관리자추가 (회원가입)
	int insertEmployee(Employee employee);

}
