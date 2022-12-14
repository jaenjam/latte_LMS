package com.gd.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.service.EmployeeService;
import com.gd.lms.service.NoticeService;
import com.gd.lms.service.ProfessorService;
import com.gd.lms.service.RegisterService;
import com.gd.lms.service.StudentService;
import com.gd.lms.service.TimeTableService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Transactional
public class MainController {

	@Autowired ProfessorService professorService;
	@Autowired StudentService studentService;
	@Autowired EmployeeService employeeService;
	@Autowired NoticeService noticeService;
	@Autowired RegisterService registerService;
	@Autowired TimeTableService timetableService;
	
		// 상단 헤더 누를 시 메인접근
		@GetMapping("/home")
		public String gomain(HttpServletRequest request, Model model, int No) {
			// 해당컨트롤러 진입여부 확인
			log.debug(TeamColor.KHW +"메인 이동");
			
			// 세션 사용하기위해 선언
			HttpSession session =  request.getSession();	
			
////////////////////////////////////////////////////////////////////////////////////////////////////////			
			
			//noticeList최근 5개를 List에 담아준다.
			List<Map<String, Object>> noticeListTop = noticeService.selectNoticeListTop();
			
			//꺼내서 쓸수 있게 model에 넣어준다.
			model.addAttribute("noticeListTop", noticeListTop);
			
			//디버깅코드 재확인
			log.debug(TeamColor.LJE + "MainController gomain noticeListTop : " + noticeListTop);
			
////////////////////////////////////////////////////////////////////////////////////////////////////////			
			
			//professorImg에 넣어주기
			List<Map<String,Object>> professorImg = professorService.getProfessorImg(No);
			
			//professorImg에 값 저장해주기
			model.addAttribute("professorImg", professorImg);

			log.debug(TeamColor.LJE + "MainController gomain professorImg : " + professorImg);
			
////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			//studentImg에 넣어주기
			List<Map<String, Object>> studentImg = studentService.getStudentImg(No);
			
			model.addAttribute("studentImg", studentImg);
			
			log.debug(TeamColor.LJE + "MainController gomain studentImg : " + studentImg);
			
////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			//employeeImg에 넣어주기
			List<Map<String, Object>> employeeImg = employeeService.getEmployeeImg(No);
			
			//employeeImg에 값 저장해주기
			model.addAttribute("employeeImg", employeeImg);
			
			log.debug(TeamColor.LJE + "MainController gomain model값 출력 : " + model);

////////////////////////////////////////////////////////////////////////////////////////////////////////			
			
			//employeeCount에 넣어주기
			int employeeCount = employeeService.selectEmployeeCount();
			
			//employeeCount에 값 저장해주기
			model.addAttribute("employeeCount", employeeCount);
			
			log.debug(TeamColor.LJE + "MainController gomain employeeCount : " + employeeCount);
			
			
			//professorCount에 실행결과넣어주기
			int professorCount = professorService.professorCount();
			
			//professorCount에 값 넣어주기
			model.addAttribute("professorCount", professorCount);
			
			log.debug(TeamColor.LJE + "MainController gomain professorCount : " + professorCount);
			
			
			//studentCount에 실행결과넣어주기
			int studentCount = studentService.studentCount();
			
			//studentCount에 값 넣어주기
			model.addAttribute("studentCount", studentCount);
			
			log.debug(TeamColor.LJE + "MainController gomain studentCount : " + studentCount);
			
			
			//직원,교수,학생 수 총합
			model.addAttribute("total", employeeCount+professorCount+studentCount);
			
			// 직원/전체
			model.addAttribute("employeePer", (double)employeeCount/(employeeCount+professorCount+studentCount)*100);
			
			// 교수/전체
			model.addAttribute("professorPer", (double)professorCount/(employeeCount+professorCount+studentCount)*100);
			
			// 학생/전체
			model.addAttribute("studentPer", (double)studentCount/(employeeCount+professorCount+studentCount)*100);
			
////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			// 교수의 강의리스트 확인
			List<Map<String, Object>> myRegisterListProf = registerService.getMyRegisterListProf((int)session.getAttribute("No"));

			// myRegisterListProf확인
			model.addAttribute("myRegisterListProf", myRegisterListProf);
			
			log.debug(TeamColor.LJE + "SubjectApproveController getsubjectApproveMain myRegisterListProf : " + myRegisterListProf);

////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			//학생 시간표 : 월
			Map<String, Object> Mon = timetableService.getStudentTimeTableMon(No);
			
			model.addAttribute("Mon", Mon);
			
			log.debug(TeamColor.LJE + "MainController gomain studentTimeTable 월요일 수업 값 확인 : " + Mon);
			
			
			//학생 시간표 : 화
			Map<String, Object> Tue = timetableService.getStudentTimeTableTue(No);
			
			model.addAttribute("Tue", Tue);
			
			log.debug(TeamColor.LJE + "MainController gomain studentTimeTable 화요일 수업 값 확인 : " + Tue);
			
			
			//학생 시간표 : 수
			Map<String, Object> Wed = timetableService.getStudentTimeTableWed(No);
			
			model.addAttribute("Wed", Wed);
			
			log.debug(TeamColor.LJE + "MainController gomain studentTimeTable 수요일 수업 값 확인 : " + Wed);
			
			
			//학생 시간표 : 목
			Map<String, Object> Thu = timetableService.getStudentTimeTableThu(No);
			
			model.addAttribute("Thu", Thu);
			
			log.debug(TeamColor.LJE + "MainController gomain studentTimeTable 목요일 값 확인 : " + Thu);
			
			
			//학생 시간표 : 금
			Map<String, Object> Fri = timetableService.getStudentTimeTableFri(No);
			
			model.addAttribute("Fri", Fri);
			
			log.debug(TeamColor.LJE + "MainController gomain studentTimeTable 금요일 값 확인 : " + Fri);
			
			
////////////////////////////////////////////////////////////////////////////////////////////////////////			
			
			
			//교수 시간표 : 월
			Map<String, Object> Mon1 = timetableService.getProfessorTimeTableMon(No);
			
			model.addAttribute("Mon", Mon1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 월요일 수업 값 확인 : " + Mon1);
			
			
			//교수 시간표 : 화
			Map<String, Object> Tue1 = timetableService.getProfessorTimeTableTue(No);
			
			model.addAttribute("Tue", Tue1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 화요일 수업 값 확인 : " + Tue1);
			
			
			//교수 시간표 : 수
			Map<String, Object> Wed1 = timetableService.getProfessorTimeTableWed(No);
			
			model.addAttribute("Wed", Wed1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 수요일 수업 값 확인 : " + Wed1);
			
			
			//교수 시간표 : 목
			Map<String, Object> Thu1 = timetableService.getProfessorTimeTableThu(No);
			
			model.addAttribute("Thu", Thu1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 목요일 값 확인 : " + Thu1);
			
			
			//교수 시간표 : 금
			Map<String, Object> Fri1 = timetableService.getProfessorTimeTableFri(No);
			
			model.addAttribute("Fri", Fri1);
			
			log.debug(TeamColor.LJE + "MainController gomain professorTimeTable 금요일 값 확인 : " + Fri1);
			
			
////////////////////////////////////////////////////////////////////////////////////////////////////////			
							
			
			//사이드 바(학생 수강 중인 강의 리스트 출력)
			List<Map<String,Object>> myRegisterListStu = registerService.getMyRegisterList(No);
			
			//model myRegisterListStu에 저장
			model.addAttribute("myRegisterListStu", myRegisterListStu);
			
			log.debug(TeamColor.LJE + "MainController gomain myRegisterListStu : " + myRegisterListStu);
			
			
			if(session.getAttribute("user") !=null) {
				return "/home";
			} else {
				log.debug(TeamColor.KHW + "로그인 만료되었습니다!");				
			return "/loginForm";
			}
		}
}
