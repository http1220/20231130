package com.example.demo.service;


import com.example.demo.domain.Homework;
import com.example.demo.dto.Evaluation;
import com.example.demo.dto.EvaluationCreateDto;
import com.example.demo.dto.HomeworkCreateDto;
import com.example.demo.dto.HomeworkViewDto;
import com.example.demo.dto.StudentInfoDto;
import com.example.demo.dto.TransferDto;
import com.example.demo.repository.HomeworkMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class testService {

    private final HomeworkMapper homeworkMapper;

    public List<HomeworkViewDto> test() {
        return homeworkMapper.selectHomeworkListInDB("teacher");
    }

    public List<Evaluation> evaluationsview(){
        return homeworkMapper.selectEvaluationList("teacher");
    }

    public List<TransferDto> AfterTransfer(){
        return homeworkMapper.selectHomeworkListAfterTransfer("teacher");
    }

    public List<StudentInfoDto> students(){
        return homeworkMapper.selectStudentInfoByTeacher("teacher");
    }

	public void inserthomework(HomeworkCreateDto dto) {
		homeworkMapper.inserthomeworkdata(dto);
				// TODO Auto-generated method stub
		
	}

	public void insertevaluation(EvaluationCreateDto dto) {
		homeworkMapper.insertevaluation(dto);
	}

}
