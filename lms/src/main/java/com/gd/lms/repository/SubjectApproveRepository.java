package com.gd.lms.repository;


import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.SubjectApprove;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectApproveRepository extends JpaRepository<SubjectApprove, Long> {

    SubjectApprove findBySubjectApproveNo(int no);
    				// pk일 경우: findBy
    				// 전부 다 찾겠다: findAllBy
   
    List<SubjectApprove> findAllBySubjectSubjectCredit(int subjectCredit);
    
}
