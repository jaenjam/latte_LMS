package com.gd.lms.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.AnswerService;
import com.gd.lms.vo.Answer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AnswerController {

	@Autowired AnswerService answerService;
	
	//댓글 추가
	@PostMapping("/insertAnswer")
	public String addAnswer(Answer answer, int questionNo) {
		
		System.out.println(answer.toString());
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "AnswerService addNotice 실행");
		
		//answerService addAnswer 실행 insertAnswer에 넣기
		int insertAnswer = answerService.addAnswer(answer, questionNo);
		
		
		log.debug(TeamColor.LJE + "AnswerService addNotice 실행결과 1이면 성공, 0이면 실패 : " + insertAnswer);
		
		
		//return "redirect:/qna/questionOne?questionNo="+questionNo;
		
		return "redirect:/qna/questionList";
	}
}
