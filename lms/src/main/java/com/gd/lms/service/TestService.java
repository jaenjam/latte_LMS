package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.TestMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TestService {

	@Autowired
	TestMapper testMapper;

	// 수강된 강의 리스트 mapper실행해주기
	public List<Map<String, Object>> getSubjectApproveList() {

		log.debug(TeamColor.JJY+"Service -> getSubjectApproveList실행");
		return testMapper.selectSubjectApproveList();
	}

	// 시험추가하기
	public int addTest(int subjectApproveNo, String testName) {

		log.debug(TeamColor.JJY+"Service -> addTest실행");
		return testMapper.insertTest(subjectApproveNo, testName);
	}
	
	// 전공값 가져오기
	public Map<String,Object> getSubjectOne(int subjectApproveNo){
		
		log.debug(TeamColor.JJY+"Service -> getSubjectOne실행");
		return testMapper.selectSubjectOne(subjectApproveNo);
	}
	
	// 객관식문제추가하기
	public int addMultipleTest(int testNo,String multiplechoiceQuestion,int multiplechoiceAnswer,String multiplechoiceScore) {
		
		return testMapper.insertMultipleTest(testNo, multiplechoiceQuestion, multiplechoiceAnswer, multiplechoiceScore);
	}
	
	// 객관식보기추가하기
	public int addMultipleTestExample(int multiplechoiceNo,String multipleTestExampleNo,String multipleTestExampleContent) {
		
		return testMapper.insertMultipleTestExample(multiplechoiceNo, multipleTestExampleNo, multipleTestExampleContent);
	}

}
