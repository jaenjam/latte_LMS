package com.gd.lms.controller;

import ch.qos.logback.core.CoreConstants;
import com.gd.lms.repository.MultipleTestRepository;
import com.gd.lms.repository.TestRepository;
import com.gd.lms.service.ClubService;
import com.gd.lms.service.TestService;
import com.gd.lms.vo.MultipleTest;
import com.gd.lms.vo.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestApiController {

    @Autowired
    TestService testService;

    @Autowired
    TestRepository testRepository;

    @Autowired
    MultipleTestRepository multipleTestRepository;


    @GetMapping("/create/test/{subjectApproveNo}/{testName}")
    public int createTest(@PathVariable int subjectApproveNo, @PathVariable String testName){

        testService.addTest(subjectApproveNo, testName);
        Test test = testRepository.findByTestNameAndSubjectApproveSubjectApproveNo(testName, subjectApproveNo);


        return test.getTestNo();
    }

    @GetMapping("/create/MultipleTest/{testNo}/{multiplechoiceQuestion}/{multiplechoiceAnswer}")
    public int createMultipleTest(@PathVariable int testNo, @PathVariable String multiplechoiceQuestion,
                                  @PathVariable int multiplechoiceAnswer){

        testService.addMultipleTest(testNo,multiplechoiceQuestion,multiplechoiceAnswer);

        MultipleTest multipleTest = multipleTestRepository.findByTestTestNoAndMultiplechoiceQuestion(testNo,multiplechoiceQuestion);
        return multipleTest.getMultiplechoiceNo();
    }




    @GetMapping("/create/MultipleTestExample/{multiplechoiceNo}/{multipleTestExampleNo}/{multipleTestExampleContent}")
    public void createMultipleTestExample(@PathVariable int multiplechoiceNo, @PathVariable String multipleTestExampleNo,
                                          @PathVariable String multipleTestExampleContent){

        testService.addMultipleTestExample(multiplechoiceNo,multipleTestExampleNo, multipleTestExampleContent);
    }
    
    
    @GetMapping("/create/testAnswer/{multiplechoiceNo}/{studentNo}/{answerSelect}")
    public void createTestAnswer(@PathVariable int multiplechoiceNo, @PathVariable int studentNo,
                                          @PathVariable int answerSelect){

        testService.addTestAnswer(multiplechoiceNo,studentNo, answerSelect);
    }

}
