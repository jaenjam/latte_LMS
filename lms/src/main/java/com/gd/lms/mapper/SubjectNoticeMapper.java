package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectNoticeMapper {
	
	// 강의하는 과목의 공지사항 리스트 보기 >>> 교수 학생 상관 X
	List<Map<String, Object>> selectSubjectNoticeList (int subjectApproveNo);
	
	// 교수의 공지사항 작성하기	
	int insertSubjectNotice(SubjectNoticeMapper subjectnotice);
	
	// 이미지 첨부를 위해 필요한 No 찾기
	
	// 이미지 첨부하기
	
	// 조회수 증가
	
	// 공지사항 상세보기
	int selectSubjectNoticeOne(int subjectNoticeNo);
}
