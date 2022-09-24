package com.gd.lms.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Club;


@Mapper
public interface ClubMapper {

	// 동아리 목록가져오기
	List<Map<String, Object>> selectClubList();
	
	//동아리상세보기
	List<Map<String,Object>> selectClubOne(String clubNo);

	// 동아리 추가
	int insertClub(Club club);

	// 동아리 삭제
	int deleteClub(int clubNo);

	// 동아리 수정
	int updateClub(Club club);
}
