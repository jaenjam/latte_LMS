package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Test;

@Mapper
public interface TestMapper {
	
	// 시험지 추가
	int insertTest(Test test);

}
