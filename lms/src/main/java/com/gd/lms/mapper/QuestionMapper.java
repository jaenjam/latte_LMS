package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Question;

@Mapper
public interface QuestionMapper {

	//질문상세보기
	Map<String, Object> selectQuestionOne(int questionNo);
	
	//질문추가
	int insertQuestion(Question question);
	
	//질문목록 가져오기
	List<Map<String, Object>> selectQustionList();
}
