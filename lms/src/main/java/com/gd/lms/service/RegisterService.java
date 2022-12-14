package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.RegisterMapper;
import com.gd.lms.repository.SubjectApproveRepository;
import com.gd.lms.vo.Register;
import com.gd.lms.vo.RegisterCart;
import com.gd.lms.vo.SubjectApprove;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RegisterService {
	@Autowired RegisterMapper registerMapper;
	
	@Autowired
	SubjectApproveRepository subjectapproverepository;
	
	
	// 수강신청시 학생학번에 따른 담긴 수강목록 불러오기
	public List<Map<String, Object>> getMyRegisterCart(int studentNo) {
		log.debug(TeamColor.KHW+"수강신청시 학번에 따른 수강바구니가 있다면 보여주는 서비스 진입");
	
		return registerMapper.selectMyRegisterCart(studentNo);
	}
	
	
	// 수강신청시 학점에 따른 과목 이름 불러오기
	public List<Map<String,Object>> getRegisterListByCredit(int subjectCredit) {
		log.debug(TeamColor.KHW+"학점선택에 따른 과목리스트 셀렉서비스 진입");
		
		return registerMapper.selectRegisterListByCredit(subjectCredit);
		
	}
	
	// 레파지토리 사용
	public List<SubjectApprove> getSubjectName(int subjectCredit) {
		log.debug(TeamColor.KHW+"학점선택에 따른 과목리스트 셀렉서비스 진입 >> 레파지토리 사용");
	
		return subjectapproverepository.findAllBySubjectSubjectCredit(subjectCredit);
	}
	
	
	
	// 수강신청전 중복검사
	public int checkRegisterCart(RegisterCart registercart) {
		log.debug(TeamColor.KHW+ "수강신청바구니에 담기 서비스 진입전 중복검사 ajax api컨트롤러이용");
		
		return  registerMapper.selectCheckRegisterCart(registercart);
	}
	
	
	// 수강신청 바구니에 담기
	public int insertRegisterCart(RegisterCart registercart) {
		log.debug(TeamColor.KHW+ "수강신청바구니에 담기 서비스 진입 ajax api컨트롤러이용");
		
		return registerMapper.insertRegisterCart(registercart);
	}
	
	
	// 수강신청 바구니에 담긴 과목 삭제하기
	public int removeRegisterCart(RegisterCart registercart) {
		log.debug(TeamColor.KHW+ "수강신청바구니에서 삭제하기 서비스 진입 ajax api컨트롤러이용");
		
		return registerMapper.deleteRegisterCart(registercart);
	}
	
	
	// 수강신청하기
	public int insertRegister(RegisterCart registercart) {
		log.debug(TeamColor.KHW+ "수강신청하기 서비스 진입 ajax api컨트롤러이용");
		registerMapper.insertRegister(registercart);
		return registercart.getRegisterNo();
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

	//
	public List<Map<String, Object>> getRegisterStudentList(int subjectApproveNo){
		log.debug(TeamColor.LJE + "RegisterService getRegisterStudentList");
		
		return registerMapper.selectRegisterStudentList(subjectApproveNo);
	}
	
}
