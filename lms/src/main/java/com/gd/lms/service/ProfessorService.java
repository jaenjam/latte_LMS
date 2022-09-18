package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ProfessorMapper;
import com.gd.lms.vo.Professor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfessorService {
	@Autowired ProfessorMapper professorMapper;
	
	//교수로그인
	public Professor getProfessor(Professor professor) {
		Professor professorLogin = professorMapper.professerLogin(professor);
	
		return professorLogin;
	}
	
	//교수추가(회원가입)
		public int addProfessor(Professor professor) {
			log.debug(TeamColor.JJY+"addprofessor service실행");
			return professorMapper.insertProfessor(professor);
		}
}
