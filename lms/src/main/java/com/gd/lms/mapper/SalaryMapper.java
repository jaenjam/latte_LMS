package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalaryMapper {
	
	//연봉 리스트
	List<Map<String, Object>> selectSalaryList();
}
