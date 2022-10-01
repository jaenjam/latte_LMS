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
	
	// 수강신청시 학점에 따른 과목 이름 불러오기
	public Map<String,Object> getRegisterListByCredit(int subjectCredit) {
		log.debug(TeamColor.KHW+"학점선택에 따른 과목리스트 셀렉서비스 진입");
		
		return registerMapper.selectRegisterListByCredit(subjectCredit);
		
	}
	
	
	
	// 학생의 나의강의실리스트
	public List<Map<String,Object>> getMyRegisterList(int studentNo){
		log.debug(TeamColor.KHW+"학생의 나의강의실리스트 셀렉서비스 진입");
		
		return registerMapper.selectStudentMyRegisterList(studentNo);
	}
	
	// 교수의 강의리스트
	public List<Map<String,Object>> getMyRegisterListProf(int professorNo){
		log.debug(TeamColor.KHW+"교수의 나의강의실리스트 셀렉서비스 진입");
		
		return registerMapper.selectProfessorMyRegisterList(professorNo);
	}
	
	
	// 넘겨받은 approveNo 기준으로 강의정보 셀렉하기 & 학생 교수 상관없이 (특정 수강강의 메인용)
	public Map<String,Object> getRegisterInfo(int subjectApproveNo) {
		log.debug(TeamColor.KHW+ "사이드바에서 나의강의실리스트 클릭후 강의메인서비스 진입");
		
		return registerMapper.selectRegisteInfo(subjectApproveNo);
	}

	
}
