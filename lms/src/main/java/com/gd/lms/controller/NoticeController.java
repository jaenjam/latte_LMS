package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.NoticeService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	
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
