package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Domain.Member;
import com.example.demo.Model.Evaluation;
import com.example.demo.Model.HomeworkView;
import com.example.demo.Model.PaymentHistory;
import com.example.demo.Model.StudentInfo;
import com.example.demo.Model.Transfer;
import com.example.demo.ParamObject.EvaluationCreate;
import com.example.demo.ParamObject.HomeworkCreate;
import com.example.demo.ParamObject.PaymentCreate;
import com.example.demo.service.testService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	private final testService testService;

	@GetMapping("/")
	public ModelAndView mainopen(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		if (session.isNew()) {
			System.out.println("세션을 새로 생성합니다.");
			Member member = testService.findOneMember();
			session.setAttribute("user", member);
			session.setMaxInactiveInterval(1800);

		} else {
			Object user = request.getSession(true);
			Member member = testService.findOneMember();
			session.setAttribute("user", member);
			session.setMaxInactiveInterval(1800);
			System.err.println(user);
		}
		mv.setViewName("/main");

		return mv;
	}

	@GetMapping("/logout")
	public void loggout(HttpSession session) {
		session.invalidate();
	}

	@GetMapping("/paymenthistory")
	public ModelAndView myproducttopen(ModelAndView mv, HttpSession session) {
		System.out.println("세션 : " + session.getAttribute("user"));
		mv.setViewName("/paymenthistory");
		List<PaymentHistory> data = testService.getpaymenthistory();
		mv.addObject("data", data);
		return mv;
	}

	@GetMapping("/homeworks/homework")
	public ModelAndView homeworkopen(ModelAndView mv) {
		mv.setViewName("/homework");
		List<HomeworkView> data = testService.test();
		System.out.println("숙제 창 열림");
		mv.addObject("data", data);
		return mv;
	}
	
	@GetMapping("/homeworks/homeworkseach")
	public ModelAndView SearchHomework(ModelAndView mv , @RequestParam(name = "keyword") String keyword) {
		mv.setViewName("/homeworktransfer");
		List<HomeworkView> data = testService.SearchHomework(keyword);
		System.out.println("숙제 검색 창 열림");
		mv.addObject("data", data);
		return mv;
	}

	@GetMapping("/homeworks/homeworktransfer")
	public ModelAndView HomeworkTransferPageOpen(ModelAndView mv) {
		System.out.println("숙제 전송 페이지");
		mv.setViewName("/homeworktransfer");
		List<HomeworkView> data = testService.test();
		List<StudentInfo> groupdata = testService.students();
		mv.addObject("data", data);
		mv.addObject("groupdata", groupdata);
		return mv;
	}
	
	@PostMapping("/homeworktransfer")
	public void TransferHomeworkToStudent(HttpServletRequest request , @RequestParam(name = "homeworklist") int[] homeworknolist , @RequestParam(name = "studentlist") int[] studentnolist) {
		System.out.println("studentNo" + studentnolist.length);
		System.out.println("homeworkNo" + homeworknolist.length);
		testService.addHomeworkTransfer(studentnolist , homeworknolist);
	}

	@GetMapping("/homeworks/homeworksubmit")
	public ModelAndView homeworksubmitOpen(ModelAndView mv) {
		System.out.println("숙제 제출 관리 페이지");
		mv.setViewName("/homeworksubmit");
		List<Evaluation> sumbited = testService.evaluationsview();

		List<HomeworkView> data = testService.AfterTransfer();

		mv.addObject("data", data);
		mv.addObject("sumbited", sumbited);
		return mv;
	}

	@PostMapping("/evaluation")
	public void evaluation(@ModelAttribute EvaluationCreate dto) {
		System.out.println(dto);
		testService.insertevaluation(dto);
	}

	@PostMapping("/pay")
	public ModelAndView addPayment(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute PaymentCreate paymentCreate) {
		// 왜 존재 하는가? - 주문 정보와 결제 정보를 DB에 저장하기 위해
		// 무슨 작업을 하는가? - 주문&결제 요청을 받아서 Service 계층으로 전달하고, 결과를 받아서 결제 완료 페이지로 이동 시킨다.
		System.out.println("결제 정보 수신");
		Member user = (Member) request.getSession().getAttribute("user");
		int rsl = testService.addPayment(paymentCreate, user);
		if (rsl == 1) {
			mv.setViewName("/paymenthistory");
			return mv;
		} else {
			Map<String, String> error = new HashMap<String, String>();
			error.put("msg", "결제 실패");
			error.put("code", "404");
			mv.setViewName("/payprocessdeny");
		}
		return mv;
	}
	
	
	@PostMapping("/homeworks/create")
	public ModelAndView addHomework(ModelAndView mv , HttpServletRequest request, HomeworkCreate homeworkCreate) {
		Member user = (Member)request.getSession().getAttribute("user");
		if(user.getRole().equals("TEACHER")) {
		testService.inserthomework(homeworkCreate , user);
		} 
		else {
			System.out.println("권한 없음");
			Map<String, String> error = new HashMap<String, String>();
			error.put("msg", "권한 없음");
			error.put("code", "403");
			mv.setViewName("/main");
		}
		return mv;
	}
	
	@DeleteMapping("/homeworks/delete")
	public ModelAndView deleteHowework(ModelAndView mv , HttpServletRequest reqeust , @RequestParam(name = "homeworkno") int no) {
		if(roleHanddler(reqeust).equals("TEACHER")) {
			Member user = (Member) reqeust.getSession().getAttribute("user");
			testService.deletehomework(no);
 		} else {
 			System.out.println("권한 없음");
			Map<String, String> error = new HashMap<String, String>();
			error.put("msg", "권한 없음");
			error.put("code", "403");
			mv.setViewName("/main");
 		}
		return mv;
	}
	
	public String roleHanddler(HttpServletRequest reqeust) {
		Member user = (Member) reqeust.getSession().getAttribute("user");
		return user.getRole();
	}
}
