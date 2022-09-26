package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SubjectApproveMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SubjectApproveService {

	@Autowired private SubjectApproveMapper subjectApproveMapper;
	
	//승인과목 리스트(EmployeeDetailController로)
	public List<Map<String, Object>> selectSubjectApproveList(){
		log.debug(TeamColor.LJE + "SubjectApproveService selectSubjectApproveList");
		
		return subjectApproveMapper.selectSubjectApproveList();
}
}
