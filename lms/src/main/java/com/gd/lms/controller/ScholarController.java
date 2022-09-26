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
import com.gd.lms.service.ScholarService;
import com.gd.lms.vo.Scholar;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScholarController {

	@Autowired
	ScholarService scholarService;

	// 장학수정 Action
	@PostMapping("/modifyScholar")
	public String modifyScholar(Scholar scholar, Model model) {

		// 디버깅
		log.debug(TeamColor.CSJ + "scholarController.modifyScholar post");

		// service실행
		int updateScholar = scholarService.modifyScholar(scholar);

		log.debug(TeamColor.CSJ + "updateScholar : " + updateScholar);

		// update값 넣어주기
		model.addAttribute("updateScholar", updateScholar);

		return "redirect:/scholar/scholarList";

	}

	// 장학수정 Form
	@GetMapping("/scholar/modifyScholar")
	public String modifyScholar(Model model, int scholarNo) {

		log.debug(TeamColor.CSJ + "scholarController.modifyScholar get");

		List<Map<String, Object>> scholar = scholarService.getScholarOne(scholarNo);

		// Service.ScholarOne에서 사용된 값을 model에 넣어줌
		model.addAttribute("scholar", scholar);
		log.debug(TeamColor.CSJ + "scholarController.modifyScholar model" + scholar);

		return "/scholar/modifyScholar";
	}

	// 장학목록
	@GetMapping("/scholar/scholarList")
	public String scholarList(Model model) {

		log.debug(TeamColor.CSJ + "ScholarController.scholarList");

		List<Map<String, Object>> scholarList = scholarService.getScholarList();

		model.addAttribute("scholarList", scholarList);
		log.debug(TeamColor.CSJ + ("scholarController.scholarList : " + scholarList));

		return "/scholar/scholarList";
	}

	// 장학 상세보기
	@GetMapping("/scholar/scholarOne")
	public String getScholarOne(Model model, int scholarNo, HttpServletRequest request) {

		HttpSession session = request.getSession();

		log.debug(TeamColor.CSJ + "scholarController.getScholarOne");

		List<Map<String, Object>> scholarOne = scholarService.getScholarOne(scholarNo);

		model.addAttribute("scholarOne", scholarOne);

		log.debug(TeamColor.CSJ + "scholarController.getScholarOne scholarOne 확인" + scholarOne);

		return "/scholar/scholarOne";
	}

	// 장학 추가 form
	@GetMapping("/scholar/addScholar")
	public String addScholar() {
		log.debug(TeamColor.CSJ + ("scholarController.addScholar form"));

		return "/scholar/addScholar";
	}

	// 장학 추가 action
	@PostMapping("/addScholar")
	public String addScholar(Scholar scholar) {
		log.debug(TeamColor.CSJ + ("scholarController addScholar action"));
		scholarService.addScholar(scholar);

		return "redirect:/scholar/scholarList";
	}

}
