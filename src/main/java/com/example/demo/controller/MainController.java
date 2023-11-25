package com.example.demo.controller;

import com.example.demo.domain.Homework;
import com.example.demo.dto.Evaluation;
import com.example.demo.dto.EvaluationCreateDto;
import com.example.demo.dto.HomeworkCreateDto;
import com.example.demo.dto.HomeworkViewDto;
import com.example.demo.dto.StudentInfoDto;
import com.example.demo.dto.TransferDto;
import com.example.demo.service.testService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final testService testService;
    @GetMapping("/")
    public ModelAndView mainopen(ModelAndView mv){
        mv.setViewName("/main");

        return mv;
    }

    @GetMapping("/payment")
    public ModelAndView myproducttopen(ModelAndView mv){
        mv.setViewName("/payment");
        List<Map<String,String>> data = new ArrayList<Map<String, String>>();

        for(int i = 1 ; i < 11 ; i++){
            Map<String , String> payment = new HashMap<>();
            payment.put("product" , i+"번 상품");
            payment.put("period" , "2023-11-"+(int)(20+i));
            payment.put("date" , "2023-11-"+i);
            payment.put("group" , i + "번 그룹");
            data.add(payment);
        }
        mv.addObject("data" , data);
        return mv;
    }

    @GetMapping("/homeworks/homework")
    public ModelAndView homeworkopen(ModelAndView mv){
        mv.setViewName("/homework");
        List<HomeworkViewDto> data = testService.test();
        System.out.println("숙제 창 열림");
        mv.addObject("data" , data);
        return mv;
    }

    @GetMapping("/homeworks/homeworktransfer")
    public ModelAndView homeworktransferOpen(ModelAndView mv){
        System.out.println("숙제 전송 페이지");
        mv.setViewName("/homeworktransfer");
        List<TransferDto> data = testService.AfterTransfer();
        List<StudentInfoDto> groupdata = testService.students();
        mv.addObject("data" , data);
        mv.addObject("groupdata" , groupdata);
        return mv;
    }

    @GetMapping("/homeworks/homeworksubmit")
    public ModelAndView homeworksubmitOpen(ModelAndView mv){
        System.out.println("숙제 제출 관리 페이지");
        mv.setViewName("/homeworksubmit");
        List<Evaluation> sumbited = testService.evaluationsview();

        List<TransferDto> data = testService.AfterTransfer();

        mv.addObject("data" , data);
        mv.addObject("sumbited" , sumbited);
        return mv;
    }
    
    @PostMapping("/homworkcreate")
    public void homeworkcreate(HomeworkCreateDto dto) {
    	testService.inserthomework(dto);
    
    }
    
    @PostMapping("/evaluation")
    public void evaluation(EvaluationCreateDto dto) {
    	testService.insertevaluation(dto);
    }
}
