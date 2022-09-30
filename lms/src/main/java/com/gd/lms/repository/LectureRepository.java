package com.gd.lms.repository;


import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.SubjectApprove;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LectureRepository extends JpaRepository<Lecture, Long> {

    Page<Lecture> findAllByLectureContentContains(String content, Pageable pageable);
    Page<Lecture> findAllBySubjectApprove(SubjectApprove subjectApprove, Pageable pageable);
    Page<Lecture> findAllBySubjectApproveAndLectureTitleContains(SubjectApprove subjectApprove, String content, Pageable pageable);
}