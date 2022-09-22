package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.RegisterMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RegisterService {
	@Autowired RegisterMapper registerMapper;
	
	// 학생의 나의강의실리스트
	public List<Map<String,Object>> getMyRegisterList(int studentNo){
		log.debug(TeamColor.KHW+"학생의 나의강의실리스트 셀렉서비스 진입");
		
		return registerMapper.selectStudentMyRegisterList(studentNo);
	}
	
}
