package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.NoticeService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.Notice;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class NoticeController {
	
	@Autowired NoticeService noticeService;
	@Autowired RegisterService registerService;
	
	//공지 삭제하기 action
	@GetMapping("/deleteNotice")
	public String removeNotice(int noticeNo) {
		
		//디버깅
		log.debug(TeamColor.LJE + "NoticeController removeNotice action");
		
		//deleteNotice페이지에 noticeNo값을 넣어준다.
		noticeService.deleteNotice(noticeNo);
		
		//notice/noticeList 페이지로
		return "redirect:/notice/noticeList";
	}
	
	//공지 상세보기 form
	@GetMapping("/notice/noticeOne")
	public String getNoticeOne(Model model, int noticeNo, HttpServletRequest request, HttpSession session) {
		
		//디버깅
		log.debug(TeamColor.LJE + "NoticeController getNoticeOne");
		
		// 세션 사용하기위해 선언
		
		session.getAttribute("No");
		String user = (String) session.getAttribute("user");
		
		// 사이드바를 위한 서비스실행
		if(user == "professor") { // 교수면 이거			
			List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((Integer)session.getAttribute("No"));
			// myRegisterListProf확인
			model.addAttribute("myRegisterListProf", myRegisterListProf);
			
			log.debug(TeamColor.LJE + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
		
		}
		else if (user == "student") { // 학생이면 이거
			List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList((Integer)session.getAttribute("No"));
	
			model.addAttribute("myRegisterListStu", myRegisterListStu);
			
			log.debug(TeamColor.LJE + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
			
		}
	
		//noticeNo가 noticeList에 있는 no값이랑 일치하면 상세정보를 Map에 넣어준다.
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeNo);
		
		//Map<String, Object> noticeOne을 model에 넣어준다.
		model.addAttribute("noticeOne",noticeOne);
		
		int noticeCount = noticeService.updateNoticeCount(noticeNo);
		
		log.debug(TeamColor.LJE + "NoticeControler noticeCount의 값 : " + noticeCount);
		
		log.debug(TeamColor.LJE + "NoticeControler getNoticeOne에 있는 model의 값 : " + model);
		
		log.debug(TeamColor.LJE + "NoticeControler getNoticeOne에 있는 noticeNo의 값 : " + noticeNo);
		
		
		//사이드 바(학생 수강 중인 강의 리스트 출력)
		//List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList((int)session.getAttribute("No"));
		
		
		//model myRegisterListStu에 저장
		//model.addAttribute("myRegisterListStu", myRegisterListStu);
		
		//log.debug(TeamColor.LJE + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
		
		
		
		//notice/noticeOne에 넣어준다.
		return "/notice/noticeOne";
	}
	
	
	//공지 수정하기 form
	@GetMapping("/notice/updateNotice")
	public String updateNotice(Model model
			, int noticeNo
			, HttpServletRequest request) {
		
		//디버깅
		log.debug(TeamColor.LJE + "NoticeController getNoticeOne");
		
		
	
		
		
		
		//noticeNo에 해당하는 상세정보를 Map에 넣어준다.
		Map<String, Object> notice = noticeService.getNoticeOne(noticeNo);
		
		//Map<String, Object> notice을 model에 넣어준다.
		model.addAttribute("notice",notice);
		
		log.debug(TeamColor.LJE + "NoticeControler updateNotice에 있는 model의 값 : " + model);
		
		log.debug(TeamColor.LJE + "NoticeControler updateNotice에 있는 noticeNo의 값 : " + noticeNo);
		
		//notice/updateNotice에 넣어준다.
		return "/notice/updateNotice";
		
	}
	
	//공지 수정하기 Action
	@PostMapping("/updateNotice")
	public String updateNotice(Notice notice, Model model) {
		
		//디버깅
		log.debug(TeamColor.LJE + "NoticeController.updateNotice Action");
		
		//noticeService addNotice 실행해서 값 insertNotice에 넣기
		int updateNotice = noticeService.updateNotice(notice);
		
		log.debug(TeamColor.LJE + "noticeService updateNotice 실행결과 1이면 성공, 0이면 실패 : " + updateNotice);
		
		//add Notice
		model.addAttribute("updateNotice", updateNotice);
		
		//model에 넣은 값 확인하기
		log.debug(TeamColor.LJE + "NoticeController의 addNotice model : " + model);
		
		//notice/noticeList 페이지로
		return "redirect:/notice/noticeList";
	}
	
	//공지 추가 form
	@GetMapping("/notice/addNoticeForm")
	public String addNotice() {
		
		//디버깅
		log.debug(TeamColor.LJE + "NoticeController addNoticeForm");
		
		//notice/addNoticeForm으로
		return "/notice/addNoticeForm";
	}
	
	
	//공지추가 action
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
		
		//notice/noticeList 페이지로
		return "redirect:/notice/noticeList";
	}
	
	
	//공지목록
	@GetMapping("/notice/noticeList")
	public String noticeList(@RequestParam(required = false, defaultValue = "")  String search,
			 @PageableDefault Pageable pageable, Model model, HttpServletRequest request, HttpSession session) {
		 
		//디버깅코드출력
		log.debug(TeamColor.LJE + "NoticeController.noticeList 실행");
		
		//map으로 뽑아와서 list에 넣어주기
		List<Map<String, Object>> noticeList;
		
		//noticeList에 넣어주기
		model.addAttribute("noticeList", noticeService.findNoticeList(pageable, search));
		
		log.debug(TeamColor.LJE + "NoticeController noticeList값 :" + model);
		
		
		model.addAttribute("previous", pageable.previousOrFirst().getPageNumber());
		model.addAttribute("next", pageable.next().getPageNumber());
		
		
		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);
		
		log.debug(TeamColor.LJE + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
		
		
		
		//사이드 바(학생 수강 중인 강의 리스트 출력)
		List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList((int)session.getAttribute("No"));
		
		//model myRegisterListStu에 저장
		model.addAttribute("myRegisterListStu", myRegisterListStu);
		
		log.debug(TeamColor.LJE + "NoticeController noticeList myRegisterListStu : " + myRegisterListStu);
		
		
		//notice/noticeList 페이지로
		return "/notice/noticeList";
	}
}
