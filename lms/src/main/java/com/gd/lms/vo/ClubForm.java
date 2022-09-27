package com.gd.lms.vo;



import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClubForm {
	private String clubName;
	private String clubContent;
	private List<MultipartFile> clubImgList;
	
	
	
	

}
