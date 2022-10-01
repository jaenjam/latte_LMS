package com.gd.lms.repository;

import org.springframework.stereotype.Repository;

import com.gd.lms.vo.Subject;

@Repository
public interface SubjectRepository {

	Subject findBySubjectName(String subjectName);
}
