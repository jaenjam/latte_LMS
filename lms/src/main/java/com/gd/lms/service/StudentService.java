package com.gd.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.StudentMapper;
import com.gd.lms.vo.Student;
import com.gd.lms.vo.StudentImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudentService {
	@Autowired
	StudentMapper studentMapper;
	
	//학생 수
	public int studentCount() {
		log.debug(TeamColor.LJE + "StudentService studentCount");
		
		return studentMapper.selectStudentCount();
	}
	
	//학생사진여부유무
	public List<Map<String, Object>> getStudentImg(int studentNo){
		log.debug(TeamColor.LJE + "StudentService getStudentImg");
		
		return studentMapper.selectStudentImg(studentNo);
	}
	
	//재직/재학 상태 - 학생 리스트 출력(EmployeeStatusController로)
	public List<Map<String, Object>> getStudentStatusList(){
		log.debug(TeamColor.LJE + "StudentService getStudentStatusList");
		
		return studentMapper.studentStatusList();
	}
	
	
	// 학생로그인
	public Student getStudent(Student student) {
		// 해당 서비스 진입여부 확인
		log.debug(TeamColor.KHW + "학생로그인 서비스 진입");

		Student loginstudent = studentMapper.loginstudent(student);

		log.debug(TeamColor.KHW + "StudentService의 loginstudent");
		return loginstudent;
	}

	// 학생 회원가입
	public int addStudent(Student student) {
		// 해당 서비스 진입여부 확인
		System.out.println("학생회원가입 서비스 진입");

		log.debug(TeamColor.KHW + "StudentService의 addStudent");
		return studentMapper.insertStudent(student);
	}

	
	 // 학생회원가입 (학번중복체크)
	 public int studentNoCheck(int studentNo) throws Exception {
		 
		 return studentMapper.studentNoCheck(studentNo);
	 }
	
	
	// 학생정보 상세보기
	public List<Map<String, Object>> getStudentOne(int studentNo) {
		// 해당 서비스 진입여부 확인
		log.debug(TeamColor.KHW + "학생정보 상세보기 폼 서비스 진입");
		return studentMapper.selectStudentOne(studentNo);
	}

	// 학생정보 상세보기 (비밀번호 입력 후)
	public List<Map<String, Object>> getStudentOneAfterPass(Student student) {
		// 해당 서비스 진입여부 확인
		log.debug(TeamColor.KHW + "학생정보 상세보기 폼 진입(비밀번호 입력후) 서비스 진입");

		return studentMapper.selectStudentOneAfterPass(student);
	};

	// 학생 목록
	public List<Map<String, Object>> getStudentList() {

		log.debug(TeamColor.CSJ + "getStudentList.service");

		return studentMapper.selectStudentList();
	}

	// 학생사진 등록하기
	public int addStudentImg(StudentImg studentImg) {
		// 해당 서비스 진입여부 확인
		log.debug(TeamColor.KHW + "학생사진 등록하기 서비스 진입");

		return studentMapper.insertStudentImg(studentImg);
	}

	// 학생 정보수정하기
	public int modifyStudent(Student studnet) {
		// 해당 서비스 진입여부 확인
		log.debug(TeamColor.LJE + "StudentService modifyStudent 실행");
		
		log.debug(TeamColor.KHW + "학생정보수정 서비스 진입");

		return studentMapper.updateStudent(studnet);
	}
	
	
	//나의정보 : 기본
	public List<Map<String, Object>> getStudentInfo(int studentNo){
		log.debug(TeamColor.LJE + "StudentService getStudentInfo 실행");
		
		return studentMapper.selectStudentInfo(studentNo);
	}
	
	//학생사진수정하기
	public int modifyStudentImg(StudentImg studentImg) {
		log.debug(TeamColor.LJE + "StudentService modifyStudentImg 실행");
		
		return studentMapper.updateStudentImg(studentImg);
	}
	
	//학생 재학상태수정
	public int modifyStatusStudent(Student student) {
		log.debug(TeamColor.LJE + "StudentService modifyStausStudent 실행");
		
		return studentMapper.updateStatusStudent(student);
	}
	
}