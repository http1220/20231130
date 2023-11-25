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

      .container {
        width: 1200px;
        height: auto;
        flex-wrap: wrap;
        display: flex;
        justify-content: flex-start;
        margin: 0 auto;
        background-color: #fcfcfc;
      }

      .nav {
        width: 1200px;
        height: 75px;
        display: flex;
        flex-flow: row wrap;
        background-color: #fcfcfc;
        border-bottom: 2px #c9c9c9 solid;
        align-item: center;
      }

      .nav>span {
        padding-top: 15px;
        padding-right: 15px;
        font-size: xx-large;
      }

      .nav>span:hover {
        color: white;
      }

      .menu {
        width: 198px;
        height: 800px;
        border-right: 2px #c9c9c9 solid;
        background-color: #fcfcfc;
        display: inline-block;

      }

      .content {
        width: 1000px;
        height: 800px;
        background-color: #fcfcfc;
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
        height: 600px;
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

      .table-container {
        display: flex;
        flex-flow: column nowrap;
        background-color: white;
        width: 98%;
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

      .modal {
        visibility: hidden;
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        padding: 1.5rem;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: all 0.3s;
      }

      .modal_inner {
        max-width: 32rem;
        padding: 1.5rem;
        border-radius: 2px;
        background-color: #ffffff;
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
        opacity: 0;
        transform: scale(0.8);
        transition: all 0.3s;
      }

      .modal.-open {
        visibility: visible;
        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.-open .modal_inner {
        opacity: 1;
        transform: scale(1);
      }



      .paging {
        height: 100px;
        display: flex;
        justify-content: center;
      }


      .pagination,
      .pagination li a {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        list-style: none;
      }

      .pagination li {}

      .pagination a {
        font-weight: 300;
        padding-top: 1px;
        text-decoration: none;
        border: none;
        border-left-width: 0;
        min-width: 44px;
        min-height: 44px;
        color: black;

      }

      .pagination li:not([class*="current"]) a:hover {
        background-color: rgba(255, 255, 255, .2);
        border-top-color: rgba(0, 0, 0, .35);
        border-bottom-color: rgba(0, 0, 0, .5);
      }

      .pagination li:not([class*="current"]) a:focus,
      .pagination li:not([class*="current"]) a:active {
        ;
        box-shadow: 0px 0px 10px 1px rgba(0, 0, 0, .25);
        border-left-width: 1px;
      }

      .pagination li:first-of-type a {
        border-left-width: 1px;
      }

      .pagination li:first-of-type span,
      .pagination li:last-of-type span,
      .pagination li:nth-of-type(2) span,
      .pagination li:nth-last-of-type(2) span {
        /* screen readers only */
        position: absolute;
        top: -9999px;
        left: -9999px;
      }

      .pagination li:first-child a::before,
      .pagination li:last-child a::after,
      .pagination li:nth-of-type(2) a::before,
      .pagination li:nth-last-of-type(2) a::after {
        display: inline-block;
        font-family: Fontawesome;
        font-size: inherit;
        text-rendering: auto;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        transform: translate(0, 0);
      }

      .pagination li:first-child a::before,
      .pagination li:last-child a::after {
        content: "\f100";
      }

      .pagination li:nth-of-type(2) a::before,
      .pagination li:nth-last-of-type(2) a::after {
        content: "\f104";
      }

      .pagination li:last-child a::after,
      .pagination li:nth-last-of-type(2) a::after {
        transform: rotate(180deg);
      }

      .pagination li.current a {
        padding-top: .25em;
        color: blue;
        background-color: rgba(255, 255, 255, .15);
        box-shadow: inset 0px 2px 1px 0px rgba(0, 0, 0, .25);
        cursor: default;
        pointer-events: none;
      }

      @media only screen and (max-width: 64.063em) {

        .pagination li:first-child,
        .pagination li:last-child {
          /* screen readers only */
          position: absolute;
          top: -9999px;
          left: -9999px;
        }

        .pagination li:nth-of-type(2) a {
          border-left-width: 1px;
        }

      }

      @media only screen and (max-width: 40.063em) {
        .pagination li {
          /* screen readers only */
          position: absolute;
          top: -9999px;
          left: -9999px;
        }

        .pagination li.current,
        .pagination li:first-of-type,
        .pagination li:last-of-type,
        .pagination li:nth-of-type(2),
        .pagination li:nth-last-of-type(2) {
          position: initial;
          top: initial;
          left: initial;
        }

        .pagination li:nth-of-type(2) a {
          border-left-width: 0;
        }

      }

      @media only screen and (max-width: 30.063em) {

        h1 {
          font-size: 1.35em !important;
        }

        .pagination li:first-child,
        .pagination li:last-child {
          /* screen readers only */
          position: absolute;
          top: -9999px;
          left: -9999px;
        }

        .pagination li:nth-of-type(2) a {
          border-left-width: 1px;
        }

      }

      @media only screen and (max-width: 15.063em) {
        /* For watches? */

        .pagination li {
          width: 50%;
        }

        .pagination li.current {
          order: 2;
          width: 100%;
          border-left-width: 1px;

        }



      }


      .search {
        display: flex;
        justify-content: center;
      }


      @font-face {

        src: url("/font/BMHANNAProOTF.otf");

        font-family: hanna;

      }
    </style>
    <script>
      function boardBan(param) {
        if (window.confirm("정지하시겠습니까?")) {
          fetch("/admin/boardban", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: JSON.stringify({
              no: param,
            }),
          })
            .then((result) => console.log(result));
          alert("완료");
          location.href = "";
        }


      }

      function go_board_detail(param) {
        fetch("/admin/boarddetail?board=" + param)
          .then(res => res.json())
          .then(function (data) {
            const modalboard = document.querySelector("#modal_board");
            modalboard.innerHTML = "";
            const htmlcode = `
							<p>게시물번호 : `+ data.no + `</p>
							<p>닉네임 : `+ data.nickname + `</p>
							<p>등록일 : `+ data.registrationDate + `</p>
							<p>조회수 : `+ data.views + `</p>
							<button><a href="../detail?vehicleno=`+ data.no + `"target='_blank'">게시글로 이동</a></button>
							`;
            modalboard.innerHTML = htmlcode;

          });

        const modal = document.querySelector("#modal");
        modal.classList.toggle("-open");

      }



    </script>

    <body>
      <div class="container">
        <div class="content">
          <div class="board">
            <div class="main-container">
              <div class="table-container" id="modal-pa">
                <div class="table-row heading">
                  <div class="row-item">상품명</div>
                  <div class="row-item">구독기간</div>
                  <div class="row-item">구매일</div>
                  <!-- 			      <div class="row-item">차량번호</div> -->
                  <div class="row-item">학습 그룹 등록 내역</div>
                </div>
                <c:forEach items="${data}" var="i">
                  <div class="table-row">
                    <div class="row-item" onclick="go_board_detail('${i.no}')">${i.product}</div>
                    <div class="row-item" onclick="go_board_detail('${i.no}')">${i.period}</div>
                    <div class="row-item" onclick="go_board_detail('${i.no}')">${i.date}</div>

                    <div class="row-item" onclick="go_board_detail('${i.no}')">${i.group}</div>
                    <!-- <div class="row-item"><button onclick="boardBan('${i.no}')">게시글 삭제</button></div> -->
                  </div>
                </c:forEach>
                <div class="modal" id="modal">
                  <div class="modal_inner" id="modal_board">
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="paging">
            <ul class="pagination" role="menubar" aria-label="Pagination">

              <li class="first"><a href="/admin/board?page=1"><span>First</span></a></li>
              <li class="previous"><a href="/admin/board?page=${nowpage}"><span>Previous</span></a></li>

              <c:forEach begin="1" end="${totalpages}" var="i">
                <li><a href="/admin/board?page=${i }">${i}</a></li>
              </c:forEach>

              <li class="next"><a href="/admin/board?page=${nowpage+2}"><span>Next</span></a></li>
              <li class="last"><a href="/admin/board?page=${totalpages }"><span>Last</span></a></li>

            </ul>
          </div>
          <div class="search">
            <form action="/adminSearch" method="GET">
              <input type="text" name="kwd"><button class="search_btn">검색</button>
            </form>
          </div>
        </div>
      </div>
    </body>
    <script>
      const modal = document.querySelector('#modal');
      modal.addEventListener('click', () => {
        modal.classList.toggle('-open')
      })
    </script>

    </html>