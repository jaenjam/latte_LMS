package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.mapper.EmployeeMapper;
import com.gd.lms.vo.Employee;
import com.gd.lms.vo.Student;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	// 관리자 정보 수정
	public int modifyEmployee(Employee employee) {
		return employeeMapper.updateEmployee(employee);
	}

	// 관리자정보 상세보기(비밀번호 입력 후)
	public List<Map<String, Object>> getEmployeeOneAfterPass(Employee employee) {
		return employeeMapper.selectEmployeeOneAfterPass(employee);
	}

	// 관리자 상세보기(수정 전)
	public List<Map<String, Object>> getEmployeeOne(int employeeNo) {
		return employeeMapper.selectEmployeeOne(employeeNo); 
	}

	// 관리자 회원가입
	public int addEmployee(Employee employee) {
		System.out.println("addEmployee service");
		return employeeMapper.insertEmployee(employee);
	}

	// 관리자 로그인
	public Employee loginEmployee(Employee employee) {
		System.out.println("loginEmployee service");
		return employeeMapper.getEmployee(employee);
	}

	// 관리자 목록
	public List<Map<String, Object>> getEmployeeList() {

		System.out.println("getEmployee service");

		return employeeMapper.selectEmployeeList();
	}

}
