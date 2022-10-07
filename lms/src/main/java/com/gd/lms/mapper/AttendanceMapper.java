package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceMapper {
	
	int autoInsertAttendance(int studentNo, int subjectApproveNo, String attendanceDate);
	
}
