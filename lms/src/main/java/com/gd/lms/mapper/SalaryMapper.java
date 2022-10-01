package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Employee;
import com.gd.lms.vo.Professor;

@Mapper
public interface SalaryMapper {
	
	//연봉 리스트
	List<Map<String, Object>> selectSalaryList();
	
	// 직원 연봉 수정
	int updateSalaryEmployee(Employee employee);
	
	// 교수 연봉 수정
	int updateSalaryProfessor(Professor professor);
}
