package com.gd.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.SubjectNoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SubjectNoticeController {

	
	@Autowired	
	SubjectNoticeService subjectnoticeservice;
	
	// 강의하는 과목의 공지사항 리스트 보기
	@GetMapping("/subject/notice/getSubjectNoticeList")
	public String getSubjectNoticeList(Model model
			, @RequestParam("subjectApproveNo") int subjectApproveNo
			, @RequestParam(required = false, defaultValue = "") String search
			,  @PageableDefault Pageable pageable ) {
	
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"SubjectNoticeController의 getSubjectNoticeList 진입");
		
		;
		
		// model.addAttribute("subjectNoticeList" , subjectnoticeservice.getSubjectNoticeList(subjectApproveNo));
		model.addAttribute("subjectNoticeList" , subjectnoticeservice.findSubjectNotice(pageable, subjectApproveNo, search));
		return "/subject/notice/getSubjectNoticeList";
	}
	
	
	// 강의하는 과목의 공지사항 상세보기
	
	/*
	// 강의하는 과목의 공지사항 작성하기 FORM
	@GetMapping("/subject/notice/addSubjectNoticeForm")
	public String addSubjectNoticeForm() {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"SubjectNoticeController의 addSubjectNoticeForm 진입");
		
		return "/subject/notice/getSubjectNoticeForm";
	}
	
	
	// 강의하는 과목의 공지사항 작성하기 ACTION
	@PostMapping("/subject/notice/addSubjectNoticeForm")
	public String addSubjectNoticeForm() {	
	
	}
	*/
	
}
