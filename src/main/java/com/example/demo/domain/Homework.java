package com.example.demo.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class Homework {
    private int homeworkNo;
    private String homeworkTitle;
    private String homeworkContent;
    private String progress;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @JsonFormat(pattern = "YYYY-MM-DD")
    private LocalDate due;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    @JsonFormat(pattern = "YYYY-MM-DD")
    private LocalDate creation;
    private int teacherNo;
    private int teacherName;
}
