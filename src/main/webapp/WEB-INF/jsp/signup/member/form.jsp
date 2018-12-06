<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indisker : 일반 회원 가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
<link href="/../css/common.css" rel="stylesheet">
<style>

#logo{
width: 40px; 
height:40px; 
float: left; 
margin-top: -4px;
margin-right: 0.5rem;
}

#titl{
margin-top: 5%;
margin-bottom: 3%;
/* margin-left: 11%; */
}

#titl h3{
float: left; 
margin-top: -5px;
font-size: 24px;
}

body{
background-color: snow;
}

.container {
    background-color: white;
}

.join_form {
	border: 1px solid silver;
	border-radius: 10px;
	margin: 0px auto;
	margin-bottom: 10%;
}

label {
	margin-bottom: 0px;
	font-family: "Open Sans", Helvetica, sans-serif;
	font-size: 14px;
	font-weight: 900;
}

form {
	margin: 0px auto;
	padding: 5% 10%;
}

input {
	font-family: "Open Sans", Helvetica, sans-serif;
	font-size: 11px; border : none;
	border-bottom: 2px solid #ebebeb;
	position: relative;
	width: 80%;
	border: none; 
	border-bottom : 2px solid #ebebeb; 
	position : relative;
	width : 80%;
}

span{
font-family: "Open Sans", Helvetica, sans-serif;
    font-size: 12px;
}

input:focus {
	outline: none;
	border-bottom-color: #3CC !important;
}

 input:hover {
	border-bottom-color: #3CC;
} 
input:invalid {
	box-shadow: none;
}

input[type=checkbox] {
	display: none;
}

.chklabel {
	margin: 2% 1%;
	padding: 0px !important;
	width: 65px;
	height: 20px;
	text-align: center;
	border: 1px solid silver;
	border-radius: 25px;
	background-color: rgba(52, 58, 64, 0.5);
	color: white;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
	margin: 2% 1%;
}

input[type=checkbox]:checked+label{
    background-color:rgb(52, 58, 64);
;
}

#upload {
	width: 64%;
	padding-left: 25%;
}

#input_img {
	padding-top: 20px;
}

.signupbtn:disabled {
	cursor: not-allowed;
	background-color: #3F51D1;
	border-radius: 12px;
}

.signupbtn {
	background-color: #3F51D1;
	border-radius: 12px;
	margin-right: 2%;
    margin-left: 2%;
    height: 2rem;
    padding-top: 0;
    padding-bottom: 0;
    }
p{
margin-top: 2rem;
margin-bottom: 1rem;
}
.cbtn{
text-align: center;}
</style>
</head>
<jsp:include page="../../header.jsp"></jsp:include>
<body>

<div class="title container">
<div class="row">
    <div id="titl" class='col-lg-8'>
        <img id="logo" src="../../../img/tum.png" alt="플레이로고">
        <h3>회원가입</h3>
    </div>
    </div>
    </div>
	<div class= container>
		<div class="row">
		<div class='col-lg-12'>
		  <div class="join_form col-lg-8">
			<form action='add' method='post' enctype="multipart/form-data">
			  <label for="checkid">아이디</label><br> 
			  <input type='text' name='id' required class="id" oninput="checkId()" id="checkid"><br>
			  <span id="idMsg"></span><br>
			  <label for="pwd">비밀번호</label><br> 
			  <input type="password" placeholder="8자 이상 영어, 숫자, 특수문자 포함" name="password" 
			         required class="pass" id="pwd" oninput="checkPwd()"><br> 
			  <span id="pwdMsg"></span><br>
		      <label for="repwd">비밀번호 확인</label><br> 
		      <input type="password" placeholder="위와 같은 비밀번호를 써주세요" name="psd-repeat" 
		             required class="pass" id="repwd" oninput="checkPwd()"><br> 
		      <span id="rePassword"></span><br>
		      <label for="checkmail">이메일</label><br>
			  <input type="email" name="email" required class="email" oninput="checkEmail()" 
			         id="checkemail"><br> 
			  <span	id="emailMsg"></span><br> 
			  <label for="checknickname">닉네임</label><br>
			  <input type="text" name="nickname" required class="id"
				 	 id="checknickname" oninput="checkNickname()"><br> 
			  <span	 id="nickMsg"></span> <label for='input_img'>사진</label><br> 
			  <img id="upload" src="/img/anonymous.png" alt="기본이미지"><br>
			  <input type='file' name='file1' id='input_img' onchange="readURL(this);" /> 
			  <br><label>선호하는 장르</label><br> 
			  <label>필수적으로 3개를 골라주세요</label><br> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="ballad" id="ballad"> 
			  <label for="ballad" class='chklabel'>발라드</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="dance" id="dance">
			  <label for="dance" class='chklabel'>댄스</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="trot" id="trot"> 
			  <label for="trot"	class='chklabel'>트로트</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="folk" id="folk"> 
			  <label for="folk" class='chklabel'>포크</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="rock" id="rock">
			  <label for="rock" class='chklabel'>락</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="jazz" id="jazz"> 
			  <label for="jazz"	class='chklabel'>재즈</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="country" id="country"> 
			  <label for="country" class='chklabel'>컨츄리</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="rnb" id="rnb">
			  <label for="rnb" class='chklabel'>알앤비</label> 
			  <input type="checkbox" name="genre" onclick="ChkCount(this)" value="rap" id="rap"> 
			  <label for="rap" class='chklabel'>랩</label>
			     <p>팬으로 가입하셔도, 이후 메인화면의 <br> '버스커되기' '제공자되기'로 변경 가능합니다.</p>
					<div class="cbtn">
					<button class="signupbtn btns btns btns-outline-light" onclick="sendMsg()"
						name="type" value="fan" disabled="disabled">팬으로 가입</button>
					<button class="signupbtn btns btns-outline-light"  onclick="sendMsg()"
						name="type" value="busker" disabled="disabled">버스커로 가입</button>
					<button class="signupbtn btns btns btns-outline-light" onclick="sendMsg()"
						name="type" value="supporter" disabled="disabled">무대 제공자로 가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script src="/js/signupMember.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
<jsp:include page="../../footer.jsp"></jsp:include>
</html>