//이전값을 저장해주는 변수
var _prevObj = null;
$(function() {
	// 캘린더 출력해주는 코드
	$('#calendar').fullCalendar({
		dayClick: function(date, jsEvent, view, resourceObj) {
			var current_date = moment().format('YYYY-MM-DD')
			if(current_date > date.format()) {
				swal("잠깐!","오늘 이상의 날짜를 선택해주세요.","warning");
			}else{
				if(_prevObj) {
					_prevObj.css('background-color', 'white');
					$(this).css('background-color', 'gray');
				} else {
					$(this).css('background-color', 'gray');
				}	
				_prevObj = $(this);
				$('.panel-heading h4').empty();
				$('.panel-body h2').html(date.format());
				$('.selectdates').empty();
				$('.panel-footer').empty();
				$('.dates').css('height','');
			}
		}
	})
});


$('.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
    $('.tabs li').removeClass('active current');
    $('.span12').removeClass('active current');
     
    $(this).addClass('active current');
    $("#"+tab_id).addClass('active current');
    
});



//등록가능한 무대일정 출력 & 체크할 수 있게.
function add(){
	var td = $('.panel-body h2').text();
	if(td==null || td==''){
		swal("잠깐!","해당 날짜를 선택해주세요.","warning");
		return;
	}

	$('.panel-heading h4').empty();
	$('.panel-heading h4').append('무대 등록');
	$('.dates').css('height','192px');

	$.ajax({ 
		type : "POST", 
		url : "showPossibleDate", 
		dataType: 'json',
		data : {"date" : td},
		success : function(data){
			$('.selectdates').empty();
			$(".panel-footer").empty();
			$.each(data,function(index,item){
				$(".selectdates").append(
				  '<li class="list-group-item"><input type="checkbox" name="insertdate" value="'+item+'">'+item+'</li>');
			});
			$(".panel-footer").append(
					'<button class="btn btn-lg btn-block btn-success" onclick="addDate()">등록하기</button>'
					);
		},
			error : function(request, status, error) {
				swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
			}});
}


//삭제가능한 무대일정 출력&체크할 수 있게
function removes(){
	var td = $('.panel-body h2').text();
	if(td==null || td==''){
		swal("잠깐!","해당 날짜를 선택해주세요.","warning");
		return;
	}
	$('.panel-heading h4').empty();
	$('.panel-heading h4').append('무대 삭제');
	$('.dates').css('height','192px');

	$.ajax({ 
		type : "POST", 
		url : "showDate", 
		dataType: 'json',
		data : {"date" : td},
		success : function(data){
			$('.selectdates').empty();
			$(".panel-footer").empty();
			if(data.length == 0){
				$(".selectdates").append(
				'<li class="list-group-item">해당 일자에 등록된 일정이 없습니다.</li>');      
			}else{
				$.each(data,function(index,item){
				$(".selectdates").append(
					'<li class="list-group-item"><input type="checkbox" name="stagedate" value="'+item.sno+'">'+item.nsdt+'~'+item.nedt+'</li>');
				});
				$(".panel-footer").append(
				'<button class="btn btn-lg btn-block btn-success" onclick="removeDate()">삭제하기</button>'
				);
			}
		},
		error : function(request, status, error) {
			swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
		}
	});

}
//체크한 일정 삭제하기
function removeDate(){
	var td = $('.panel-body h2').text();
	var chkbox = document.getElementsByName("stagedate");
	var chkCnt=0;
	var chks = new Array();
	var j=0;
	for(var i=0;i<chkbox.length; i++){
		if(chkbox[i].checked){
			chks[j] = chkbox[i].value;
			j++
			chkCnt++;
		}
	}

	if(chkCnt == 0)
		swal("잠깐!","삭제하실 일정을 선택해주세요.","warning");

	$.ajax({ 
		type : "GET", 
		url : "removeDate", 
		traditional : true,
		data : {"stagedate" : chks},
		success : function(data){
			if(data != null){
				swal("성공!","해당 일정이 삭제되었습니다.","success");
				window.location.href=window.location.href;
			}else
				swal("에러!","해당 데이터가 없습니다.","error");
		},
		error : function(request, status, error) {
			swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
		}
	});
}

function addDate(){
	var td = $('.panel-body h2').text();
	var chkbox = document.getElementsByName("insertdate");
	var chkCnt=0;
	var addchk = new Array();
	var j=0;
	for(var i=0;i<chkbox.length; i++){
		if(chkbox[i].checked){
			addchk[j] = chkbox[i].value;
			j++;
			chkCnt++;
		}
	}

	if(chkCnt == 0)
		swal("잠깐!","등록하실 일정을 선택해주세요.","warning");

	$.ajax({ 
		type : "GET", 
		url : "insertDate", 
		traditional : true,
		data : {"insertDate" : addchk, "day" : td},
		success : function(data){
			if(data != null){
				swal("성공!","해당 일정이 등록되었습니다.","success");
				window.location.href=window.location.href;
			}else
				swal("에러!","해당 데이터가 없습니다.","error");
		},
		error : function(request, status, error) {
			swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
		}
	});
}

function chk(e){
	var brno = e.value;
	console.log(brno);
	$.ajax({ 
		type : "GET", 
		url : "showInfo", 
		data : {"brno" : brno},
		success : function(data){
			$('.info').empty();
			$(".dates").empty();
			$('.abtn').empty();
			if(data.length != 0){
				$(".info").append(
						"<h3>"+data.busker.teamname+"</h3>"+
						"<img src='/upload/"+data.busker.teamPhoto+"' alt='버스커 이미지'>"+
						"<button value="+data.busker.no+">"+"피드링크연결필요"+"</button>"+
						"<table>"+
						"<tr><td>팀명</td><td>"+data.busker.teamname+"</td></tr>"+
						"<tr><td>장르</td><td>"+data.busker.teamgenre+"</td></tr>"+
						"<tr><td>연락처</td><td>"+data.busker.tel+"</td></tr>"+
						"<tr><td>좋아요</td><td>"+data.busker.likecount+"</td></tr>"+
						"<tr><td>메시지</td><td>"+data.busker.message+"</td></tr>" 					
				);
				if(data.flag == 1){
					$('.abtn').append('<tr><td><button type="button" class="brno" value="'+data.sno+'">신청하기</button></td></tr>');
					$.each(data.scheduletime,function(index,item){
						$('.dates').append(
								'<tr>'+
								'<td>'+
								'<input type="checkbox" name="reqdates" value="'+item.sssno+'">'+
								item.snsdt+'~'+item.snedt+'</td>'+'</tr>');
					});
				}else if(data.flag == 2 || data.flag == 3){
					$.each(data.scheduletime,function(index,item){
						$('.dates').append(
								'<tr>'+'<td>'+item.snsdt+'~'+item.snedt+'</td>');
					})};				
			}else
				swal("에러!","해당 데이터가 없습니다.","error");
		},
		error : function(request, status, error) {
			swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
		}
	});
};


$('.abtn').click(function(){
	var brno = $('.brno').val();
	var chkbox = document.getElementsByName("reqdates");
	var chkCnt=0;
	var chks = new Array();
	var j=0;
	for(var i=0;i<chkbox.length; i++){
		if(chkbox[i].checked){
			chks[j] = chkbox[i].value;
			j++
			chkCnt++;
		}
	}
	if(chkCnt == 0){
		swal("에러!","승낙하실 일정을 선택해주세요.","error");
	}

	if(confirm("체크하신 일정을 승낙하시겠습니까?") == true){
		$.ajax({ 
			type : "GET", 
			url : "consent", 
			traditional : true,
			data : {"reqdates" : chks, "brno":brno},
			success : function(data){
				if(data != null){
					swal("성공!","해당 요청이 승낙되었습니다.","success");
					window.location.href=window.location.href;
				}else
					swal("에러!","해당 데이터가 없습니다.","error");
			},
			error : function(request, status, error) {
				swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
			}
		});
	}else{
		return false;
	}
});



function goPage(e,list) {

console.log(list);
	
$.ajax({ 
		type : "GET", 
		url : "page", 
		traditional : true,
		data : {"pageNo" : e, "type":list},
		success : function(data){
			if(data != null){
				$("#tab1list").empty();
				$.each(data,function(index,item){
					if(item.flag == '1'.charAt(0)){
						$("#tab1list").append(
						'<tr><td>'+item.busker.teamname+'</td><td>'+item.busker.teamgenre+'</td>'+
						'<td>'+item.nsdt+'~'+item.nedt+'</td><td>'+item.cnt+'명'+'</td><td>'
						+'<span class="label label-info">신청중</span>'
						+'</td><td>'+item.ncdt+'</td><td>'
						+'<button type="button" class="btns btns-outline-secondary"'
						+'data-target="#detailModal" data-toggle="modal" value="'+item.sno
						+'" onclick="chk(this)">상세보기</button> <br /></td></tr>');
					}else if(item.flag == '2'.charAt(0)){
						$("#tab1list").append(
						'<tr><td>'+item.busker.teamname+'</td><td>'+item.busker.teamgenre+'</td>'+
						'<td>'+item.nsdt+'~'+item.nedt+'</td><td>'+item.cnt+'명'+'</td><td>'
						+'<span class="label label-success">완료 </span>'
						+'</td><td>'+item.ncdt+'</td><td>'
						+'<button type="button" class="btns btns-outline-secondary"'
						+'data-target="#detailModal" data-toggle="modal" value="'+item.sno
						+'" onclick="chk(this)">상세보기</button> <br /></td></tr>');
					}else if(item.flag == '3'.charAt(0)){
						$("#tab1list").append(
						'<tr><td>'+item.busker.teamname+'</td><td>'+item.busker.teamgenre+'</td>'+
						'<td>'+item.nsdt+'~'+item.nedt+'</td><td>'+item.cnt+'명'+'</td><td>'
						+'<span class="label label-danger">기한만료</span>'
						+'</td><td>'+item.ncdt+'</td><td>'
						+'<button type="button" class="btns btns-outline-secondary"'
						+'data-target="#detailModal" data-toggle="modal" value="'+item.sno
						+'" onclick="chk(this)">상세보기</button> <br /></td></tr>');
					}
				});
			}else
				swal("에러!","해당 데이터가 없습니다.","error");
		},
		error : function(request, status, error) {
			swal("에러!","에러가 발생했습니다. 관리자에게 문의하시기 바랍니다.","error");
		}
	});
	
	
}
