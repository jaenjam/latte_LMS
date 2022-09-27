package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.MultipleTest;
import com.gd.lms.vo.Test;

@Mapper
public interface TestMapper {
	
	// 시험지 중간/기말 추가
	int insertTest(Test test);

	// 시험지 문제 추가
	int insertMultiple(MultipleTest multipleTest);
}
