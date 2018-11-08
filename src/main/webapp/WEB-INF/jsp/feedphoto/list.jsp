<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>����Ŀ ������</title>
<link rel='stylesheet' href='/css/common.css'> <!-- �� ������ ���忡���� ��� -->
<style>
    #titl{ margin: 10px; padding: 10px;}
    #logo {width: 50px; height: 50px; margin: 10px;}
    h2{margin-top: -50px; margin-left: 70px; }
    table{
        width: 80%;
        border: 1px solid silver;
        margin: 10%;
        border-collapse: collapse;
    }
    th{
        height: 50px;
        border: 1px solid silver;
        background-color: azure
    }
    td{
        height: 30px;
        border: 1px solid silver;
        padding: 15px;
    }
</style>
</head>
<body>
    <div id="titl">
    <img id="logo" src="../../img/playButton.PNG" alt="�÷��̷ΰ�"><h2>����ŷ ����</h2>
    </div>
<table>
<thead>
<tr>
    <th>����</th> <th>�帣</th> <th>����</th><th>����</th><th>���ƿ���</th>
</tr>
</thead>
<tbody>

<c:forEach  items="${list}" var="m">
<tr>
    <td>${m.teamName}</td>
    <td>${m.genre}</td>
    <td>${m.city}</td>
    <td>${m.content}</td>
    <td>${m.likecount}</td>
</tr>
</c:forEach>

</tbody>
</table>
</body>
</html>