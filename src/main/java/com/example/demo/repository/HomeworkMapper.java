package com.example.demo.repository;

import com.example.demo.domain.Homework;
import com.example.demo.dto.Evaluation;
import com.example.demo.dto.EvaluationCreateDto;
import com.example.demo.dto.HomeworkCreateDto;
import com.example.demo.dto.HomeworkViewDto;
import com.example.demo.dto.StudentInfoDto;
import com.example.demo.dto.TransferDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface HomeworkMapper {
    /* SQL 쿼리문을 작성한 XML 파일과 연결되어, xml에서 sql문을 호출해서 DB에 쿼리를 날리는 역할 */
    List<Homework> findAll();
    List<Evaluation> selectEvaluationList(String Teachername);
    List<HomeworkViewDto> selectHomeworkListInDB(String Teachername);
    List<TransferDto> selectHomeworkListAfterTransfer(String Teachername);
    List<StudentInfoDto> selectStudentInfoByTeacher(String Teachername);
	void inserthomeworkdata(HomeworkCreateDto dto);
	void insertevaluation(EvaluationCreateDto dto);

}
