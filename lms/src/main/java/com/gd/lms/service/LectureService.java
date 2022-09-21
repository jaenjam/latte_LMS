package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.lms.mapper.LectureMapper;

@Service
@Transactional
public class LectureService {
	@Autowired
	private LectureMapper lectureMapper;
	
	public List<Map<String, Object>> getLectureListProf(int professorNo) {
		return lectureMapper.selectLectureListPro(professorNo);
	}
}
