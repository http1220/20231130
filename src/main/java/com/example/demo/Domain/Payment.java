package com.example.demo.Domain;

import java.util.Date;

import com.example.demo.ParamObject.PaymentCreate;

import lombok.Data;

@Data
public class Payment {

	/**
	 * 결제 번호
	 */
	private int paymentno;
	/**
	 * 주문 번호
	 */
	private String orderNumber;
	/**
	 * 게임 콘텐츠
	 */
	private int gameContentNo;
	/**
	 * 구매자
	 */
	private int memberNo;
	/**
	 * 연락처
	 */
	private String contact;
	/**
	 * 결제 수단
	 */
	private method method;
	/**
	 * 결제일
	 */
	private Date paymentDate;
	/**
	 * 결제 상태
	 */
	private status status;
	/**
	 * 입금자명
	 */
	private String depositorName;
	/**
	 * 결제 금액
	 */
	private String amount;

	public enum method {
		DIRECTTRNASFER, CREDITCART, KAKAO
	}

	public enum status {
		PROCESSING, FINISH
	}

	public Payment(PaymentCreate p) {
		this.method = p.getMethod();
		this.amount = p.getAmount();
		this.depositorName = p.getDepositorName();
		this.contact = p.getContact();
		this.gameContentNo = p.getGameContentNo();
	}
}
