package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ProfessorMapper;
import com.gd.lms.vo.Professor;
import com.gd.lms.vo.ProfessorImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfessorService {
	@Autowired ProfessorMapper professorMapper;
	
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
		
	//교수상세보기
	public List<Map<String,Object>> getProfessorOne(int professorNo){
		log.debug(TeamColor.JJY+"getProfessorOne(상세보기) service실행");
		
		return professorMapper.selectProfessorOne(professorNo);	
	}
	
	//교수사진등록하기
		public int addProfessorImg(ProfessorImg professorImg) {
			log.debug(TeamColor.JJY+"addProfessorImg(사진추가) service실행");
			System.out.println("addProfessorImg(사진추가) service 실행");
			
			return professorMapper.insertProfessorImg(professorImg);
			
		}
}
