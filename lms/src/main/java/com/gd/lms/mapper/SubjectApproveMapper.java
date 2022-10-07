package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.SubjectApprove;

@Mapper
public interface SubjectApproveMapper {

	//승인과목목록
	List<Map<String, Object>> selectSubjectApproveList();
	
	//과목승인 active값 변경
	int updateApproveActive(SubjectApprove subjectApprove);

	//교수가 과목신청하면 승인테이블로 넘어감
	int insertSubjectApprove(int majorNo,String subjectNo,int professorNo,String startDate,String endDate);
}
