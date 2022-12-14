package com.gd.lms.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.LectureMapper;
import com.gd.lms.mapper.StudentLectureHomeworkMapper;
import com.gd.lms.service.LectureService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.vo.Lecture;
import com.gd.lms.vo.StudentHomework;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class  LectureController {

		@Autowired 
		LectureService lectureService;
		
		@Autowired 
		RegisterService registerservice;
		
		@Autowired 
		LectureMapper lecturemapper;
		
		@Autowired
		StudentLectureHomeworkMapper studentlecturehomeworkmapper;
		
		// 강의하는 과목의 과제 목록 (교수가)
		@GetMapping("/lecture/getLectureList")
		public String getlectureList(Model model
				, @RequestParam("subjectApproveNo") int subjectApproveNo
				, @RequestParam(required = false, defaultValue = "") String search
				,  @PageableDefault Pageable pageable 
				, HttpServletRequest request
				){
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"LectureController의 lectureList 진입");

			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();
			session.getAttribute("No");
			String user = (String) session.getAttribute("user");
			
			// 사이드바를 위한 서비스실행
			if(user == "professor") { // 교수면 이거			
				List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
				// myRegisterListProf확인
				model.addAttribute("myRegisterListProf", myRegisterListProf);
				
				log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
			
			}
			else if (user == "student") { // 학생이면 이거
				List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
		
				model.addAttribute("myRegisterListStu", myRegisterListStu);
				
				log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
				
			}
			
			
			// pageable = PageRequest.of(0, 10, Sort.by("lectureNo").descending());
			model.addAttribute("lectureList", lectureService.findLectureList(pageable, subjectApproveNo, search));
			model.addAttribute("approveNo", subjectApproveNo);
			
			// 디버그
			// log.debug(TeamColor.KHW+ lectureList);
			//log.debug(TeamColor.KHW+ model);

			//log.debug(TeamColor.KHW +"model : " + model.getAttribute("lectureList"));
			
			
			return "/lecture/getLectureList";
		}
		
		
		// 강의하는 과목의 과제 상세보기
		@GetMapping("/lecture/getLectureOne")
		public String getlectureListOne(Model model
				, @RequestParam("lectureNo") int lectureNo
				, HttpServletRequest request) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"LectureController의 lectureOne 진입");
			
			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();
			session.getAttribute("No");
			String user = (String) session.getAttribute("user");
			
			// 사이드바를 위한 서비스실행
			if(user == "professor") { // 교수면 이거			
				List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
				// myRegisterListProf확인
				model.addAttribute("myRegisterListProf", myRegisterListProf);
				
				log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
			
			}
			else if (user == "student") { // 학생이면 이거
				List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
		
				model.addAttribute("myRegisterListStu", myRegisterListStu);
				
				log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
				
			}
			
			// 조회수 증가 service 실행
			lectureService.updatelectureHit(lectureNo);
			
			// 게시판 상세보기 긁어오기 및 lectureOne에 저장
			Map<String, Object> lectureOne = lectureService.getLectureOne(lectureNo);
			
			// model에 다시 저장
			model.addAttribute("lectureOne", lectureOne);
			
			return "/lecture/getLectureOne";
		}
		
		
		// 강의하는 과목의 과제 작성하기 FORM
		@GetMapping("/lecture/addLectureForm")
		public String addLecture(Model model
				, @RequestParam("subjectApproveNo") int subjectApproveNo
				, HttpServletRequest request ) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 작성하기 FORM 컨트롤러 진입");
			
			
			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();
			session.getAttribute("No");
			String user = (String) session.getAttribute("user");
			
			// 사이드바를 위한 서비스실행
			if(user == "professor") { // 교수면 이거			
				List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
				// myRegisterListProf확인
				model.addAttribute("myRegisterListProf", myRegisterListProf);
				
				log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
			
			}
			else if (user == "student") { // 학생이면 이거
				List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
		
				model.addAttribute("myRegisterListStu", myRegisterListStu);
				
				log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
				
			}
			
			
			
			model.addAttribute("subjectApproveNo", subjectApproveNo);
			return "/lecture/addLectureForm";
		}
		
		
		// 강의하는 과목의 과제 작성하기 Action
		@PostMapping("/lecture/addLectureForm")
		public String addLecture(int subjectApproveNo, String lectureTitle, String lectureContent,
								 Model model, RedirectAttributes rttr
				, HttpServletRequest request
				, @RequestParam("file") MultipartFile[] lectureFile ) throws UnsupportedEncodingException {
			
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 작성하기 Action 컨트롤러 진입");
			log.debug(TeamColor.KHW+ subjectApproveNo+" "+lectureTitle+"  "+lectureContent);
			log.debug(TeamColor.KHW+ "lectureFile :" +lectureFile);
			//log.debug(TeamColor.KHW+ "File :" +file);

			// lectureService를 실행하여 form에서 입력받은 sql의 값 insert
			int result = lectureService.addLecture(subjectApproveNo,lectureTitle, lectureContent,lectureFile, request);
			
			
			
			// 디버깅
			log.debug(TeamColor.KHW +"lectureService.addLecture 실행결과 " + result);
			
			if (result !=0) { // 1일시 과제작성 성공
								
				log.debug(TeamColor.KHW +"과제작성 성공!");
				
				rttr.addFlashAttribute("result", "과제 등록에 성공했습니다!");
				log.debug(TeamColor.KHW+"? :" +subjectApproveNo);
				//int subjectApproveNo = lecture.getSubjectApprove();
				//model.addAttribute("subjectApproveNo", subjectApproveNo);
				
				// 입력된 값을 통한 오토인크리먼트 받아오기
				int lectureNo = lecturemapper.selectLectureNo(lectureTitle, lectureContent, subjectApproveNo);
				log.debug(TeamColor.KHW + "오토인크리먼트 : " + lectureNo);
				
				
				// 과제작성에 따라 학생들에게도 과제 자동 생성하기 시작
				
				//List<Map<String, Object>> 객체에 셀렉트로 뽑은 수강학생들 넣어주기
				List<Map<String, Object>> student = studentlecturehomeworkmapper.selectStudents(subjectApproveNo);
				log.debug(TeamColor.KHW +"student" + student);
				
				// 셀렉한 학생들의 리스트 크기만큼 반복문
				for(int i=0; i<student.size(); i++) {
					// vo객체 생성
					StudentHomework stHomework = new StudentHomework();
					// 강의듣는 학생넘버를 뽑아 셋팅(반복문 돌리는만큼 늘어남)
					int studentNo = Integer.parseInt(student.get(i).get("student_no").toString());
					
					// 이를 다시 vo 객체에 셋팅
					stHomework.setLectureNo(lectureNo);
					stHomework.setStudentNo(studentNo);
					log.debug(TeamColor.KHW + "stHomework" + stHomework);
					
					// 셋팅한 객체를 넣어 매퍼실행 및 결과확인 및 디버깅
					int sturesult = studentlecturehomeworkmapper.insertAllStudentHomework(stHomework);
					log.debug(TeamColor.KHW +"수강하는 학생들에게 자동 인서트 성공! : " + sturesult);
				}
				
				
				return "redirect:/lecture/getLectureList?subjectApproveNo="+subjectApproveNo;
			} else {
				log.debug(TeamColor.KHW +"과제작성 실패!");
				rttr.addFlashAttribute("result", "과제 등록에 실패했습니다!");
				return "redirect:/lecture/getLectureList?subjectApproveNo="+subjectApproveNo;
			}			
		}
		
		
		// 강의하는 과목의 과제 수정하기 Form
		@GetMapping("/lecture/modifyLecture")
		public String modifyLecture(Model model
				, @RequestParam("lectureNo") int lectureNo
				, HttpServletRequest request) {
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 수정하기 Form 컨트롤러 진입");
			

			// 세션 사용하기위해 선언
				HttpSession session =  request.getSession();
				session.getAttribute("No");
				String user = (String) session.getAttribute("user");
				
				// 사이드바를 위한 서비스실행
				if(user == "professor") { // 교수면 이거			
					List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
					// myRegisterListProf확인
					model.addAttribute("myRegisterListProf", myRegisterListProf);
					
					log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
				
				}
				else if (user == "student") { // 학생이면 이거
					List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
			
					model.addAttribute("myRegisterListStu", myRegisterListStu);
					
					log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
					
				}
			
			// 게시판 상세보기 긁어오기 및 lectureOne에 저장
			Map<String, Object> lectureOne = lectureService.getLectureOne(lectureNo);
			
			// model에 넣어주기 (view로 보여주기 위함)
			model.addAttribute("lectureOne", lectureOne);
			log.debug(TeamColor.KHW +"lectureService.getLectureOne 실행결과 : " + lectureOne);
			
			return "/lecture/modifyLecture";
		}
	
		
		// 강의하는 과목의 과제 수정하기 Action
		@PostMapping("/lecture/modifyLecture")
		public String modifyLecture(
				Lecture lecture // 본문용
				, Model model // 넘겨주기용
				, @RequestParam("lectureNo") int lectureNo // 게시글 수정용 넘버				
				, @RequestParam("subjectApproveNo") int subjectApproveNo // ?
				, @RequestParam("lectureTitle") String lectureTitle
				, @RequestParam("lectureContent") String lectureContent
				, HttpServletRequest request
				, @RequestParam("newfile") MultipartFile[] newlectureFile ) throws UnsupportedEncodingException {
			
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 수정하기 Action 컨트롤러 진입");
			
			// 넘겨받은 값 확인
			log.debug(TeamColor.KHW+ "lectureNo : " + lectureNo);
			log.debug(TeamColor.KHW+ "subjectApproveNo : " + subjectApproveNo);
			log.debug(TeamColor.KHW+ "넘겨받은 파일 = newfile : " + newlectureFile);
			
			lecture.setLectureTitle(lectureTitle);
			lecture.setLectureContent(lectureContent);
			
			// 과제 서비스 수정 서비스 실행
			int result = lectureService.modifyLecture(lecture, lectureNo, newlectureFile, request);
			
			
			
			
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
				, Lecture lecture
				, String fileName
				, HttpServletRequest request
				, RedirectAttributes rttr
				) {
			
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "강의하는 과목의 과제 삭제하기 Action 컨트롤러 진입");
			
			log.debug(TeamColor.KHW +"강의하는 과목의 과제 삭제하기 Action 컨트롤러 진입시 전달받은 lectureNo : " + lectureNo);
			log.debug(TeamColor.KHW +"강의하는 과목의 과제 삭제하기 Action 컨트롤러 진입시 전달받은 subjectApproveNo : " + subjectApproveNo);
			// lectureService를 실행하여 form에서 입력받은 sql의 값 insert
			int result =lectureService.removeLectureOne(lectureNo, subjectApproveNo, fileName, request);
			
			
			
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
	
		
		
		// 첨부한 파일 다운로드
		@GetMapping("/lecture/downloadLecture")
		public ResponseEntity<Object> downloadFile(String fileName, int lectureNo, HttpServletRequest request) throws UnsupportedEncodingException{
			
			log.debug(TeamColor.KHW+ "값 확인 :" +fileName);
			
			
			//파일 경로
			String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/view/lecture/uploadFile") + "\\"+ fileName;
			
			//디버깅
			log.debug(TeamColor.KHW+ "값 확인 / realPath: " + realPath);
			
			//리턴값 세팅
			ResponseEntity<Object> returnVal = lectureService.downloadFile(fileName, realPath);
			
			//디버깅
			log.debug(TeamColor.KHW + "값 확인 / returnVal: " + returnVal);
			
			return returnVal;
		
		}
	
		
		// 교수메뉴 시작-------------------------------------------------------
		// 교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인
		@GetMapping("/lecture/notStudent/getlectureHomeworkStuList")
		public String getLectureTotalList(Model model
				, @RequestParam("lectureNo") int lectureNo
				, @RequestParam("subjectApproveNo") int subjectApproveNo
				, HttpServletRequest request) {
			
			// 해당 컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW+ "교수의 낸 과제 고유넘버당 듣는 학생들의 강의제출일람 확인 컨트롤러 진입");
			
			// 받아온 값 디버깅 확인
			log.debug(TeamColor.KHW+ "lectureNo : " + lectureNo);
			log.debug(TeamColor.KHW+ "subjectApproveNo : " + subjectApproveNo);
			
			

			// 세션 사용하기위해 선언
				HttpSession session =  request.getSession();
				session.getAttribute("No");
				String user = (String) session.getAttribute("user");
				
				// 사이드바를 위한 서비스실행
				if(user == "professor") { // 교수면 이거			
					List<Map<String, Object>> myRegisterListProf = registerservice.getMyRegisterListProf((Integer)session.getAttribute("No"));
					// myRegisterListProf확인
					model.addAttribute("myRegisterListProf", myRegisterListProf);
					
					log.debug(TeamColor.KHW + "NoticeController noticeList myRegisterListProf : " + myRegisterListProf);
				
				}
				else if (user == "student") { // 학생이면 이거
					List<Map<String,Object>> myRegisterListStu = registerservice.getMyRegisterList((Integer)session.getAttribute("No"));
			
					model.addAttribute("myRegisterListStu", myRegisterListStu);
					
					log.debug(TeamColor.KHW + "NoticeController getNoticeOne myRegisterListStu : " + myRegisterListStu);
					
				}
			
			
			
			model.addAttribute("LectureTotalList",lectureService.getLectureTotalList(lectureNo) );
			
			
			return "/lecture/notStudent/getlectureHomeworkStuList";
		}
			
}
