package com.gd.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.SubjectApprove;

@RestController
@RequestMapping("/api/register")
public class RegisterApiController {

	
	@Autowired
	RegisterService registerservice;
	
	//			/api/register + /get/subjectName >>> 실제는 이 주소로 주고받음
	@GetMapping("/get/subjectName/{subjectCredit}") // 이건 ajax통신할떄 주는 url과 같아야함 
	public List<SubjectApprove> getSubjectName(@PathVariable int subjectCredit) {
		// └ SubjectApproveRepositoy 에서 정의한 그값
		
		return registerservice.getSubjectName(subjectCredit);
	}
}
