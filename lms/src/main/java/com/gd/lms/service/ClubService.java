package com.gd.lms.service;

import java.io.File;
import java.util.List;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.lms.commons.TeamColor;
import com.gd.lms.mapper.ClubImgMapper;
import com.gd.lms.mapper.ClubMapper;
import com.gd.lms.vo.Club;
import com.gd.lms.vo.ClubForm;
import com.gd.lms.vo.ClubImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ClubService {

	@Autowired
	private ClubMapper clubMapper;
	private ClubImgMapper clubImgMapper;

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

	// 동아리 추가 (사진)
	public void addClub(ClubForm clubForm, String path) {
		log.debug(TeamColor.CSJ + "ClubService.addClub.param path", path);
		log.debug(TeamColor.CSJ + "ClubService.addClub.param clubForm", clubForm);

		// ClubMapper
		Club club = new Club();
		club.setClubName(clubForm.getClubName());
		club.setClubContent(clubForm.getClubContent());
		// club.getClubNo() --> 0
		int row = clubMapper.insertClub(club);
		// insert시 입력된 autoincrement값이 출력됨
		log.debug("ClubService.addClub clubNo : ", club.getClubNo());

		// clubfileList가 하나이상이고 row==1 일때
		// ClubImgMapper
		if (clubForm.getClubImgList().get(0).getSize() > 0 && row == 1) {
			log.debug("▶▶▶ ClubService.addClub : ", "첨부된 파일이 있습니다.");
			for (MultipartFile mf : clubForm.getClubImgList()) {
				// mf -> ClubImg
				ClubImg clubimg = new ClubImg();

				String originName = mf.getOriginalFilename();
				// originName에서 마지막 .문자열 위치
				String ext = originName.substring(originName.lastIndexOf("."));

				// 파일을 저장할대 사용할 중복되지않는 새로운 이름 필요(UUID API사용)
				String filename = UUID.randomUUID().toString();
				// filename = filename.replace("-","");

				filename = filename + ext;

				clubimg.setClubNo(club.getClubNo());
				clubimg.setFileName(filename);
				clubimg.setContentType(mf.getContentType());
				log.debug("ClubService.addClub clubimg: " + clubimg);
				clubImgMapper.insertClubImg(clubimg);

				try {
					mf.transferTo(new File(path + filename));
				} catch (Exception e) {
					e.printStackTrace();
					// 새로운 예외 발생시켜야지만 @Transactional 작동을 위해
					throw new RuntimeException(); // RuntimeException은 예외처리를 하지 않아도 컴파일된다
				}

				

			}

		}
	}
}
