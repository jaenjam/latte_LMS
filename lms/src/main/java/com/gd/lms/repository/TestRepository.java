package com.gd.lms.repository;

import com.gd.lms.vo.Test;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TestRepository extends JpaRepository<Test, Long> {

   Test findByTestNameAndSubjectApproveSubjectApproveNo(String testName, int subjectApproveNo);
}
