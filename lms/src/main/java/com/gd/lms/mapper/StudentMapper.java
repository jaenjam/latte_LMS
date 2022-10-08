package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Student;
import com.gd.lms.vo.StudentImg;

@Mapper
public interface StudentMapper {

	//학생 수
	int selectStudentCount();
	
	//학생사진유무
	List<Map<String, Object>> selectStudentImg(int studentNo);
	
	//재직/재학 상태 - 학생 상태 수정폼
	List<Map<String, Object>> studentStatusList();
	
	// 학생로그인
	Student loginstudent(Student student);

	// 학생추가 (회원가입)
	int insertStudent(Student student);

	// 학번중복검사
	int studentNoCheck(int studentNo) throws Exception;
	
	// 학생정보 상세보기
	List<Map<String, Object>> selectStudentOne(int studentNo);

	// 학생정보 상세보기(비밀번호 입력 후)
	List<Map<String, Object>> selectStudentOneAfterPass(Student student);

	// 학생 목록
	List<Map<String, Object>> selectStudentList();

	// 학생사진 등록하기
	int insertStudentImg(StudentImg studentImg);

	// 학생정보 수정하기
	int updateStudent(Student student);
	
	//나의정보 : 기본
	List<Map<String, Object>> selectStudentInfo(int studentNo);
}
