package com.gd.lms.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.LectureService;
import com.gd.lms.vo.Lecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {

		@Autowired LectureService lectureService;
		
		
		// 강의하는 과목의 과제 목록 (교수가)
		@GetMapping("/lecture/getLectureList")
		public String getlectureList(Model model, @RequestParam("subjectApproveNo") int subjectApproveNo) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"LectureController의 lectureList 진입");
			
			// 조회수 증가 service 실행
			//lectureService.lectureHit(lecturerNo);
			
			// 리스트 긁어오는 service 실행 >>> 교수사번 입력되어 얻은 쿼리문을 lectureList에 담기
			List<Map<String,Object>> lectureList = lectureService.getLectureListProf(subjectApproveNo);
			log.debug(TeamColor.KHW +"LectureController로 다시 돌아옴(서비스 끝남)");
			
			// 해당 값을 모델에 저장(view에서 띄우기 위함)
			model.addAttribute("lectureList", lectureList);
			
			// 디버그
			log.debug(TeamColor.KHW+lectureList);
			
			return "/lecture/getLectureList";
		}
		
		// 강의하는 과목의 과제 상세보기
		@GetMapping("/lecture/getLectureOne")
		public String getlectureListOne(Model model, Lecture lecture ,@RequestParam("lectureNo") int lectureNo) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"LectureController의 lectureOne 진입");
			
			// 조회수 증가 service 실행
			lectureService.updatelectureHit(lectureNo);
			
			// 게시판 상세보기 긁어오기 및 lectureOne에 저장
			Lecture lectureOne = lectureService.getLectureOne(lectureNo);
			
			// model에 다시 저장
			model.addAttribute("lectureOne", lectureOne);
			
			return "/lecture/getLectureOne";
		}
		
		
		// 강의하는 과목의 과제 작성하기 FORM
		@GetMapping("/lecture/addLectureForm")
		public String addLecture() {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 작성하기 FORM 컨트롤러 진입");
			
			return "/lecture/addLectureForm";
		}
		
		
		// 강의하는 과목의 과제 작성하기 Action
		@PostMapping("/lecture/addLectureForm")
		public String addLecture(Lecture lecture, Model model, RedirectAttributes rttr
				, HttpServletRequest request
				, @RequestParam("file") MultipartFile[] lectureFile ) throws UnsupportedEncodingException {
			
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 작성하기 Action 컨트롤러 진입");
			
			log.debug(TeamColor.KHW+ "lectureFile :" +lectureFile);
			//log.debug(TeamColor.KHW+ "File :" +file);
			
			// lectureService를 실행하여 form에서 입력받은 sql의 값 insert
			int result = lectureService.addLecture(lecture, lectureFile, request);
			
			
			
			// 디버깅
			log.debug(TeamColor.KHW +"lectureService.addLecture 실행결과 " + result);
			
			if (result !=0) { // 1일시 과제작성 성공
								
				log.debug(TeamColor.KHW +"과제작성 성공!");
				
				rttr.addFlashAttribute("result", "과제 등록에 성공했습니다!");
				log.debug(TeamColor.KHW+"? :" +lecture.getSubjectApproveNo());
				int subjectApproveNo = lecture.getSubjectApproveNo();
				model.addAttribute("subjectApproveNo", subjectApproveNo);
				return "redirect:/lecture/getLectureList?subjectApproveNo="+lecture.getSubjectApproveNo();
			} else {
				log.debug(TeamColor.KHW +"과제작성 실패!");
				rttr.addFlashAttribute("result", "과제 등록에 실패했습니다!");
				return "redirect:/lecture/getLectureList?subjectApproveNo="+lecture.getSubjectApproveNo();
			}			
		}
		
		
		// 강의하는 과목의 과제 수정하기 Form
		@GetMapping("/lecture/modifyLecture")
		public String modifyLecture(Model model,@RequestParam("lectureNo") int lectureNo) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 수정하기 Form 컨트롤러 진입");
			
			// 게시판 상세보기 긁어오기 및 lectureOne에 저장
			Lecture lectureOne = lectureService.getLectureOne(lectureNo);
			
			// model에 넣어주기 (view로 보여주기 위함)
			model.addAttribute("lectureOne", lectureOne);
			log.debug(TeamColor.KHW +"lectureService.getLectureOne 실행결과 : " + lectureOne);
			
			return "/lecture/modifyLecture";
		}
		
		
		// 강의하는 과목의 과제 수정하기 Action
		@PostMapping("/lecture/modifyLecture")
		public String modifyLecture(Lecture lecture, Model model
				,@RequestParam("lectureNo") int lectureNo
				,@RequestParam("subjectApproveNo") int subjectApproveNo ) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 수정하기 Action 컨트롤러 진입");
			
			// 과제 서비스 수정 서비스 실행
			int result = lectureService.modifyLecture(lectureNo);
			if(result != 0) { // 수정성공!
				log.debug(TeamColor.KHW+ "과제 수정성공!");
				return "redirect:/lecture/getLectureList?subjectApproveNo="+subjectApproveNo;
			} else {
			return "redirect:/lecture/getLectureList?subjectApproveNo="+subjectApproveNo;
			}
		}
		
		
		// 강의하는 과목의 과제 삭제하기 Action
		@GetMapping("/lecture/removeLecture")
		public String removeLectureForm(@RequestParam("lectureNo") int lectureNo, 
				@RequestParam("subjectApproveNo") int subjectApproveNo
				,Lecture lecture, RedirectAttributes rttr) {
			
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 삭제하기 Action 컨트롤러 진입");
			
			log.debug(TeamColor.KHW +"강의하는 과목의 과제 삭제하기 Action 컨트롤러 진입시 전달받은 lectureNo : " + lectureNo);
			log.debug(TeamColor.KHW +"강의하는 과목의 과제 삭제하기 Action 컨트롤러 진입시 전달받은 subjectApproveNo : " + subjectApproveNo);
			// lectureService를 실행하여 form에서 입력받은 sql의 값 insert
			int result =lectureService.removeLectureOne(lectureNo);
			
			
			
			// 디버깅
			log.debug(TeamColor.KHW +"lectureService.removeLectureOne 실행결과 " + result);
			if (result !=0) { // 1일시 과제작성 성공
				
				log.debug(TeamColor.KHW +"과제삭제 성공!");
				
				rttr.addFlashAttribute("result", "과제 삭제에 성공했습니다!");
				log.debug(TeamColor.KHW+"? :" +subjectApproveNo);
				return "redirect:/lecture/getLectureList?subjectApproveNo="+subjectApproveNo;
			} else {
				log.debug(TeamColor.KHW +"과제삭제 실패!");
				rttr.addFlashAttribute("result", "과제 삭제에 실패했습니다!");
				return "redirect:/lecture/getLectureList?subjectApproveNo="+subjectApproveNo;
			}			
		}
			
			
}
