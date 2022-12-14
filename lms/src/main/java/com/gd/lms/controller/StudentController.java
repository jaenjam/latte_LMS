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

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.MajorService;
import com.gd.lms.service.NoticeService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.StudentService;
import com.gd.lms.service.TimeTableService;
import com.gd.lms.vo.Student;
import com.gd.lms.vo.StudentImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired MajorService majorService;
	@Autowired RegisterService registerService;
	@Autowired NoticeService noticeService;
	@Autowired TimeTableService timetableService;
	
	// 학생 회원가입 form
	@GetMapping("/student/signupStudentForm")
	public String addStudent(Model model) {
		
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "StudentController의 회원가입폼 진입");
		
		// major_no용 리스트
		List<Map<String,Object>> majorList = majorService.getMajorList();
		// model에 저장하기
		model.addAttribute("majorList",majorList);

		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 majorList:" +majorList);
		
		return "/student/signupStudentForm";
	}
	
	
	// 학생 회원가입 action
	@PostMapping("/student/signupStudentForm")
	public String addStudent(Student student, Model model ) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "StudentController의 회원가입액션 진입");
		
		//  ┌그 값을 담음		 ┌서비스에 메서드를 실행시킴
		int insertStudent = studentService.addStudent(student);
		// model에 해당 값을 저장
		model.addAttribute("addStudent", insertStudent);
		
		// 디버깅
		log.debug(TeamColor.KHW+ "StudentController의 addStudent의 model:" +model);
		return "loginForm";		
	}
	
	
	// 아이디 중복검사
	@RequestMapping(value = "/studentNoChk", method = RequestMethod.POST)
	@ResponseBody
	public String studentNoChkPOST(int studentNo) throws Exception{
		
		log.debug(TeamColor.KHW+ "studentNoChkPOST() 진입");
		
		int result = studentService.studentNoCheck(studentNo);
		
		log.debug(TeamColor.KHW+ "studentNoChkPOST() 진입 : " + result);
		
		
		if(result !=0) {
			return "fail"; // 중복아이디가 존재
		} else {
			return "success";
		}
		
	} 
	
		
	
	// 학생 로그인 action
	@PostMapping("/StudentForm")
	public String loginstudent(Student student, Model model, HttpServletRequest request, @RequestParam("studentNo") int studentNo) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "StudentController의 학생로그인액션 진입");
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();	
		
		// 서비스의 getStudent 실행
		Student loginstudent = studentService.getStudent(student);
		
		// model에 저장하기
		model.addAttribute("StudentId", loginstudent);

		
		// 디버깅
		//${StudentId.studentNo}
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 model:" +model);
		log.debug(TeamColor.KHW+ "StudentController의 loginstudent의 loginstudent:" +loginstudent);
		
		
		//noticeList최근 5개를 List에 담아준다.
		List<Map<String, Object>> noticeListTop = noticeService.selectNoticeListTop();
		
		//꺼내서 쓸수 있게 model에 넣어준다.
		model.addAttribute("noticeListTop", noticeListTop);
		
		//디버깅코드 재확인
		log.debug(TeamColor.LJE + "StudentController loginstudent noticeListTop : " + noticeListTop);
		
		
		//studentImg에 넣어주기
		List<Map<String, Object>> studentImg = studentService.getStudentImg(studentNo);
		
		model.addAttribute("studentImg", studentImg);
		
		log.debug(TeamColor.LJE + "StudentController getStudentOne studentImg : " + studentImg);
		
	
		if (loginstudent == null) { // 로그인시 null값이면 >>> 쿼리에서 맞는 값을 찾지 못했다면
			log.debug(TeamColor.KHW +"로그인 실패");
			return "loginForm";	// 로그인화면으로
			
		} else {// 로그인시 null값이 아니라면 >>> 쿼리에서 맞는 값을 찾았다면
			
			// 로그인정보 세션에 저장하기
					session.setAttribute("No", loginstudent.getStudentNo() );
			
					session.setAttribute("Name", loginstudent.getStudentName() );
					
					session.setAttribute("studentMajor", loginstudent.getMajorNo() );
					
					session.setAttribute("studentRegiNo", loginstudent.getStudentRegiNo() );
					 
					session.setAttribute("studentAge", loginstudent.getStudentAge() );
					   
					session.setAttribute("studentGender", loginstudent.getStudentGender() );
					  
					session.setAttribute("studentTelephone", loginstudent.getStudentTelephone());
					 
					session.setAttribute("studentEmail", loginstudent.getStudentEmail() );
					 
					session.setAttribute("studentAddress", loginstudent.getStudentAddress() );
					  
					session.setAttribute("studentDetailAddress",
					 loginstudent.getStudentDetailAddress() );

					session.setAttribute("studentState", loginstudent.getStudentState() );
	
					session.setAttribute("user", "student");
			
					
					//학생 시간표 : 월
					Map<String, Object> Mon = timetableService.getStudentTimeTableMon(loginstudent.getStudentNo());
					
					model.addAttribute("Mon", Mon);
					
					log.debug(TeamColor.LJE + "StudentController loginstudent studentTimeTable 월요일 수업 값 확인 : " + Mon);
					
					
					//학생 시간표 : 화
					Map<String, Object> Tue = timetableService.getStudentTimeTableTue(loginstudent.getStudentNo());
					
					model.addAttribute("Tue", Tue);
					
					log.debug(TeamColor.LJE + "StudentController loginstudent studentTimeTable 화요일 수업 값 확인 : " + Tue);
					
					
					//학생 시간표 : 수
					Map<String, Object> Wed = timetableService.getStudentTimeTableWed(loginstudent.getStudentNo());
					
					model.addAttribute("Wed", Wed);
					
					log.debug(TeamColor.LJE + "StudentController loginstudent studentTimeTable 수요일 수업 값 확인 : " + Wed);
					
					
					//학생 시간표 : 목
					Map<String, Object> Thu = timetableService.getStudentTimeTableThu(loginstudent.getStudentNo());
					
					model.addAttribute("Thu", Thu);
					
					log.debug(TeamColor.LJE + "StudentController loginstudent studentTimeTable 목요일 값 확인 : " + Thu);
					
					
					//학생 시간표 : 금
					Map<String, Object> Fri = timetableService.getStudentTimeTableFri(loginstudent.getStudentNo());
					
					model.addAttribute("Fri", Fri);
					
					log.debug(TeamColor.LJE + "StudentController loginstudent studentTimeTable 금요일 값 확인 : " + Fri);
					
					
					
					// 학생의 나의강의실 리스트 get을 위한 서비스 실행 ( 로그인 주체에 따른 사이드바 구분을 위함)					
				
					List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList(loginstudent.getStudentNo());
					
					// 서비스실행 결과물을 model에 저장 & 디버깅으로 확인
					model.addAttribute("myRegisterListStu", myRegisterListStu);
					//log.debug(TeamColor.KHW + myRegisterListStu);
					
		
					
					// 디버깅
					log.debug(TeamColor.KHW + myRegisterListStu);
					log.debug(TeamColor.KHW + session.getAttribute("studentMajor")); // 세션에 값 저장되는지 확인용으로 랜덤 하나	
					log.debug(TeamColor.KHW + session.getAttribute("studentNo"));
					
					log.debug(TeamColor.KHW + session.getAttribute("studentRegiNo"));
					log.debug(TeamColor.KHW + session.getAttribute("studentAddress"));
					log.debug(TeamColor.KHW + session.getAttribute("studentState"));
					log.debug(TeamColor.KHW + session.getAttribute("user"));
					log.debug(TeamColor.KHW +"로그인 성공");
					return "home"; // 성공시 main이동
		}
	}
	
	
	// 학생정보 상세보기 FORM (비밀번호입력전)
	@GetMapping("/getStudentOne") 
	public String getStudentOne(Student student
			, Model model
			, HttpServletRequest request
			, @RequestParam("studentNo") int studentNo) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW+ "StudentController의 학생정보상세보기 폼 진입");
		
		List<Map<String, Object>> studentOne = studentService.getStudentOne(studentNo);
		
		model.addAttribute("studentOne", studentOne);
		
		//디버그
		log.debug(TeamColor.KHW + "studentOne : " + studentOne);
		
		//studentImg에 넣어주기
		List<Map<String, Object>> studentImg = studentService.getStudentImg(studentNo);
		
		model.addAttribute("studentImg", studentImg);
		
		log.debug(TeamColor.LJE + "StudentController getStudentOne studentImg : " + studentImg);
		
		
		//사이드 바(학생 수강 중인 강의 리스트 출력)
		List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList(studentNo);
		
		//model myRegisterListStu에 저장
		model.addAttribute("myRegisterListStu", myRegisterListStu);
		
		log.debug(TeamColor.LJE + "StudentController getStudentOne myRegisterListStu : " + myRegisterListStu);
		
		//디버그
		log.debug(TeamColor.KHW +model);
		log.debug(TeamColor.KHW +studentNo);
		
		return "/student/getStudentOne";
	}
	
	
	//학생정보수정 Form
	@GetMapping("/student/modifyStudent")
	public String modifyStudent(Model model, int studentNo) {
		
		log.debug(TeamColor.LJE + "StudentController modifyStudent Form 실행");
		
		//수정하기 폼에 띄울 상세정보 가져오기
		List<Map<String, Object>> studentOne = studentService.getStudentOne(studentNo);
		
		//studentOne
		model.addAttribute("studentOne", studentOne);
		
		log.debug(TeamColor.LJE + "StudentController model studentOne값 확인 : " + studentOne);
		
		
		//studentImg에 넣어주기
		List<Map<String, Object>> studentImg = studentService.getStudentImg(studentNo);
		
		model.addAttribute("studentImg", studentImg);
		
		log.debug(TeamColor.LJE + "StudentController modifyStudent studentImg : " + studentImg);
		
		
		
		//사이드 바(학생 수강 중인 강의 리스트 출력)
		List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList(studentNo);
		
		//model myRegisterListStu에 저장
		model.addAttribute("myRegisterListStu", myRegisterListStu);
		
		log.debug(TeamColor.LJE + "StudentController modifyStudent myRegisterListStu : " + myRegisterListStu);
		
		
		
		return "/student/modifyStudent";
	}
	
	//학생정보수정 Action
	@PostMapping("/modifyStudent")
	public String modifyStudent(HttpServletRequest request, Student student, Model model) {
		
		//디버깅
		log.debug(TeamColor.LJE + "StudentController modifyStudent Action 실행");
		
		HttpSession session = request.getSession();
		
		//service 실행
		studentService.modifyStudent(student);
		
		session.setAttribute("Name", student.getStudentName());
		
		return "redirect:/getStudentOne?studentNo=" + student.getStudentNo();
	}
	
	//학생사진등록하기 (Form)
	@GetMapping("/student/addStudentImgForm")
	public String addStudentImg(Model model) {
		log.debug(TeamColor.LJE + "StudentController addStudentImgForm 실행");
		
		return "/student/addStudentImgForm";
	}
	
	//학생사진등록하기 (Action) 첨부파일 업로드
	@PostMapping("/addStudentImg")
	public String addStudentImg(MultipartFile imgFile, HttpServletRequest request, Student student) {
		
		log.debug(TeamColor.LJE + "StudentController addStudentImg 실행");
		
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

		StudentImg studentImg = new StudentImg();

		studentImg.setStudentNo((int) session.getAttribute("No"));
		studentImg.setContentType(fileExtension); // 확장자
		studentImg.setFilename(uniqueName);
		studentImg.setOriginFilename(fileRealName);

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		try {
			imgFile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			studentService.addStudentImg(studentImg);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.print(student.getStudentNo());
		
		return "redirect:/getStudentOne?studentNo=" + student.getStudentNo();
		
	}
	/*
	// 학생정보 수정전 비밀번호확인 FORM
	@GetMapping("/modifyStudentPass")
	public String pageLock() {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"StudentController의 학생정보 수정을 위한 비밀번호 확인 폼 진입");
		
		return "/student/modifyStudentPass";
	}
	
	
	// 학생정보 수정전 비밀번호확인입력 Action
	@PostMapping("/modifyStudentPass")
	public String pageLock(Student student, Model model, HttpServletRequest request, @RequestParam("studentPass") String studentPass) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"StudentController의 학생정보 수정을 위한 비밀번호 확인 적용 액션");
		
		// 세션 사용하기위해 선언
		HttpSession session =  request.getSession();		
		
		// 이전페이지에서 입력된 비밀번호와 히든으로 넘겨받은 아이디를 입력받아 쿼리 실행시킨 것을 담기
		List<Map<String, Object>> studentOneAfterPass= studentService.getStudentOneAfterPass(student);
		
		// 디버그
		log.debug(TeamColor.KHW +studentOneAfterPass);
		
		// 모델에 담기
		model.addAttribute("studentOneAfterPass", studentOneAfterPass);
		
		// 디버그
		log.debug(TeamColor.KHW + "model에 저장된 studentOneAfterPass" + studentOneAfterPass);
		
	
		// 다음 페이지에서 비번 넘기기를 위해 입력한 값중 비밀번호만 model에서 골라내기
		List<String> studentPasss = new ArrayList<String>();
		for(Map<String, Object> data : studentOneAfterPass) {
			studentPasss.add((String) data.get("studentPass"));
		}
		
		// 골라낸 비밀번호를 세션에 저장
		session.setAttribute("studentPass", (studentPasss));
		
		// 디버그
		log.debug(TeamColor.KHW + "session에 저장된 studentPass " + studentPass);
		
		
		return "/student/getStudentOneAfterPass";
	}
	
	
	// 학생정보 상세보기 수정 FORM(비밀번호 입력 후 폼)
	@PostMapping("/student/getStudentOneAfterPass")
	public String modifyStudentOne(Student student, Model model) {
		// 해당 컨트롤러 진입여부 확인
		log.debug(TeamColor.KHW +"StudentController의 학생정보 수정 액션 진입");
		
		return "home"; // 성공시 main 이동
	}
	*/
	
	@GetMapping("/student/studentMyPage")
	public String studentMyPage(Model model, int studentNo) {
		
		//나의정보 : 기본(학생)
		List<Map<String, Object>> studentInfo = studentService.getStudentInfo(studentNo);
		
		//studentInfo model 값 저장해주기
		model.addAttribute("studentInfo", studentInfo);
		
		log.debug(TeamColor.LJE + "StudentController studentMyPage studentInfo : " + studentInfo);
		
		
		
		
		//학생이 수강중인 과목
		List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList(studentNo);
		
		//model myRegisterListStu에 저장
		model.addAttribute("myRegisterListStu", myRegisterListStu);
		
		log.debug(TeamColor.LJE + "StudentController studentMyPage myRegisterListStu : " + myRegisterListStu);
		
		
		return "/student/studentMyPage";
	}
	
	// 학생 사진 수정하기 (Form)
	@GetMapping("/student/modifyStudentImg")
	public String modifyStudentImg(Model model) {
		log.debug(TeamColor.LJE + "modifyStudentImg 실행");
		
		return "/student/modifyStudentImg";
	}
	
	//학생사진 수정하기 (Action) 첨부파일 업로드
	@PostMapping("/modifyStudentImg")
	public String modifyStudentImg(MultipartFile imgFile, HttpServletRequest request, Student student) {
	
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg 실행");
		
		HttpSession session = request.getSession();
		
		//파일명
		String fileRealName = imgFile.getOriginalFilename();
		
		//파일 사이즈
		long size = imgFile.getSize();
		
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg fileRealName : " + fileRealName);
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg size : " + size);
		
		//확장자(fileType)
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
		
		String uploadFolder = request.getSession().getServletContext().getRealPath("/images/userprofile/");
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg uploadFolder : " + uploadFolder);
		
		UUID uuid = UUID.randomUUID();
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg uuid : " + uuid.toString());
		
		String [] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg uniqueName : " + uniqueName);
		log.debug(TeamColor.LJE + "StudentController modifyStudentImg fileExtendsion : " + fileExtension);
		
		StudentImg studentImg = new StudentImg();
		
		studentImg.setStudentNo((int)session.getAttribute("No"));
		studentImg.setContentType(fileExtension);
		studentImg.setFilename(uniqueName);
		studentImg.setOriginFilename(fileRealName);
		
		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);
		
		try {
			//img파일을 변환해서 넣어준다.
			imgFile.transferTo(saveFile);
			studentService.modifyStudentImg(studentImg);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/getStudentOne?studentNo=" + student.getStudentNo();
	}
	
}
