package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.SubjectApprove;

@Mapper
public interface SubjectApproveMapper {

	// 과목승인 정보변경
	int updateSubjectApprove(int year, String semester, String approveActive, String subjectRoom, String day,  int startTime, int endTime,int subjectApproveNo);

	// 승인과목목록
	List<Map<String, Object>> selectSubjectApproveList();


	// 교수가 과목신청하면 승인테이블로 넘어감
	int insertSubjectApprove(int majorNo, String subjectNo, int professorNo, String startDate, String endDate);
}
