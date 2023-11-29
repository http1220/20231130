    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8"%>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

  </head>
  <style>

    body {
      font-family: hanna;
    }


    .content {
      width: 900px;
      height: 750px;
      display: flex;
      flex-direction: column;

    }

    .menu_ul {
      font-size: xx-large;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .menu_ul>li:hover {
      color: white;
    }

    .title {
      font-size: xx-large;
      padding-left: 10px;
    }

    .board {
      height: 750px;
      display: flex;
      flex-direction: column;
      font-size: x-large;

    }

    .table-form {
      display: flex;
      flex-flow: column nowrap;
      width: 98%;
      margin: 0 auto;
      border-radius: 4px;
      border: 1px solid #DADADA;
      box-shadow: 0px 1px 4px rgba(0, 0, 0, .08);
    }

    .table-container {
      display: flex;
      flex-flow: column nowrap;
      width: 98%;
      overflow: scroll;
      margin: 0 auto;
      border-radius: 4px;
      border: 1px solid #DADADA;
      box-shadow: 0px 1px 4px rgba(0, 0, 0, .08);
    }

    .table-row {
      display: flex;
      flex-flow: row nowrap;
      width: 100%;
      border-bottom: 1px solid #dadada;
    }

    .heading {
      background-color: #ececec;
      color: #3e3e3e;
      font-weight: bold;
    }

    .row-item {
      display: flex;
      flex: 1;
      font-size: 14px;
      padding: 8px 0;
      justify-content: center;
      align-items: center;
      transition: all 0.15s ease-in-out;
    }

    .row-item:hover {
      cursor: pointer;
      background-color: #F0F0F0;
      /*   box-shadow: 0px 1px 4px rgba(0, 0, 0, .08); */
    }

    .row-sub-container {
      display: flex;
      flex-flow: row wrap;

    }

    .row-sub-container .row-item {
      padding: 8px 0;
      text-align: center;
      flex: 1;
      width: max-content;

    }

    .table-row:last-child,
    .row-sub-container .row-item:last-child {
      border-bottom: 0;
    }
  </style>

  <body>
      <div class="content">

        <div class="board">
          <div class="main-container">
            <div class="table-form" id="modal-pa">
              <div class="work-form" style="width: 100%;">
                <h3>숙제 정보 입력</h3>
                <form action="/homeworks/create" method="post" style="width: 90%; text-align: center;">
                  <table>
                    <tr>
                      <th><span>숙제 제목</span></th>
                      <th><input class="work-form-input" style="margin: 5; width: 350; height: 30; font-size: large;"
                          type="text" name="title"></th>

                    </tr>
                    <tr>
                      <td><span>목표 진도</span></td>
                      <td><input class="work-form-input" style="margin: 5; width: 350; height: 30; font-size: large;"
                          type="number" name="progress" min="0" max="99"></td>

                    </tr>
                    <tr>
                      <td><span>숙제 내용</span></td>
                      <td><textarea name="content" style="margin: 5;" rows="1" cols="33" placeholder="내용을 입력 하세요."></textarea></td>

                    </tr>
                    <tr>
                      <td><span>제출 기한</span></td>
                      <td><input class="work-form-input" name="deadline" style="margin: 5;" type="date" name="st_name"></td>

                    </tr>
                  </table>
                  <div style="width: 100%; text-align: right;">
                    <button id="creatbutton" style="width: 100; height: 30; font-size: large;">숙제 저장</button>
                  </div>
                </form>
              </div>
            </div>
          </div>

            <div class="table-container" id="modal-pa">
              <div class="table-row heading">
              	<div class="row-item"><input type="checkbox"></div>
                <div class="row-item">순서</div>
                <div class="row-item">숙제 제목</div>
                <div class="row-item">숙제 내용</div>
                <div class="row-item">진도</div>
                <div class="row-item">제출 기한</div>
                <div class="row-item">생성일</div>
                <div class="row-item">작성자</div>
              </div>
              <c:forEach items="${data}" var="i">
              <div class="table-row">
              	<div class="row-item"><input type="checkbox" name = "homework" value = "${i.homeworkNo}"></input></div>
                <div class="row-item">${i.no}</div>
                <div class="row-item">${i.homeworkTitle}</div>
                <div class="row-item">${i.homeworkContent}</div>
                <div class="row-item">${i.progress}</div>
                <div class="row-item">${i.due}</div>
                <div class="row-item">${i.creation}</div>
                <div class="row-item">${i.teacherName}</div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>

  </body>

  </html>