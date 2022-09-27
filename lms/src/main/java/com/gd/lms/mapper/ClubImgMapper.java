package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.ClubImg;

@Mapper
public interface ClubImgMapper {
	
	String insertClubImg(ClubImg clubimg);

}
