package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.Domain.Payment;
import com.example.demo.Domain.Member;

@Mapper
@Repository
public interface PaymentMapper {

	int addPayment(Payment payment);

	List<Payment> getPaymentHistory();

	Member findonemember();
	

}
