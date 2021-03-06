<%@page import="java.util.List"%>
<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="../../css/common.css">
</head>
<title>관리자</title>
</head>

<style>
#topbutton{margin-bottom:0.5rem; }
#mytable{background-color: white;}
 body{background-color: snow;}
    .container{width: 80%; margin: auto;}
    .pagination{margin-right: 39%;}    
    td{text-align: center; vertical-align: middle !important ;}
    th{text-align: center;}
    #bun{float: left;}
    #ccc{float: right; margin-top: 2%;}
    #mttl,.bttl,.stitle{margin-left:45%;}
.close{margin-right: 1rem;}
.mtb{    border: 1px solid silver;
width: 26.5rem;
padding: 0.5rem;
margin: auto;
margin-top: 1.5rem;
margin-bottom: 1rem;
border-radius: 5px;
    }

    #ttl{margin-left: 21px;}
    .mtb label{float: left}
      #titl{margin-top: 3.5%; margin-bottom: 2%;}
    #logo{float: left; width: 40px; height: 40px;}
    #haha{margin-top: 0.6%; margin-left: 4%;}
     .memberDetail,.buskDetail,.supDetail,.btt2,.btt{width: 4rem; height: 1.8rem; font-size: 0.8rem;padding: 0;}
    /* Tabs css */
.list-group-horizontal .list-group-item {
    display: inline-block;
    cursor:pointer;
}
.list-group-horizontal .list-group-item {
    margin-bottom: 0;
    margin-left:-4px;
    margin-right: 0;
}
.list-group-horizontal .list-group-item:first-child {
    border-top-right-radius:0;
    border-bottom-left-radius:4px;
}
.list-group-horizontal .list-group-item:last-child {
    border-top-right-radius:4px;
    border-bottom-left-radius:0;
}
    ul{
    padding-left: 0px;
}
#bun{
width: 40%;
margin-left: -2rem;
}  
.pages{
text-align: center;
padding-left: 28%;
}
#start,#end{width: 8rem; margin-right: 0.2rem;}
.container{width: 70%;}
.text-left{margin-top: 1%; margin-bottom: -1%;}
#ccc{display: inline-flex;}
#selt{width: 6rem; margin-right: 0.2rem;}
#input{width:11rem; margin-right: 0.2rem;}
#tbtn{
font-size: 0.8rem;
    margin-top: -0.15rem;
    height: 2rem;
    padding: 0;
    width: 3rem;
}
#topp{margin-right: 0.2rem;margin-top: 1%;}
.bmimg,.carousel,.mc{    width: 26.5rem;
    height: 19rem;
    margin: auto;}
</style>


<jsp:include page="../header.jsp"></jsp:include>
<div id="titl" class="container">
        <img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
        <h3 id="haha">회원관리</h3>
    </div>
<body>
<div class="container">
        <div id="topbutton">       
        <div class="text-left" style='display:inline-block;'>
            <div class="list-group list-group-horizontal">
               <ul class='tabs'>
                    <li class="list-group-item active" onclick="showList()">전체보기</li>
                    <li class="list-group-item" onclick="showMemb()">일반 </li>
                    <li class="list-group-item" onclick="showBusk()">버스커</li>
                    <li class="list-group-item" onclick="showSup()">제공자</li>
                    <li class="list-group-item" onclick="showStop()">정지</li>
                </ul>
            </div>
        </div>
<!-- 검색 옵션 -->
       <div id="ccc">      
            <input type="date" class="date1 form-control" id="start"><p id="topp">~</p><input type="date" class="date2 form-control" id="end">
            <select name="st" class="flag form-control" id="selt">
              <option value='0' selected>기간</option>
               <option value='1'>일</option>
               <option value='2'>닉네임</option> 
               <option value='3'>이메일</option>
        </select>
        <input type="text" id="input" class="text form-control">
        <button class="btns btns-outline-m" id="tbtn" type="button" onclick="check(1)">클릭</button>
        </div>    
       </div>

<!-- 전체 보기  -->
        <div class="table table-responsive">
              
         <div class="tab12" id="bt1"> 
              <table id="mytable" class="table table-bordred table-striped"> 
                  <thead>                   
                       <tr><th class="col-md-1">아이디</th>
                       <th class="col-md-1">닉네임</th>
                       <th class="col-md-2">이메일</th>
                       <th class="col-md-1">등급</th>
                       <th class="col-md-2">가입일</th>
                       <th class="col-md-2">메모</th>
                       <th class="col-md-1">메모수정</th>
                       <th class="col-md-1">상세보기</th>
                       <th class="col-md-1">정지</th></tr>
                   </thead>
    <tbody id="testappend">
          <c:forEach  items="${list}" var="m">
          <c:if test= "${m.flag == 1}">
             <tr class="tt">
                    <td>${m.id}</td>
                    <td class=niks>${m.nik}</td>
                    <td>${m.email}</td>
                    <td>회원</td>
                    <td>${m.ncdt}</td>
                    <td id="memow">${m.memo}</td>
                    <td><button class="btt btns btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td><div  class="detailbtn"><button name="detailAll" id="btnA" class="memberDetail btns btns-outline-secondary"  data-toggle="modal" data-target="#modalmemberDetail" value="${m.nik}">상세보기</button></div></td>
                    <c:choose>
                    <c:when test="${m.flag < 10}">
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td>
                    </c:when>
                    <c:otherwise>
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td>
                    </c:otherwise>
                    </c:choose>
             </tr>
             </c:if>  
                   <c:if test= "${m.flag == 2}">
          
             <tr class="tt">
                    <td>${m.id}</td>
                    <td class=niks>${m.nik}</td>
                    <td>${m.email}</td>
                    <td>버스커</td>
                    <td>${m.ncdt}</td>
                    <td id="memow">${m.memo}</td>
                    <td><button class="btt btn btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td><div id="detailAll" class="detailbtn"><button name="detailAll" class="buskDetail btns btns-outline-secondary"  data-toggle="modal" data-target="#modalbuskDetail" value="${m.nik}">상세보기</button></div></td>
                    <c:choose>
                    <c:when test="${m.flag < 10}">
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td>
                    </c:when>
                    <c:otherwise>
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td>
                    </c:otherwise>
                    </c:choose>
                    
             </tr>
             
             </c:if>  
                   <c:if test= "${m.flag == 3}">
          
             <tr class="tt">
                    <td class="col-md-1">${m.id}</td>
                    <td class="col-md-1">${m.nik}</td>
                    <td class="col-md-2">${m.email}</td>
                    <td class="col-md-1">제공자</td>
                    <td class="col-md-2">${m.ncdt}</td>
                    <td id="memow" class="col-md-2">${m.memo}</td>
                    <td class="col-md-1"><button class="btt btn btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td class="col-md-1"><div id="detailAll" class="detailbtn"><button id="detailAll" class="supDetail btns btns-outline-secondary"  data-toggle="modal" data-target="#modalsupDetail" value="${m.nik}">상세보기</button></div></td>
                    <c:choose>
                    <c:when test="${m.flag < 10}">
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td>
                    </c:when>
                    <c:otherwise>
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td>
                    </c:otherwise>
                    </c:choose>
             </tr>
             
             </c:if>  
                    <c:if test= "${m.flag > 10}">
             <tr class="tt">
                    <td>${m.id}</td>
                    <td class=niks>${m.nik}</td>
                    <td>${m.email}</td>
                    <td>정지회원</td>
                    <td>${m.ncdt}</td>
                    <td id="memow">${m.memo}</td>
                    <td><button class="btt btn btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="${m.nik}">메모수정</button></td>
                    <td><div id="detailAll" class="detailbtn"><button id="detailAll" class="btt2 btns btns-outline-secondary"  data-toggle="modal" data-target="#model-id" value="${m.nik}">상세보기</button></div></td>
                    <td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td>
             </tr> 
             
             </c:if>  
            </c:forEach>
    </tbody>
</table>

                    <nav aria-label="Page navigation example" class='pages'>
                            <ul class="pagination justify-content-center">
                                <li class="page-item prev">
                                    <a class="page-link" href="javascript:goPage(${paging.prevPageNo})">Previous</a></li>
                                <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                                 <c:choose>
                                 <c:when test="${i eq paging.pageNo}">
                                    <li class="page-item active">
                                    <a href="javascript:goPage(${i})" class="choice">${i}</a></li>
                                 </c:when>  
                                 <c:otherwise>
                                  <li class="page-item">
                                  <a href="javascript:goPage(${i})">${i}</a></li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goPage(${paging.nextPageNo})">Next</a></li>
                            </ul>
                        </nav>
                        <form action="list" class="pageForm">
                        <input type="hidden" class="pageNO" name="pageNo">
                        </form>
                         <form action="showList" class="AllpageForm">
                        <input type="hidden" class="AllpageNO" name="pageNo">
                        </form>
                         <form action="showMemb" class="MembpageForm">
                        <input type="hidden" class="MembpageNO" name="pageNo">
                        </form>
                         <form action="showBusk" class="BuskpageForm">
                        <input type="hidden" class="BuskpageNO" name="pageNo">
                        </form>
                         <form action="showSup" class="SuppageForm">
                        <input type="hidden" class="SuppageNO" name="pageNo">
                        </form>
                                       
      
</div>
</div>
</div>

     
<!-- memo 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">메모 수정</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="cl control-label">:</label>
            <textarea class="texta form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" onclick=ssss() class="gg btn btn-primary" >변경</button>
      </div>
    </div>
  </div>
</div>
<div class="container"><!-- 버스커 모달 시작 -->
  <div id="modalbuskDetail" class="modalbuskdetail modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <div class="bttl">
        
        </div>
      </div>
        <div id="mmain">
                    <div id="slider" id="main">
                        <!-- Top part of the slider -->
                            <div id="carousel-bounding-box" >
                                <div class="mc carousel slide" id="myCarousel">
                                                          
                                        <div class="bmimg active item"  data-slide-number="0">
                                        </div>
                            </div>                            
                    </div>
        </div>
</div>
     <div class="mtb">
        <label>아이디 :</label><div class="bid"></div>
        <label>이메일 :</label><div class="bemail"></div>
        <label>닉네임 :</label><div class="bnik"></div>
        <label>팀명 :</label><div class="bteam"></div>
        <label>선호 장르 :</label><div class="bgenre"></div>
        <label>도시 :</label><div class="bcity"></div>
        <label>연락처 :</label><div class="btel"></div>
        <label>악기 :</label><div class="binst"></div>
        <label style="margin: 0px;">팀소개 :</label><div class="bmemo"></div>
     </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>
</div><!-- 버스커 모달끝 -->

<!-- 회원모달 시작 -->
<div class="container">

  <div id="modalmemberDetail" class="modalmemberDetail modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <div id="mttl">
        </div>
      </div>
      
      <div id="mmain">
                <!-- Slider -->
                    <div id="slider" id="main">
                        <!-- Top part of the slider -->
                                <div class="mc" id="myCarousel2">
                                  
                                    <div class="carousel-inner" >
                                        <div class="mmimg active item">
                                        </div>
                                    </div><!-- Carousel nav -->
                                    </div>
                </div>
</div>

     <div class="mtb">
        <label>아이디 :</label><div class="mid"></div>
        <label>이메일 :</label><div class="meamil"></div>
        <label>닉네임 :</label><div class="mnik"></div>
        <label>선호장르:</label><div class="mgenre"></div>
        <label>메모 :</label><div class="mmemo"></div>
     </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>

</div>
<!-- 회원모달 끝 -->
<!-- 서포터모달 시작 -->
<div class="container">
  <div id="modalsupDetail" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 class="stitle"></h3>
      </div>
      
        <div id="mmain">
                <!-- Slider -->
                <div>
                    <div id="slider" id="main">
                        <!-- Top part of the slider -->
                            <div id="carousel-bounding-box" >
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="dddd carousel-inner" >
                                        <div class="active item"   data-slide-number="0">
                                        <img src="img/%EB%B2%84%EC%8A%A4%ED%82%B9%201.jpg"></div>

                               
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href=".carousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                    </a>
                                    <a class="right carousel-control" href=".carousel" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                    </a>                                
                                    </div>
                    </div>
                </div><!--/Slider-->
            
        </div>
</div>
     <div class="mtb">
        <label>아이디 :</label><div class="sid"><p></p></div>
        <label>이메일 :</label><div class="semail"><p></p></div>
        <label>닉네임 :</label><div class="snik"><p></p></div>
        <label>제공자명 :</label><div class="sname"><p></p></div>
        <label>상세주소 :</label><div class="saddr"><p></p></div>
        <label>선호 장르 :</label><div class="sgenre"><p></p></div>
        <label>수용가능 인원 :</label><div class="scapa"><p></p></div>
        <label>연락처 :</label><div class="stel"><p></p></div>
        <label>메시지 :</label><div class="smemo"><p></p></div>
     </div>
     
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div>
  </div>
  </div>
</div>
<!-- 서포터모달 끝 -->
<script>

/* 정지 기능 */
function stop(params){
    var stopORun;
    var grade;
   $('.btn.btns-outline-danger').each(function(index,item){
       if(item.value == params){
           stopORun = item;
       }
   });
   
    var vals = params.split(' ');
    if(stopORun.innerHTML == '정지'){
    swal({
        title: "정말 정지 시키겠습니까?",
        text: "확인버튼을 누르면 해당 회원은 로그인이 불가능합니다.",
        icon: "warning",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          swal("해당 회원 정지 완료", {
            icon: "success",
          });
          $('button.swal-button.swal-button--confirm').click(function(){
              
              $.ajax({
                  type : "POST",
                  url : "stopMem",
                  dataType : 'json',
                  data : {"id":vals[0], "flag":vals[1]},
                  success : function(data){
                       
                  }
              });
              stopORun.value = vals[0] + " " + 1 +vals[1];
              stopORun.innerHTML = '정지해제';
              location.href = "";
          });
        } 
      });
    } else{
        swal({
            title: "정말 정지해제 시키겠습니까?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) {
              swal("해당 회원 정지해제 완료", {
                icon: "success",
              });
              $('button.swal-button.swal-button--confirm').click(function(){
                  console.log(vals[1]);
                  $.ajax({
                      type : "POST",
                      url : "stopMem",
                      dataType : 'json',
                      data : {"id":vals[0], "flag":vals[1]},
                      success : function(data){
                          
                      }
                  });
                  
                  stopORun.value = vals[0] + " " + vals[1].substr(1);
                  stopORun.innerHTML = '정지';
                  location.href = "";
                  
              });
            } 
          });
        
    }
}
function ssss(){
    
        swal({position: 'top-end',
                  type: 'success',
                  title: '변경하였습니다',
                  showConfirmButton: false})
}

//메모 업데이트
$('.gg').click(function(){
     var texta = $(".texta").val();
     var nik = $(".nikval").attr("value");
     var values = {nik : nik,
                  memo : texta}
    
     $.ajax({
         type : "POST",
            url : "update",
            dateType : "json",
            data :values, 
           
            success : function(data){
                setTimeout("reset()", 1000);
            }, error : function(request, status, error) {
                alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
            }           
    });
});

/* 일반회원 상세보기 */
$(document).on("click",'.memberDetail',function(){
    var m = $(this).val();
    
    $.ajax({
        type : "POST",
        url : "memberListDetail",
        dataType : 'json',
        data : {"nik":m},
        success : function(data){
            $("#mttl").empty();
            $(".mid").empty();
            $(".meamil").empty();
            $(".mnik").empty();
            $(".mgenre").empty();
            $(".mmemo").empty();
            $(".mmimg").empty();
            
            $(".mmimg").append("<img style='width: 26.5rem; height: 400px;' src='/upload/"+data.photo+"'>");
            $("#mttl").append('<h3>'+data.nickname+'</h3>');
            $(".mid").append('<p>'+data.id+'</p>');
            $(".meamil").append('<p>'+data.email+'</p>');
            $(".mnik").append('<p>'+data.nickname+'</p>');
            $(".mgenre").append('<p>'+data.genre0+','+data.genre1+','+data.genre2+'</p>');
            $(".mmemo").append('<p>'+data.memo+'</p>');
        }
    })
    
})

/* 버스커 상세보기 */
$(document).on("click",'.buskDetail',function(){
    var b = $(this).val();
    
    $.ajax({
        type : "POST",
        url : "buskListDetail",
        dataType : 'json',
        data : {"nik":b},
        success : function(data){
            $(".bttl").empty();
            $(".bid").empty();
            $(".bemail").empty();
            $(".bnik").empty();
            $(".bteam").empty();
            $(".bgenre").empty();
            $(".bcity").empty();
            $(".btel").empty();
            $(".binst").empty();
            $(".bmemo").empty();
            $(".bmimg").empty();
            
            $(".bmimg").append("<img style='width: 26.5rem; height: 400px;' class='bbbmimg' src='/upload/"+data.teamPhoto+"'>")
            $(".bttl").append('<h3>'+data.teamname+'</h3>')
            $(".bid").append('<p>'+data.id+'</p>')
            $(".bemail").append('<p>'+data.email+'</p>')
            $(".bnik").append('<p>'+data.nickname+'</p>')
            $(".bteam").append('<p>'+data.teamname+'</p>')
            $(".bgenre").append('<p>'+data.teamgenre+'</p>')
            $(".bcity").append('<p>'+data.city+'</p>')
            $(".btel").append('<p>'+data.tel+'</p>')
            $(".binst").append('<p>'+data.instrument+'</p>')
            $(".bmemo").append("<p>"+data.teamInfo+"</p>")
        }
    })
    
});

/* 제공자 상세보기 */
$(document).on("click",'.supDetail',function(){
    var s = $(this).val();
    $.ajax({
        type : "POST",
        url : "supListDetail",
        dataType : 'json',
        data : {"nik":s},
        success : function(data){
            $(".stitle").empty();            
            $(".sid").empty();
            $(".semail").empty();            
            $(".snik").empty();
            $(".sname").empty();            
            $(".saddr").empty();
            $(".sgenre").empty();            
            $(".scapa").empty();
            $(".stel").empty();            
            $(".smemo").empty();
            $(".dddd").empty();
           
            $.each(data.stagephotos,function(index,item){
                $(".dddd").append("<div class='item'><img style='width: 26.5rem; height: 400px;' bbbmimg data-slide-number="+index+" src='/upload/"+item.photo+"'></div>")
                /* fefefweafefxczbvxcvwfp */
            });
            $(".item:eq(2)").removeClass("item").addClass("item active");
            
            $(".stitle").append(data.name);            
            $(".sid").append('<p>'+data.id+'</p>');
            $(".semail").append('<p>'+data.email+'</p>');            
            $(".snik").append('<p>'+data.nickname+'</p>');
            $(".sname").append('<p>'+data.name+'</p>');            
            $(".saddr").append('<p>'+data.baseaddr+'     '+data.detailaddr+'</p>');
            $(".sgenre").append('<p>'+data.sgnere+'</p>');            
            $(".scapa").append('<p>'+data.capa+'</p>');
            $(".stel").append('<p>'+data.tel+'</p>');            
            $(".smemo").append('<p>'+data.message+'</p>');
           
        }});
        });
        
// 메모 값 가져오기
$(document).on("click",'.btt',function(){
    var nik =$(this).val();
    $.ajax({
        type : "POST",
           url : "getMemo",
           data :{"nik":nik},
           success : function(data){
           $(".cl").empty();
           $('#message-text').empty();
           $('.cl').append("<h1 class='nikval' value="+nik+">"+nik+"님의 메모수정</h1>"); 
           $('#message-text').append(data);
           }, error : function(request, status, error) {
               alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
           }           
   });  
});
   
/* 새로고침 */
function reset(){
    window.location.href=window.location.href;
}

/* 검색 */
function check(e){
var data1= $('.date1').val();
var data2 =$('.date2').val();
var flag = $('.flag').val();
var text = $('.text').val();
var values={
          "cdt1":data1,
          "cdt2":data2,
          "flag":flag,
          "text":text,
          "pageNo":e
          }
$.ajax({
    type : "POST",
    url : "dateselect",
    dataType: 'json',
    data : values,
    success : function(data){
         $("#testappend1").empty();
         $("#testappend2").empty();
         $("#testappend3").empty();
         $("#testappend4").empty();
         $("#testappend").empty();
         $('.pages').empty();

         $.each(data.list,function(index,item){
            if(item.flag == 1 || item.flag == 11){
                var btn;
                if(item.flag < 10){
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                    } else {
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value=value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                    }
            $("#testappend, #testappend1").append('<tr><td>'+item.id+'</td>'
                    +'<td>'+item.nik+'</td>'
                    +'<td>'+item.email+'</td>'
                    +'<td>'+'일반회원'+'</td>'
                    +'<td>'+item.ncdt+'</td>'
                    +'<td>'+item.memo+'</td>'
                    +'<td><button class="btt btns btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="'+item.nik+'">메모수정</button></td>'
                    +'<td><button class="memberDetail btns btns-outline-secondary" data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기</button></td>'
                    + btn
                           );
            }else if(item.flag == 2 || item.flag == 12){
                var btn;
                if(item.flag < 10){
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                    } else {
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                    }
                $("#testappend, #testappend2").append('<tr><td>'+item.id+'</td>'
                 +'<td>'+item.nik+'</td>'
                 +'<td>'+item.email+'</td>'
                 +'<td>'+'버스커'+'</td>'
                 +'<td>'+item.ncdt+'</td>'
                 +'<td>'+item.memo+'</td>'
                 +'<td><button class="btt btns btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="'+item.nik+'">메모수정</button></td>'
                 +'<td><button class="buskDetail btns btns-outline-secondary"  data-toggle="modal" data-target="#modalbuskDetail" value="'+item.nik+'">상세보기</button></td>'
                 + btn        
         );
            }else if(item.flag==3 || item.flag==13){
                var btn;
                if(item.flag < 10){
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                    } else {
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                    }
                $("#testappend, #testappend3").append('<tr><td>'+item.id+'</td>'
                +'<td>'+item.nik+'</td>'
                +'<td>'+item.email+'</td>'
                +'<td>'+'제공자'+'</td>'
                +'<td>'+item.ncdt+'</td>'
                +'<td>'+item.memo+'</td>'
                +'<td><button class="btt btns btns-outline-info"  data-toggle="modal" data-target="#exampleModal"  value="'+item.nik+'">메모수정</button></td>'
                +'<td><button class="supDetail btns btns-outline-secondary"  data-toggle="modal" data-target="#modalsupDetail"value="'+item.nik+'">상세보기</button></td>'
                + btn      
                );
            }
        });
         $('.pages').append(' <ul class="pagination justify-content-center">'+
                 '<li class="page-item prev">'+
                 '<a class="page-link" href="javascript:check('+data.paging.prevPageNo+
                         ')">Previous</a></li>');
            for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                if(i == data.paging.pageNo){
                    $('.pagination.justify-content-center').append('<li class="page-item active">'+
                    '<a href="javascript:check('+i+')" class="choice">'+i+'</a></li>');
                }else{
                    $('.pagination.justify-content-center').append('<li class="page-item">'+
                    '<a href="javascript:check('+i+')">'+i+'</a></li>');
                }
            } 
         $('.pagination.justify-content-center').append('<li class="page-item">'+
                 '<a class="page-link" href="javascript:check('+data.paging.nextPageNo+')">Next</a></li>'+
                 '</ul></nav>');
    },
    error : function(request, status, error) {
        alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
    }
    
});
}

/* 카르셀 */
$('#myCarousel').carousel({
    interval: 5000
});
$('#carousel-text').html($('#slide-content-0').html());
//Handles the carousel thumbnails
$('[id^=carousel-selector-]').click( function(){
    var id = this.id.substr(this.id.lastIndexOf("-") + 1);
    var id = parseInt(id);
    $('#myCarousel').carousel(id);
});
// When the carousel slides, auto update the text
$('#myCarousel').on('slid.bs.carousel', function (e) {
         var id = $('.item.active').data('slide-number');
        $('#carousel-text').html($('#slide-content-'+id).html());
});


/* 전체보기 페이징 */
function goPage(e){
    $('.pageNO').val(e);
    $('.pageForm').submit();
}

/* 에이작으로 전체보기 페이징 */
function goPageAll(e){
    $.ajax({
        type : "POST",
        url : "showList",
        data : {"pageNo":e, "flag":1},
        success : function(data){
            $('#testappend').empty();
            $('.pages').empty();
              $.each(data.list,function(index,item){
                  var btn;
                  if(item.flag < 10){
                      btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td></tr>';                        
                      } else {
                      btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td></tr>'     
                      }
                $('#testappend').append(
               '<tr><td>'+item.id+'</td>'+
               '<td class=niks>'+item.nik+'</td>'+
               '<td>'+item.email+'</td><td>'+item.type+'</td>'+
               '<td>'+item.ncdt+'</td>'+
               '<td id="memow">'+item.memo+'</td>'+
               '<td><button class="btt btns btns-outline-info"'+  
               'data-toggle="modal" data-target="#exampleModal"'+
               'value="'+item.nik+'">메모수정</button></td>'+
               '<td><div class="detailbtn"><button name="detailAll"'+
               'class="memberDetail btns btns-outline-secondary"'+  
               'data-toggle="modal" data-target="#memberDetail" value="'+item.nik+'">상세보기'
               +'</button></div></td>'
               + btn
                )});
        $('.pages').append(' <ul class="pagination justify-content-center">'+
                '<li class="page-item prev">'+
                '<a class="page-link" href="javascript:goPageAll('+data.paging.prevPageNo+
                        ')">Previous</a></li>');
           for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
               if(i == data.paging.pageNo){
                   $('.pagination.justify-content-center').append('<li class="page-item active">'+
                   '<a href="javascript:goPageAll('+i+')" class="choice">'+i+'</a></li>');
               }else{
                   $('.pagination.justify-content-center').append('<li class="page-item">'+
                   '<a href="javascript:goPageAll('+i+')">'+i+'</a></li>');
               }
           } 
        $('.pagination.justify-content-center').append('<li class="page-item">'+
                '<a class="page-link" href="javascript:goPageAll('+data.paging.nextPageNo+')">Next</a></li>'+
                '</ul></nav>');
        },
         error : function(request, status, error) {
         }
        
    });
}

/* 에이작으로 일반회원 페이징 */
function goPageMemb(e){
    $.ajax({
        type : "POST",
        url : "showMemb",
        data : {"pageNo":e, "flag":1},
        success : function(data){
             $('#testappend').empty();
             $('.pages').empty();
             $.each(data.list,function(index,item){
                 var btn;
                 if(item.flag < 10){
                     btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td></tr>';                        
                     } else {
                     btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td></tr>'     
                     }
             $('#testappend').append(
                '<tr><td>'+item.id+'</td>'+
                '<td class=niks>'+item.nik+'</td>'+
                '<td>'+item.email+'</td><td>회원</td>'+
                '<td>'+item.ncdt+'</td>'+
                '<td id="memow">'+item.memo+'</td>'+
                '<td><button class="btt btns btns-outline-info"'+  
                'data-toggle="modal" data-target="#exampleModal"'+
                'value="'+item.nik+'">메모수정</button></td>'+
                '<td><div class="detailbtn"><button name="detailAll"'+
                'class="memberDetail btns btns-outline-secondary"'+  
                'data-toggle="modal" data-target="#memberDetail" value="'+item.nik+'">상세보기'
                +'</button></div></td>'
                + btn
                 );});
             $('.pages').append(' <ul class="pagination justify-content-center">'+
                     '<li class="page-item prev">'+
                     '<a class="page-link" href="javascript:goPageMemb('+data.paging.prevPageNo+
                             ')">Previous</a></li>');
                for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                    if(i == data.paging.pageNo){
                        $('.pagination.justify-content-center').append('<li class="page-item active">'+
                        '<a href="javascript:goPageMemb('+i+')" class="choice">'+i+'</a></li>');
                    }else{
                        $('.pagination.justify-content-center').append('<li class="page-item">'+
                        '<a href="javascript:goPageMemb('+i+')">'+i+'</a></li>');
                    }
                } 
             $('.pagination.justify-content-center').append('<li class="page-item">'+
                     '<a class="page-link" href="javascript:goPageMemb('+data.paging.nextPageNo+')">Next</a></li>'+
                     '</ul></nav>');
         },
          error : function(request, status, error) {
          }
        
    });
}

/* 에이작으로 버스커 페이징 */
function goPageBusk(e){
    $.ajax({
        type : "POST",
        url : "showBusk",
        data : {"pageNo":e, "flag":1},
        success : function(data){
            $('#testappend').empty();
            $('.pages').empty();
              $.each(data.list,function(index,item){
                  var btn;
                  if(item.flag < 10){
                      btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td></tr>';                        
                      } else {
                      btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td></tr>'     
                      }
                  $('#testappend').append(
                          '<tr><td>'+item.id+'</td>'+
                          '<td class=niks>'+item.nik+'</td>'+
                          '<td>'+item.email+'</td><td>버스커</td>'+
                          '<td>'+item.ncdt+'</td>'+
                          '<td id="memow">'+item.memo+'</td>'+
                          '<td><button class="btt btns btns-outline-info"'+  
                          'data-toggle="modal" data-target="#exampleModal"'+
                          'value="'+item.nik+'">메모수정</button></td>'+
                          '<td><div class="detailbtn"><button name="detailAll"'+
                          'class="memberDetail btns btns-outline-secondary"'+  
                          'data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기'
                          +'</button></div></td>'
                          +btn
                           );});
                   $('.pages').append(' <ul class="pagination justify-content-center">'+
                           '<li class="page-item prev">'+
                           '<a class="page-link" href="javascript:goPageBusk('+data.paging.prevPageNo+
                                   ')">Previous</a></li>');
                      for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                          if(i == data.paging.pageNo){
                              $('.pagination.justify-content-center').append('<li class="page-item active">'+
                              '<a href="javascript:goPageBusk('+i+')" class="choice">'+i+'</a></li>');
                          }else{
                              $('.pagination.justify-content-center').append('<li class="page-item">'+
                              '<a href="javascript:goPageBusk('+i+')">'+i+'</a></li>');
                          }
                      } 
                   $('.pagination.justify-content-center').append('<li class="page-item">'+
                           '<a class="page-link" href="javascript:goPageBusk('+data.paging.nextPageNo+')">Next</a></li>'+
                           '</ul></nav>');
        },
         error : function(request, status, error) {
         }
        
    });
}


/* 에이작으로 서포터 페이징 */
function goPageSup(e){
    $.ajax({
        type : "POST",
        url : "showSup",
        data : {"pageNo":e, "flag":1},
        success : function(data){
            $('#testappend').empty();
            $('.pages').empty();
              $.each(data.list,function(index,item){
                  var btn;
                  if(item.flag < 10){
                      btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td></tr>';                        
                      } else {
                      btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td></tr>'     
                      }
                  $('#testappend').append(
                          '<tr><td>'+item.id+'</td>'+
                          '<td class=niks>'+item.nik+'</td>'+
                          '<td>'+item.email+'</td><td>제공자</td>'+
                          '<td>'+item.ncdt+'</td>'+
                          '<td id="memow">'+item.memo+'</td>'+
                          '<td><button class="btt btns btns-outline-info"'+  
                          'data-toggle="modal" data-target="#exampleModal"'+
                          'value="'+item.nik+'">메모수정</button></td>'+
                          '<td><div class="detailbtn"><button name="detailAll"'+
                          'class="memberDetail btns btns-outline-secondary"'+  
                          'data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기'
                          +'</button></div></td>'
                          + btn 
                           );});
                   $('.pages').append(' <ul class="pagination justify-content-center">'+
                           '<li class="page-item prev">'+
                           '<a class="page-link" href="javascript:goPageSup('+data.paging.prevPageNo+
                                   ')">Previous</a></li>');
                      for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                          if(i == data.paging.pageNo){
                              $('.pagination.justify-content-center').append('<li class="page-item active">'+
                              '<a href="javascript:goPageSup('+i+')" class="choice">'+i+'</a></li>');
                          }else{
                              $('.pagination.justify-content-center').append('<li class="page-item">'+
                              '<a href="javascript:goPageSup('+i+')">'+i+'</a></li>');
                          }
                      } 
                   $('.pagination.justify-content-center').append('<li class="page-item">'+
                           '<a class="page-link" href="javascript:goPageSup('+data.paging.nextPageNo+')">Next</a></li>'+
                           '</ul></nav>');
               },
                error : function(request, status, error) {
                }
        
    });
}

/* 에이작으로 정지회원 페이징 */
function goPageStop(e){
    $.ajax({
        type : "POST",
        url : "showStop",
        data : {"pageNo":e, "flag":1},
        success : function(data){
            $('#testappend').empty();
            $('.pages').empty();
            $.each(data.list,function(index,item){
                var btn;
                if(item.flag < 10){
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td></tr>';                        
                    } else {
                    btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td></tr>'     
                    }
                $('#testappend').append(
                   '<tr><td>'+item.id+'</td>'+
                   '<td class=niks>'+item.nik+'</td>'+
                   '<td>'+item.email+'</td><td>'+item.type+'</td>'+
                   '<td>'+item.ncdt+'</td>'+
                   '<td id="memow">'+item.memo+'</td>'+
                   '<td><button class="btt btns btns-outline-info"'+  
                   'data-toggle="modal" data-target="#exampleModal"'+
                   'value="'+item.nik+'">메모수정</button></td>'+
                   '<td><div class="detailbtn"><button name="detailAll"'+
                   'class="memberDetail btns btns-outline-secondary"'+  
                   'data-toggle="modal" data-target="#memberDetail" value="'+item.nik+'">상세보기'
                   +'</button></div></td>'
                   + btn
                    );});
            $('.pages').append(' <ul class="pagination justify-content-center">'+
                    '<li class="page-item prev">'+
                    '<a class="page-link" href="javascript:goPageStop('+data.paging.prevPageNo+
                            ')">Previous</a></li>');
               for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                   if(i == data.paging.pageNo){
                       $('.pagination.justify-content-center').append('<li class="page-item active">'+
                       '<a href="javascript:goPageStop('+i+')" class="choice">'+i+'</a></li>');
                   }else{
                       $('.pagination.justify-content-center').append('<li class="page-item">'+
                       '<a href="javascript:goPageStop('+i+')">'+i+'</a></li>');
                   }
               } 
            $('.pagination.justify-content-center').append('<li class="page-item">'+
                    '<a class="page-link" href="javascript:goPageStop('+data.paging.nextPageNo+')">Next</a></li>'+
                    '</ul></nav>');
        },
         error : function(request, status, error) {
         }
        
    });
}

/* 에이작으로 전체보기 */
function showList(){
    $('.tabs li').eq(0).removeClass('list-group-item').addClass('list-group-item active');
    $('.tabs li:not(:eq(0))').removeClass('list-group-item active').addClass('list-group-item');
   var flag=1;
    $.ajax({
            type : "POST",
            url : "showList",
            data : {"flag":flag},   
            success : function(data){
                $('#testappend').empty();
                $('.pages').empty();
                  $.each(data.list,function(index,item){
                      console.log(item);
                      var btn;
                      if(item.flag < 10){
                          btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지</button></td></tr>';                        
                          } else {
                          btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="${m.id} ${m.flag}" onclick="stop(value)">정지해제</button></td></tr>'     
                          }
                    $('#testappend').append(
                   '<tr><td>'+item.id+'</td>'+
                   '<td class=niks>'+item.nik+'</td>'+
                   '<td>'+item.email+'</td><td>'+item.type+'</td>'+
                   '<td>'+item.ncdt+'</td>'+
                   '<td id="memow">'+item.memo+'</td>'+
                   '<td><button class="btt btns btns-outline-info"'+  
                   'data-toggle="modal" data-target="#exampleModal"'+
                   'value="'+item.nik+'">메모수정</button></td>'+
                   '<td><div class="detailbtn"><button name="detailAll"'+
                   'class="memberDetail btns btns-outline-secondary"'+  
                   'data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기'
                   +'</button></div></td>'
                   + btn 
                    )});
            $('.pages').append(' <ul class="pagination justify-content-center">'+
                    '<li class="page-item prev">'+
                    '<a class="page-link" href="javascript:goPageAll('+data.paging.prevPageNo+
                            ')">Previous</a></li>');
               for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                   if(i == data.paging.pageNo){
                       $('.pagination.justify-content-center').append('<li class="page-item active">'+
                       '<a href="javascript:goPageAll('+i+')" class="choice">'+i+'</a></li>');
                   }else{
                       $('.pagination.justify-content-center').append('<li class="page-item">'+
                       '<a href="javascript:goPageAll('+i+')">'+i+'</a></li>');
                   }
               } 
            $('.pagination.justify-content-center').append('<li class="page-item">'+
                    '<a class="page-link" href="javascript:goPageAll('+data.paging.nextPageNo+')">Next</a></li>'+
                    '</ul></nav>');
            },
             error : function(request, status, error) {
             }
            
        });
}


/* 에이작으로 일반회원*/
function showMemb(){
    $('.tabs li').eq(1).removeClass('list-group-item').addClass('list-group-item active');
    $('.tabs li:not(:eq(1))').removeClass('list-group-item active').addClass('list-group-item');
    var flag=1;
    $.ajax({
            type : "POST",
            url : "showMemb",
            data : {"flag":flag},
            success : function(data){
                $('#testappend').empty();
                $('.pages').empty();
                $.each(data.list,function(index,item){
                    var btn;
                    if(item.flag < 10){
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                        } else {
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                        }
                $('#testappend').append(
                        '<tr><td>'+item.id+'</td>'+
                   '<td class=niks>'+item.nik+'</td>'+
                   '<td>'+item.email+'</td><td>회원</td>'+
                   '<td>'+item.ncdt+'</td>'+
                   '<td id="memow">'+item.memo+'</td>'+
                   '<td><button class="btt btns btns-outline-info"'+  
                   'data-toggle="modal" data-target="#exampleModal"'+
                   'value="'+item.nik+'">메모수정</button></td>'+
                   '<td><div class="detailbtn"><button name="detailAll"'+
                   'class="memberDetail btns btns-outline-secondary"'+  
                   'data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기'
                   +'</button></div></td>'
                   + btn
                    );});
                $('.pages').append('<ul class="pagination justify-content-center">'+
                        '<li class="page-item prev">'+
                        '<a class="page-link" href="javascript:goPageAll('+data.paging.prevPageNo+
                                ')">Previous</a></li>');
                   for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                       if(i == data.paging.pageNo){
                           $('.pagination.justify-content-center').append('<li class="page-item active">'+
                           '<a href="javascript:goPageAll('+i+')" class="choice">'+i+'</a></li>');
                       }else{
                           $('.pagination.justify-content-center').append('<li class="page-item">'+
                           '<a href="javascript:goPageAll('+i+')">'+i+'</a></li>');
                       }
                   } 
                $('.pagination.justify-content-center').append('<li class="page-item">'+
                        '<a class="page-link" href="javascript:goPageAll('+data.paging.nextPageNo+')">Next</a></li>'+
                        '</ul></nav>');
            },
             error : function(request, status, error) {
                 console.log(error);
             }
            
        });
};


/* 에이작으로 버스커 */
function showBusk(){
       $('.tabs li').eq(2).removeClass('list-group-item').addClass('list-group-item active');
        $('.tabs li:not(:eq(2))').removeClass('list-group-item active').addClass('list-group-item');
    var flag=2;
    $.ajax({
            type : "POST",
            url : "showBusk",
            data : {"flag":flag},
            success : function(data){
                $('#testappend').empty();
                $('.pages').empty();
                $.each(data.list,function(index,item){
                    var btn;
                    if(item.flag < 10){
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                        } else {
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                        }
                    $('#testappend').append(
                       '<tr><td>'+item.id+'</td>'+
                       '<td class=niks>'+item.nik+'</td>'+
                       '<td>'+item.email+'</td><td>버스커</td>'+
                       '<td>'+item.ncdt+'</td>'+
                       '<td id="memow">'+item.memo+'</td>'+
                       '<td><button class="btt btns btns-outline-info"'+  
                       'data-toggle="modal" data-target="#exampleModal"'+
                       'value="'+item.nik+'">메모수정</button></td>'+
                       '<td><div class="detailbtn"><button name="detailAll"'+
                       'class="memberDetail btns btns-outline-secondary"'+  
                       'data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기'
                       +'</button></div></td>'
                       + btn
                        );});
                $('.pages').append(' <ul class="pagination justify-content-center">'+
                        '<li class="page-item prev">'+
                        '<a class="page-link" href="javascript:goPageBusk('+data.paging.prevPageNo+
                                ')">Previous</a></li>');
                   for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                       if(i == data.paging.pageNo){
                           $('.pagination.justify-content-center').append('<li class="page-item active">'+
                           '<a href="javascript:goPageBusk('+i+')" class="choice">'+i+'</a></li>');
                       }else{
                           $('.pagination.justify-content-center').append('<li class="page-item">'+
                           '<a href="javascript:goPageBusk('+i+')">'+i+'</a></li>');
                       }
                   } 
                $('.pagination.justify-content-center').append('<li class="page-item">'+
                        '<a class="page-link" href="javascript:goPageBusk('+data.paging.nextPageNo+')">Next</a></li>'+
                        '</ul></nav>');
            },
             error : function(request, status, error) {
             }
            
        });
};


/* 에이작으로 제공자*/
function showSup(){
       $('.tabs li').eq(3).removeClass('list-group-item').addClass('list-group-item active');
        $('.tabs li:not(:eq(3))').removeClass('list-group-item active').addClass('list-group-item');
    var flag=3;
    $.ajax({
            type : "POST",
            url : "showSup",
            data : {"flag":flag},
            success : function(data){
                $('#testappend').empty();
                $('.pages').empty();
                $.each(data.list,function(index,item){
                    var btn;
                    if(item.flag < 10){
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                        } else {
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                        }
                    $('#testappend').append(
                       '<tr><td>'+item.id+'</td>'+
                       '<td class=niks>'+item.nik+'</td>'+
                       '<td>'+item.email+'</td><td>제공자</td>'+
                       '<td>'+item.ncdt+'</td>'+
                       '<td id="memow">'+item.memo+'</td>'+
                       '<td><button class="btt btns btns-outline-info"'+  
                       'data-toggle="modal" data-target="#exampleModal"'+
                       'value="'+item.nik+'">메모수정</button></td>'+
                       '<td><div class="detailbtn"><button name="detailAll"'+
                       'class="memberDetail btns btns-outline-secondary"'+  
                       'data-toggle="modal" data-target="#modalmemberDetail" value="'+item.nik+'">상세보기'
                       +'</button></div></td>'
                       + btn
                        );});
                $('.pages').append(' <ul class="pagination justify-content-center">'+
                        '<li class="page-item prev">'+
                        '<a class="page-link" href="javascript:goPageSup('+data.paging.prevPageNo+
                                ')">Previous</a></li>');
                   for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                       if(i == data.paging.pageNo){
                           $('.pagination.justify-content-center').append('<li class="page-item active">'+
                           '<a href="javascript:goPageSup('+i+')" class="choice">'+i+'</a></li>');
                       }else{
                           $('.pagination.justify-content-center').append('<li class="page-item">'+
                           '<a href="javascript:goPageSup('+i+')">'+i+'</a></li>');
                       }
                   } 
                $('.pagination.justify-content-center').append('<li class="page-item">'+
                        '<a class="page-link" href="javascript:goPageSup('+data.paging.nextPageNo+')">Next</a></li>'+
                        '</ul></nav>');
            },
             error : function(request, status, error) {
             }
            
        });
};


/* 에이작으로 정지 탭*/
function showStop(){
       $('.tabs li').eq(4).removeClass('list-group-item').addClass('list-group-item active');
        $('.tabs li:not(:eq(4))').removeClass('list-group-item active').addClass('list-group-item');
    var flag=4;
    $.ajax({
            type : "POST",
            url : "showStop",
            data : {"flag":flag},
            success : function(data){
                $('#testappend').empty();
                $('.pages').empty();
                $.each(data.list,function(index,item){
                    var btn;
                    if(item.flag < 10){
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지</button></td></tr>';                        
                        } else {
                        btn = '<td><button class="btn btns-outline-danger" data-title="Delete" data-toggle="modal" data-target="#delete" value="'+item.id+" "+item.flag+'" onclick="stop(value)">정지해제</button></td></tr>'     
                        }
                    $('#testappend').append(
                       '<tr><td>'+item.id+'</td>'+
                       '<td class=niks>'+item.nik+'</td>'+
                       '<td>'+item.email+'</td><td>정지회원</td>'+
                       '<td>'+item.ncdt+'</td>'+
                       '<td id="memow">'+item.memo+'</td>'+
                       '<td><button class="btt btns btns-outline-info"'+  
                       'data-toggle="modal" data-target="#exampleModal"'+
                       'value="'+item.nik+'">메모수정</button></td>'+
                       '<td><div class="detailbtn"><button name="detailAll"'+
                       'class="memberDetail btns btns-outline-secondary"'+  
                       'data-toggle="modal" data-target="#memberDetail" value="'+item.nik+'">상세보기'
                       +'</button></div></td>'
                       + btn
                        );});
                $('.pages').append(' <ul class="pagination justify-content-center">'+
                        '<li class="page-item prev">'+
                        '<a class="page-link" href="javascript:goPageStop('+data.paging.prevPageNo+
                                ')">Previous</a></li>');
                   for(var i = data.paging.startPageNo;i<=data.paging.endPageNo;i++){
                       if(i == data.paging.pageNo){
                           $('.pagination.justify-content-center').append('<li class="page-item active">'+
                           '<a href="javascript:goPageStop('+i+')" class="choice">'+i+'</a></li>');
                       }else{
                           $('.pagination.justify-content-center').append('<li class="page-item">'+
                           '<a href="javascript:goPageStop('+i+')">'+i+'</a></li>');
                       }
                   } 
                $('.pagination.justify-content-center').append('<li class="page-item">'+
                        '<a class="page-link" href="javascript:goPageStop('+data.paging.nextPageNo+')">Next</a></li>'+
                        '</ul></nav>');
            },
             error : function(request, status, error) {
             }
            
        });
};
</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>