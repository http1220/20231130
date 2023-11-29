package com.example.demo.Model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class Evaluation {

    private int no;
    private int submitNo;
    private String studentName;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @JsonFormat(pattern = "YYYY-MM-DD")
    private LocalDate submitDate;

    private String submitContent;
    private String submitprogress;
    private String addiQu;
}
