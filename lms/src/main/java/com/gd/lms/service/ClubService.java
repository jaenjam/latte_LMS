package com.gd.lms.service;

import java.util.List;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ClubMapper;
import com.gd.lms.vo.Club;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ClubService {
	
	@Autowired private ClubMapper clubMapper; 
	
	// 동아리수정
		public int modifyClub(Club club) {
			
			log.debug(TeamColor.CSJ +"ClubService.modifyClub");
			
			return clubMapper.updateClub(club);
		}

	
	
	
	// 동아리상세보기
		public List<Map<String,Object>> getClubOne(int clubNo){
			log.debug(TeamColor.CSJ +"ClubService.getClubOne");
			
			return clubMapper.selectClubOne(clubNo);
		}
	
	
	
	// 동아리 목록
	public List<Map<String,Object>> getClubList(){
		log.debug(TeamColor.CSJ +"ClubService.getClubList");
	
		return clubMapper.selectClubList();
	}
	
	// 동아리 추가
	public int addClub(Club club) {
		log.debug(TeamColor.CSJ +"ClubService.addClub");
		
		return clubMapper.insertClub(club);
		
	}

}
