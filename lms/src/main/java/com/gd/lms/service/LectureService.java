package com.gd.lms.service;

import java.io.File;
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
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.LectureMapper;
import com.gd.lms.repository.LectureRepository;
import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.LectureFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
	@Autowired
	private LectureMapper lectureMapper;
	@Autowired 
	private LectureRepository repository;
	
	
	
	// 페이징>>> 잠시 잠궈둠
	public Page<Lecture> findLectureList(Pageable pageable, String contains){
		pageable = PageRequest.of(
				pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
				pageable.getPageSize());

		//return 	repository.findAllByLectureContentContains(contains, pageable);
		return repository.findAllByLectureContentContains(contains, pageable);
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
	public int addLecture(Lecture lecture, MultipartFile[] lectureFile
			, HttpServletRequest request) {
		log.debug(TeamColor.KHW +"강의하는 과목의 과제 작성하기 서비스 진입");
		int result = lectureMapper.insertLectureOne(lecture);
		
		log.debug(TeamColor.KHW +"result :" + result);
		log.debug(TeamColor.KHW +"lectureFile :" + lectureFile);		
		
		
		if(result != 0 && lectureFile!= null ) {
			int lectureNoo = lectureMapper.selectLectureNo(lecture);
			
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
	
	
	/*
	// 강의하는 과목의 과제 수정하기
	public int modifyLecture(Lecture lecture
			, int lectureNo // 그냥.. 어떤 게시글인지
			, int lectureFileNo
			, MultipartFile[] newlectureFile // 새로 넘겨받은 파일정보
			, HttpServletRequest request) {
		
		log.debug(TeamColor.KHW+"강의하는 과목의 과제 수정하기 서비스 진입");
		
		
		// 1) 여기서 본문만 수정하는 경우
		// 2) 본문 수정 + 파일첨부 수정하는 경우
		//	  >>> 외래키로 연결되어있으니 lectureNo를 통해 기존의 파일정보를 불러오고 해당하는 로컬파일 및 디비 지움
		//	  >>> 이후 폼에서 넘어온 새로운 멀티파일정보를 덮어씌움?
		// 3) 본문 수정 + 파일첨부 취소하는 경우...?
		//	  >>> 외래키로 연결되어있으니 lectureNo를 통해 기존의 파일정보를 불러오고 해당하는 로컬파일 및 디비 지움
		
		int result = lectureMapper.updateLectureOne(lectureNo);
		
		// 디버깅
		log.debug(TeamColor.KHW + "본문수정의 경우 : " + result);
		
		// 본문 변경사항이 있으며 첨부파일의 변경사항도 있을 때
		if (result !=0 && newlectureFile!= null) {
			
			// >>> 넘겨받은 lectureFileNo 를 기준으로 이미지 디비와 실제 로컬 파일을 지운다
			int filede = lectureMapper.deleteLectureFileOne(lectureFileNo);
			
			// 
			
			log.debug(TeamColor.KHW + "새로운 파일로 수정하기 위해 기존 디비 지움 : " + filede);
			
			// 이후 로컬의 파일 지우기
			String dir = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/uploadFile");
			
			if(  != null ) {
				 String fullpath = dir + "/" + savedfile;
			      File file = new File(fullpath);
				 file.delete();
			}
			
			
			
			// 렉쳐파일형태의 vo 객체 생성 이후 변수 넣어주기(새로 업로드된)
			LectureFile existlecturefile = new LectureFile();
			
			
			existlecturefile.getLectureFilename();
			existlecturefile.getLectureOriginname();
			existlecturefile.getLectureType();
	
			// 새로운 파일 디비 삽입
			
		}
		
		
		return lectureMapper.updateLectureOne(lectureNo);
	}
	
	*/
	
	// 강의하는 과목의 과제 삭제하기
	public int removeLectureOne(int lectureNo) {
		log.debug(TeamColor.KHW+"강의하는 과목의 과제 삭제하기 서비스 진입");
		return lectureMapper.deleteLectureOne(lectureNo);
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
	
	
	
	
	
}
