package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SubjectNoticeMapper;
import com.gd.lms.repository.SubjectApproveRepository;
import com.gd.lms.repository.SubjectNoticeRepository;
import com.gd.lms.vo.SubjectApprove;
import com.gd.lms.vo.SubjectNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SubjectNoticeService {

	@Autowired
	SubjectNoticeMapper subjectnoticemapper;
	
	@Autowired
	private SubjectApproveRepository subjectApproveRepository;
	
	@Autowired
	private SubjectNoticeRepository repository;
	
	// 페이지보기
	public Page<SubjectNotice> findSubjectNotice(Pageable pageable, int subjectApproveNo, String search) {
		log.debug("페이징서비스");
		pageable = PageRequest.of(
				pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
				pageable.getPageSize(),
				Sort.by("subjectNoticeNo").descending());
		
		SubjectApprove subject = subjectApproveRepository.findBySubjectApproveNo(subjectApproveNo);
		log.debug(TeamColor.KHW+ "subject : "+subject);
		
		log.debug(search);
		return repository.findAllBySubjectApproveAndSubjectNoticeTitleContains(subject,search, pageable); 
	}
	
	// 강의하는 과목의 공지사항 리스트 보기 >>> 교수 학생 상관 X
	public List<Map<String, Object>> getSubjectNoticeList(int subjectApproveNo){
		log.debug(TeamColor.KHW + "공지사항리스트보기 서비스 진입");
		
		return subjectnoticemapper.selectSubjectNoticeList(subjectApproveNo);
	}
	
	
	// 공지사항 상세보기
	
	/*
	// 교수의 공지사항 작성하기 ACTION FORM
	public String addSubjectNoticeOne() {
		log.debug(TeamColor.KHW + "공지사항작성하기 서비스 진입");
		
		return 
	}
	*/
	
	// 교수의 공지사항 작성하기
	
	
	// 이미지 첨부를 위해 필요한 No 찾기

	// 이미지 첨부하기

	// 조회수 증가
	
	
	
}
