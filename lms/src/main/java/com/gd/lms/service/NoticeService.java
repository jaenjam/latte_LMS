package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.NoticeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {

	@Autowired private NoticeMapper noticeMapper;
	
	//공지목록
	public List<Map<String,Object>> getNoticeList(){
		log.debug(TeamColor.LJE + "NoticeService안에 있는 getNoticeList실행");
		
		return noticeMapper.selectNoticeList();
	}
}
