package com.gd.lms.service;

import java.io.File;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.LectureMapper;
import com.gd.lms.mapper.StudentLectureHomeworkMapper;
import com.gd.lms.vo.LectureFile;
import com.gd.lms.vo.StudentHomework;
import com.gd.lms.vo.StudentHomeworkFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class StudentLectureHomeworkService {
	
	@Autowired 
	StudentLectureHomeworkMapper studentlecturehomeworkmapper;
	@Autowired
	private LectureMapper lectureMapper;
	
	// 학생이 본인이 수강하는 과목의 과제 리스트 보기
	public List<Map<String, Object>> getLecureHomeworkList(int subjectApproveNo) {
		
		log.debug(TeamColor.KHW + "과제리스트보기 서비스 진입");
		
		return studentlecturehomeworkmapper.selectMyLecureHomeworkList(subjectApproveNo);
	}
	

	// 학생이 수강하는 과목의 과제 제출
	public int submitHomework(
			StudentHomework studenthomework
			, MultipartFile[] studentHomeworkFile
			, HttpServletRequest request
			, int lectureNo
			) {
		
		log.debug(TeamColor.KHW + "학생이 수강하는 과목의 과제 제출 서비스 진입");
		log.debug(TeamColor.KHW + "lectureNo : " + lectureNo);
		
		//studenthomework.getNo();
		log.debug(TeamColor.KHW +"studenthomework :" + studenthomework);
		
		int result = studentlecturehomeworkmapper.insertLectureHomework(studenthomework);
		
		
		log.debug(TeamColor.KHW +"result :" + result);
		log.debug(TeamColor.KHW +"studentHomeworkFile :" + studentHomeworkFile);	
		log.debug(TeamColor.KHW +"lectureNo :" + lectureNo);
		
		//return studentlecturehomeworkmapper.insertLectureHomework(studenthomework);
	
	
		
		if(result != 0 && studentHomeworkFile!= null ) {
			int pfHomeworkNo = studentlecturehomeworkmapper.selectLectureHomeworkPf(studenthomework);
			int studentNo = studenthomework.getStudentNo();
			log.debug(TeamColor.KHW + "pfHomeworkNo :" + pfHomeworkNo);
			log.debug(TeamColor.KHW + "studentNo :" + studentNo);
			log.debug(TeamColor.KHW +"studentHomeworkFile이 not null입니다");
			
			String dir = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/lectureStudentHomework/uploadFileStu");
			log.debug(TeamColor.KHW +"dir 경로 확인 : " + dir);
			
			String homeworkFileName= ""; // 학생이 업로드한 파일에서 저장된 이름
			String homeworkOriginName = ""; // 기존 파일 이름
			String homeworkFiletype = ""; // 파일 형식
			
			List<StudentHomeworkFile> list = new ArrayList<>();
			
			for(MultipartFile file : studentHomeworkFile) {
				
				if(!file.isEmpty()) {
					homeworkOriginName = file.getOriginalFilename();
					homeworkFiletype = file.getContentType();
					
					// 업로드한 파일을 vo내 존재하느 파일객체에 넣어주기
					StudentHomeworkFile studenthomeworkFile = new StudentHomeworkFile();
					
					studenthomeworkFile.setHomeworkOriginName(homeworkOriginName);
					studenthomeworkFile.setHomeworkFileName(UUID.randomUUID() + "_" + homeworkOriginName);
					studenthomeworkFile.setHomeworkFileType(homeworkFiletype);
					studenthomeworkFile.setPfHomeworkNo(pfHomeworkNo);
					studenthomeworkFile.setStudentNo(studentNo);
					
					
					log.debug(TeamColor.KHW + "studenthomeworkFile에 저장된 것들 : " + studenthomeworkFile);
					
					list.add(studenthomeworkFile);
					
					String saveFileName = dir + File.separator + studenthomeworkFile.getHomeworkFileName(); 
			
					Path savedir = Paths.get(saveFileName);
				
					try {
						// 전송
						file.transferTo(savedir);
						
						result =+ studentlecturehomeworkmapper.insertLectureHomeworkfile(studenthomeworkFile);
						
							// 파일 추가
							log.debug(TeamColor.KHW + " 성공 result : " + result);
						} catch(Exception e) {
							log.debug(TeamColor.KHW + " 실패 result : " + result);
							e.printStackTrace();
						}						
					}
				}
			}
			return result;
		}
			
	
	// 학생이 본인이 수강하는 과목의 과제 목록보기
	public List<Map<String, Object>> getMyHomeworkList (
			int subjectApproveNo
			, int studentNo
			) {
		log.debug(TeamColor.KHW + "학생이 본인이 수강하는 과목의 과제 목록보기 서비스 진입");
		
		return studentlecturehomeworkmapper.selectMyHomeworkList(subjectApproveNo,studentNo);
	}
	
	
	// 본인의 과제 상세보기
	public Map<String,Object> getMyhomeworkOne(int pfHomeworkNo){
		log.debug(TeamColor.KHW +"본인의 과제 상세보기 서비스 진입");
		return studentlecturehomeworkmapper.selectMyHomeworkOne(pfHomeworkNo); 
	}
	
	
	// 학생이 수강하는 과목의 과제 수정하기
	public int modifyHomework(StudentHomework studenthomework
			, int pfHomeworkNo
			, MultipartFile[] newsthFile // 새로 넘겨받은 파일정보
			, HttpServletRequest request) {
		
		log.debug(TeamColor.KHW+"제출 과제 수정하기 서비스 진입");
		
		
		int result = studentlecturehomeworkmapper.updateMyHomeworkOne(studenthomework);
		
		// 디버깅
		
		// 디버깅
		log.debug(TeamColor.KHW + "본문수정의 경우 : " + result);
		
		// 본문 변경사항이 있으며 첨부파일의 변경사항도 있을 때
				if (result !=0 && newsthFile!= null) {
		
					log.debug(TeamColor.KHW + "본문 변경사항이 있으며 첨부파일의 변경사항도 있음");
					
					String dir = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/uploadFileStu/uploadFile");
					
					log.debug(TeamColor.KHW + dir);
					
					// 파일 삭제시작
					//db lectureFileName 가져오기 
					String homeworkFilename =  studentlecturehomeworkmapper.selectHomeworkFileExis(pfHomeworkNo);
					
					// 셀렉으로 있다면 파일 지워버리기
					if( homeworkFilename != null ) {
						 String fullpath = dir + "/" + homeworkFilename;
					      File file = new File(fullpath);
						 file.delete();
						 log.debug(TeamColor.KHW +"파일삭제 완료");
					}
					
					
					// 새로 다시 디비에 저장하기 위해 값 셋팅
					String homeworkFileName = ""; // 저장된 이름
					String homeworkOriginName = ""; // 기존파일이름
					String homeworkFileType= ""; // 파일형식
					
								
					List<StudentHomeworkFile> list = new ArrayList<>();
					
					for(MultipartFile file : newsthFile) {
						// 
						if(!file.isEmpty()) {
							homeworkOriginName = file.getOriginalFilename();
							homeworkFileType = file.getContentType();
							
							// 업로드한 파일을 vo내 존재하는 파일객체에 넣어주기
							StudentHomeworkFile sthFile = new StudentHomeworkFile();
							
							
							sthFile.setHomeworkOriginName(homeworkOriginName);
							sthFile.setHomeworkFileName(homeworkFilename);
							sthFile.setHomeworkFileType(homeworkFileType);
							sthFile.setPfHomeworkNo(pfHomeworkNo);
												
							log.debug(TeamColor.KHW + "StudentHomeworkFile에 저장된 것들 : " + sthFile);
							
							
							list.add(sthFile);
							
							String saveFileName = dir + File.separator + sthFile.getHomeworkFileName();
							
							Path savedir = Paths.get(saveFileName);
							
							try {
								// 전송
								file.transferTo(savedir);
								
								// 디비 업데이트
								result =+ studentlecturehomeworkmapper.updateHomeworkFile(sthFile);
								
								// 파일 추가
								log.debug(TeamColor.KHW + " 파일 수정 성공 result : " + result);
							} catch(Exception e) {
								log.debug(TeamColor.KHW + " 파일 수정 실패 result : " + result);
								e.printStackTrace();
							
							}
						}
				
					}
					
				
				
				}
				return 1;
			}
	
	
	
	// 학생이 수강하는 과목의 과제 삭제하기
	
	
	// 학생이 수강하는 과목의 과제 파일 삭제하기 


	
	// 교수메뉴 시작-------------------------------------------------------
	// 교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인
		public List<Map<String, Object>> getLectureTotalList (int lectureNo) {
			log.debug(TeamColor.KHW + "교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인 서비스 실행");
			
			return lectureMapper.selectLectureTotalList(lectureNo);
		}

	// 학생의 과제 제출 후 교수가 뷰에서 ck를 Y로 바꿔주기
	public int updateStudentHomeworkSubmitCk(int lectureNo) {
		log.debug(TeamColor.KHW + "학생의 과제 제출 후 교수가 뷰에서 ck를 Y로 바꿔주기 서비스 진입");
		
		return studentlecturehomeworkmapper.updateStudentHomeworkSubmitCk(lectureNo);
	}
	
	// 교수의 제출 과제 평가 >> ck / 점수 수정 서비스
	public int updateStudentHomeworkStuall(StudentHomework studenthomework) {
		log.debug(TeamColor.KHW + "학생의 과제 제출 후 교수가 교수의 제출 과제 평가 >> ck / 점수 수정 서비스 진입");
		
		
		return studentlecturehomeworkmapper.updateLectureHomeworkall(studenthomework);
	}
	
}
