package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Test;

@Mapper
public interface TestMapper {
	
	// 승인된 과목리스트를 뽑아주기 
	List<Map<String,Object>> selectSubjectApproveList();
	
	// 과목에 대한 정보 보여주기
	Map<String,Object> selectSubjectOne(int subjectApproveNo);
	
	// 시험지 추가
	int insertTest(int subjectApproveNo, String testName);
	
	// 객관식문제 추가하기
	int insertMultipleTest(int testNo,String multiplechoiceQuestion,int multiplechoiceAnswer,String multiplechoiceScore);
	
	// 번호 가져와주기
	int selectMultipleChoiceNo(int testNo,String multiplechoiceQuestion);
	
	// 객관식답안보기 추가하기
	int insertMultipleTestExample(int multiplechoiceNo,String multipleTestExampleNo,String multipleTestExampleContent);


}
