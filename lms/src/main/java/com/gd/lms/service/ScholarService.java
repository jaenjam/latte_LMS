package com.gd.lms.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ScholarMapper;
import com.gd.lms.vo.Scholar;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ScholarService {

	@Autowired
	private ScholarMapper scholarMapper;

	// 장학상세보기
	public List<Map<String, Object>> getScholarOne(int scholarNo) {
		log.debug(TeamColor.CSJ + "ScholarService.getScholarOne");

		return scholarMapper.selectScholarOne(scholarNo);
	}

	// 전공수정
	public int modifyScholar(Scholar scholar) {
		log.debug(TeamColor.CSJ + "scholarService.modifyScholar");
		log.debug(TeamColor.CSJ + "ScholarService scholar 확인 : " + scholar);
		return scholarMapper.updateScholar(scholar);
	}

	// 장학 목록
	public List<Map<String, Object>> getScholarList() {
		log.debug(TeamColor.CSJ + "ScholarService.getScholarList");

		return scholarMapper.selectScholarList();
	}

	// 장학 추가
	public int addScholar(Scholar scholar) {
		log.debug(TeamColor.CSJ + "ScholarService.addScholar");

		return scholarMapper.insertScholar(scholar);

	}

}
