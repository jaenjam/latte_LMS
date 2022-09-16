package com.gd.lms.service;

import java.util.List;
import java.util.Map;

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
		System.out.println("addEmployee service");
		return employeeMapper.insertEmployee(employee);
	}
	
	//관리자 로그인
	public Employee loginEmployee(Employee employee) {
		System.out.println("loginEmployee service");
		return employeeMapper.getEmployee(employee);
	}
	
	//관리자 목록
		public List<Map<String,Object>> getEmployeeList(){
			
			System.out.println("getEmployee service");
			
			return employeeMapper.selectEmployeeList();
		}

}