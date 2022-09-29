package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.NoticeMapper;
import com.gd.lms.vo.Notice;
import com.gd.lms.repository.NoticeRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeService {

	@Autowired private NoticeMapper noticeMapper;
	@Autowired private NoticeRepository noticeRepository;
	
	//공지페이징
	public Page<Notice> findNoticeList(Pageable pageable, String contains){
		pageable = PageRequest.of(
				pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
				pageable.getPageSize());

		return noticeRepository.findAllByNoticeContentContains(contains, pageable);
	}
	
	//공지삭제
	public int deleteNotice(int noticeNo) {
		log.debug(TeamColor.LJE + "NoticeService deleteNotice");
		
		return noticeMapper.deleteNotice(noticeNo);
	}
	
	//공지수정
	public int updateNotice(Notice notice) {
		log.debug(TeamColor.LJE + "NoticeService updateNotice");
		
		return noticeMapper.updateNotice(notice);
	}
	
	//공지상세보기
	public Map<String, Object> getNoticeOne(int noticeNo){
		log.debug(TeamColor.LJE + "NoticeService getNoticeOne");
		
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	//공지추가
	public int addNotice(Notice notice) {
		log.debug(TeamColor.LJE + "NoticeService addNotice");
		
		return noticeMapper.insertNotice(notice);
	}	
	
	//공지목록
	public List<Map<String,Object>> getNoticeList(){
		log.debug(TeamColor.LJE + "NoticeService안에 있는 getNoticeList실행");
		
		return noticeMapper.selectNoticeList();
	}
}
