package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Professor;
import com.gd.lms.vo.ProfessorImg;

@Mapper
public interface ProfessorMapper {

	// 교수로그인
	Professor professerLogin(Professor professor);

	// 교수추가 (회원가입)
	int insertProfessor(Professor professor);

	// 교수사번중복검사
	int professorNoCheck(int professorNo) throws Exception;

	// 교수목록 (관리지가 관리하기위해보여주기)
	List<Map<String, Object>> selectProfessorList();

	// 교수상세보기
	List<Map<String, Object>> selectProfessorOne(int professorNo);

	// 교수정보수정하기
	int updateProfessor(Professor professor);

	// 교수사진유무
	List<Map<String, Object>> selectProfessorImg(int professorNo);

	// 교수사진등록하기(수정폼에서)
	int insertProfessorImg(ProfessorImg professorImg);
	
	// 사진수정하기
	int updateProfessorImg(ProfessorImg professorImg);

}
