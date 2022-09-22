package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Notice;

@Mapper
public interface NoticeMapper {

	//공지수정
	int updateNotice(Notice notice);
	
	//공지상세보기
	Map<String, Object> selectNoticeOne(int noticeNo);
	
	//공지추가
	int insertNotice(Notice notice);
	
	//공지목록가져오기
	List<Map<String,Object>> selectNoticeList();
}
