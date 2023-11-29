 <label%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      height: 900px;
      flex-wrap: wrap;
      display: flex;
      justify-content: flex-start;
      margin: 0 auto;
    }

    .nav {
      width: 1200px;
      height: 75px;
      display: flex;
      flex-flow: row wrap;
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
      display: inline-block;

    }

    .content {
      width: 1000px;
      height: 800px;
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
  </style>
<script>
  function changeIframeSrc(href , title) {
    var iframeContainer = document.getElementById('iframe-container');
    var iframeHeading = document.getElementById('iframe-heading');

    iframeHeading.innerHTML = '<div style="border-bottom:1px #e8e8e8 solid;background-color:#f3f3f3;padding:8px;font-size:13px;font-weight:700;color:#45484d;">' + title + '</div>';
        // Remove existing iframe
        while (iframeContainer.firstChild) {
            iframeContainer.removeChild(iframeContainer.firstChild);
        }

        // Create a new iframe
        var iframe = document.createElement('iframe');
        iframe.src = href;
        iframe.style.width = '100%';
        iframe.style.height = '800px';
        iframe.style.border = '0';
        iframe.scroll = "no"
        iframe.frameborder = "0"

        // Append the new iframe to the container
        iframeContainer.appendChild(iframe);
  }
</script>
  <body>
    <div class="container">
      <div class="nav">
      <span><a href="/admin" style="text-decoration : none;">메인으로</a></span>
      </div>

      <div class="menu">
      <ul class="menu_ul">
      <li><a href="#" title="내 구입 목록" onclick="changeIframeSrc('/paymenthistory', '내 구입 목록')"><i class="icon-dashboard"></i><span>내 구입 목록</span></a></li>
      <li><a href="#" title="숙제 생성" onclick="changeIframeSrc('/homeworks/homework', '숙제 생성')"><i class="icon-bullhorn"></i><span> 숙제 생성</span></a></li>
      <li><a href="#" title="숙제 전송" onclick="changeIframeSrc('/homeworks/homeworktransfer' , '숙제 전송')"><i class="icon-file-alt"></i><span> 숙제 전송</span></a></li>
      <li><a href="#" title="숙제 전송" onclick="changeIframeSrc('/homeworks/homeworksubmit' , '숙제 제출')"><i class="icon-file-alt"></i><span> 숙제 제출</span></a></li>
     </ul>

      	</div>

      <div class="content">
        <div id = "iframe-heading"></div>
        <div id="iframe-container">

        </div>
      </div>
    </div>
  </body>
  </html>