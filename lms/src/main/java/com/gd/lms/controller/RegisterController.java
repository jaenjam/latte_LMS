package com.gd.lms.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SubjectApproveMapper;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.SubjectApprove;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class RegisterController {
	@Autowired RegisterService registerservice;
	@Autowired SubjectApproveMapper subjectApproveMapper;
	
	// 수강바구니에 들어가는 수강신청폼 (학생의)
	@GetMapping("/register/getRegisterForm")
	public String getRegisterForm(HttpServletRequest request
			, Model model) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"RegisterController의 RegisterForm 진입");
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();	
				
		// 학생이거나
		if( session.getAttribute("user") != "student") {
			log.debug(TeamColor.KHW +"학생이 아닙니다");
			
			return "home";
		}
		// 해당 기간이 아니면 아웃(이건 학사일정 만들고 나서 시도)
		
		// 수강승인된 과목 리스트 가져오기
		model.addAttribute("approveSubjectList", subjectApproveMapper.selectSubjectApproveList());
		log.debug(TeamColor.KHW +"approveSubjectList model값 : " + model);
		
		return "/register/getRegisterForm";
	}
	
	
	// 학점에 따른 과목선택
	
	
	
	
	
	
	
	/*
	
	// 학점에 따른 과목선택 (ajax이용)
	@RequestMapping(value="/", method = RequestMethod.POST)
	@ResponseBody
	public String selectsubjectName(int subjectCredit
			, @RequestBody String filterJSON
	        , HttpServletResponse response
	        , ModelMap model 
			) throws Exception{ 
		
		log.debug(TeamColor.KHW+ "selectsubjectName() 진입");
		
		// JSONObject 생성
		JSONObject obj = new JSONObject();
		
		List<SubjectApprove> subjectList = null;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			SubjectApprove subjectapprove = ()
			
			
		} catch(Exception e){
		    System.out.println(e.toString());
		    obj.put("res", "error");
		    
		    }
		
		return ;
	}
	
	*/
}
