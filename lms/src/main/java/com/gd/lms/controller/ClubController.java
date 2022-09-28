package com.gd.lms.controller;

import java.io.UnsupportedEncodingException;

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
import com.gd.lms.service.ClubService;
import com.gd.lms.service.ProfessorService;
import com.gd.lms.service.StudentService;
import com.gd.lms.vo.Club;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ClubController {

	@Autowired
	ClubService clubService;
	@Autowired
	ProfessorService professorService;
	@Autowired
	StudentService studentService;

	// 학생의 동아리 가입 action
	@PostMapping("/addClub")
	public String addStudentClub(Club club, HttpServletRequest request, Model model) {
		log.debug(TeamColor.CSJ + "clubController.addStudentClub post");
		
		int studentClub = clubService.addStudentClub(club);	
		
		model.addAttribute("studentClub", studentClub);
		
		return "club/clubList";

	}

	// 학생의 동아리 가입 form
	@GetMapping("club/addStudentClub")
	public String addStudentClub(Model model) {
		log.debug(TeamColor.CSJ + "clubController.addStudentClub get");

		List<Map<String, Object>> clubList = clubService.getClubList(); // 동아리 리스트 불러오기
		model.addAttribute("clubList", clubList);

		log.debug(TeamColor.CSJ + ("clubController.clubList : " + clubList));

		return "/club/addStudentClub";
	}

	// 동아리 수정 Form
	@GetMapping("/club/modifyClub")
	public String modifyClub(Model model, String clubNo) {

		log.debug(TeamColor.CSJ + "ClubController.modifyClub");

		List<Map<String, Object>> club = clubService.getClubOne(clubNo);
		List<Map<String, Object>> professorList = professorService.getProfessorList();

		model.addAttribute("professorList", professorList); // 동아리수정할때 교수목록불러오기
		model.addAttribute("club", club);
		log.debug(TeamColor.CSJ + "ClubController.getClubOne clubOne" + club);

		return "/club/modifyClub";
	}

	// 동아리 수정 action
	@PostMapping("/modifyClub")
	public String modifyClub(Club club, Model model) {

		// 디버깅
		log.debug(TeamColor.CSJ + "ClubController.modifyClub 실행");

		int updateClub = clubService.modifyClub(club);

		log.debug(TeamColor.CSJ + "ClubController.modifyClub updateClub" + updateClub);

		// update값 넣어주기
		model.addAttribute("updateClub", updateClub);

		return "redirect:/club/clubList";

	}

	// 동아리 상세보기
	@GetMapping("/club/clubOne")
	public String getClubOne(Model model, String clubNo, HttpServletRequest request) {

		HttpSession session = request.getSession();

		log.debug(TeamColor.CSJ + "ClubController.getClubOne");

		List<Map<String, Object>> clubOne = clubService.getClubOne(clubNo);

		model.addAttribute("clubOne", clubOne);

		log.debug(TeamColor.CSJ + "ClubController.getClubOne clubOne 확인" + clubOne);

		return "/club/clubOne";
	}

	// 동아리 목록
	@GetMapping("/club/clubList")
	public String clubList(Model model) {

		log.debug(TeamColor.CSJ + "ClubController.clubList");

		List<Map<String, Object>> clubList = clubService.getClubList();

		model.addAttribute("clubList", clubList);
		log.debug(TeamColor.CSJ + ("clubController.clubList : " + clubList));

		return "/club/clubList";
	}

	// 동아리 추가 form
	@GetMapping("/club/addClub")
	public String addClub(Model model) {

		List<Map<String, Object>> professorList = professorService.getProfessorList();
		model.addAttribute("professorList", professorList); // 동아리추가할때 교수목록추가

		log.debug(TeamColor.CSJ + "clubController.addClub form");
		log.debug(TeamColor.CSJ + ("clubController.addClub professorList" + professorList));

		return "/club/addClub";
	}

	// 동아리 추가 action
	@PostMapping("/addClub")
	public String addClub(Club club, HttpServletRequest request, Model model,
			@RequestParam("file") MultipartFile[] clubImg) throws UnsupportedEncodingException {

		log.debug(TeamColor.CSJ + ("clubController addClub action"));

		log.debug(TeamColor.CSJ + ("clubController clubImg" + clubImg));

		// ClubService를 실행하여 form에서 입력받은 sql의 값 insert
		int result = clubService.addClub(club, clubImg, request);

		// 디버깅
		log.debug(TeamColor.CSJ + "clubService.addClub 실행결과 " + result);

		if (result != 0) { // 1이면 성공

			String selectClubNo = clubService.getClubNo(club);

			log.debug(TeamColor.CSJ + "동아리 추가 성공");

			model.addAttribute("selectClubNo", selectClubNo);

			return "redirect:/club/clubList?clubNo=" + club.getClubNo();
		} else {
			log.debug(TeamColor.CSJ + "동아리 추가 실패");

			return "redirect:/club/clubList?clubNo=" + club.getClubNo();
		}

	}

}
