package com.gd.lms.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Answer;

@Mapper
public interface AnswerMapper {
	
	//답글추가
	int insertAnswer(String answerTitle, String answerContent, String answerWriter, int questionNo);

	//답글목록가져오기
	Map<String, Object> selectAnswerList(int questionNo);
	
}
