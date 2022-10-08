package com.gd.lms.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.EmployeeMapper;
import com.gd.lms.vo.Employee;
import com.gd.lms.vo.EmployeeImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	//관리자 수
	public int selectEmployeeCount() {
		log.debug(TeamColor.LJE + "EmployeeService selectEmployeeCount 실행");
		
		return employeeMapper.selectEmployeeCount();
	}
	
	//관리자 사진유무
	public List<Map<String, Object>> getEmployeeImg(int employeeNo){		
		log.debug(TeamColor.LJE + "EmployeeService getEmployeeImg 실행");
		
		return employeeMapper.selectEmployeeImg(employeeNo);
	}
	
	//재직상태 - 서브관리자 리스트 출력 (EmployeeStatusController로)
	public List<Map<String, Object>> getEmployeeStatusList(){
		log.debug(TeamColor.LJE + "EmployeeService getEmployeeStatusList");
		
		return employeeMapper.EmployeeStatus();
	}
	
	//연봉관리 - 서브관리자 연봉리스트 출력(EmployeeSalayController로)
	public List<Map<String, Object>> getsubEmployeeSalaryList(){
		log.debug(TeamColor.LJE + "EmployeeService getsubEmployeeSalary");
		
		return employeeMapper.subEmployeeSalaryList();
	}
	
	//연봉관리 - 관리자 연봉리스트 출력(EmployeeSalayController로)
	public List<Map<String, Object>> getEmployeeSalaryList(){
		log.debug(TeamColor.LJE + "EmployeeService getEmployeeSalary");
		
		return employeeMapper.employeeSalaryList();
	}
	
	//상세관리 - 서브관리자리스트 보여주기(EmployeeDetailController로)
	public List<Map<String, Object>> getsubEmployeeList() {
		log.debug(TeamColor.LJE + "EmployeeService getsubEmployeeList");

		return employeeMapper.subEmployeeList();
	}

	// 관리자 정보 수정 사진등록
	public int addEmployeeImg(EmployeeImg employeeImg) {
		log.debug(TeamColor.CSJ + "addEmployeeImg.service");
		;
		return employeeMapper.insertEmployeeImg(employeeImg);
	}

	// 관리자 정보 수정
	public int modifyEmployee(Employee employee) {
		log.debug(TeamColor.CSJ + "modifyEmployee.service");
		return employeeMapper.updateEmployee(employee);
	}

	// 관리자정보 상세보기(비밀번호 입력 후)
	public List<Map<String, Object>> getEmployeeOneAfterPass(Employee employee) {
		log.debug(TeamColor.CSJ + "getEmployeeOneAfterPass.service");
		return employeeMapper.selectEmployeeOneAfterPass(employee);
	}

	// 관리자 상세보기(수정 전)
	public List<Map<String, Object>> getEmployeeOne(int employeeNo) {
		log.debug(TeamColor.CSJ + "getEmployeeOne.service");
		return employeeMapper.selectEmployeeOne(employeeNo);
	}

	// 관리자 회원가입 (사번중복체크)
	public int employeeNoCheck(int employeeNo) throws Exception {
		log.debug(TeamColor.CSJ + "employeeNoCheck.service");
		return employeeMapper.employeeNoCheck(employeeNo);
	}

	// 관리자 회원가입
	public int addEmployee(Employee employee) {
		log.debug(TeamColor.CSJ + "addEmployee.service");

		return employeeMapper.insertEmployee(employee);
	}

	// 관리자 로그인
	public Employee loginEmployee(Employee employee) {
		log.debug(TeamColor.CSJ + "loginEmployee.service");

		return employeeMapper.getEmployee(employee);
	}

	// 관리자 목록
	public List<Map<String, Object>> getEmployeeList() {

		log.debug(TeamColor.CSJ + "getEmployeeList.service");

		return employeeMapper.selectEmployeeList();
	}

	//관리자사진수정하기
	public int modifyEmployeeImg(EmployeeImg employeeImg) {
		log.debug(TeamColor.LJE + "EmployeeService modifyEmployeeImg 실행");
		
		return employeeMapper.updateEmployeeImg(employeeImg);
	}
	
}
