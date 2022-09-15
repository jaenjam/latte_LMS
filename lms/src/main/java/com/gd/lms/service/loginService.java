package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.mapper.loginMapper;
import com.gd.lms.vo.Professor;

@Service
public class loginService {
	
	@Autowired loginMapper loginmapper;
	
	public Professor getProfessor(Professor professor) {
		Professor loginprofessor = loginmapper.loginProfesser(professor);

		return loginprofessor;
	}

}
