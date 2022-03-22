<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<link href="common.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
<% if(session.getAttribute("session_id") == null) { %>
<ul class="myMenu">
    <li><a href="login.jsp"><strong>로그인</strong></a></li>
    <li><a href="member.jsp"><strong>회원가입</strong></a></li>
    <li><a href="index.jsp"><strong>홈으로</strong></a></li>
    
    <li class="menu2"> <strong>매출조회</strong>
        <ul class="menu2_s submenu">
            <li><a href="year.jsp" style="color: #fff;"> 연매출조회</a></li>
            <li><a href="day.jsp" style="color: #fff;"> 월매출조회</a></li>
        </ul>   
    </li>
    <li class="menu3"> <strong>고객검색</strong>
    	<ul class="menu3_s submenu">
    	    <li><a href="nameSelect.jsp" style="color: #fff;">이름으로 검색</a></li>
            <li><a href="phoneSelect.jsp" style="color: #fff;">핸드폰번호로 검색</a></li>
            <li><a href="memoSelect.jsp" style="color: #fff;">메모로 검색</a></li>
        </ul></li>
        <li class="menu4"><a href="memberInsert.jsp"><strong>고객 입력</strong></a></li>
            <li class="menu5"> <strong>스타일 관리</strong>
    	<ul class="menu5_s submenu">
    	    <li><a href="style.jsp" style="color: #fff;">스타일 추가</a></li>
            <li><a href="styleSelect.jsp" style="color: #fff;">스타일 수정/삭제</a></li>
            <li><a href="stylerank.jsp" style="color: #fff;">스타일별 매출조회</a></li>
        </ul></li>
                 <li class="menu5"> <strong>지출내역 관리</strong>
    	<ul class="menu6_s submenu">
    	    <li><a href="ExpensesInsert.jsp" style="color: #fff;">지출내역 등록</a></li>
            <li><a href="ExpensesSelect.jsp" style="color: #fff;">지출내역 리스트</a></li>
        </ul></li>
<br>
<img src="./image/main.jfif" id=mainImage width="1495" height="700" alt="slide">

<script> /* 메인페이지 이미지 슬라이드 */
	var myImage = document.getElementById("mainImage");
	var imageArray=["./image/main.jfif","./image/11.jpg","./image/22.jpg","./image/44.jpg"];
	var imageIndex = 0;

	function changeImage() {
		myImage.setAttribute("src", imageArray[imageIndex]);
		imageIndex++;
		if (imageIndex >= imageArray.length) {
			imageIndex = 0;
		}
	}
	setInterval(changeImage, 2000);
</script>

<br><br>
<%} else { %>
<ul class="myMenu">
    <li><a href="logout.jsp"><strong>로그아웃</strong></a></li>
    <li><a href="member.jsp"><strong>회원가입</strong></a></li>
    <li><a href="index.jsp"><strong>홈으로</strong></a></li>
    
    <li class="menu2"> <strong>매출조회</strong>
        <ul class="menu2_s submenu">
            <li><a href="year.jsp" style="color: #fff;"> 연매출조회</a></li>
            <li><a href="day.jsp" style="color: #fff;"> 월매출조회</a></li>
        </ul>   
    </li>
    <li class="menu3"> <strong>고객검색</strong>
    	<ul class="menu3_s submenu">
    	    <li><a href="nameSelect.jsp" style="color: #fff;">이름으로 검색</a></li>
            <li><a href="phoneSelect.jsp" style="color: #fff;">핸드폰번호로 검색</a></li>
            <li><a href="memoSelect.jsp" style="color: #fff;">메모로 검색</a></li>
        </ul></li>
        <li class="menu4"><a href="memberInsert.jsp"><strong>고객 입력</strong></a></li>
         <li class="menu5"> <strong>스타일 관리</strong>
    	<ul class="menu5_s submenu">
    	    <li><a href="style.jsp" style="color: #fff;">스타일 추가</a></li>
            <li><a href="styleSelect.jsp" style="color: #fff;">스타일 수정/삭제</a></li>
            <li><a href="stylerank.jsp" style="color: #fff;">스타일별 매출조회</a></li>
        </ul></li>
                 <li class="menu5"> <strong>지출내역 관리</strong>
    	<ul class="menu6_s submenu">
    	    <li><a href="ExpensesInsert.jsp" style="color: #fff;">지출내역 등록</a></li>
            <li><a href="ExpensesSelect.jsp" style="color: #fff;">지출내역 리스트</a></li>
        </ul></li>
<img src="./image/main.jfif" id=mainImage width="1495" height="700" alt="slide">
<br>
<script> /* 메인페이지 이미지 슬라이드 */
	var myImage = document.getElementById("mainImage");
	var imageArray=["./image/main.jfif","./image/11.jpg","./image/22.jpg","./image/44.jpg"];
	var imageIndex = 0;

	function changeImage() {
		myImage.setAttribute("src", imageArray[imageIndex]);
		imageIndex++;
		if (imageIndex >= imageArray.length) {
			imageIndex = 0;
		}
	}
	setInterval(changeImage, 2000);
</script>

<%} %>
<%@ include file="footer.jsp" %>
</body>
</html>