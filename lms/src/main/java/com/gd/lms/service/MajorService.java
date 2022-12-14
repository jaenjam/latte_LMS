package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.MajorMapper;
import com.gd.lms.vo.Major;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MajorService {
	
	@Autowired private MajorMapper majorMapper; 
	
	// 전공목록
	public List<Map<String,Object>> getMajorList(){
		log.debug(TeamColor.JJY +"MajorService안에있는 getMajorList실행");
	
		return majorMapper.selectMajorList();
	}
	
	// 전공추가
	public int addMajor(Major major) {
		log.debug(TeamColor.JJY +"MajorService안에있는 addMajor실행");
		
		return majorMapper.insertMajor(major);
		
	}
	
	// 전공상세보기
	public List<Map<String,Object>> getMajorOne(int majorNo){
		log.debug(TeamColor.JJY+"MajorService안에있는 getMajorOne실행");
		
		return majorMapper.selectMajorOne(majorNo);
	}
	
	// 전공수정
	public int modifyMajor(Major major) {
		
		log.debug(TeamColor.JJY +"majorService modifyMajor실행");
		log.debug(TeamColor.JJY +"Major확인 : " + major);
		return majorMapper.updateMajor(major);
	}

}
