package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.QuestionMapper;
import com.gd.lms.vo.Question;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class QuestionService {

	@Autowired private QuestionMapper questionMapper;
	
	//질문상세보기
	public Map<String, Object> getQuestionOne(int questionNo){
		log.debug(TeamColor.LJE + "QuestionService getQuestionOne 실행");
		
		return questionMapper.selectQuestionOne(questionNo);
	}
	
	//질문추가
	public int addQuestion(Question question) {
		log.debug(TeamColor.LJE + "QuestionService addQuestion 실행");
		
		return questionMapper.insertQuestion(question);
	}
	
	//질문목록가져오기
	public List<Map<String, Object>> getQuestionList(){
		log.debug(TeamColor.LJE + "QuestionService getQuestionList 실행");
		
		return questionMapper.selectQustionList();
	}
}
