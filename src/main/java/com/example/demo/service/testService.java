package com.example.demo.service;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.example.demo.Domain.Payment;
import com.example.demo.Domain.Payment.status;
import com.example.demo.Domain.Member;
import com.example.demo.Model.Evaluation;
import com.example.demo.Model.HomeworkView;
import com.example.demo.Model.PaymentHistory;
import com.example.demo.Model.StudentInfo;
import com.example.demo.Model.Transfer;
import com.example.demo.ParamObject.EvaluationCreate;
import com.example.demo.ParamObject.HomeworkCreate;
import com.example.demo.ParamObject.PaymentCreate;
import com.example.demo.repository.HomeworkMapper;
import com.example.demo.repository.PaymentMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class testService {

    private final HomeworkMapper homeworkMapper;
    private final PaymentMapper paymentMapper;

    public List<HomeworkView> test() {
        return homeworkMapper.selectHomeworkListInDB("teacher");
    }

    public List<Evaluation> evaluationsview(){
        return homeworkMapper.selectEvaluationList("teacher");
    }

    public List<HomeworkView> AfterTransfer(){
        return homeworkMapper.selectHomeworkListAfterTransfer("teacher");
    }

    public List<StudentInfo> students(){
        return homeworkMapper.selectStudentInfoByTeacher("teacher");
    }

	public void inserthomework(HomeworkCreate dto, Member user) {
		dto.setWriter(user.getMemberNo());
		homeworkMapper.inserthomeworkdata(dto);
	}

	public void insertevaluation(EvaluationCreate dto) {
		homeworkMapper.insertevaluation(dto);
	}
	
	public int addPayment(PaymentCreate paymentCreate , Member user) {
		Payment payment = new Payment(paymentCreate);
		payment.setMemberNo(user.getMemberNo());
		payment.setOrderNumber("1234");
		payment.setPaymentno(111);
		payment.setStatus(status.PROCESSING);
	    int rsl=paymentMapper.addPayment(payment);
	    if(rsl == 1) {
	    	System.out.println("저장 성공");
	    }
	    return rsl;
	}

	public List<Payment> getpayment() {
		return paymentMapper.getPaymentHistory();
	}
	
	public List<PaymentHistory> getpaymenthistory() {
		List<PaymentHistory> list = new ArrayList<PaymentHistory>();
		PaymentHistory pm = new PaymentHistory();
		pm.setPeriod("2023-12-01 ~ 2024-12-01");
		pm.setGroupname("강남지점");
		pm.setDate("2023-11-30");
		pm.setProductname("초보자도 쉽게 배우는 바둑");
		list.add(pm);
		return list;
	}

	public Member findOneMember() {
		return paymentMapper.findonemember();
	}

	public int deletehomework(int no) {
		return homeworkMapper.deletehomework(no);
		
	}

	public void addHomeworkTransfer(int studentNo, int homeworkNo) {
		homeworkMapper.addhomeworktranfer(studentNo, homeworkNo);
		
	}

	public void addHomeworkTransfer(int[] studentnolist, int[] homeworknolist) {
		for (int i : studentnolist) {
			for (int j : homeworknolist) {
				homeworkMapper.addhomeworktranfer(i, j);
			}
		}
		
	}

	public List<HomeworkView> SearchHomework(String keyword) {
		// TODO Auto-generated method stub
		return homeworkMapper.selectHomeworkBykeyword(keyword);
	}

}
