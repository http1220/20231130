<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

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

.table-container-homework {
	display: flex;
	flex-flow: column nowrap;
	background-color: white;
	width: 98%;
	height: 300px;
	margin: 0 auto;
	overflow: scroll;
	border-radius: 4px;
	border: 1px solid #DADADA;
	box-shadow: 0px 1px 4px rgba(0, 0, 0, .08);
}

.table-container-studentgruop {
	display: flex;
	flex-flow: column nowrap;
	background-color: white;
	width: 98%;
	height: 450px;
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

.table-row:last-child, .row-sub-container .row-item:last-child {
	border-bottom: 0;
}
</style>
<body>
	<div class="content">
		<div class="board">
			<div class="main-container">
				<div class="table-container-homework" id="modal-pa">
					<div>
						<span>숙제명</span> <form action="/homeworks/homeworkseach" method="get"><input type="text" name="keyword">
						<button>조회하기</button></form>
					</div>
					<div class="table-row heading">
						<div class="row-item">
							<input type="checkbox">
						</div>
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
							<div class="row-item">
								<input type="checkbox" name="homeworkck"
									id="homework_${i.homeworkNo}" value="${i.homeworkNo}">
							</div>
							<div class="row-item">${i.no}</div>
							<div class="row-item">${i.homeworkTitle}</div>
							<div class="row-item">${i.homeworkContent}</div>
							<div class="row-item">${i.progress}</div>
							<div class="row-item">${i.due}</div>
							<div class="row-item">${i.creation}</div>
							<div class="row-item">${i.studentName}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="main-container">
				<div class="table-container-studentgruop" id="modal-pa">
					<div>
						<span>학습 그룹</span> <input type="text" value="강남학원">
						<button>대상 조회</button>
						<button>전체 선택</button>
						<button onclick="transferhomework()">일괄 전송</button>
					</div>
					<div></div>
					<div class="table-row heading">
						<div class="row-item">
							<input type="checkbox">
						</div>
						<div class="row-item">학습자명</div>
						<div class="row-item">전화번호</div>
						<div class="row-item">현재 진도</div>
					</div>
					<c:forEach items="${groupdata}" var="i">
						<div class="table-row">
							<div class="row-item">
								<input type="checkbox" name="studentck"
									id="student_${i.studentNo}" value="${i.studentNo}">
							</div>
							<div class="row-item">${i.studentName}</div>
							<div class="row-item">${i.studentTel}</div>
							<div class="row-item">${i.progress}</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function transferhomework() {
		
		var homeworklist = new Array();
		
		const checkboxes = document.querySelectorAll('input[name="homeworkck"]');
			checkboxes.forEach((checkbox, index) => {
			    if (checkbox.checked) {
			    	const homeworkNo = checkbox.value;
			    	homeworklist.push(homeworkNo);
		}
	});
			
			
			
		var studentlist = new Array();
		const students = document.querySelectorAll('input[name="studentck"]');
		
		students.forEach((student, index) => {
		    if (student.checked) {
		    	const studentNo = student.value;
		    	studentlist.push(studentNo);
				}
		    });
		    console.log(homeworklist);
		    console.log(studentlist);
		    
			const formData = new FormData();
			formData.append('homeworklist' , homeworklist)
			formData.append('studentlist', studentlist)
			
			fetch('/homeworktransfer', {
			    method: 'POST',
			    cache: 'no-cache',
			    body: formData
			  })
			  .then((response) => response.json())
			  ;
}
</script>

</html>