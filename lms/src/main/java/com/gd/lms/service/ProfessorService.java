package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.mapper.ProfessorMapper;
import com.gd.lms.vo.Professor;

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
			System.out.println("addprofessor service실행");
			return professorMapper.insertProfessor(professor);
		}
}
