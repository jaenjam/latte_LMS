package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.Major;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MajorController {
	
	@Autowired MajorService majorService;
	@Autowired RegisterService registerService;
	
	//전공목록
	@GetMapping("/major/majorList")
	public String majorList(Model model, HttpServletRequest request, HttpSession session) {
		
		log.debug(TeamColor.JJY +"MajorController.majorList실행");
		
		List<Map<String,Object>> majorList = majorService.getMajorList();
		
		model.addAttribute("majorList",majorList);
		log.debug(TeamColor.JJY +("majorController majorList값 : " + majorList));
		
		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);
		
		log.debug(TeamColor.LJE + "MajorController majorList myRegisterListProf : " + myRegisterListProf);
		
		
		
		//사이드 바(학생 수강 중인 강의 리스트 출력)
		List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList((int)session.getAttribute("No"));
		
		//model myRegisterListStu에 저장
		model.addAttribute("myRegisterListStu", myRegisterListStu);
		
		log.debug(TeamColor.LJE + "MajorController majorList myRegisterListStu : " + myRegisterListStu);
		
		
		
		return "/major/majorList"; // major폴더안에 majorList보여주기
	}
	
	// 전공추가Form
	@GetMapping("/major/addMajor")
	public String addMajor() {
		log.debug(TeamColor.JJY + ("majorController addMajor Get실행"));
		
		return "/major/addMajor"; // major폴더안에 addMajor보여주기
	}
	
	// 전공추가 Action
	@PostMapping("/addMajor")
	public String addMajor(Major major) {
		log.debug(TeamColor.JJY + ("majorController addMajor Post실행"));
		majorService.addMajor(major);
		
		return "redirect:/major/majorList"; // addMajor실행해서 추가시켜주기
	}
	
	// 전공상세보기
	@GetMapping("/major/majorOne")
	public String getMajorOne(Model model,int majorNo) {
		
		log.debug(TeamColor.JJY +"getMajorOne실행");
		
		List<Map<String,Object>> majorOne = majorService.getMajorOne(majorNo);
		
		//majorOne의 값을 model에 넣어주기
		model.addAttribute("majorOne",majorOne); 
		
		log.debug(TeamColor.JJY + "majorOne의값 : " + majorOne);
		
		return "/major/majorOne";
	}
	
	// 전공수정 Form
		@GetMapping("/major/modifyMajor")
		public String modifyMajor(Model model,int majorNo) {
			
			log.debug(TeamColor.JJY +"modifyMajor Get실행");
			
			List<Map<String,Object>> major = majorService.getMajorOne(majorNo);
			
			// Service.MajorOne에서 사용된 값을 model에 넣어줌
			model.addAttribute("major",major);
			log.debug(TeamColor.JJY+"model>major값 확인 : " + major);
			
			return "/major/modifyMajor";			
		}
			
		// 전공수정 Action
		@PostMapping("/modifyMajor")
		public String modifyMajor(Major major,Model model) {
			
			//디버깅
			log.debug(TeamColor.JJY + "modifyMajor실행");
			
			//service실행
			int updateMajor = majorService.modifyMajor(major);
			
			log.debug(TeamColor.JJY + "updateMajor : " + updateMajor);
			
			// update값 넣어주기
			model.addAttribute("updateMajor",updateMajor);
			
			return "redirect:/major/majorList";
			
			}
}
