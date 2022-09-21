package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.MajorMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MajorService {
	
	@Autowired private MajorMapper majorMapper; 
	
	// 전공목록
	public List<Map<String,Object>> getMajorList(){
		log.debug(TeamColor.CSJ +"MajorService안에있는 getMajorList실행");
	
		return majorMapper.selectMajorList();
	}

}
