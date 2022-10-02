package com.gd.lms.controller;

import com.gd.lms.service.ClubService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/club")
public class ClubApiController {

    @Autowired
    ClubService clubService;

    @GetMapping("/get/detail/{clubNo}")
    public List<Map<String, Object>> getClubDetailInfo(@PathVariable String clubNo) {

        System.out.println("클럽스No : "+ clubNo );
        List<Map<String, Object>> club = clubService.getClubOne(clubNo);
        System.out.println("클럽스 : "+club.toString());
        return club;
    }
}
