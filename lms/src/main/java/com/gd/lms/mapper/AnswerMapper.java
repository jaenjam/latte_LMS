package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Answer;

@Mapper
public interface AnswerMapper {
	
	//답글추가
	int insertAnswer(String answerTitle, String answerContent, String answerWriter, int questionNo);

}
