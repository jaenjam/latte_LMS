package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.SubjectNotice;
import com.gd.lms.vo.SubjectNoticeFile;

@Mapper
public interface SubjectNoticeMapper { // 과목공지사항
	
	// 강의하는 과목의 공지사항 리스트 보기 >>> 교수 학생 상관 X
	List<Map<String, Object>> selectSubjectNoticeList (int subjectApproveNo);
	
	// 조회수 증가
	int subjectNoticeHit(int subjectNoticeNo);

	// 공지사항 상세보기
	Map<String, Object> selectSubjectNoticeOne(int subjectNoticeNo);
	
	// 교수의 공지사항 작성하기	
	int insertSubjectNotice(int subjectApproveNo, String subjectNoticeTitle
			, String subjectNoticeContent);
	
	// 이미지 첨부를 위해 필요한 No 찾기
	int selectSubjectNoticeNo(String subjectNoticeTitle, String subjectNoticeContent, int subjectApproveNo);
	
	// 이미지 첨부하기
	int insertSubjectNoticefile(SubjectNoticeFile subjectnoticefile);
	
	// 공지사항 수정
	int updateSubjectNoticeOne(SubjectNotice subjectnotice);
	
	// 기존 파일 정보 가져오기
	String selectSubjectFileExis(int subjectNoticeNo);
	
	// 공지사항 첨부 파일 수정
	int updateSubjectNoticeFile(SubjectNoticeFile subjectnoticefile);
	
	// 공지사항 삭제
	int delteSubjectNoticeOne(int subjectNoticeNo);
	
	// 공지사항 첨부 파일 삭제
	int deleteSubjectNoticeFileOne(int subjectNoticeFileNo);

}
