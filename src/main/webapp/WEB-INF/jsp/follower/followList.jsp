<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en"  id="top">
<head>
    <meta charset="UTF-8">
    <title>팔로우 리스트</title>
<link rel="stylesheet" href="/css/common.css"/>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<style>

#titl {
    margin: 10px auto; padding: 10px 0; width: 920px;
}

#logo {
    width: 40px;
    height: 40px;
    margin: 10px;
}

#bodybody{
    min-height: 850px;
}
    
body {
    margin: 0;
    background-color: #f5f5f5;
}

.container {
    height: 950px;
    width: 900px;
    padding-right: auto;
    padding-left: 2rem;
    margin-right: auto;
    margin-left: auto;
    margin-bottom: 1rem;
    border-radius: 8px/7px;
    background-color: #ebebeb; 
    /* box-shadow: 1px 2px 5px rgba(0,0,0,.31);  */
    border: solid 1px #cbc9c9;
}
/* 데이터가 없을 때 */
#nodata{
text-align: center;
}
#nodata h3{
position: absolute;
width:100%;
margin-top: -800px;
margin-left: auto;
font-size: 32px;
}

/*페이지네이션*/
.OutOfpagination {
    text-align: center;
}

.pagination {
    margin-bottom: 150px;
    display: inline-block;
    color: #01DF01;
    text-decoration: none;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

.pagination a:hover:not(.active) {background-color: #ddd;}


/*리스트 출력*/
.innertable
{
text-align: center;
}

.gallery-title
{
    font-size: 36px;
    color: #42B32F;
    text-align: center;
    font-weight: 500;
    margin-bottom: 70px;
}
.gallery-title:after {
    content: "";
    position: absolute;
    width: 7.5%;
    left: 46.5%;
    height: 45px;
    border-bottom: 1px solid #5e5e5e;
}

.port-image
{
    width: 100%;
}

.gallery_product
{
    margin-bottom: 30px;
}
/* 팀이름 크기조절 */
.teamnamefont{
font-size: large;
/* font-family: -webkit-body; */
}

.teamPhotoImg {
    width: 210px;
    height: 210px;
    margin: 0;
    border-radius: 0.25rem;
}
.teamPhotoImgWrap {
    /* display: inline-block; */
    margin: 11px 0 11px 11px;
    position: relative;
}
.teamPhotoImgWrap:after {
    position: absolute;
    display: block;
    content: "";
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    box-shadow: 
      inset 0 0 20px #fff /* 배경과 같은 색 */,
      inset 0 0 20px #fff,
      inset 0 0 20px #fff,
      inset 0 0 20px #fff;
}

/*오른쪽 자세히*/
#xbutton{
width: 15px;
height: 15px;
}
div.wrapfollowerdetailOpen {
    opacity:1;
    pointer-events: auto;
}

.wrapfollowerdetail{
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}

.wrapfollowerdetail > div {/* 모달창 */
    position: absolute;
    top: 25%;
    left: 25%;
    width: 50%;
    min-width: 700px;
    max-width: 820px;
    min-height: 469px;
    height: 50%;
    padding: 0;
    background-color: white;
    overflow: auto; 
    border-radius: 5px;
}
#followerdetail {/* 테이블 */
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    margin : auto;
    padding-top: 30px; 
}

.leftside{ /* 일반메뉴 */
width: 80px;
height: 35px;
text-align: left;
pading: 5px;
margin: 5px;
}
.rightside{
width: 270px;
height: 35px;
text-align: left;
pading: 5px;
margin: 5px;
}
#closebtn{
margin-rignt:5px;
padding-right: 5px;
padding:0;
text-align: right;
}
#inclosebtn {
margin-rignt:5px;
padding-right: 5px;
text-decoration:none ;
color:#000000;
width: 30px;
height: 30px;
}

#leftsidebottom{ /* 가장아래 메뉴 */
margin: 5px 0px 0px 0px;
padding: 5px 0px 0px 0px;
width: 80px;
height: 190px;
text-align: left;
vertical-align: top;
}
#rightsidebottom{ /* 가장아래 메뉴 */
margin: 5px 0px 0px 0px;
padding: 5px 0px 0px 0px;
width: 270px;
height: 190px;
text-align: left;
vertical-align: top;
}
#gofeed{
text-align: center;
padding-top: 10px;
width: 300px;
height: 20px;
}



/* 모달창 사진 */

.detailphotowrap {
    /* display: inline-block; */
    position: relative;
    overflow: hidden; /* 불필요한 부분 가리기 */
    padding: 6px; /* 6px정도 이미지 밖으로 표현 */
}
.detailphotowrap:before,
.detailphotowrap:after {
    content: "";
    position: absolute;
    z-index: 1;
    width: 97px;
    height: 50px;
    background: #fff; /* 배경색과 같은 색 */
    transform: rotate(-30deg);
}
/* 왼쪽 위 */
.detailphotowrap:before {
    box-shadow: 0 10px 8px -12px rgba(0, 0, 0, 0.8);
    top: -24px;
    bottom: auto;
    right: auto;
    left: -26px;

}
/* 오른쪽 아래 */
.detailphotowrap:after {
    box-shadow: 0 -10px 10px -10px rgba(0, 0, 0, 0.7);
    top: auto;
    bottom: -22px;
    right: -25px;
    left: auto;
}

#detailphoto{
width: 250px;
height: 250px;
margin: 0 30px;
padding: 0;
box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
}

.bigdiv{
display: flex;
text-align: center;
}

#followPagenation{
margin-top: 50px;
}

/* 위로가기 */
a#movetop {
    position: fixed; right: 2%; bottom: 82px; display: none; z-index: 999;
}

</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<div id="bodybody">
        <div id="pos"></div>
	    <div id="titl">
	        <h2><img id="logo" src="../../img/playButton.PNG" alt="플레이로고">팔로우 리스트</h2>
	    </div>
    <div class="container">

        <div class="row">
            <div id="followPagenation">
                <c:forEach items="${followerList}" var="bno">
                    <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter ${bno.teamgenre}">
	                   <a href="javascript:void(0)" value="${bno.bno}" 
	                   style="text-decoration: none; color: #555; " class="followerbtn" >
		                   <table class="innertable">
		                       <tr><td class="teamPhotoImgWrap"><img src="/upload/${bno.teamPhoto}" class="teamPhotoImg"></td></tr> 
		                       <tr><td class="teamnamefont">${bno.teamname}</td></tr>
		                   </table>
	                   </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- 페이지네이션 -->
    <div class="toolbar-bottom">
        <div class="toolbar mt-lg">
            <div class="sorter">
                <div class="OutOfpagination">
                    <ul class="pagination">
                      <li><a href="javascript:PageMove(${pageMove.startPageNo},${pageMove.no})" class="first" style="color: #000000;">&laquo;&laquo;</a></li>
                      <li><a href="javascript:PageMove(${pageMove.prePageNo},${pageMove.no})" class="prev" style="color: #000000;">&laquo;</a></li>
                      <%-- <a href="javascript:PageMovePre(${i},${pageMove.no})" style="color: #000000;">&laquo;</a> --%>
                        <c:forEach var="i"  begin="${pageMove.visibleStartPageNo}" end="${pageMove.visibleEndPageNo}" step="1">
                            <li><a href="javascript:PageMove(${i},${pageMove.no})" style="color: #000000;">${i}</a></li>
                        </c:forEach>
                      <%-- <a href="javascript:PageMoveNext(${i},${pageMove.no})" style="color: #000000;">&raquo;</a> --%>
                      <li><a href="javascript:PageMove(${pageMove.nexPageNo},${pageMove.no})" class="next" style="color: #000000;">&raquo;</a></li>
                      <li><a href="javascript:PageMove(${pageMove.endPageNo},${pageMove.no})" class="last" style="color: #000000;">&raquo;&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<a href="#" id="movetop"><img src="../../img/topbtn.png"></a>
<!-- 팔로잉된 버스커가 없을때 -->
<div id="nodata">
    <h3>${nodata}</h3>
</div>

<!--우측 자세히 보기-->
    <div id="wrapfollowerdetail" class="wrapfollowerdetail">
        <div>
        <div id="closebtn"><a href="javascript:void(0)" id="inclosebtn">close X </a></div>
            <table id="followerdetail">
                <tbody>
                             
                </tbody>
            </table>
        </div>
    </div>

  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="/js/headerfixing.js"></script>
  <script src="/js/promotion/promofilter.js"></script>
  <script src='../../js/jquery.easing.1.3.js'></script>
<script>
//페이징 
/* function PageMovePre(prePageNo,no){
    location.href="?no="+ no +"&pageNo="+prePageNo;
   } */
//매개변수 이름 달라도 잘들어가네요;;;;
function PageMove(i,no){
    location.href="?no="+ no +"&pageNo="+i;
   }

/* function PageMoveNext(nexPageNo,no){
    location.href="?no="+ no +"&pageNo="+nexPageNo;
   } */


 

//자세히 보기
$('.followerbtn').click(function(e){
	var folbtn = $(e.target).parent().parent().parent().parent()
    var bno = $(folbtn).attr('value'); 
/* 	console.log(folbtn);
    console.log(bno); */
    
    $.ajax({ 
        type : "POST", //보내는 타입을 Post방식으로 할지,  GET방식으로 할지 결정
        url : "followerdetail", // /내 프로젝트명/XML파일의namespace/내가불러올XML의Query이름.do
        //header :'Content-Type: application/json',
        dataType: 'json',
        data : { bno : bno }, //파라미터 넘겨줄 부분? : 이게 할말이 많은데 원래 GET방식으로 하라했다가 
        //contentType : "application/x-www-form-urlencoded; charset=utf-8",  // 기본값이라고 하니까 건들이지 않았고 
        success : function(data) {
           $("#followerdetail tbody").empty();
                
           $("#followerdetail tbody").append(
              '<tr><td rowspan="4" class="detailphotowrap"><img src="/upload/'+data.teamPhoto+'" id="detailphoto"></td>'
          	  +'<td class="leftside">팀    명 : </td><td class="rightside">'+data.teamname+'</td></tr>'
              +'<tr><td class="leftside">주요장르 : </td><td class="rightside">'+data.teamgenre+'</td></tr>'
              +'<tr><td class="leftside">활동도시 : </td><td class="rightside">'+data.city+'</td></tr>'
              +'<tr><td id="leftsidebottom">소 개 말 : </td><td id="rightsidebottom">'+data.teamInfo+'</td></tr>'
              +'<tr><td id="gofeed" colspan="3"><a href="javascript:void(0)" class="more-button" style="text-decoration: none;" >그만 보기</a>'
              +'<a href="/app/buskerfeed/enter?no='+data.bno+'" class="more-button" style="text-decoration: none;">피드가기</a></td></tr>');
           $('.wrapfollowerdetail').addClass('wrapfollowerdetailOpen');
        },
        error : function(request, status, error) {
            alert("에러가 발생했습니다. 관리자에게 문의하시기 바랍니다");
        }
    });
	
});


   /* 상단고정, 위로가기 */
   $(document).scroll(function(){
       var pos = document.getElementById('pos'); 
       var movetop = document.getElementById('movetop');
       if($(pos).attr('value') > 50){
           movetop.style.display = 'block';
       } else{
           movetop.style.display = 'none';
       }
    });
    
    $('#movetop').click(function(){
        $('#top').animate({
             scrollTop:0
        }, 800, 'easeInQuart');
        return false;
    });
    
    
    $('#inclosebtn').click(function(e){
    	
        console.log('test');
        $('div.wrapfollowerdetail.wrapfollowerdetailOpen').removeClass('wrapfollowerdetailOpen');
    });
    $('a.more-button').ready(function(){
	    $(this).click(function(e){
	        $('div.wrapfollowerdetail.wrapfollowerdetailOpen').removeClass('wrapfollowerdetailOpen');
	    });
    });
    	
    
        
</script>
    
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>