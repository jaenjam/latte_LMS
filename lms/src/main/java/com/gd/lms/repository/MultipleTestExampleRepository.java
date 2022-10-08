package com.gd.lms.repository;


import com.gd.lms.vo.MultipleTestExample;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MultipleTestExampleRepository extends JpaRepository<MultipleTestExample, Long> {


}