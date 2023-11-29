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
        width: 980px;
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

      .main-container {
        width: 100%;
        height: 100%;
        display: flex;
        margin: 0;
      }


      .table-container-studentgruop {
        display: flex;
        flex-flow: column nowrap;
        width: 98%;
        height: 350px;
        margin: 0 auto;
        overflow: scroll;
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
              <div class="table-container-studentgruop" id="modal-pa">
                <div>
                  <span>숙제명</span>
                  <input type="text">
                  <button>조회하기</button>
                </div>
                <div class="table-row heading">
                  <div class="row-item">순서</div>
                  <div class="row-item">숙제 제목</div>
                  <div class="row-item">숙제 내용</div>
                  <div class="row-item">진도</div>
                  <div class="row-item">제출 기한</div>
                  <div class="row-item">전송일</div>
                </div>
                <c:forEach items="${data}" var="i">
                <div class="table-row">
                  <div class="row-item">${i.no}</div>
                  <div class="row-item">${i.homeworkTitle}</div>
                  <div class="row-item">${i.homeworkContent}</div>
                  <div class="row-item">${i.progress}</div>
                  <div class="row-item">${i.due}</div>
                  <div class="row-item">${i.creation}</div>
                  <!-- <div class="row-item"><button onclick="boardBan('${i.no}')">게시글 삭제</button></div> -->
                </div>
                </c:forEach>
              </div>
            </div>
            <br>
            <div class="main-container">
              <div class="table-container-studentgruop" id="modal-pa">
                <div>
                  <span>제출 내역</span>

                  <button>저장하기</button>
				
                </div>
                <div>

                </div>
                <div class="table-row heading">
                  <div class="row-item">순서</div>
                  <div class="row-item">학습자명</div>
                  <div class="row-item">제출일</div>
                  <div class="row-item">학습 제출 내용</div>
                  <div class="row-item">학습 진도</div>
                  <div class="row-item">추가 질의 내용</div>
                  <div class="row-item">평가</div>
                </div>
                <c:forEach items="${sumbited}" var="i">
                <div class="table-row">
                  <div class="row-item">${i.no}</div>
                  <div class="row-item">${i.studentName}</div>
                  <div class="row-item">${i.submitDate}</div>
                  <div class="row-item">${i.submitContent}</div>
                  <div class="row-item">${i.submitprogress}</div>
                  <div class="row-item">${i.addiQu}</div>
                  <div class="row-item"><input type="number" id="submit_${i.submitNo}" min="0"
                      max="5"></input><button onclick="evaluation(${i.submitNo})">저장</button></div>
                </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>

    </body>
				<script>
				function evaluation(submitNo){
					  const formData = new FormData();
					  const score = document.getElementById('submit_'+submitNo).value;
					  formData.append('submitno', submitNo);
					  formData.append('evalutionscore', score);
					  
					  fetch('/evaluation', {
					    method: 'POST',
					    cache: 'no-cache',
					    body: formData
					  })
					  .then((response) => response.json())
					  .then((data) => {
					    console.log(data);
					  });
					}
				</script>
    </html>