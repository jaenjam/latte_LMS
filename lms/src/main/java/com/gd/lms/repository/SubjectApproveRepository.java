package com.gd.lms.repository;


import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.SubjectApprove;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectApproveRepository extends JpaRepository<SubjectApprove, Long> {

    SubjectApprove findBySubjectApproveNo(int no);

}
