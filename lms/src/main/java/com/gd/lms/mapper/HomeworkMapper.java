package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeworkMapper {

	// 학생의 과제 제출
	int submitHomework();
	
	// 과제제출시 제출여부를 N으로 바꿔주기

	// 학생이 제출한 과제 삭제
	
	
}
