package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface TestMapper {
	
	// 학생이 자신이 수강하는 시험응시과목 확인하기
	List<Map<String,Object>> selectTestList(int studentNo);
		
	// 시험지 상세보기(join해서 세부적인 요소 끌고오기)
	List<Map<String,Object>> selectTestOne(int testNo);
	
	// 승인된 과목리스트를 뽑아주기 
	List<Map<String,Object>> selectSubjectApproveList();
	
	// 과목에 대한 정보 보여주기
	Map<String,Object> selectSubjectOne(int subjectApproveNo);
	
	// 시험지 추가
	int insertTest(int subjectApproveNo, String testName);
	
	// 객관식문제 추가하기
	int insertMultipleTest(int testNo,String multiplechoiceQuestion,int multiplechoiceAnswer);
	
	// 번호 가져와주기
	int selectMultipleChoiceNo(int testNo,String multiplechoiceQuestion);
	
	// 객관식답안보기 추가하기
	int insertMultipleTestExample(int multiplechoiceNo,String multipleTestExampleNo,String multipleTestExampleContent);

	//학생 답안 추가
	int insertTestAnswer(int multiplechoiceNo, int studentNo, int answerSelect);

}
