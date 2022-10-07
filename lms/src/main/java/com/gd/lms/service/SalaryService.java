package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SalaryMapper;
import com.gd.lms.vo.Employee;
import com.gd.lms.vo.Professor;
import com.gd.lms.vo.Salary;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SalaryService {

	@Autowired private SalaryMapper salaryMapper;
	
	// 연봉 목록
	public List<Map<String, Object>> getSalaryList(){
		log.debug(TeamColor.LJE + "SalaryService getSalaryList 실행");

		return salaryMapper.selectSalaryList();
	}
	
	// 연봉 수정 (직원)
	public int modifySalaryEmployee(Employee employee) {
		
		log.debug(TeamColor.JJY + "SalaryService modifySalaryEmployee 실행");
		return salaryMapper.updateSalaryEmployee(employee);
	}
	
	// 연봉 수정 (교수)
	public int modifySalaryProfessor(Professor professor) {
		
		log.debug(TeamColor.JJY + "SalaryService modifySalaryProfessor 실행");
		return salaryMapper.updateSalaryProfessor(professor);
	}
	
	// 연봉 수정
	public int modifySalary(Salary salary) {
		
		System.out.print("modifySalary 실행");
		return salaryMapper.updateSalary(salary);
	}
}
