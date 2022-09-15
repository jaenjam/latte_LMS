package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MajorMapper {
	
	//전공목록가져오기(회원가입에서 select로 넣어주기위해서)
	List<Map<String,Object>> selectMajorList();

}
