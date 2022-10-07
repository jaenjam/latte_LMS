package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SubjectApproveMapper;
import com.gd.lms.repository.SubjectApproveRepository;
import com.gd.lms.vo.SubjectApprove;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SubjectApproveService {

	@Autowired private SubjectApproveMapper subjectApproveMapper;
	@Autowired SubjectApproveRepository repository;
	@Autowired 
	
	//승인과목 리스트(EmployeeDetailController로)
	public List<Map<String, Object>> selectSubjectApproveList(){
		log.debug(TeamColor.LJE + "SubjectApproveService selectSubjectApproveList");
		
		return subjectApproveMapper.selectSubjectApproveList();
}
	
	// SubjectApprove값 승인
	public int modifyApproveActive(SubjectApprove subjectApprove) {
		log.debug(TeamColor.JJY + "modifyApproveActive service 실행");
		
		return subjectApproveMapper.updateApproveActive(subjectApprove);
	}
	
	// 교수가 신청한 과목이 승인테이블로 넘어옴
	public int addSubjectApprove(int majorNo,String subjectNo,int professorNo,String startDate,String endDate) {
		
		log.debug(TeamColor.JJY+"suvjectApproveService -> addSubjectApprove 실행");
		
		return subjectApproveMapper.insertSubjectApprove(majorNo, subjectNo, professorNo, startDate, endDate);
	}
	

}
