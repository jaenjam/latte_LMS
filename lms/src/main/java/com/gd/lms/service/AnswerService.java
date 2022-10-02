package com.gd.lms.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.AnswerMapper;
import com.gd.lms.vo.Answer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AnswerService {

	@Autowired private AnswerMapper answerMapper;
	
	//답변추가
	public int addAnswer(Answer answer, int questionNo) {
		log.debug(TeamColor.LJE + "AnswerService addAnswer 실행");
		
		return answerMapper.insertAnswer(answer.getAnswerTitle(),answer.getAnswerContent(),answer.getAnswerWriter(), questionNo);
	}
	
	
	//답변목록
	public Map<String, Object> getAnswerList(int questionNo){
		log.debug(TeamColor.LJE + "AnswerService안에 있는 getAnswer");
		
		return answerMapper.selectAnswerList(questionNo);
	}
}
