package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.mapper.SignupMapper;
import com.gd.lms.vo.Professor;

@Service
@Transactional
public class SignupService {
	
	@Autowired private SignupMapper signupMapper;
	
	// 교수회원가입
	public int addProfessor(Professor professor) {
		
		return signupMapper.insertProfessor(professor);
	}

}
