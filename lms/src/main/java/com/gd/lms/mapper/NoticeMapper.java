package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

	//공지목록가져오기
	List<Map<String,Object>> selectNoticeList();
}
