package com.example.demo.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
@Data
public class Sumbit {
    private int submitNo;
    private int homeworkNo;
    private int studentNo;
    private String studentName;
    private String content;
    private String question;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @JsonFormat(pattern = "YYYY-MM-DD")
    private LocalDate submitDate;
    private String evaluation;
}
