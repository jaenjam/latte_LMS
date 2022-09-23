package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.FaqMapper;
import com.gd.lms.vo.Faq;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FaqService {
	@Autowired private FaqMapper faqMapper;
	
	//자주묻는질문 수정
	public int updateFaq(Faq faq) {
		log.debug(TeamColor.LJE + "FaqService안에 있는 updateFaq 실행");
		
		return faqMapper.updateFaq(faq);
	}
	
	//자주묻는질문 상세보기
	public Map<String, Object> getFaqOne(int faqNo){
		log.debug(TeamColor.LJE + "FaqService안에 있는 getFaqOne 실행");
		
		return faqMapper.selectFaqOne(faqNo);
	}
	
	
	//자주묻는질문 삭제
	public int deleteFaq(int faqNo) {
		log.debug(TeamColor.LJE + "FaqService안에 있는 deleteFaq 실행");
		
		return faqMapper.deleteFaq(faqNo);
	}
	
	//자주묻는질문 추가
	public int addFaq(Faq faq) {
		log.debug(TeamColor.LJE + "FaqService안에 있는 addFaq 실행");
		
		return faqMapper.insertFaq(faq);
	}
	
	//자주묻는질문 목록
	public List<Map<String,Object>> getFaqList(){
		log.debug(TeamColor.LJE + "FaqService안에 있는 getFaqList실행");
		
		return faqMapper.selectFaqList();
	}
}
