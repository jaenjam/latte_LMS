package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.FaqService;
import com.gd.lms.vo.Faq;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FaqController {

	@Autowired FaqService faqService;
	
	//자주묻는질문 수정하기 form
	@GetMapping("/faq/updateFaq")
	public String updateFaq(Model model, int faqNo) {
		
		//디버깅
		log.debug(TeamColor.LJE + "FaqController updateFaq 상세보기");
		
		//faqNo에 해당하는 정보들을 Map에 넣어준다.
		Map<String, Object> faq = faqService.getFaqOne(faqNo);
		
		//Map<String, Object> faq를 model에 넣어준다.
		model.addAttribute("faq",faq);
		
		log.debug(TeamColor.LJE + "FaqController updateFaq에 있는 model의 값 : " + model);
		
		log.debug(TeamColor.LJE + "FaqController updateFaq에 있는 faqNo의 값 : " + faqNo);
		
		//faq/updateFaqForm에 넣어준다.
		return "/faq/updateFaq";
	}
	
	
	//자주묻는질문 수정하기 action
	@PostMapping("/updateFaq")
	public String updateFaq(Faq faq, Model model) {
		
		//디버깅
		log.debug(TeamColor.LJE + "FaqController updateFaq action");
		
		//faqService updateFaq 실행해서 값 updateFaq에 넣기
		int updateFaq = faqService.updateFaq(faq);
		
		log.debug(TeamColor.LJE + "FaqController updateFaq 실행결과 1이면 성공, 0이면 실패 : " + updateFaq);
		
		//model에 updateFaq값 넣기
		model.addAttribute("updateFaq", updateFaq);
		
		log.debug(TeamColor.LJE + "FaqController model 담긴 값 : " + model);
		
		//faq/faqList 페이지로
		return "redirect:/faq/faqList";
	}
	
	
	
	//자주묻는질문 삭제하기 action
	@GetMapping("/deleteFaq")
	public String removeFaq(int faqNo) {
		
		//deleteFaq페이지에 faqNo값을 넣어준다.
		faqService.deleteFaq(faqNo);
		
		//faq/faqList 페이지로
		return "redirect:/faq/faqList";
	}
	
	//자주묻는질문 추가 form
	@GetMapping("/faq/addFaqForm")
	public String addFaq() {
		
		//디버깅
		log.debug(TeamColor.LJE + "FaqController addFaqForm");
		
		//faq/addFaq으로
		return "/faq/addFaqForm";
	}
	
	
	//자주묻는질문 추가 action
	@PostMapping("/addFaq")
	public String addFaq(Faq faq, Model model) {
		
		//디버깅
		log.debug(TeamColor.LJE + "FaqController addFaq action");
		
		//faqService addFaq 실행해서 실행한 값 insetFaq에 넣기
		int insertFaq = faqService.addFaq(faq);
		
		log.debug(TeamColor.LJE + "faqService addFaq 실행결과 1이면 성공, 0이면 실패 : " + insertFaq);
		
		//add Faq
		model.addAttribute("addFaq", insertFaq);
		
		//model에 넣은 값 확인하기
		log.debug(TeamColor.LJE + "FaqController의 addFaq model : " + model);
				
		//faq/faqList 페이지로
		return "redirect:faq/faqList";
	}
	
	
	//자주묻는질문목록
	@GetMapping("/faq/faqList")
	public String faqList(Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "FaqController.faqList 실행");
		
		//map에 넣어주고 list에 넣어 출력하기 위함
		List<Map<String,Object>> faqList = faqService.getFaqList();
		
		//faqList에 넣어주기
		model.addAttribute("faqList",faqList);
		
		log.debug(TeamColor.LJE + "FaqController faqList에 저장된 값 : " + faqList);
		
		
		//faq/faqList 페이지로
		return "/faq/faqList";
	}
}
