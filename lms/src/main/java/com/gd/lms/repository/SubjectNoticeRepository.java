package com.gd.lms.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.SubjectApprove;
import com.gd.lms.vo.SubjectNotice;

@Repository
public interface SubjectNoticeRepository extends JpaRepository<SubjectNotice, Long>{

		Page<SubjectNotice> findAllBySubjectNoticeContentContains(String content, Pageable pageable);
		Page<SubjectNotice> findAllBySubjectApprove(SubjectApprove subjectApprove, Pageable pageable);
		Page<SubjectNotice> findAllBySubjectApproveAndSubjectNoticeTitleContains(SubjectApprove subjectApprove, String content, Pageable pageable);

}
