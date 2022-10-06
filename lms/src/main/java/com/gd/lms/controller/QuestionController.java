package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.AnswerService;
import com.gd.lms.service.QuestionService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.Answer;
import com.gd.lms.vo.Question;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {

	@Autowired QuestionService questionService;
	@Autowired AnswerService answerService;
	@Autowired RegisterService registerService;
	
	//질문 답변하기 form
	@GetMapping("/qna/questionOne")
	public String getQuestionOne(Model model, int questionNo) {
		
		//디버깅
		log.debug(TeamColor.LJE + "QuestionController getQuestionOne");
		
		//Map<String, Object> questionOne을 model에 넣어준다.
		Map<String, Object> questionOne = questionService.getQuestionOne(questionNo);
		
		model.addAttribute("questionOne", questionOne);
		
		//answerService getAnswerList
		Map<String, Object> answerOne = answerService.getAnswerList(questionNo);
		
		if(answerOne != null) {
		
			model.addAttribute("answerOne", answerOne);
			
			System.out.println(answerOne.toString());
			
			log.debug(TeamColor.LJE + "QuestionController getQuestionOne에 있는 answerOne의 값 : " + answerOne);
		
		}
		
		System.out.println(questionOne.toString());
		
		log.debug(TeamColor.LJE + "QuestionController getQuestionOne에 있는 questionOne의 값 : " + questionOne);
		
		log.debug(TeamColor.LJE + "QuestionController getQuestionOne에 있는 questionNo의 값 : " + questionNo);
		
		//qna/questionOne에 넣어준다.
		return "/qna/questionOne";
	}
	
	

	//질문추가
	@GetMapping("/qna/addQuestionForm")
	public String addQuestion() {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "QuestionController addQuestionForm");
		
		//qna/questionList 페이지를 보여준다.
		return "/qna/addQuestionForm";
	}
	
	
	@PostMapping("/addQuestion")
	public String addQuestion(Question question) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "QuestionController addQuestion");
		
		//insert 성공 유무 확인
		int insertQuestion = questionService.addQuestion(question);
		
		//성공유무 확인하기
		log.debug(TeamColor.LJE + "QuestionController addQuestion 성공 1, 실패 0 : " + insertQuestion);
		
		//insert가 성공하면 qna/questionList 페이지를 보여준다.
		return "redirect:/qna/questionList";
	}
	
	//질문목록
	@GetMapping("/qna/questionList")
	public String questionList(Model model, HttpSession session) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "questionController questionList 실행");
		
		//map으로 뽑아와서 list에 넣어주기
		List<Map<String, Object>> questionList = questionService.getQuestionList();
		
		//questionList에 넣어주기
		model.addAttribute("questionList",questionList);
		
		log.debug(TeamColor.LJE + "questionController questionList 값 : " + questionList);
		
		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);
		
		log.debug(TeamColor.LJE + "QuestionController faqList myRegisterListProf : " + myRegisterListProf);		
		
		
		//question/questionList 페이지로
		return "/qna/questionList";
	}
}
