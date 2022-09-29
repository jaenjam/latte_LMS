package com.gd.lms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	
	@GetMapping("/test/testList")
	public String testList() {
		
		
		return "/test/testList";
	}

}
