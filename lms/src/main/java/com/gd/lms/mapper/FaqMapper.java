package com.gd.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.lms.vo.Faq;

@Mapper
public interface FaqMapper {
	
	//자주묻는질문 수정
	int updateFaq(Faq faq);
	
	//자주묻는질문 상세보기
	Map<String, Object> selectFaqOne(int faqNo);
	
	//자주묻는질문 삭제
	int deleteFaq(int faqNo);
	
	//자주묻는질문 추가하기
	int insertFaq(Faq faq);
	
	//자주묻는질문목록 가져오기
	List<Map<String,Object>> selectFaqList();
}
