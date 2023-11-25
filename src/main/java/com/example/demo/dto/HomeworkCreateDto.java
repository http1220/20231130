package com.example.demo.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import java.time.LocalDate;
@Data
public class HomeworkCreateDto {

    private String title;
    private String content;
    private String progress;
    
    @DateTimeFormat(iso = ISO.DATE)
    private LocalDate deadline;

    private String writer;
}
