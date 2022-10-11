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
import org.springframework.data.domain.Sort;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.SubjectNoticeMapper;
import com.gd.lms.repository.SubjectApproveRepository;
import com.gd.lms.repository.SubjectNoticeRepository;
import com.gd.lms.vo.SubjectApprove;
import com.gd.lms.vo.SubjectNotice;
import com.gd.lms.vo.SubjectNoticeFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SubjectNoticeService {

	@Autowired
	SubjectNoticeMapper subjectnoticemapper;
	
	@Autowired
	private SubjectApproveRepository subjectApproveRepository;
	
	@Autowired
	private SubjectNoticeRepository repository;
	
	
	// 리스트보기(페이징 같이)
	public Page<SubjectNotice> findSubjectNotice(Pageable pageable, int subjectApproveNo, String search) {
		log.debug("페이징서비스");
		pageable = PageRequest.of(
				pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber()-1,
				pageable.getPageSize(),
				Sort.by("subjectNoticeNo").descending());
		
		SubjectApprove subject = subjectApproveRepository.findBySubjectApproveNo(subjectApproveNo);
		log.debug(TeamColor.KHW+ "subject : "+subject);
		
		log.debug(search);
		return repository.findAllBySubjectApproveAndSubjectNoticeTitleContains(subject,search, pageable); 
	}
	
	
	// 조회수 증가
	public int updateSubjectNoticeHit(int subjectNoticeNo) {
		log.debug(TeamColor.KHW +"조회수카운트서비스 진입");
		return subjectnoticemapper.subjectNoticeHit(subjectNoticeNo);
	}
	
	

	// 공지사항 상세보기
	public Map<String,Object> getSubjectNoticeOne(int subjectNoticeNo) {
		log.debug(TeamColor.KHW +"공지사항 상세보기 서비스 진입");
		
		return subjectnoticemapper.selectSubjectNoticeOne(subjectNoticeNo);
	}
	
	
	// 교수의 공지사항 작성하기 
	public int addSubjectNoticeOne(int subjectApproveNo
			, String subjectNoticeTitle
			, String subjectNoticeContent
			, MultipartFile subjectNoticeFile
			, HttpServletRequest request) {
		
		log.debug(TeamColor.KHW + "공지사항작성하기 서비스 진입");
		// 기입된 내용 있어?
		int result = subjectnoticemapper.insertSubjectNotice(subjectApproveNo, subjectNoticeTitle, subjectNoticeContent);
				
		log.debug(TeamColor.KHW +"result :" + result);
		log.debug(TeamColor.KHW +"subjectNoticeFile :" + subjectNoticeFile);	
		
		// 기입된 내용과 첨부받은 파일이 있다면
		if(result !=0 && subjectNoticeFile !=null ) {
			
			// sql 실행시 필요한 오토인크리먼트No구하기
			int subjectNoticeNo = subjectnoticemapper.selectSubjectNoticeNo(subjectNoticeTitle, subjectNoticeContent, subjectApproveNo);
		
			log.debug(TeamColor.KHW +"셀렉트로 no셀렉 : " + subjectNoticeNo);
			
			log.debug(TeamColor.KHW +"subjectNoticeFile이 not null입니다");
			
			// 저장할 경로 지정
			String dir = request.getSession().getServletContext().getRealPath("/images/noticeImg/");
			log.debug(TeamColor.KHW +"dir 경로 확인 : " + dir);
			
			String subjectNoticeFileName = ""; //  공지사항에서 저장된 이름 = 현재파일
			String subjectNoticeOriginName = ""; // 기존파일이름 = 오리진
			String contentType= ""; // 파일형식
			
			
			
					log.debug(TeamColor.KHW +"중간확인");
					
					String fileRealName = subjectNoticeFile.getOriginalFilename();
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

					
					// 업로드한 파일을 vo내 존재하는 파일객체에 넣어주기
					SubjectNoticeFile subjectnoticefile = new SubjectNoticeFile();
					
					subjectnoticefile.setSubjectNoticeOriginName(fileRealName);
					subjectnoticefile.setSubjectNoticeFileName(UUID.randomUUID() + "_" + subjectNoticeOriginName);
					subjectnoticefile.setContentType(fileExtension);
					subjectnoticefile.setSubjectNoticeNo(subjectNoticeNo);
					log.debug(TeamColor.KHW + "subjectnoticefile에 저장된 것들 : " + subjectnoticefile);
					
					
					File saveFile = new File(dir + "\\" + subjectnoticefile.getSubjectNoticeFileName() + fileExtension );
					try {
						// 전송
						subjectNoticeFile.transferTo(saveFile);
						
						result = subjectnoticemapper.insertSubjectNoticefile(subjectnoticefile);

						// 파일 추가
						log.debug(TeamColor.KHW + " 성공 result : " + result);
					
					}  catch (IllegalStateException e) {
						log.debug(TeamColor.KHW + " 실패 result : " + result);
						e.printStackTrace();
					} 	catch(Exception e) {
						log.debug(TeamColor.KHW + " 실패 result : " + result);
						e.printStackTrace();
					
					}
				} 
			
		return result;
	}
	
	
	
	
	// 교수의 공지사항 수정하기
	public int modifySubjectNotice(SubjectNotice subjectnotice
			, int subjectNoticeNo
			, int subjectNoticeFileNo
			, MultipartFile newSubjectNoticeFile // 새로 넘겨받은 파일정보
			, HttpServletRequest request) {
				
				log.debug(TeamColor.KHW+"강의하는 과목의 공지사항 수정하기 서비스 진입");	
				
				int result = subjectnoticemapper.updateSubjectNoticeOne(subjectnotice);
				
				// 디버깅
				log.debug(TeamColor.KHW + "본문수정의 경우 : " + result);
				
				// 본문 변경사항이 있으며 첨부파일의 변경사항도 있을 때
				if(result !=0 && newSubjectNoticeFile !=null) {
					
					log.debug(TeamColor.KHW + "본문 변경사항이 있으며 첨부파일의 변경사항도 있음");
				
					String dir  = request.getSession().getServletContext().getRealPath("/images/noticeImg/");
					log.debug(TeamColor.KHW + "dir : " + dir);
					
					// db subjectNoticeFileName 가져오기
					String subjectNoticefileName = subjectnoticemapper.selectSubjectFileExis(subjectNoticeNo);
			
					// 셀렉으로 있다면 파일 지워버리기
					if ( subjectNoticefileName != null) {
						String fullpath = dir + "/" + subjectNoticefileName;
						log.debug(TeamColor.KHW +"fullpath : " + fullpath);
						File file = new File(fullpath);
						file.delete();
						log.debug(TeamColor.KHW +"파일삭제 완료");
						}
					
					String subjectNoticeFileName = ""; //  공지사항에서 저장된 이름 = 현재파일
					String subjectNoticeOriginName = ""; // 기존파일이름 = 오리진
					String contentType= ""; // 파일형식
					
					
					
							log.debug(TeamColor.KHW +"중간확인");
							
							String fileRealName = newSubjectNoticeFile.getOriginalFilename();
							String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

							
							// 업로드한 파일을 vo내 존재하는 파일객체에 넣어주기
							SubjectNoticeFile subjectnoticefile = new SubjectNoticeFile();
							
							subjectnoticefile.setSubjectNoticeOriginName(fileRealName);
							subjectnoticefile.setSubjectNoticeFileName(UUID.randomUUID() + "_" + subjectNoticeOriginName);
							subjectnoticefile.setContentType(fileExtension);
							subjectnoticefile.setSubjectNoticeNo(subjectNoticeNo);
							log.debug(TeamColor.KHW + "subjectnoticefile에 저장된 것들 : " + subjectnoticefile);
							
							
							File saveFile = new File(dir + "\\" + subjectnoticefile.getSubjectNoticeFileName() + fileExtension );
							try {
								// 전송
								newSubjectNoticeFile.transferTo(saveFile);
								
								// 디비업데이트
								result =+ subjectnoticemapper.updateSubjectNoticeFile(subjectnoticefile);

								// 파일 추가
								log.debug(TeamColor.KHW + " 파일 수정 성공 result : " + result);
							
							}  catch (IllegalStateException e) {
								log.debug(TeamColor.KHW + " 실패 result : " + result);
								e.printStackTrace();
							} 	catch(Exception e) {
								log.debug(TeamColor.KHW + " 실패 result : " + result);
								e.printStackTrace();
							
							}
						} 
					
		return 1;
			
	}
	
	
	
	// 공지사항 삭제하기 + 파일삭제
	public int removeSubjectNoticeOne(int subjectNoticeNo
			, int subjectApproveNo
			, String fileName
			, HttpServletRequest request) {
		
		log.debug(TeamColor.KHW+ "강의하는 과목의 공지사항 삭제하기 서비스 진입");
		
		log.debug(TeamColor.KHW+ "subjectNoticeNo : " + subjectNoticeNo);
		log.debug(TeamColor.KHW+ "subjectApproveNo : " + subjectApproveNo);
		
		// 디비 지우기
		int fileresult = subjectnoticemapper.deleteSubjectNoticeFileOne(subjectNoticeNo);
		log.debug(TeamColor.KHW+ "fileresult : " + fileresult);
		
    	int result = subjectnoticemapper.delteSubjectNoticeOne(subjectNoticeNo);
    	log.debug(TeamColor.KHW+ "result : " + result);
		
		return result;
	}
	
	
	
	// 첨부파일 다운로드
	public ResponseEntity<Object> downloadFile(String fileName, String realPath) {
		log.debug(TeamColor.KHW + "파일 다운로드 서비스 실행");
		ResponseEntity<Object> returnVal = null;
		
		try {
			
			Path filePath = Paths.get(realPath);
			
			// 파일 리소스
			Resource resource = new InputStreamResource(Files.newInputStream(filePath));
			
			// 객체
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
	
	
	
}// 서비스 클래스 닫기

