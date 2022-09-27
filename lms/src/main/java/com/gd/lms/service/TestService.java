package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.TestMapper;
import com.gd.lms.vo.Test;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@Transactional
public class TestService {
	
	@Autowired TestMapper testMapper;
	
	//시험추가하기
	public int addTest(Test test) {
		
		log.debug(TeamColor.JJY+"TestService addTestForm실행");
		
		return testMapper.insertTest(test);
	
	}
}
