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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.service.NoticeService;
import com.gd.lms.vo.Employee;
import com.gd.lms.vo.EmployeeImg;
import com.gd.lms.vo.Student;
import com.gd.lms.vo.StudentImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	@Autowired NoticeService noticeService;

	// 교수사진등록하기 (Form)
	@GetMapping("/employee/addEmployeeImgForm")
	public String addEmployeeImg(Model model) {
		log.debug(TeamColor.CSJ + "employeeController.addEmployeeImg form");

		return "/employee/addEmployeeImgForm";
	}

	// 교수사진등록하기 (Action) 첨부파일 업로드
	@PostMapping("/addEmployeeImg")
	public String addEmployeeImg(MultipartFile imgFile, HttpServletRequest request, Employee employee) {

		log.debug(TeamColor.LJE + "EmployeeController addEmployeeImg 실행");
		
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

		EmployeeImg employeeImg = new EmployeeImg();

		employeeImg.setEmployeeNo((int) session.getAttribute("No"));
		employeeImg.setContentType(fileExtension); // 확장자
		employeeImg.setFilename(uniqueName);
		employeeImg.setOriginFilename(fileRealName);

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		try {
			imgFile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			employeeService.addEmployeeImg(employeeImg);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.print(employee.getEmployeeNo());
		
		return "redirect:/getEmployeeOne?employeeNo=" + employee.getEmployeeNo();
	}

	// 관리자 목록보기 (총관리자)
	@GetMapping("/employee/employeeList")
	public String employeeList(Model model) {

		log.debug(TeamColor.CSJ + "employeeController.employeeList실행");

		List<Map<String, Object>> employeeList = employeeService.getEmployeeList();

		model.addAttribute("employeeList", employeeList);
		log.debug(TeamColor.CSJ + ("employeeController.employeeList : " + employeeList));

		return "/employee/employeeList";
	}

	// 관리자 정보수정 form
	@GetMapping("/employee/modifyEmployee")
	public String modifyEmployee(Model model, int employeeNo) {

		log.debug(TeamColor.LJE + "EmployeeController modifyEmployee 실행");
		
		List<Map<String, Object>> employeeOne = employeeService.getEmployeeOne(employeeNo);

		model.addAttribute("employeeOne", employeeOne);

		log.debug(TeamColor.CSJ + "EmployeeController의 modifyEmployee:" + employeeOne);

		//employeeImg에 넣어주기
		List<Map<String, Object>> employeeImg = employeeService.getEmployeeImg(employeeNo);
		
		//employeeImg에 값 저장해주기
		model.addAttribute("employeeImg", employeeImg);
		
		log.debug(TeamColor.LJE + "EmployeeController modifyEmployee model값 출력 : " + model);
		
		return "/employee/modifyEmployee";

	}

	// 관리자 정보수정 action
	@PostMapping("/modifyEmployee")
	public String modifyEmployee(HttpServletRequest request, Employee employee, Model model) {

		//디버깅
		log.debug(TeamColor.LJE + "modifyEmployee 실행");
		
		HttpSession session = request.getSession();
		
		//service실행하기
		employeeService.modifyEmployee(employee);
		
		session.setAttribute("Name", employee.getEmployeeName());

		return "redirect:/getEmployeeOne?employeeNo="+employee.getEmployeeNo();

	}
	
	//관리자상세보기
	@GetMapping("/getEmployeeOne")
	public String EmployeeOne(Employee employee, Model model, HttpServletRequest request,
			@RequestParam("employeeNo") int employeeNo) {
		
		log.debug(TeamColor.LJE + "EmployeeController employeeOne 실행");
		
		List<Map<String, Object>> employeeOne = employeeService.getEmployeeOne(employeeNo);
		
		model.addAttribute("employeeOne", employeeOne);
		
		log.debug(TeamColor.LJE + "EmployeeController employeeOne : " + employeeOne);
		
		//employeeImg에 넣어주기
		List<Map<String,Object>> employeeImg = employeeService.getEmployeeImg(employeeNo);
		
		//employeeImg에 값 저장해주기
		model.addAttribute("employeeImg", employeeImg);
		
		log.debug(TeamColor.LJE + "EmployeeController getEmployeeImg employeeImg : " + employeeImg);
		
		
		return "/employee/getEmployeeOne";
	}
	
	
	/*
	
	// 관리자 정보 수정 전 비밀번호 확인 form
	@GetMapping("/modifyEmployeePass")
	public String pageLock() {

		log.debug(TeamColor.CSJ + "비밀번호확인 form 으로 이동");
		return "/employee/modifyEmployeePass";
	}

	// 관리자 정보 수정 전 비밀번호 확인 Action
	@PostMapping("/modifyEmployeePass")
	public String pageLock(Employee employee, Model model, HttpServletRequest request,
			@RequestParam(value = "employeePass", required = false) String employeePass) {

		log.debug(TeamColor.CSJ + "비밀번호확인 적용 액션");

		// 이전페이지에서 입력된 비밀번호와 히든으로 넘겨받은 아이디를 입력받아 쿼리 실행시킨 것을 담기
		List<Map<String, Object>> employeeOneAfterPass = employeeService.getEmployeeOneAfterPass(employee);

		// 디버그
		log.debug(TeamColor.CSJ + employeeOneAfterPass);

		// 모델에 담기
		model.addAttribute("studentOneAfterPass", employeeOneAfterPass);

		// 디버그
		log.debug(TeamColor.CSJ + model);

		return "/employee/getEmployeeOneAfterPass";
	}

	// 관리자 정보 상세보기(수정 전)
	@GetMapping("/getEmployeeOne")
	public String getEmployeeOne(HttpServletRequest request, @RequestParam("No") int employeeNo, Model model) {

		List<Map<String, Object>> employeeOne = employeeService.getEmployeeOne(employeeNo);

		log.debug(TeamColor.CSJ + "EmployeeController의 employeeOne" + employeeOne);

		return "/employee/getEmployeeOne";

	}
 */
	// 아이디 중복검사
	@RequestMapping(value = "/employeeNoChk", method = RequestMethod.POST)
	@ResponseBody
	public String employeeNoChkPOST(int employeeNo) throws Exception {

		log.debug(TeamColor.CSJ + "employeeNoChkPOST() 진입");

		int result = employeeService.employeeNoCheck(employeeNo);

		log.debug(TeamColor.CSJ + "employeeNoChkPOST() 진입 : " + result);

		if (result != 0) {
			return "fail"; // 중복아이디가 존재
		} else {
			return "success";
		}

	}
	
	
	// 관리자회원가입 form
	@GetMapping("/employee/signupEmployeeForm")
	public String addEmployee() {

		log.debug(TeamColor.CSJ + "EmployeeController의 addEmployee get");

		return "/employee/signupEmployeeForm";
	}

	// 관리자회원가입 action
	@PostMapping("/employee/signupEmployeeForm")
	public String addEmployee(Employee employee, Model model) {

		int row = employeeService.addEmployee(employee);
		model.addAttribute("addemployee", row);

		log.debug(TeamColor.CSJ + "EmployeeController의 addEmployee post:" + model);

		// 실패시에 입력폼으로 리다이렉트
		if (row == 0) {
			return "redirect:/employee/signupEmployeeForm";
		}
		// 해당하는 뷰 페이지로 이동
		return "redirect:/loginForm";
	}

	// 관리자로그인 action
	@PostMapping("/EmployeeForm")
	public String loginEmployee(Employee employee, Model model, HttpServletRequest request) {

		// 세션 사용하기위해 선언
		HttpSession session = request.getSession();

		Employee loginEmployee = employeeService.loginEmployee(employee);

		model.addAttribute("employeeId", loginEmployee);

		log.debug(TeamColor.CSJ + "EmployeeController의 loginEmployee model:" + model);
		log.debug(TeamColor.CSJ + "EmployeeController의 loginEmployee loginEmployee:" + loginEmployee);

		
		//noticeList최근 5개를 List에 담아준다.
		List<Map<String, Object>> noticeListTop = noticeService.selectNoticeListTop();
		
		//꺼내서 쓸수 있게 model에 넣어준다.
		model.addAttribute("noticeListTop", noticeListTop);
		
		//디버깅코드 재확인
		log.debug(TeamColor.LJE + "EmployeeController loginEmployee noticeListTop : " + noticeListTop);
		
		
		// 계정 정보가 없으면 로그인 실패
		if (loginEmployee == null) {
			log.debug(TeamColor.CSJ + "EmployeeController.login : " + "로그인 실패");

			return "/loginForm";

		} else {
			session.setAttribute("No", loginEmployee.getEmployeeNo());
			session.setAttribute("employeePass", loginEmployee.getEmployeePass());
			session.setAttribute("Name", loginEmployee.getEmployeeName());
			session.setAttribute("employeeRegiNo", loginEmployee.getEmployeeRegiNo());
			session.setAttribute("employeeAge", loginEmployee.getEmployeeAge());
			session.setAttribute("employeeGender", loginEmployee.getEmployeeGender());
			session.setAttribute("employeeTelephone", loginEmployee.getEmployeeTelephone());
			session.setAttribute("employeeEmail", loginEmployee.getEmployeeEmail());
			session.setAttribute("employeeAddress", loginEmployee.getEmployeeAddress());
			session.setAttribute("employeeDetailAddress", loginEmployee.getEmployeeDetailAddress());
			session.setAttribute("employeeActive", loginEmployee.getEmployeeActive());
			session.setAttribute("user", "employee");

			log.debug(TeamColor.CSJ + "EmployeeController.login :" + "로그인 성공");

			return "home";

		}
	}

}
