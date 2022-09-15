package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.mapper.EmployeeMapper;
import com.gd.lms.vo.Employee;

@Service
@Transactional
public class EmployeeService {
	
	@Autowired private EmployeeMapper employeeMapper;
	
	//관리자 회원가입
	public int addEmployee(Employee employee) {
		System.out.println("employee service");
		return employeeMapper.insertEmployee(employee);
	}

}
