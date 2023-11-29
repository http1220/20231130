package com.example.demo.repository;

import com.example.demo.Domain.Homework;
import com.example.demo.Model.Evaluation;
import com.example.demo.Model.HomeworkView;
import com.example.demo.Model.StudentInfo;
import com.example.demo.Model.Transfer;
import com.example.demo.ParamObject.EvaluationCreate;
import com.example.demo.ParamObject.HomeworkCreate;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface HomeworkMapper {
    /* SQL 쿼리문을 작성한 XML 파일과 연결되어, xml에서 sql문을 호출해서 DB에 쿼리를 날리는 역할 */
    List<Homework> findAll();
    List<Evaluation> selectEvaluationList(String Teachername);
    List<HomeworkView> selectHomeworkListInDB(String Teachername);
    List<HomeworkView> selectHomeworkListAfterTransfer(String Teachername);
    List<StudentInfo> selectStudentInfoByTeacher(String Teachername);
	void inserthomeworkdata(HomeworkCreate dto);
	void insertevaluation(EvaluationCreate dto);
	int deletehomework(int no);
	void addhomeworktranfer(@Param(value = "studentno") int studentNo, @Param(value = "homeworkno") int homeworkNo);
	List<HomeworkView> selectHomeworkBykeyword(@Param(value = "keyword") String keyword);

}
