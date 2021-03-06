
    var chkId=0;
    var chkPwd=0;
    var chkEmail=0;
    var chkNick=0;
    var chkGenre=0;
    var chkFile=1;

    function checkId(){
    	$('#checkid').removeAttr("background-color");
    	$('#checkid').attr("background-color","#ebebeb");
        var inputed = $('#checkid').val();
        $.ajax({
            data : {id : inputed},
            url : "checkId",
            success : function(data) {
                if(inputed=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $("#idMsg").html("아이디를 입력해주세요.").css('color','red');
                    chkId = 0;
                } else if (data == '0') {
                    $("#idMsg").html("사용 가능한 아이디입니다.").css('color','black');
                    chkId = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#idMsg").html("이미 존재하는 아이디입니다.").css('color','red');
                    chkId = 0;
                } 
            }
        });
    };
    
    
    function ChkCount(obj){
    	
        var chkbox = document.getElementsByName("genre");
        var chkCnt=0;
        for(var i=0;i<chkbox.length; i++){
            if(chkbox[i].checked){
                chkCnt++;
            }
        }
        if(chkCnt==3){
            chkGenre =1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1){
                $(".signupbtn").prop("disabled", false);
            }
        }else if(chkCnt>3){
        	swal("잠깐!","최대 3개까지만 선택하실 수 있습니다.","warning");
            chkGenre=1;
            obj.checked = false;
            return false;
          }else if(chkCnt<3){
            $(".signupbtn").prop("disabled", true);
        }
    };
    
    function sendMsg(){
    	swal("성공!",$('#checknickname').val()+'님 환영합니다!',"success");
        };
    
    function checkPwd() {
        var inputed = $('#pwd').val();
        var reinputed = $('#repwd').val();
            
        if(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(inputed)){
            $('#pwdMsg').html("사용가능한 비밀번호입니다.").css('color','black');
        }else{
        	 $('span .fa-lock').hide(); 
        	 $('span .fa-lock-open').show();
            $('#pwdMsg').html("8자 이상 영어,숫자,특수문자를 포함해주세요 ").css('color','red');
            $(".signupbtn").prop("disabled", true);
        }
        
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        	 $('span .fa-lock').hide(); 
             $('span .fa-lock-open').show();
            $("#rePassword").html("위와 같은 비밀먼호를 입력해주세요").css('color','red');
            $(".signupbtn").prop("disabled", true);
        }
        else if (inputed == reinputed) {
        	 $('span .fa-lock').show(); 
             $('span .fa-lock-open').hide();
                $("#rePassword").html("비밀번호가 일치합니다.").css('color','black');
            chkPwd = 1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick==1 && chkGenre==1 && chkFile==1) {
                $(".signupbtn").prop("disabled", false);
            }
        } else if (inputed != reinputed) {
            $('span .fa-lock').hide(); 
            $('span .fa-lock-open').show();
            $("#rePassword").html("비밀번호가 일치하지않습니다.").css('color','red');
            chkPwd = 0;
            $(".signupbtn").prop("disabled", true);
            
        }
    };
    
    function checkEmail(){
        var inserted =$('#checkemail').val();
        $.ajax({
            data : {
                email : inserted
            },
            url : "checkEmail",
            success : function(data) {
                if(inserted=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $("#emailMsg").html("이메일을 입력해주세요.").css('color','red');
                    chkEmail = 0;
                } else if (data == '0') {
                    $("#emailMsg").html("사용 가능한 이메일입니다.").css('color','black');
                    chkEmail = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#emailMsg").html("이미 존재하는 이메일입니다.").css('color','red');
                    chkEmail = 0;
                }else if (data = '-1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#emailMsg").html("정확한 이메일을 입력해주세요.").css('color','red');
                    chkEmail = 0;
                }
            }
        });
    };
    
    function checkNickname(){
        var nick =$('#checknickname').val();
        $.ajax({
            data : {
                nickname : nick
            },
            url : "checkNick",
            success : function(data) {
                if(nick=="" && data=='0') {
                    $(".signupbtn").prop("disabled", true);
                    $("#nickMsg").html("닉네임을 입력해주세요.").css('color','red');
                    chkNick = 0;
                } else if (data == '0') {
                    $("#nickMsg").html("사용 가능한 닉네임입니다.").css('color','black');
                    chkNick = 1;
                    if(chkId==1 && chkPwd == 1 && chkEmail==1 && chkNick==1 && chkGenre==1 & chkFile==1) {
                        $(".signupbtn").prop("disabled", false);
                        $(".signupbtn").removeAttr("background-color");
                    } 
                } else if (data >= '1') {
                    $(".signupbtn").prop("disabled", true);
                    $("#nickMsg").html("이미 존재하는 닉네임입니다.").css('color','red');
                    chkNick = 0;
                } 
            }
        });
    };

    function readURL(input) { 
    
    var chkImg = document.getElementById('input_img').value
    chkImg=chkImg.slice(chkImg.indexOf(".")+1).toLowerCase();
    if(chkImg !="jpg" && chkImg !="jpeg" && chkImg !="gif" && chkImg !="png" && chkImg !="bmp"){
        chkFile=0;
        $(".signupbtn").prop("disabled", true);
        swal("잠깐!","이미지 파일만 올려주세요.","warning");
        $('#upload').attr('src', "/img/anonymous.png");}
    else if (input.files && input.files[0]){
    	console.log(input.files);
    	console.log(input.files[0]);
            var reader = new FileReader(); 
        reader.onload = function (e) { 
            $('#upload').attr('src', e.target.result); } 
        reader.readAsDataURL(input.files[0]); 
    chkFile = 1;
    if(chkId==1 && chkPwd == 1 && chkEmail==1 && chkNick==1 && chkGenre==1 & chkFile==1) {
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").removeAttr("background-color");
    } 
    }
    };
    function ChkCount(obj){
        var chkbox = document.getElementsByName("genre");
        var chkCnt=0;
        for(var i=0;i<chkbox.length; i++){
            if(chkbox[i].checked){
                chkCnt++;
            }
        }
        if(chkCnt==3){
            chkGenre =1;
            if(chkId==1 && chkPwd == 1 && chkEmail ==1 && chkNick ==1 && chkGenre==1 && chkFile==1){
                $(".signupbtn").prop("disabled", false);
            }
        }else if(chkCnt>3){
        	swal("잠깐!","최대 3개까지만 선택하실 수 있습니다.","warning");
            chkGenre=1;
            obj.checked = false;
            return false;
          }else if(chkCnt<3){
            $(".signupbtn").prop("disabled", true);          
        }
    };
    