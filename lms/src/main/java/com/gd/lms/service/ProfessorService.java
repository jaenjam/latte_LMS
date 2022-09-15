package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.mapper.ProfessorMapper;
import com.gd.lms.vo.Professor;

@Service
public class ProfessorService {
	@Autowired ProfessorMapper professorMapper;
	
	public Professor getProfessor(Professor professor) {
		Professor professorLogin = professorMapper.professerLogin(professor);
	
		return professorLogin;
	}
}
