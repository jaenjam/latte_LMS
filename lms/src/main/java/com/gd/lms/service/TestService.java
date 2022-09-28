package com.gd.lms.service;

import java.util.List;
import java.util.Map;

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
	
	//시험추가여부확인하기
		public Map<String,Object> getTestNo(){
			
			log.debug(TeamColor.JJY+"TestService getTestNo실행");
			
			return testMapper.selectTestNo();
		}
		
	//테스트리스트 빼주기
		public List<Map<String,Object>> getTestList(){
			
			log.debug(TeamColor.JJY+"TestService getTestList실행");
			
			return testMapper.selectTestList();
		}
}
