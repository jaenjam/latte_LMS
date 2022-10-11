package com.gd.lms.service;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.LectureFileMapper;
import com.gd.lms.mapper.LectureMapper;
import com.gd.lms.repository.LectureRepository;
import com.gd.lms.repository.SubjectApproveRepository;
import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.LectureFile;
import com.gd.lms.vo.SubjectApprove;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
	@Autowired
	private LectureMapper lectureMapper;
	
	@Autowired
	private LectureFileMapper lecturefilemapper;
	
	@Autowired 
	private LectureRepository repository;
	@Autowired
	private SubjectApproveRepository subjectApproveRepository;
	
	
	// 페이징
	public Page<Lecture> findLectureList(Pageable pageable, int subjectApproveNo, String search){
		log.debug("페이징서비스");
		pageable = PageRequest.of(
				pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
				pageable.getPageSize(),
				Sort.by("lectureNo").descending());
		
		SubjectApprove subject = subjectApproveRepository.findBySubjectApproveNo(subjectApproveNo);
		log.debug(search);
		return repository.findAllBySubjectApproveAndLectureTitleContains(subject, search, pageable);

	}
	
	// 강의하는 과목의 과제 리스트 긁어오기
	public List<Map<String, Object>> getLectureListProf(int subjectApproveNo) {
		log.debug(TeamColor.KHW +"강의리스트셀렉 진입");	
		return lectureMapper.selectLectureListPro(subjectApproveNo);
	}

	
	// 강의하는 과목의 과제 조회수증가
	public int updatelectureHit(int lectureNo) {
		log.debug(TeamColor.KHW +"조회수카운트서비스 진입");		
		return lectureMapper.lectureHit(lectureNo);
	}
	
	
	// 강의하는 과목의 과제 상세보기
	public Map<String,Object> getLectureOne(int lectureNo) {
		log.debug(TeamColor.KHW +"강의자료상세보기 서비스 진입");
		return lectureMapper.selectLectureOnePro(lectureNo); 
	}
	
	
	// 강의하는 과목의 과제 작성하기
	public int addLecture(int subjectApproveNo, String lectureTitle, String lectureContent
			, MultipartFile[] lectureFile, HttpServletRequest request) {
		log.debug(TeamColor.KHW +"강의하는 과목의 과제 작성하기 서비스 진입");
		int result = lectureMapper.insertLectureOne(subjectApproveNo, lectureTitle, lectureContent);
		
		log.debug(TeamColor.KHW +"result :" + result);
		log.debug(TeamColor.KHW +"lectureFile :" + lectureFile);		
		
		
		if(result != 0 && lectureFile!= null ) {
			int lectureNoo = lectureMapper.selectLectureNo(lectureTitle, lectureContent, subjectApproveNo);
			
			log.debug(TeamColor.KHW +"셀렉트로 no셀렉 : " + lectureNoo);
			
			log.debug(TeamColor.KHW +"lectureFil이 not null입니다");
			
			String dir = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/uploadFile");
			log.debug(TeamColor.KHW +"dir 경로 확인 : " + dir);
			
			String lectureFilename = ""; //  강의자료파일에서 저장된 이름
			String lectureOriginname = ""; // 기존파일이름
			String lectureType= ""; // 파일형식
			
						
			List<LectureFile> list = new ArrayList<>();
			
			for(MultipartFile file : lectureFile) {
				// 
				if(!file.isEmpty()) {
					lectureOriginname = file.getOriginalFilename();
					lectureType = file.getContentType();
					
					// 업로드한 파일을 vo내 존재하는 파일객체에 넣어주기
					LectureFile LectureFile = new LectureFile();
					
					
					LectureFile.setLectureOriginname(lectureOriginname);
					LectureFile.setLectureFilename(UUID.randomUUID() + "_" + lectureOriginname);
					LectureFile.setLectureType(lectureType);
					LectureFile.setLectureNo(lectureNoo);
										
					log.debug(TeamColor.KHW + "LectureFile에 저장된 것들 : " + LectureFile);
					
					
					list.add(LectureFile);
					
					String saveFileName = dir + File.separator + LectureFile.getLectureFilename();
					
					Path savedir = Paths.get(saveFileName);
					
					try {
						// 전송
						file.transferTo(savedir);
						
						result =+ lectureMapper.insertLecturefile(LectureFile);
						
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
	
	
	
	// 강의하는 과목의 과제 수정하기
	public int modifyLecture(Lecture lecture
			, int lectureNo // 그냥.. 어떤 게시글인지
			, MultipartFile[] newlectureFile // 새로 넘겨받은 파일정보
			, HttpServletRequest request) {
		
		log.debug(TeamColor.KHW+"강의하는 과목의 과제 수정하기 서비스 진입");
		
		
		// 1) 여기서 본문만 수정하는 경우
		// 2) 본문 수정 + 파일첨부 수정하는 경우
		//	  >>> 외래키로 연결되어있으니 lectureNo를 통해 기존의 파일정보를 불러오고 해당하는 로컬파일 및 디비 지움
		//	  >>> 이후 폼에서 넘어온 새로운 멀티파일정보를 덮어씌움?
		// 3) 본문 수정 + 파일첨부 취소하는 경우...?
		//	  >>> 외래키로 연결되어있으니 lectureNo를 통해 기존의 파일정보를 불러오고 해당하는 로컬파일 및 디비 지움
		
		int result = lectureMapper.updateLectureOne(lecture);
		
		// 디버깅
		log.debug(TeamColor.KHW + "본문수정의 경우 : " + result);
		
		// 본문 변경사항이 있으며 첨부파일의 변경사항도 있을 때
		if (result !=0 && newlectureFile!= null) {
			
			log.debug(TeamColor.KHW + "본문 변경사항이 있으며 첨부파일의 변경사항도 있음");
			
			String dir = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/uploadFile");
			
			log.debug(TeamColor.KHW + dir);
			
			// 파일 삭제시작
			//db lectureFileName 가져오기 
			String lectureFileName =  lectureMapper.selectLectureFileExis(lectureNo);
			
			// 셀렉으로 있다면 파일 지워버리기
			if( lectureFileName != null ) {
				 String fullpath = dir + "/" + lectureFileName;
			      File file = new File(fullpath);
				 file.delete();
				 log.debug(TeamColor.KHW +"파일삭제 완료");
			}
			
			
			
			// 새로 다시 디비에 저장하기 위해 값 셋팅
			String lectureFilename = ""; //  강의자료파일에서 저장된 이름
			String lectureOriginname = ""; // 기존파일이름
			String lectureType= ""; // 파일형식
			
						
			List<LectureFile> list = new ArrayList<>();
			
			for(MultipartFile file : newlectureFile) {
				// 
				if(!file.isEmpty()) {
					lectureOriginname = file.getOriginalFilename();
					lectureType = file.getContentType();
					
					// 업로드한 파일을 vo내 존재하는 파일객체에 넣어주기
					LectureFile LectureFile = new LectureFile();
					
					
					LectureFile.setLectureOriginname(lectureOriginname);
					LectureFile.setLectureFilename(UUID.randomUUID() + "_" + lectureOriginname);
					LectureFile.setLectureType(lectureType);
					LectureFile.setLectureNo(lectureNo);
										
					log.debug(TeamColor.KHW + "LectureFile에 저장된 것들 : " + LectureFile);
					
					
					list.add(LectureFile);
					
					String saveFileName = dir + File.separator + LectureFile.getLectureFilename();
					
					Path savedir = Paths.get(saveFileName);
					
					try {
						// 전송
						file.transferTo(savedir);
						
						// 디비 업데이트
						result =+ lectureMapper.updateLectureFile(LectureFile);
						
						// 파일 추가
						log.debug(TeamColor.KHW + " 파일 수정 성공 result : " + result);
					} catch(Exception e) {
						log.debug(TeamColor.KHW + " 파일 수정 실패 result : " + result);
						e.printStackTrace();
					
					}
				}
		
			}
			
			
			/*
			//db file name 수정하기
			
			String newName = "bye";
			
			//db file update
			
			//file 저장
			// 렉쳐파일형태의 vo 객체 생성 이후 변수 넣어주기(새로 업로드된)
			LectureFile existlecturefile = new LectureFile();
			
			
			existlecturefile.getLectureFilename();
			existlecturefile.getLectureOriginname();
			existlecturefile.getLectureType();
	
			// 새로운 파일 디비 삽입
				
			}return lectureMapper.updateLectureOne(lectureNo);
			*/
		
		}
		return 1;
	}
	
	
	
	// 강의하는 과목의 과제 삭제하기 + 파일삭제 (못하면 디비라도 지워)
	public int removeLectureOne(int lectureNo
			, int subjectApproveNo
			, String fileName
			, HttpServletRequest request) {
		log.debug(TeamColor.KHW+ "강의하는 과목의 과제 삭제하기 서비스 진입");
		
		log.debug(TeamColor.KHW+ "fileName : " + fileName);
		log.debug(TeamColor.KHW+ "subjectApproveNo : " + subjectApproveNo);
	
		
		/*
		// 업로드된 파일 삭제
    	String srcFileName = null;
		
    	
    	// 파일 경로 설정
    	String uploadPath = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/uploadFile");
    	
    	
    	try {
    		 srcFileName = URLDecoder.decode(fileName,"UTF-8");
    		 
    		 File file = new File(uploadPath +File.separator + srcFileName);
    		 boolean result = file.delete(); 
    		 log.debug(TeamColor.KHW + "srcFileName : " + srcFileName);
    		 
    	}
    	*/
		
		int fileresult = lecturefilemapper.deleteLectureFile(lectureNo);
		log.debug(TeamColor.KHW+ "fileresult : " + fileresult);
		
    	int result = lectureMapper.deleteLectureOne(lectureNo);
    	log.debug(TeamColor.KHW+ "result : " + result);
    	
		return result;
	}
	
	
	// 첨부파일 다운로드
	public ResponseEntity<Object> downloadFile(String fileName, String realPath) {
		log.debug(TeamColor.KHW + "파일 다운로드 서비스 실행");
		ResponseEntity<Object> returnVal = null;
		
		try {
			
			Path filePath = Paths.get(realPath);
			//파일 리소스
			Resource resource = new InputStreamResource(Files.newInputStream(filePath));
			
			//객체
			File file = new File(realPath);
			
			//헤더
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());
			
			//디버깅
			log.debug(TeamColor.KHW + "파일 다운로드 성공");
			
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		} catch(Exception e) {
			//디버깅
			log.debug(TeamColor.KHW + "파일 다운로드 실패");
			
			return new ResponseEntity<Object>(null, HttpStatus.CONFLICT);
		}
	
		
		
	}
	
	
	
	// 교수메뉴 시작-------------------------------------------------------
	// 교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인
	public List<Map<String, Object>> getLectureTotalList (int lectureNo) {
		log.debug(TeamColor.KHW + "교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인 서비스 실행");
		
		return lectureMapper.selectLectureTotalList(lectureNo);
	}
	
}
