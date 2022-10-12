package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ProfessorMapper;
import com.gd.lms.vo.Professor;
import com.gd.lms.vo.ProfessorImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ProfessorService {
	@Autowired ProfessorMapper professorMapper;
	
	//교수 수
	public int professorCount() {
		log.debug(TeamColor.LJE + "ProfessorService professorCount 실행");
		
		return professorMapper.selectProfessorCount();
	}
	
	//재직/재학 상태 - 교수 계정상태리스트 출력(EmployeeStatusController로)
	public List<Map<String, Object>> getProfessorStatusList(){
		log.debug(TeamColor.LJE + "ProfessorService getProfessorStatusList");
		
		return professorMapper.professorStatusList();
	}
	
	//연봉관리 - 교수 연봉리스트 출력(EmployeeSalaryController로)
	public List<Map<String, Object>> getProfessorSalaryList(){
		log.debug(TeamColor.LJE + "ProfessorService getProfessorSalary");
		
		return professorMapper.professorSalaryList();
	}
	
	//교수로그인
	public Professor getProfessor(Professor professor) {
		log.debug(TeamColor.JJY+"getProfessor(로그인) service실행");
		Professor professorLogin = professorMapper.professerLogin(professor);
	
		return professorLogin;
	}
	
	//교수추가(회원가입)
	public int addProfessor(Professor professor) {
		log.debug(TeamColor.JJY+"addprofessor(회원가입) service실행");
		
		return professorMapper.insertProfessor(professor);
		}
	

	// 교수 회원가입 (사번중복체크)
		public int professorNoCheck(int professorNo) throws Exception {
			log.debug(TeamColor.CSJ + "professorNoCheck.service");
			return professorMapper.professorNoCheck(professorNo);
		}
	
	
		
	//교수상세보기
	public List<Map<String,Object>> getProfessorOne(int professorNo){
		log.debug(TeamColor.JJY+"getProfessorOne(상세보기) service실행");
		
		return professorMapper.selectProfessorOne(professorNo);	
	}
	
	//교수수정하기
	public int modifyProfessor(Professor professor) {
		
		log.debug(TeamColor.JJY+"Professor Service안에 modifyProfessor실행");
		
		return professorMapper.updateProfessor(professor);
	}
	
	//교수목록보기
	public List<Map<String,Object>> getProfessorList(){
		log.debug(TeamColor.JJY+"getProfessorList(목록보기) service실행");
		
		return professorMapper.selectProfessorList();
	}
	
	//교수사진등록하기
	public int addProfessorImg(ProfessorImg professorImg) {
		log.debug(TeamColor.JJY+"addProfessorImg(사진추가) service실행");
		System.out.println("addProfessorImg(사진추가) service 실행");
		
		return professorMapper.insertProfessorImg(professorImg);
		
	}
		
	//교수사진여부유무
	public List<Map<String,Object>> getProfessorImg(int professorNo){
		log.debug(TeamColor.JJY+"Service getProfessorImg실행");
		
		return professorMapper.selectProfessorImg(professorNo);	
	}
	
	//교수사진수정하기
	public int modifyProfessorImg(ProfessorImg professorImg) {
		log.debug(TeamColor.JJY+"Service modifyProfessorImg실행");
		System.out.print("service modifyProfessorImg실행");
		
		return professorMapper.updateProfessorImg(professorImg);
	}
	
	//교수 재직상태수정
	public int modifyStatusProfessor(Professor professor) {
		log.debug(TeamColor.LJE + "ProfessorService modifyStatusProfessor 실행");
		
		return professorMapper.updateStatusProfessor(professor);
	}
}
