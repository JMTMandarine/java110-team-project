<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<style>

#logo {
	width: 50px;
	height: 50px;
}

#table{
border: 1px solid silver;
border-collapse: true;
}

</style>

</head>
<body>
	<div id="titl">
		<img id="logo" src="/img/playButton.PNG" alt="플레이로고">
		<h2>버스킹 일정</h2>
	</div>

<div id='calendar'></div>
    <div id='selectday'>
        <table class='insertDate'>
            <thead>
                <tr><td colspan="4" id='showDate'><h2></h2></td></tr>
                <tr>
                    <td id="showtype"><h4></h4></td>
                    <td><button onclick="add()">등록</button></td>
                    <td><button onclick="remove()">삭제</button></td>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

	<table>
	<thead>
	<tr><th>날짜/시간</th><th>팀명</th><th>장소</th></tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="m">
	<tr><td>${m.nsdt} ~ ${m.nedt}</td><td>${m.busker.teamname}</td><td>${m.addr}</td>
	</c:forEach>
	</tbody>
	</table>
	
	
</body>
</html>