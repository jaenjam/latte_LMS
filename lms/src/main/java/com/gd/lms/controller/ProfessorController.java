package com.gd.lms.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.service.ProfessorService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.TimeTableService;
import com.gd.lms.vo.Professor;
import com.gd.lms.vo.ProfessorImg;

import lombok.extern.slf4j.Slf4j;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;
import com.gd.lms.service.NoticeService;

@Controller
@Transactional
@Slf4j
public class ProfessorController {
	@Autowired
	ProfessorService professorService;
	@Autowired
	MajorService majorService;
	@Autowired
	RegisterService registerService;
	@Autowired NoticeService noticeService;
	@Autowired TimeTableService timetableService;

	// 로그인폼
	@GetMapping("loginForm")
	public String professorLogin() {

		log.debug(TeamColor.JJY + "ProfessorController loginForm Get실행");
		return "loginForm";
	}

	// 로그인 액션
	@PostMapping("/ProfessorForm")
	public String professorLogin(Professor professor, Model model, HttpServletRequest request,@RequestParam("professorNo") int professorNo) {

		log.debug(TeamColor.JJY + "ProfessorController loginForm Post실행");

		String result = "";

		HttpSession session = request.getSession(); // 세션 사용

		Professor professorLogin = professorService.getProfessor(professor); // professor값 다 select
		model.addAttribute("ProfessorId", professorLogin); // model에 ProfessorId라는 값으로 select한 값 다 들어가있음

		log.debug(TeamColor.JJY + "ProfessorController professorLogin 값 :" + professorLogin); // professorLogin안에 들어가있는																							
		log.debug(TeamColor.JJY + "ProfessorController professorLogin의 model :" + model); // model값 출력

		//noticeList최근 5개를 List에 담아준다.
		List<Map<String, Object>> noticeListTop = noticeService.selectNoticeListTop();
		
		//꺼내서 쓸수 있게 model에 넣어준다.
		model.addAttribute("noticeListTop", noticeListTop);
		
		//디버깅코드 재확인
		log.debug(TeamColor.LJE + "ProfessorController loginEmployee noticeListTop : " + noticeListTop);
		
		
		if (professorLogin == null) {
			log.debug(TeamColor.JJY + "로그인실패 ! professorLogin값이 null");
			result = "/loginForm";
		} else {
			log.debug(TeamColor.JJY + "로그인성공");

			// 세션에 로그인시 받은값 저장
			// 로그인 성공시 세션에 로그인시 받은값 저장
			session.setAttribute("user", "professor"); // user에 넣어주기
			session.setAttribute("No", professorLogin.getProfessorNo()); // 사번
			session.setAttribute("Name", professorLogin.getProfessorName()); // 이름
			session.setAttribute("MajorNo", professorLogin.getMajorNo()); // 전공
			session.setAttribute("professorRegiNo", professorLogin.getProfessorRegiNo());// 주민번호
			session.setAttribute("professorAge", professorLogin.getProfessorAge());// 나이
			session.setAttribute("professorGender", professorLogin.getProfessorGender());// 성별
			session.setAttribute("professorTelephone", professorLogin.getProfessorTelephone());// 전화번호
			session.setAttribute("professorEmail", professorLogin.getProfessorEmail());// 이메일
			session.setAttribute("professorAddress", professorLogin.getProfessorAddress());// 주소
			session.setAttribute("professorDetailAddress", professorLogin.getProfessorDetailAddress());// 상세주소
			session.setAttribute("professorRoom", professorLogin.getProfessorRoom());// 교수실
			session.setAttribute("salaryNo", professorLogin.getSalaryNo());
			session.setAttribute("professorState", professorLogin.getProfessorState());// 재직상태

			log.debug(TeamColor.JJY + "professorNo : " + session.getAttribute("No")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorAge : " + session.getAttribute("professorAge")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorDetailAddress : " + session.getAttribute("professorDetailAddress")); // 값 출력되는지 확인
			log.debug(TeamColor.JJY + "professorRegiNo : " + session.getAttribute("professorRegiNo")); // 값 출력되는지 확인
			
			// Header사진셀렉
			List<Map<String, Object>> professorOne = professorService.getProfessorImg(professorNo);
			log.debug(TeamColor.JJY +"professorImg값 : "+professorOne);
			model.addAttribute("professorOne",professorOne);
			log.debug(TeamColor.JJY +"professorImgModel : " + model);

			// 교수의 나의 강의리스트 get을 위한 서비스 실행 ( 로그인 주체에 따른 사이드바 구분을 위함 )
			List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf(professorLogin.getProfessorNo());

			// 서비스실행 결과물을 model에 저장 & 디버깅으로 확인
			model.addAttribute("myRegisterListProf", myRegisterListProf);
			log.debug(TeamColor.KHW + myRegisterListProf);
			
			//professorImg에 넣어주기
			List<Map<String,Object>> professorImg = professorService.getProfessorImg(professorNo);
			
			//professorImg에 값 저장해주기
			model.addAttribute("professorImg", professorImg);

			log.debug(TeamColor.LJE + "ProfessorController professorLogin professorImg : " + professorImg);
			
			
			
			//교수 시간표 : 월
			Map<String, Object> Mon1 = timetableService.getProfessorTimeTableMon(professorNo);
			
			model.addAttribute("Mon", Mon1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 월요일 수업 값 확인 : " + Mon1);
			
			
			//교수 시간표 : 화
			Map<String, Object> Tue1 = timetableService.getProfessorTimeTableTue(professorNo);
			
			model.addAttribute("Tue", Tue1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 화요일 수업 값 확인 : " + Tue1);
			
			
			//교수 시간표 : 수
			Map<String, Object> Wed1 = timetableService.getProfessorTimeTableWed(professorNo);
			
			model.addAttribute("Wed", Wed1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 수요일 수업 값 확인 : " + Wed1);
			
			
			//교수 시간표 : 목
			Map<String, Object> Thu1 = timetableService.getProfessorTimeTableThu(professorNo);
			
			model.addAttribute("Thu", Thu1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 목요일 값 확인 : " + Thu1);
			
			
			//교수 시간표 : 금
			Map<String, Object> Fri1 = timetableService.getProfessorTimeTableFri(professorNo);
			
			model.addAttribute("Fri", Fri1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 금요일 값 확인 : " + Fri1);
			
			
			
			
			result = "/home";
		}
		return result;
	}
	
	// 아이디 중복검사
			@RequestMapping(value = "/professorNoChk", method = RequestMethod.POST)
			@ResponseBody
			public String professorNoChkPOST(int professorNo) throws Exception {

				log.debug(TeamColor.CSJ + "professorNoChkPOST() 진입");

				int result = professorService.professorNoCheck(professorNo);

				log.debug(TeamColor.CSJ + "professorNoChkPOST() 진입 : " + result);

				if (result != 0) {
					return "fail"; // 중복아이디가 존재
				} else {
					return "success";
				}

			}

	// 교수회원가입 form
	@GetMapping("/professor/signupProfessorForm")
	public String addProfessor(Model model) {
		log.debug(TeamColor.JJY + "ProfessorController addProfessor get실행");

		List<Map<String, Object>> majorList = majorService.getMajorList();
		model.addAttribute("majorList", majorList); // 회원가입할때 학과추가 select로

		log.debug(TeamColor.JJY + "ProfessorController addProfessor의 model:" + majorList);

		return "/professor/signupProfessorForm";
	}

	// 교수회원가입 action
	@PostMapping("/professor/signupProfessorForm")
	public String addProfessor(Professor professor, Model model) {

		int insertProfessor = professorService.addProfessor(professor);
		model.addAttribute("addProfessor", insertProfessor);

		log.debug(TeamColor.JJY + "ProfessorController addProfessor post실행");

		return "loginForm";
	}

	// 교수상세보기
	@GetMapping("/getProfessorOne")
	public String ProfessorOne(Professor professor, Model model, HttpServletRequest request,
			@RequestParam("professorNo") int professorNo, HttpSession session) {

		log.debug(TeamColor.JJY + "ProfessorController ProfessorOne Get실행");

		List<Map<String, Object>> professorOne = professorService.getProfessorOne(professorNo);
		model.addAttribute("professorOne", professorOne);
		log.debug(TeamColor.JJY + "professorOne : " + professorOne);
		
		//professorImg에 넣어주기
		List<Map<String,Object>> professorImg = professorService.getProfessorImg(professorNo);
		
		//professorImg에 값 저장해주기
		model.addAttribute("professorImg", professorImg);

		log.debug(TeamColor.LJE + "ProfessorController getProfessorOne professorImg : " + professorImg);
		
		
		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);
		
		log.debug(TeamColor.LJE + "ProfessorController ProfessorOne myRegisterListProf : " + myRegisterListProf);		
		
		
		return "/professor/getProfessorOne";
	}

	// 교수정보수정 Form
	@GetMapping("/professor/modifyProfessor")
	public String modifyProfessor(Model model, int professorNo, HttpSession session) {

		log.debug(TeamColor.JJY + "modifyProfessor Get실행");

		// 수정할때 폼에 띄워줄거기때문에 상세보기 내역 불러오기
		List<Map<String, Object>> professorOne = professorService.getProfessorOne(professorNo);

		model.addAttribute("professorOne", professorOne);
		log.debug(TeamColor.JJY + "model professor값 확인 : " + professorOne);
		
		//professorImg에 넣어주기
		List<Map<String,Object>> professorImg = professorService.getProfessorImg(professorNo);
		
		//professorImg에 값 저장해주기
		model.addAttribute("professorImg", professorImg);

		log.debug(TeamColor.LJE + "ProfessorController modifyProfessor professorImg : " + professorImg);

		
		// 교수의 강의리스트 확인
		List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

		// myRegisterListProf확인
		model.addAttribute("myRegisterListProf", myRegisterListProf);
		
		log.debug(TeamColor.LJE + "ProfessorController modifyProfessor myRegisterListProf : " + myRegisterListProf);		
		
		
		
		return "/professor/modifyProfessor";
	}

	// 교수정보수정 Action
	@PostMapping("/modifyProfessor")
	public String modifyProfessor(HttpServletRequest request, Professor professor, Model model) {

		// 디버깅
		log.debug(TeamColor.JJY + "modifyProfessor 실행");

		HttpSession session = request.getSession();

		// service실행
		professorService.modifyProfessor(professor);
		session.setAttribute("Name", professor.getProfessorName());
		String redirectUrl = "redirect:/getProfessorOne?professorNo=" + professor.getProfessorNo();
		return redirectUrl;
	}

	// 교수사진등록하기 (Form)
	@GetMapping("/professor/addProfessorImgForm")
	public String addProfessorImg(Model model) {
		log.debug(TeamColor.JJY + "[Controller] addProfessorImg get실행");

		return "/professor/addProfessorImgForm";
	}

	// 교수사진등록하기 (Action) 첨부파일 업로드
	@PostMapping("/addProfessorImg")
	public String addProfessorImg(MultipartFile imgFile, HttpServletRequest request, Professor professor) {

		// log.debug(TeamColor.JJY + "ProfessorController addProfessorImg post실행");

		HttpSession session = request.getSession();

		String fileRealName = imgFile.getOriginalFilename(); // 파일명을 나타내줌
		long size = imgFile.getSize(); // 파일사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);

		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

		String uploadFolder = request.getSession().getServletContext().getRealPath("/images/userprofile/");
		System.out.print(uploadFolder);

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열 : " + uniqueName);
		System.out.println("확장자명 : " + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전

		ProfessorImg professorImg = new ProfessorImg();

		professorImg.setProfessorNo((int) session.getAttribute("No"));
		professorImg.setContentType(fileExtension); // 확장자
		professorImg.setFileName(uniqueName);
		professorImg.setOriginFileName(fileRealName);

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		try {
			imgFile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			professorService.addProfessorImg(professorImg);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.print(professor.getProfessorNo());
		String redirectUrl = "redirect:/getProfessorOne?professorNo=" + professor.getProfessorNo();
		return redirectUrl;
	}

	// 교수목록
	@GetMapping("/professor/professorList")
	public String professorList(Model model) {

		log.debug(TeamColor.JJY + "ProfessorController professorList실행");

		List<Map<String, Object>> professorList = professorService.getProfessorList();

		model.addAttribute("professorList", professorList);
		log.debug(TeamColor.JJY + "professorList값 : " + professorList);

		return "/professor/professorList";
	}
	
	 // 교수사진수정하기 (Form)
	@GetMapping("/professor/modifyProfessorImg")
	public String modifyProfessorImg(Model model) {
		System.out.println("modifyProfessorImgForm실행");
		
		return "/professor/modifyProfessorImg";
	}

	// 교수사진수정하기 (Action) 첨부파일 업로드
	@PostMapping("/modifyProfessorImg")
	public String modifyProfessorImg(MultipartFile imgFile, HttpServletRequest request, Professor professor) {

		 log.debug(TeamColor.JJY + "ProfessorController modifyProfessorImg post실행");

		HttpSession session = request.getSession();

		String fileRealName = imgFile.getOriginalFilename(); // 파일명을 나타내줌
		long size = imgFile.getSize(); // 파일사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);

		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

		String uploadFolder = request.getSession().getServletContext().getRealPath("/images/userprofile/");
		System.out.print(uploadFolder);

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열 : " + uniqueName);
		System.out.println("확장자명 : " + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전

		ProfessorImg professorImg = new ProfessorImg();

		professorImg.setProfessorNo((int) session.getAttribute("No"));
		professorImg.setContentType(fileExtension); // 확장자
		professorImg.setFileName(uniqueName);
		professorImg.setOriginFileName(fileRealName);

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		try {
			imgFile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			professorService.modifyProfessorImg(professorImg);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.print(professor.getProfessorNo());
		String redirectUrl = "redirect:/getProfessorOne?professorNo=" + professor.getProfessorNo();
		return redirectUrl;
	}
}
