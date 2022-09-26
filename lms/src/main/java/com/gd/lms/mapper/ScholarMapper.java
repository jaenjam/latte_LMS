package com.gd.lms.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Scholar;

@Mapper
public interface ScholarMapper {

	// 장학목록가져오기
	List<Map<String, Object>> selectScholarList();

	// 장학내용 추가
	int insertScholar(Scholar scholar);

	// 장학상세보기
	List<Map<String, Object>> selectScholarOne(int scholarNo);

	// 장학 수정

	int updateScholar(Scholar scholar);

	// 장학 삭제

	int deleteScholar(Scholar scholar);

}
