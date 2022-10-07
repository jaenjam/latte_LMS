package com.gd.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.AttendanceMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttendanceService {
	@Autowired AttendanceMapper attendanceMapper;
	
	//출석부 자동생성
	public int autoInsertAttendance(int studentNo, int subjectApproveNo, String attendanceDate) {
		log.debug(TeamColor.LJE + "AttendanceService autoInsertAttendance");
		
		return attendanceMapper.autoInsertAttendance(studentNo, subjectApproveNo, attendanceDate);
	}
}
