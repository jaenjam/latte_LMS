package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SubjectMapper;
import com.gd.lms.vo.Subject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SubjectService {

	@Autowired
	private SubjectMapper subjectMapper;

	// 과목 추가
	public int addSubject(Subject subject) {
		log.debug(TeamColor.CSJ + "subjectService addSubject");

		return subjectMapper.insertSubject(subject);

	}

	// 과목목록
	public List<Map<String, Object>> getSubjectList() {
		log.debug(TeamColor.LJE + "SubjectService getSubjectList");

		return subjectMapper.selectSubjectList();
	}

}
