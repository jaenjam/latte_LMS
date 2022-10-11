package com.gd.lms.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.SubjectNoticeService;
import com.gd.lms.vo.SubjectNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SubjectNoticeController {

	
	@Autowired	
	SubjectNoticeService subjectnoticeservice;
	
	// 강의하는 과목의 공지사항 리스트 보기 (페이징적용)
	@GetMapping("/subject/notice/getSubjectNoticeList")
	public String getSubjectNoticeList(Model model
			, @RequestParam("subjectApproveNo") int subjectApproveNo
			, @RequestParam(required = false, defaultValue = "") String search
			,  @PageableDefault Pageable pageable ) {
	
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"SubjectNoticeController의 getSubjectNoticeList 진입");
		
		;
		
		// model.addAttribute("subjectNoticeList" , subjectnoticeservice.getSubjectNoticeList(subjectApproveNo));
		model.addAttribute("subjectNoticeList" , subjectnoticeservice.findSubjectNotice(pageable, subjectApproveNo, search));
		model.addAttribute("approveNo", subjectApproveNo);
		
		return "/subject/notice/getSubjectNoticeList";
	}
	
	
	// 강의하는 과목의 공지사항 상세보기
	@GetMapping("/subject/notice/getSubjectNoticeOne")
	public String getSubjectNoticeOne(Model model
			, @RequestParam("subjectNoticeNo") int subjectNoticeNo
			) {
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"SubjectNoticeController의 getSubjectNoticeOne 진입");
		
		
		log.debug(TeamColor.KHW +"subjectNoticeNo : " + subjectNoticeNo);
		
		// 조회수 증가 service 실행
		subjectnoticeservice.updateSubjectNoticeHit(subjectNoticeNo);
		
		// Map형 객체 생성 및 서비스 실행
		Map<String, Object> subjectNoticeOne = subjectnoticeservice.getSubjectNoticeOne(subjectNoticeNo);
		
		model.addAttribute("subjectNoticeOne" , subjectNoticeOne );
		
		return "/subject/notice/getSubjectNoticeOne";
	}
	
	
	
	// 강의하는 과목의 공지사항 작성하기 FORM
	@GetMapping("/subject/notice/addSubjectNoticeForm")
	public String addSubjectNoticeForm(Model model
			, @RequestParam("subjectApproveNo") int subjectApproveNo) {
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"SubjectNoticeController의 addSubjectNoticeForm 진입");
		
		// 기준이 되는 값 model에 담기
		model.addAttribute("subjectApproveNo", subjectApproveNo);
		
		return "/subject/notice/addSubjectNoticeForm";
	}
	
	
	// 강의하는 과목의 공지사항 작성하기 ACTION
	@PostMapping("/subject/notice/addSubjectNoticeForm")
	public String addSubjectNoticeForm(int subjectApproveNo
			, String subjectNoticeTitle
			, String subjectNoticeContent
			, @RequestParam("file") MultipartFile subjectNoticeFile
			, HttpServletRequest request
			, Model model
			, RedirectAttributes rttr) throws UnsupportedEncodingException {	
	
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "강의하는 과목의 공지사항 작성하기 Action 컨트롤러 진입");
		log.debug(TeamColor.KHW+ subjectApproveNo +" "+subjectNoticeTitle +"  "+subjectNoticeContent);
		log.debug(TeamColor.KHW+ "subjectNoticeFile :" + subjectNoticeFile);
		
		// subjectnoticeservice를 실행하여 form 에서 입력받은 sql의 값 insert
		int result = subjectnoticeservice.addSubjectNoticeOne(subjectApproveNo, subjectNoticeTitle, subjectNoticeContent, subjectNoticeFile, request);
		
		
		// 디버깅
		log.debug(TeamColor.KHW +"subjectnoticeservice.addSubjectNoticeOne 실행결과 " + result);

		if(result != 0) { // 1일시 공지사항 작성 성공
			
			log.debug(TeamColor.KHW +"공지사항 작성 성공!");
			rttr.addFlashAttribute("result", "공지사항 등록에 성공했습니다!");
			log.debug(TeamColor.KHW+" ? :" +subjectApproveNo);
			return "redirect:/subject/notice/getSubjectNoticeList?subjectApproveNo="+subjectApproveNo;
		} else {
			log.debug(TeamColor.KHW +"과제작성 실패!");
			rttr.addFlashAttribute("result", "과제 등록에 실패했습니다!");
			return "redirect:/subject/notice/getSubjectNoticeList?subjectApproveNo="+subjectApproveNo;
		}			
	}

	
	// 강의하는 과목의 공지사항 수정하기 Form
	@GetMapping("/subject/notice/modifySubjectNotice")
	public String modifySubjectNotice(Model model
			, @RequestParam("subjectNoticeNo") int subjectNoticeNo) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "강의하는 과목의 공지사항 수정하기 Form 컨트롤러 진입");
		
		// 게시판 상세보기 긁어오기 및 subjectNoticeOne에 저장
		
		Map<String, Object> subjectNoticeOne = subjectnoticeservice.getSubjectNoticeOne(subjectNoticeNo);
		model.addAttribute("subjectNoticeOne", subjectNoticeOne);
		log.debug(TeamColor.KHW +"subjectnoticeservice.getSubjectNoticeOne 실행결과 : " + subjectNoticeOne);
	
		return "/subject/notice/modifySubjectNotice";
	}
	
	
	// 강의하는 과목의 공지사항 수정하기 Action
	@PostMapping("/subject/notice/modifySubjectNotice")
	public String modifySubjectNotice(
			SubjectNotice subjectnotice
			, Model model
			, @RequestParam("subjectNoticeNo") int subjectNoticeNo
			, @RequestParam("subjectNoticeFileNo") int subjectNoticeFileNo
			, @RequestParam("subjectApproveNo") int subjectApproveNo // ?
			, HttpServletRequest request
			, @RequestParam("newfile") MultipartFile newSubjectNoticeFile ) throws UnsupportedEncodingException {
	
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "강의하는 과목의 과제 수정하기 Action 컨트롤러 진입");
					
		// 넘겨받은 값 확인
		log.debug(TeamColor.KHW+ "subjectNoticeNo : " + subjectNoticeNo);
		log.debug(TeamColor.KHW+ "subjectNoticeFileNo : " + subjectNoticeFileNo);
		log.debug(TeamColor.KHW+ "subjectApproveNo : " + subjectApproveNo);
		log.debug(TeamColor.KHW+ "넘겨받은 파일 = newfile : " + newSubjectNoticeFile);
	
		
		// 공지사항 수정 서비스 실행
		int result = subjectnoticeservice.modifySubjectNotice(subjectnotice, subjectNoticeNo, subjectNoticeFileNo, newSubjectNoticeFile, request);
	
		if(result != 0) { // 수정성공
			log.debug(TeamColor.KHW+ "공지사항 수정성공!");
			return "redirect:/subject/notice/getSubjectNoticeList?subjectApproveNo="+subjectApproveNo;
		} else {
		return "redirect:/subject/notice/getSubjectNoticeList?subjectApproveNo="+subjectApproveNo;
		}
	}
	
	
	// 강의하는 과목의 공지사항 삭제하기 Action
	@GetMapping("/subject/notice/removeSubjectNotice")
	public String removeSubjectNotice(@RequestParam("subjectNoticeNo") int subjectNoticeNo
			, @RequestParam("subjectApproveNo") int subjectApproveNo
			, SubjectNotice subjectnotice
			, String fileName
			, HttpServletRequest request
			, RedirectAttributes rttr 
			) {

		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "강의하는 과목의 공지사항 삭제하기 Action 컨트롤러 진입");
		
		log.debug(TeamColor.KHW +"강의하는 과목의 공지사항 삭제하기 Action 컨트롤러 진입시 전달받은 subjectNoticeNo : " + subjectNoticeNo);
		log.debug(TeamColor.KHW +"강의하는 과목의 공지사항 삭제하기 Action 컨트롤러 진입시 전달받은 subjectApproveNo : " + subjectApproveNo);
		
		// lectureService를 실행하여 form에서 입력받은 sql의 값 insert
		int result =subjectnoticeservice.removeSubjectNoticeOne(subjectNoticeNo, subjectApproveNo, fileName, request);
		
		// 디버깅
		log.debug(TeamColor.KHW +"subjectnoticeservice.removeSubjectNoticeOne 실행결과 " + result);
		if (result !=0) { // 1일시 과제작성 성공
			
			log.debug(TeamColor.KHW +"공지사항삭제 성공!");
			
			rttr.addFlashAttribute("result", "공지사항 삭제에 성공했습니다!");
			log.debug(TeamColor.KHW+"? :" +subjectApproveNo);
			return "redirect:/subject/notice/getSubjectNoticeList?subjectApproveNo="+subjectApproveNo;
		} else {
			log.debug(TeamColor.KHW +"공지사항삭제 실패!");
			rttr.addFlashAttribute("result", "공지사항 삭제에 실패했습니다!");
			return "redirect:/subject/notice/getSubjectNoticeList?subjectApproveNo="+subjectApproveNo;
		}		
		
	}
	
	
	
	// 첨부한 파일 다운로드
	@GetMapping("/subject/notice/downloadSubjectNotice")
	public ResponseEntity<Object> downloadFile(String fileName, int subjectNoticeNo, HttpServletRequest request) throws UnsupportedEncodingException{
		
		log.debug(TeamColor.KHW+ "값 확인 :" +fileName);
		
		
		//파일 경로
		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/view/subject/notice/uploadFile") + "\\"+ fileName;
		
		//디버깅
		log.debug(TeamColor.KHW+ "값 확인 / realPath: " + realPath);
		
		//리턴값 세팅
		ResponseEntity<Object> returnVal = subjectnoticeservice.downloadFile(fileName, realPath);
		
		//디버깅
		log.debug(TeamColor.KHW + "값 확인 / returnVal: " + returnVal);
		
		return returnVal;
	
	}

	
	
	
}// 컨트롤러닫기
