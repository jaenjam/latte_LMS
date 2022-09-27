package com.gd.lms.service;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ClubMapper;
import com.gd.lms.vo.Club;
import com.gd.lms.vo.ClubImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ClubService {

	@Autowired
	private ClubMapper clubMapper;
	
	
	//사진에쓸 clubNo 가져오기
	public String getClubNo(Club club) {
		
		log.debug(TeamColor.CSJ + "clubService.getClubNo");
		
		return clubMapper.selectClubNo(club);
	}
	// 동아리수정
	public int modifyClub(Club club) {
		log.debug(TeamColor.CSJ + "ClubService.modifyClub");

		return clubMapper.updateClub(club);
	}

	// 동아리상세보기
	public List<Map<String, Object>> getClubOne(String clubNo) {
		log.debug(TeamColor.CSJ + "ClubService.getClubOne");

		return clubMapper.selectClubOne(clubNo);
	}

	// 동아리 목록
	public List<Map<String, Object>> getClubList() {
		log.debug(TeamColor.CSJ + "ClubService.getClubList");

		return clubMapper.selectClubList();
	}

	// 동아리 추가 (사진포함)
	public int addClub(Club club, MultipartFile[] clubImg, HttpServletRequest request) {

		log.debug(TeamColor.CSJ + "ClubService.addClub");

		int result = clubMapper.insertClub(club);

		log.debug(TeamColor.CSJ + "result : " + result);
		log.debug(TeamColor.CSJ + "clubImg : " + clubImg);

		if (result != 0 && clubImg != null) {
			log.debug(TeamColor.CSJ + "not null");

			String dir = request.getSession().getServletContext().getRealPath("/WEB-INF/view/club/uploadFile");
			log.debug(TeamColor.CSJ + "dir 경로 확인 : " + dir);
			String Filename = ""; // 강의자료파일에서 저장된 이름
			String Originname = ""; // 기존파일이름
			String Type = ""; // 파일형식

		

			for (MultipartFile file : clubImg) {
				//
				if (!file.isEmpty()) {
					Originname = file.getOriginalFilename();
					Type = file.getContentType();

					// 업로드한 파일을 vo내 존재하는 파일객체에 넣어주기
					ClubImg clubimg = new ClubImg();

					clubimg.setOriginFileName(Filename);
					clubimg.setFileName(UUID.randomUUID() + "_" + Originname);
					clubimg.setContentType(Type);
					clubimg.setClubNo(club.getClubNo());

					log.debug(TeamColor.CSJ + "clubImg : " + clubimg);

				

					String saveFileName = dir + File.separator + clubimg.getFileName();

					Path savedir = Paths.get(saveFileName);

					try {
						// 전송
						file.transferTo(savedir);

						result = +clubMapper.insertClubImg(clubimg);

						// 파일 추가
						log.debug(TeamColor.CSJ + " 성공 result : " + result);
					} catch (Exception e) {
						log.debug(TeamColor.CSJ + " 실패 result : " + result);
						e.printStackTrace();

					}

				}
			}

		}
		return result;
	}
}
