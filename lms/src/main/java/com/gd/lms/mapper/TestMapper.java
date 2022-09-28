package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.MultipleTest;
import com.gd.lms.vo.Test;
import com.gd.lms.vo.MultipleTestExample;

@Mapper
public interface TestMapper {
	
	// 시험지 추가
	int insertTest(Test test);
		
	// 시험지 출제 여부 확인하기
	Map<String,Object> selectTestNo();
	
	// 객관식 문제 출제할때 test번호 불러오기위해 test_no select해주기
	List<Map<String,Object>> selectTestList();
	
	// 객관식 보기 생성 (보기에 값 넣어주기)
	int insertMultipleTestExample(MultipleTestExample multipleTestExample);
	
	// 객관식 보기 수정
	int updateMultipleTestExample(MultipleTestExample multipleTestExample);
}
