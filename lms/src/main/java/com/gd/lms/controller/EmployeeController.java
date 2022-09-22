package com.gd.lms.controller;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.vo.Employee;
import com.gd.lms.vo.EmployeeImg;
import com.gd.lms.vo.ProfessorImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeservice;

	// 교수사진등록하기 (Form)
	@GetMapping("/employee/addEmployeeImgForm")
	public String addEmployeeImg(Model model) {
		log.debug(TeamColor.CSJ + "employeeController.addEmployeeImg form");
		
		return "/employee/addEmployeeImgForm";
	}

	// 교수사진등록하기 (Action) 첨부파일 업로드
	@PostMapping("/addEmployeeImg")
	public String addEmployeeImg(EmployeeImg employeeImg, Model model, MultipartFile[] uploadFile) {

		log.debug(TeamColor.JJY + "employeeController.addEmployeeImg action");

		return "/employee/getEmployeeOne";
	}

	// 관리자 목록보기 (총관리자)
	@GetMapping("/employee/employeeList")
	public String employeeList(Model model) {

		log.debug(TeamColor.CSJ + "employeeController.employeeList실행");

		List<Map<String, Object>> employeeList = employeeservice.getEmployeeList();

		model.addAttribute("employeeList", employeeList);
		log.debug(TeamColor.CSJ + ("employeeController.employeeList : " + employeeList));

		return "/employee/employeeList";
	}

	// 관리자 정보수정 action
	@PostMapping("/modifyEmployee")
	public String modifyEmployee(Employee employee, Model model) {

		int row = employeeservice.modifyEmployee(employee);

		log.debug(TeamColor.CSJ + "EmployeeController.modifyEmployee" + row);

		if (row == 0) {
			return "redirect:/employee/modifyEmployee";
		}

		return "redirect:/employee/getEmployeeOne";

	}

	// 관리자 정보수정 form
	@GetMapping("/modifyEmployee")
	public String modifyEmployee(Model model, @RequestParam(value = "No") int employeeNo) {

		List<Map<String, Object>> employee = employeeservice.getEmployeeOne(employeeNo);

		model.addAttribute("employeeOne", employee);

		log.debug(TeamColor.CSJ + "EmployeeController의 modifyEmployee:" + employee);

		return "modifyEmployeeAfterPass";

	}

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
		List<Map<String, Object>> employeeOneAfterPass = employeeservice.getEmployeeOneAfterPass(employee);

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

		List<Map<String, Object>> employeeOne = employeeservice.getEmployeeOne(employeeNo);

		log.debug(TeamColor.CSJ + "EmployeeController의 employeeOne" + employeeOne);

		return "/employee/getEmployeeOne";

	}

	// 관리자회원가입 form
	@GetMapping("/employee/signupEmployeeForm")
	public String addEmployee() {

		log.debug(TeamColor.CSJ + "EmployeeController의 addEmployee get");

		return "/employee/signupEmployeeForm";
	}

	// 관리자회원가입 action
	@PostMapping("/addEmployee")
	public String addEmployee(Employee employee, Model model) {

		int row = employeeservice.addEmployee(employee);
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

		Employee loginEmployee = employeeservice.loginEmployee(employee);

		model.addAttribute("employeeId", loginEmployee);

		log.debug(TeamColor.CSJ + "EmployeeController의 loginEmployee model:" + model);
		log.debug(TeamColor.CSJ + "EmployeeController의 loginEmployee loginEmployee:" + loginEmployee);

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
