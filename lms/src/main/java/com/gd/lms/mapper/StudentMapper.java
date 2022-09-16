package com.gd.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Student;

@Mapper
public interface StudentMapper {
	Student loginstudent(Student student);
}
