<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>버스커피드가기</title>
<link rel='stylesheet' href='/css/common.css'>
<style>
#titl {
	margin: 10px;
	padding: 10px;
}

#logo {
	width: 50px;
	height: 50px;
	margin: 10px;
}

h2 {
	margin-top: -50px;
	margin-left: 70px;
}
</style>
</head>
<body>
	<div id="titl">
		<img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
		<h2>버스킹 피드가기</h2>
	</div>

	<form action="add" method='post' enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<th>버스커번호</th>
					<td><input type='text' name='title'></td>
				</tr>
				<tr>
					<th></th>
					<td><button>등록</button></td>
				</tr>

			</tbody>
		</table>
	</form>


</body>
</html>















