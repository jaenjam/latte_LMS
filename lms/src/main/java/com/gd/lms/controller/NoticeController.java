package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.NoticeService;
import com.gd.lms.vo.Notice;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	
	
	//공지 추가 form
	@GetMapping("/notice/addNoticeForm")
	public String addNotice() {
		
		//디버깅
		log.debug(TeamColor.LJE + "NoticeController addNoticeForm");
		
		return "/notice/addNoticeForm";
	}
	
	
	@PostMapping("/addNotice")
	public String addNotice(Notice notice, Model model) {
		
		//디버깅코드출력
		log.debug(TeamColor.LJE + "NoticeController.addNotice 실행");
		
		//noticeService addNotice 실행해서 값 insertNotice에 넣기
		int insertNotice = noticeService.addNotice(notice);
		
		log.debug(TeamColor.LJE + "noticeService addNotice 실행결과 1이면 성공, 0이면 실패 : " + insertNotice);
		
		//add Notice
		model.addAttribute("addNotice", insertNotice);
		
		//model에 넣은 값 확인하기
		log.debug(TeamColor.LJE + "NoticeController의 addNotice model : " + model);
		
		
		return "redirect:/notice/noticeList";
	}
	
	
	//공지목록
	@GetMapping("/notice/noticeList")
	public String noticeList(Model model) {
		 
		//디버깅코드출력
		log.debug(TeamColor.LJE + "NoticeController.noticeList 실행");
		
		//map으로 뽑아와서 list에 넣어주기
		List<Map<String, Object>> noticeList = noticeService.getNoticeList();
		
		//noticeList에 넣어주기
		model.addAttribute("noticeList", noticeList);
		
		log.debug(TeamColor.LJE + "NoticeController noticeList값 :" + noticeList);
		
		
		return "/notice/noticeList";
	}
}
