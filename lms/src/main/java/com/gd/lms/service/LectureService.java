package com.gd.lms.service;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
	
	// 페이징
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
	
	
	// 강의하는 과목의 과제 수정하기
	public int modifyLecture(int lectureNo) {
		log.debug(TeamColor.KHW+"강의하는 과목의 과제 수정하기 서비스 진입");
		return lectureMapper.updateLectureOne(lectureNo);
	}
	
	// 강의하는 과목의 과제 삭제하기
	public int removeLectureOne(int lectureNo) {
		log.debug(TeamColor.KHW+"강의하는 과목의 과제 삭제하기 서비스 진입");
		return lectureMapper.deleteLectureOne(lectureNo);
	}
	
	
}
