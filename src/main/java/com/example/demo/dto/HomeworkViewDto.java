package com.example.demo.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class HomeworkViewDto {

    private int no;
    private String homeworkTitle;
    private String homeworkContent;
    private String progress;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @JsonFormat(pattern = "YYYY-MM-DD")
    private LocalDate due;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @JsonFormat(pattern = "YYYY-MM-DD")
    private LocalDate creation;
    private String teacherName;
}
