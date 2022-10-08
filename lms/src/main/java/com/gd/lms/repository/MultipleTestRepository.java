package com.gd.lms.repository;
import org.springframework.data.domain.Sort;
import com.gd.lms.vo.MultipleTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MultipleTestRepository extends JpaRepository<MultipleTest, Long> {

    List<MultipleTest> findAllByTestTestNo(int testNo, Sort sort);

   MultipleTest findByTestTestNoAndMultiplechoiceQuestion(int testNo, String question);

}