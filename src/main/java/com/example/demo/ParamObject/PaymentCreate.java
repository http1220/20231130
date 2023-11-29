package com.example.demo.ParamObject;

import lombok.Data;

import java.util.Date;

import com.example.demo.Domain.Payment.method;

@Data
public class PaymentCreate {
    /**
     * 결제 수단
     */
    private method method;
    /**
     * 선택 상품 아이디
     */
    private int gameContentNo;
    /**
     * 지불 금액
     */
    private String amount;
    /**
     * 판매자 연락처
     */
    private String contact;
    /**
     * 입금자명
     */
    private String depositorName;
 

}
