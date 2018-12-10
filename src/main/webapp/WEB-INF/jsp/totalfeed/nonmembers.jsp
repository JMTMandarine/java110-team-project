<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>전체 피드 보기</title>
<link rel="stylesheet" href="/css/common.css"/> 
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script>
/* 	$(document).ready(function(e) {
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#", "");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
	}); 드롭다운 메뉴에 필요한 거였는데 이제 무필요 일듯*/

	$(window).on('load', function() {
		load('.js-load', '12');
		$("#js-btn-wrap .more-button").on("click", function() {
			load('.js-load', '12', '#js-btn-wrap');
		})
	});

	function load(id, cnt, btn) {
		var girls_list = id + ":not(.active)";
		var girls_length = $(girls_list).length;
		var girls_total_cnt;
		if (cnt < girls_length) {
			girls_total_cnt = cnt;
		} else {
			girls_total_cnt = girls_length;
			$('.more-button').hide()
		}
		$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	}
	
	//장르별로 표시
	$(document).ready(function(){

	    $(".filter-button").click(function(){
	        var value = $(this).attr('data-filter');
	        
	        if(value == "all")
	        {
	            //$('.filter').removeClass('hidden');
	            $('.filter').show('1000');
	        }
	        else
	        {
//	            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//	            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
	            $(".filter").not('.'+value).hide('3000');
	            $('.filter').filter('.'+value).show('3000');
	            
	        }
	    });
	    
	    if ($(".filter-button").removeClass("active")) {
	$(this).removeClass("active");
	}
	$(this).addClass("active");

	}); 
</script>
<style>
#bodybody{
min-height: 700px;
}

.teamnametr{
text-align: center;
}

.container {
margin-top: 20px;
}

#js-btn-wrap{
margin-top: 50px;
margin-bottom : 150px;
}

.teamPhotoImg {
	width: 250px;
	height: 250px;
	margin: 5px;
	border-radius: 10px;
}

#titl {
	margin: 20px 0 40px;
	padding: 0;
}

#logo {
	width: 50px;
	height: 50px;
	margin: 10px;
}

#titl2 {
	margin-top: -50px;
	margin-left: 70px;
	margin-bottom: 30px;
}

#td3 {
	text-align: right;
	vertical-align: bottom;
}

.td2 {
	width: 700px;
}

.js-load {
	display: none;
	margin: 30px;
}

.js-load.active {
	display: block;
}

.js-load:after {
	display: none;
}

.btn-wrap, .lists {
	display: block;
}

.btn-wrap {
	text-align: center;
}

#selectsearch{
height: 35px;
width: 70px;
padding: 0;
text-align: center;
}
#selectsearchbtn{
height: 35px;
width: 35px;
padding: 0;
text-align: center;
}
#selectsearchinput{
height: 35px;
padding: 0;
}

</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id=bodybody>
	<div class="container">
	
		<div id="titl">
	        <h2><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">버스커 목록보기</h2>
	    </div>
    
    </div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
				<!-- <form method="get" class="form-inline"> -->
				<div class="input-group">
					<div class="input-group-btn search-panel">
						<select id="selectsearch" class="btn btn-default dropdown-toggle">
							<option value="city">도시</option>
							<option value="teamname" selected="selected">팀명</option>
							<!-- <option value="genre">장르</option> -->
						</select>
					</div>
					<input type="text" class="form-control" name="city"
						placeholder=" 정보를 입력해주세요" onkeydown="pushenter()" id="selectsearchinput"> <span
						class="input-group-btn">
						<button class="btn btn-default" id="selectsearchbtn"
							onclick="PageMove()">
							<span class="glyphicon glyphicon-search"></span>
						</button> <input type="hidden" name="searchType"
						value="<%=request.getParameter("searchType") != null ? request.getParameter("searchType") : ""%>" />
						<input type="hidden" name="keyword"
						value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" />
						<!-- <button class="btn btn-default" id="selectsearchbtn" onclick="button1_click();"><span class="glyphicon glyphicon-search"></span></button> -->
					</span>

				</div>

				<!-- </form>  -->
			</div>
			<!-- 인기순 최신순 -->
			<div>
				<div>
					<input type="radio" class="likedate" id="lcnt" name="sortType"
						value="lcnt"
						<%=request.getParameter("sortType") != null
					? request.getParameter("sortType").equals("lcnt") ? "checked" : ""
					: "checked"%>>
					<label for="lcnt">인기순</label>
				</div>

				<div>
					<input type="radio" class="likedate" id="cdt" name="sortType"
						value="cdt"
						<%=request.getParameter("sortType") != null
					? request.getParameter("sortType").equals("cdt") ? "checked" : ""
					: ""%>>
					<label for="cdt">최신순</label>
				</div>
			</div>
			
			<div align="center">
            <button class="btn btn-default filter-button" data-filter="all">All</button>
            <button class="btn btn-default filter-button" data-filter="ballad">발라드</button>
            <button class="btn btn-default filter-button" data-filter="dance">댄스</button>
            <button class="btn btn-default filter-button" data-filter="trot">트로트</button>
            <button class="btn btn-default filter-button" data-filter="folk">포크</button>
            <button class="btn btn-default filter-button" data-filter="rock">락</button>
            <button class="btn btn-default filter-button" data-filter="jazz">재즈</button>
            <button class="btn btn-default filter-button" data-filter="country">컨츄리</button>
            <button class="btn btn-default filter-button" data-filter="rnb">알앤비</button>
            <button class="btn btn-default filter-button" data-filter="rap">랩</button>
            </div>
			
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main">
					<div class="table table-list-search">

						<c:forEach items="${totalFeed}" var="tf">
							<div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
								<a href="/app/buskerfeed/enter?no=${tf.bno}" style="text-decoration: none; color: #555; " class="js-load">
									<table>
										<tr>
											<td><img src="/upload/${tf.teamPhoto}"
												class="teamPhotoImg"></td>
										</tr>
										<tr class="teamnametr">
											<td>${tf.teamname}</td>
										</tr>
									</table>
								</a>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main">
					<div class="table table-list-search">
						<c:forEach items="${city}" var="tf">
							<div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
								<a href="/app/buskerfeed/enter?no=${tf.bno}" style="text-decoration: none; color: #555;" class="js-load">
									<table>
										<tr>
											<td><img src="/upload/${tf.teamPhoto}"
												class="teamPhotoImg"></td>
										</tr>
										<tr class="teamnametr">
											<td>${tf.teamname}</td>
										</tr>
									</table>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main">
					<div class="table table-list-search">
						<c:forEach items="${teamname}" var="tf">
							<div class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
								<a href="/app/buskerfeed/enter?no=${tf.bno}" style="text-decoration: none; color: #555;" class="js-load">
									<table>
										<tr>
											<td><img src="/upload/${tf.teamPhoto}"
												class="teamPhotoImg"></td>
										</tr>
										<tr class="teamnametr">
											<td>${tf.teamname}</td>
										</tr>
									</table>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div id="js-btn-wrap" class="btn-wrap">
		<a href="javascript:;" class="more-button">더보기</a>
	</div>


	<script>

		$(function() {
			$("input[name='sortType']").click(
					function() {
						var keyword = $("input[name='keyword']").val();
						var url = '/app/totalfeed/nonmembers';
						var sortType = $(this).val();

						if (keyword != null && keyword != '') {
							var searchType = $("input[name='searchType']")
									.val();

							url += '?searchType=' + searchType + '&keyword='
									+ keyword + '&sortType=' + sortType;
						} else {
							url += '?sortType=' + sortType;
						}

						location.href = url;
						PageMove();
					});
		});

		function PageMove() {
			var searchType = $("#selectsearch option:selected").val();
			var keyword = $("input[name='city']").val();
			var sortType = $("input[name='sortType']:checked").val();
			
			location.href = '/app/totalfeed/nonmembers?searchType='
					+ searchType + '&keyword=' + keyword + '&sortType=' + sortType;
		}

		function pushenter() {
			if (window.event.keyCode == 13) {
				PageMove();
			}
		}
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
