<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>�װ��� �˻�</title>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<!-- asome icon CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />	

  	<!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- �޷� CDN -->
	<!-- <link rel="stylesheet" href="/resources/css/kronos.css" />
	<script src="/resources/javascript/kronos.js"></script> -->
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

	
		/* �ε��� css */
	
			#loading {
			 width: 100%;   
			 height: 100%;   
			 top: 0px;
			 left: 0px;
			 position: fixed;   
			 display: block;   
			 opacity: 0.7;   
			 background-color: #fff;   
			 z-index: 99;   
			 text-align: center; }  
			  
			#loading-image {   
			 position: absolute;   
			 top: 50%;   
			 left: 50%;  
			 z-index: 100; } 
		
		/* �ε� css ��... */
	
	
       /* �ο��� */
       row.justify-content-around {
         position:absolute;
 		 top:50%;
		 left:50%;
		}
	  /* �������� table css */
	   td{
		  font-size:11px;
		  text-align: center;
		  width : 100px;
	  }
	  #domestic ,  #europe  {
	  	z-index: 3;
	  }
	  #to , #from , div{
	  	z-index: 2;
	  }
	  /* �������� table css */
	  #europe, #domestic {
	   text-ailgn : center;
	   background-color: white;
		/*  border-collapse: separate;  */
		border:5px solid white;
	  }

	  /* �պ� , �� ��� */
		#roundTrip {
			position: relative;
		}
		#roundTrip.basic:after {
			content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-color: lightgray; 
		    width: 225px;
		    height: 50px;
		    opacity : 0.7;
		    z-index: -2;
		    margin-left: -5px;
		}
		
		#roundTrip.change:after {
		content : "";
	    display: block;
	    position: absolute;
	    top: 0;
	    left: 0;
	    background-color: lightgray; 
	    width: 0;
	    height: 50px;
	    opacity : 0.7;
	    z-index: -2;
	    margin-left: -5px;
		}
		
		#right {
		position: relative;
		}
		#right.basic:after {
		content : "";
	    display: block;
	    position: absolute;
	    top: 0;
	    left: 0;
	    background-color: lightgray; 
	    width: 225px;
	    height: 50px;
	    opacity : 0.7;
	    z-index: -2;
	    margin-left: -60px;
		}
		
		#right.change:after {
		content : "";
	    display: block;
	    position: absolute;
	    top: 0;
	    left: 0;
	    background-color: lightgray; 
	    width: 0;
	    height: 50px;
	    opacity : 0.7;
	    z-index: -2;
	    margin-left: -60px;
		}
	  
	  /* div ��ü container ��� */
	  #total{
	  	position:relative;
	  }
	  #total:after{
	  		content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-color: lightgray; 
		    width: 90%;
		    height: 200px;
		    opacity : 0.7;
		    z-index: -3;
		    margin-top:80px;
	  }
	  
	  /* �̹��� ��� css */
	  .wrapper {
		   position: relative; /* #wrapper�� ������ �ָ� �������� ���� ���������� ������.. */
		}
		.wrapper:after {
		
		    content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-image: url('/resources/images/orderImg/1.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -2;
		}
		
		/* �ο� ���� */
		#decreaseQuantity , #decreaseQuantity2 , #decreaseQuantity3{
		word-break: break-all;
		list-style: none;
		cursor: pointer;
		padding: 0;
		margin: 0;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		letter-spacing: -.3px;
		width: 43px;
		height: 43px;
		color: #e25147;
		border: 0;
		vertical-align: top;
		position: relative;
		font-size: 0;
		line-height: 0;
		background: url("//openimage.interpark.com/tourpark/tour_ui/common/btn/btn_del.png") no-repeat 0 0;
		}
		#increaseQuantity , #increaseQuantity2 , #increaseQuantity3{
		word-break: break-all;
		list-style: none;
		cursor: pointer;
		padding: 0;
		margin: 0;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		letter-spacing: -.3px;
		width: 43px;
		height: 43px;
		color: #e25147;
		border: 0;
		vertical-align: top;
		position: relative;
		font-size: 0;
		line-height: 0;
		background: url("//openimage.interpark.com/tourpark/tour_ui/common/btn/plus.png") no-repeat 0 0;
		
		}
	
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

/* $(function() {
	 $( '#searchButton' ).on("click" , function() {
			

	});
});	 */
	/* ---------------- �ε�......  ---------------- */
	

	
	$(function(){
 
 	$("#searchButton").on("click",function(){
		
 		 if ($("#tripCourses").val() == "O") {
			 $("#to").val("0000-00-00");
 		 }
					var loading = document.getElementById("loading");
					
					loading.style.display = 'block';
					$("form").attr("method" , "POST").attr("action" , "/flight/searchFlight").submit();
					setTimeout(function() {
						loading.style.display = 'none';
						 $('#loading').hide();  
							}, 100000);
		
						
	 
	 	})
	})
	/* ---------------- �ε�......��!!!  ---------------- */


/* ---------------- �޷�  ---------------- */

var rangeDate = 500; // set limit day
var setSdate, setEdate;
$(function() {
$("#from").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 2,
    onSelect: function(selectDate){
        var stxt = selectDate.split("-");
        console.log("stxt : "+stxt);
            stxt[1] = stxt[1] - 1;
        var sdate = new Date(stxt[0], stxt[1], stxt[2]);
        var edate = new Date(stxt[0], stxt[1], stxt[2]);
            edate.setDate(sdate.getDate() + rangeDate);
        $('#to').datepicker('option', {
            minDate: selectDate,
            beforeShow : function () {
                $("#to").datepicker( "option", "maxDate", edate );                
                setSdate = selectDate;
                console.log(setSdate)
        }});
        //to ����
    }
    //from ���õǾ��� ��
});
});
$(function() {
	$("#to").datepicker({ 
	    dateFormat: 'yy-mm-dd',
	    onSelect : function(selectDate){
	        setEdate = selectDate;
	        console.log(setEdate)
	    }
		
	});
	 $('#searchButton').on('click', function(e){
		 if ($("#tripCourses").val() == "2") {
				 if($('input#from').val() == ''){
				        alert('�������� �������ּ���.');
				        $('input#from').focus();
				        window.location.reload(true);
				        return;
				    }
		}else{
		    if($('input#from').val() == ''){
		        alert('�������� �������ּ���.');
		        $('input#from').focus();
		        window.location.reload(true);
		        return;
		    }else if($('input#to').val() == ''){
		        alert('�������� �������ּ���.');
		        $('input#to').focus();
		        window.location.reload(true);
		        return;
		    }
		}
	 });
 
	
});

/* ---------------- �޷�  ��---------------- */

/* ---------------- ���� ���̺� ����� , ���̱� ---------------- */
function doShow() { 
		if ($('#domestic').css("display","none")) { 
			$("#domestic").css("display","block");
			$("#europe").css("display", "none");
			$("#depIcon").hide();
			$("#arrIcon").hide();
			$("#search").show();
			$("#peopleChoice").show();
			$('footer').css("margin-top","-8");
		}
}
function Show() { 
	if ($('#europe').css("display","none")) { 
		$("#europe").css("display","block");
		$("#domestic").css("display","none");
		$("#depIcon").show();
		if ($("#tripCourses").val() == "O") {
			$("#arrIcon").hide();	
		}else{
			$("#arrIcon").show();
		}
		$("#search").hide();
		$("#peopleChoice").hide();
		$('footer').css("margin-top","-132");
	}
}

function domestic(obj) {
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	var depCity = $("#depCity").val(obj);
	if ($('#domestic').css("display","block")) { 
		$("#domestic").css("display","none");
		$("#depIcon").show();
		if ($("#tripCourses").val() == "O") {
			$("#arrIcon").hide();	
		}else{
			$("#arrIcon").show();
		}
		$('footer').css("margin-top","150");
		//$("#totalNum").css("margin-left","18%");
		
	}
};

function europe(obj) {
	// ���� Ŭ���� Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
	var arrCity = $("#arrCity").val(obj);
	if ($('#europe').css("display","block")) { 
		$("#europe").css("display","none");
		$("#search").show();
		$("#peopleChoice").show();
		$('footer').css("margin-top","150");
		
	}
};

/* ---------------- ���� ���̺� ����� , ���̱� ��������---------------- */

/* ---------------- �ο��� ����, ���� ---------------- */
	/* ���� �� */
	$(function(){
		$('#decreaseQuantity').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=0){
			alert('���̻� ���ϼ� �����ϴ�.');
			num =1;
		}
		$('#numberUpDown').val(num);
		
		});
			$('#increaseQuantity').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown').val();
			var num = parseInt(stat,10);
			num++;
		
				if(num>10){
					alert('���̻� �ø��� �����ϴ�.');
					num=10;
				}
			var adult = $('#numberUpDown').val(num);
			
			});
		});
		
	/* �ҾƼ� */
	$(function(){
		$('#decreaseQuantity2').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown2').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=-1){
			alert('���̻� ���ϼ� �����ϴ�.');
			num =0;
		}
		$('#numberUpDown2').val(num);
		});
			$('#increaseQuantity2').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown2').val();
			var num = parseInt(stat,10);
			num++;
		
				if(num>10){
					alert('���̻� �ø��� �����ϴ�.');
					num=10;
				}
			var child = $('#numberUpDown2').val(num);
			});
		});
	/* ���Ƽ� */
	$(function(){
		$('#decreaseQuantity3').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown3').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=-1){
			alert('���̻� ���ϼ� �����ϴ�.');
			num =0;
		}
		$('#numberUpDown3').val(num);
		});
			$('#increaseQuantity3').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown3').val();
			var num = parseInt(stat,10);
			num++;
		
				if(num>10){
					alert('���̻� �ø��� �����ϴ�.');
					num=10;
				}
			var inf = $('#numberUpDown3').val(num);
			});
		});
	
	/* ---------------- �ο��� ����, ����  ��������---------------- */
	
	/*  ---------------- �պ� , �� function  ---------------- */
	$(function() { //�պ�
		$("#roundTrip").click(function() {
			$("#arraw").attr("class","fas fa-arrows-alt-h");
			$('#roundTrip').attr('class','col-sm-3 basic');
			$('#right').attr('class','col-sm-3 change');
			$("#tripCourses").val("R");
			$("#arrIcon").show();
		});
	});
	$(function() { //��
		$("#right").click(function() {
			$("#arraw").attr("class","fas fa-arrow-right");
			$('#roundTrip').attr('class','col-sm-3 change');
			$('#right').attr('class','col-sm-3 basic');
			$("#tripCourses").val("O");
			$("#arrIcon").hide();
		});
		
	});
	//�⺻ reload�ÿ� �պ����� �س���
	window.onload = function () {
		$('#roundTrip').attr('class','col-sm-3 basic');
		$('#right').attr('class','col-sm-3 change');
	}
	
	/*  ---------------- �պ� , �� function ��  ---------------- */ 

	/*  ---------------- �޷� ������ ����  ---------------- */
	$(function() {
		$("#from").click(function() {
			$(".kronos-inner").css("height","320");
		});
		$("#to").click(function() {
			$(".kronos-inner").css("height","320");
		});
	});
	/*  ---------------- �޷� ������ ����  ��!!---------------- */
	
	/*  ---------------- �ο��� modal value  ---------------- */
	$(function() {
		$(".btn.btn-secondary").click(function() {
			var one =$("#numberUpDown").val();
			var two =$("#numberUpDown2").val();
			var three =$("#numberUpDown3").val();
			
			var plus = Number(one)+Number(two)+Number(three);
			var grade = $("#grade option:selected").text();
			$("#peopleChoice").val("�� "+plus+"�� / "+grade)
		})
	});
	
	function closeModal(modalName) {
		if( typeof $("."+modalName)[0] != "undefined" ){
			$("."+modalName)[0].reset();	
		}
		$("#"+modalName).modal("hide");
	}
	/*  ---------------- �ο��� modal value ��!!  ---------------- */
</script>



</head>




<body>
 	<jsp:include page="/toolbar/toolBar.jsp" />
 	<jsp:include page="/toolbar/pushBar.jsp" />
<form>
<div class="wrapper" style="">	
<br>
<br>
<br>

		<div id="loading" style="display:none;">
			<div class="col-sm-6" style="margin-left:300px;margin-top:300px">
				<img id="loading-image" width="150px" height="150px" 
			
				src="/resources/images/orderImg/Ellipsis-1.4s-200px.gif" alt="Loading..." />
			</div>
		</div>

			<div class="container" id="total">
			<div class="row" style="Padding-left:5px;Padding-top:30px;">
					<div class="col-sm-3" id="roundTrip">
							<p class="roundTrip" style="color:white;margin-left:45px;Padding-top:10px;">�պ� ���� �˻�</p>
              				<input type="hidden" name="tripCourse" id="tripCourses" value="R" >
              		</div>
              		<div class="col-sm-3" id="right">
              			<p style="color:white;margin-left:-15px;Padding-top:10px;">�� ���� �˻�</p>
              		</div>
            </div>
            
			  <div class="row" >
			    <div class="col-md-5" style="margin-top:50px;margin-left:50px;">
			    <div class="row">
			    	 <input type="text" class="form-control" placeholder="��������� �Է��ϼ���" name="depCity" id="depCity" style="width:300px;height:30px;font-size:13px;float:left;" onclick="javascript:doShow();">
					 <div class="input-group-append" >
					  <span class="input-group-text" id="basic-addon2" style="background-color:white;" ><i class="fas fa-plane" id="iconf" style="font-size:15px;"></i></span>
			  			<i class="fas fa-arrows-alt-h" id="arraw" style="font-size:25px;Padding-left:80px;"></i>
			  		 </div>
			  		<table class="table" id="domestic" style="width: 300px; display: none;">
						 <tbody>	
							<tr>
							<th rowspan="5" align="center" style="text-align: center;width: 70px;height: 100px;line-height: 100px;">����</th>
							</tr>			
								<tr>			
									<td onclick="javascript:domestic($(this).closest('td').text());">��õ</td>
									<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
								</tr>
								<tr>
									<td onclick="javascript:domestic($(this).closest('td').text());">�λ�</td>
									<td onclick="javascript:domestic($(this).closest('td').text());">�뱸</td>
								</tr>
								<tr>
									<td onclick="javascript:domestic($(this).closest('td').text());">û��</td>
									<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
								</tr>
								<tr>
									<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
									<td onclick="javascript:domestic($(this).closest('td').text());"></td>
								</tr>
							</tbody>
						</table>
						</div>
						<br/><br/>
						<div class="row">
						 <div class="col-sm-5" id="depIcon" style="margin-left:-15px;">
				    		<input type="text" class="form-control" readonly="readonly" placeholder="��߳�¥ ����" style="background-color:white;width:110px;height:30px;font-size:13px;float:left;" id="from" name="depDate">
					    	<div class="input-group-append">
					    		<span class="input-group-text" id="basic-addon2" style="background-color:white;">
					    		<i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
							</div>
						</div>
				   		 <div class="col-sm-5" id="arrIcon">
				   		 	 <input type="text" class="form-control" readonly="readonly" placeholder="������¥ ����"  style="background-color:white;width:110px;height:30px;font-size:13px;float:left;" id="to" name="arrDate">
				   				<div class="input-group-append">
				   					<span class="input-group-text" id="basic-addon2" style="background-color:white;">
				   					<i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
				   		 		</div>
				   		 </div>
						</div>
			    </div>
			    <div class="col-md-6" style="margin-top:50px;margin-left:30px;">
			    <div class="row">
			    	 <input type="text" class="form-control" placeholder="���������� �Է��ϼ���" name="arrCity" id="arrCity" style="width:350px;height:30px;font-size:13px;float:left; " onclick="javascript:Show();">
					 <div class="input-group-append" style="height:30px;">
					  <span class="input-group-text" id="basic-addon2" style="background-color:white;">
					  <i class="fas fa-plane" id="iconf" style="font-size:15px;"></i></span>
		  			 </div>
		  			
		  			<table id="europe" class="table" style="width: 350px; display: none;">
					<tbody>	
					<tr>
					<th rowspan="9" align="center" style="text-align: center;width: 70px;Padding-top:100px;line-height: 100px;">����</th>
					</tr>			
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">�ĸ�</td>
							<td onclick="javascript:europe($(this).closest('td').text());">����</td>
							<td onclick="javascript:europe($(this).closest('td').text());">���׳�</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">�θ�</td>
							<td onclick="javascript:europe($(this).closest('td').text());">������</td>
							<td onclick="javascript:europe($(this).closest('td').text());">�̽�ź��</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">����ũǪ��Ʈ</td>
							<td onclick="javascript:europe($(this).closest('td').text());">���帮��</td>
							<td onclick="javascript:europe($(this).closest('td').text());">�ж��</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">�ٸ����γ�</td>
							<td onclick="javascript:europe($(this).closest('td').text());">�븮��</td>
							<td onclick="javascript:europe($(this).closest('td').text());">��������</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">������</td>
							<td onclick="javascript:europe($(this).closest('td').text());">���Ű</td>
							<td onclick="javascript:europe($(this).closest('td').text());">���׹�</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">���Ͻ�</td>
							<td onclick="javascript:europe($(this).closest('td').text());">�δ��佺Ʈ</td>
							<td onclick="javascript:europe($(this).closest('td').text());">������</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">�Ͻ��׸���</td>
							<td onclick="javascript:europe($(this).closest('td').text());">����</td>
							<td onclick="javascript:europe($(this).closest('td').text());">������</td>
						</tr>
						<tr>
							<td onclick="javascript:europe($(this).closest('td').text());">�κ�κ��ũ</td>
							<td onclick="javascript:europe($(this).closest('td').text());">��ũ��</td>
							<td onclick="javascript:europe($(this).closest('td').text());">�����׶��</td>
						</tr>
					</tbody>
					</table>
					<br/><br/>
				</div>
				<br/>
				<div class="row">
					<!-- <div class="col-sm-2" id="totalNum">
			   		 	<input type="text" id="peopleChoice" value="���� 1�� / �Ϲݼ�" style="width:150px;" 
			   		 	 title="�ο� �� �¼� ��� ����" class="form-control" readonly="readonly" data-toggle="modal" data-target="#flightNum">
			   		 </div> -->
					<div class="col-sm-4" id="totalNum">
			   		 	<input type="text" id="peopleChoice" value="���� 1�� / �Ϲݼ�" style="width:150px;" 
			   		 	 title="�ο� �� �¼� ��� ����" class="form-control" readonly="readonly" data-toggle="modal" data-target="#flightNum">
			   		 </div>
			   		 <div class="col-sm-4" id="search">
	                  <button type="button" id="searchButton" class="btn btn-info" title="�װ��� �˻�">
	                    <span class="ico-search">�װ��� �˻�</span>
	                  </button>
	                </div>
				</div>
	  		</div> 
			  </div>
			    <br/>
			</div>
			
			

<br><br><br>

			

		
</div>	




			  
		<!-- Modal �ȿ� ���� -->
		<div class="modal fade" id="flightNum" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content"  >
		      <div class="modal-header" style="background-color:gray;">
		        <h5 class="modal-title" id="exampleModalLabel" style="color:white;font-size:13px;">> �ο� �� �¼� ��� ����</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="number">
		        	<li>
					<label for="Adt"><strong>����</strong><br/>
										�� 12�� �̻�</label>
					<span class="ctrl-num">
			        	<button type="button" id="decreaseQuantity" class="plus"></button>
							 <input style="font-size:15px;width:5%;display: table-cell;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;" 
							 		id="numberUpDown" name="adultNum" type="text" value="1" > 
						<button type="button" id="increaseQuantity" class="del"></button>
					</span>
					<br/>
					<li>
					<label for="Chd"><strong>�Ҿ�</strong><br/>
										�� 12�� �̸�</label>
					<span class="ctrl-num">
			        	<button type="button" id="decreaseQuantity2" class="plus"></button>
							 <input style="font-size:15px;width:5%;display: table-cell;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
							 		 id="numberUpDown2" name="childNum" type="text" value="0" > 
						<button type="button" id="increaseQuantity2" class="del"></button>
					</span>
					</li>
					<li>
					<label for="Inf"><strong>����</strong><br/>
										�� 2�� �̸�</label>&nbsp;
					<span class="ctrl-num">
			        	<button type="button" id="decreaseQuantity3" class="plus"></button>
							 <input style="font-size:15px;width:5%;display: table-cell;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
							 		 id="numberUpDown3" name="infantNum" type="text" value="0" > 
						<button type="button" id="increaseQuantity3" class="del"></button>
					</span>
					</li>
					<hr/>
						<div class="input-group">
						  <label for="seatGrade" id="seatGrade" style="text-align: center; font-size:14px;">�¼� ��� ����</label>
						 &nbsp;&nbsp;&nbsp;&nbsp;
						  <div class="input-group-append">
							   <select class="form-control" id="grade" name="seatGrade" style="width:80%;">
								 	<option value="O">�Ϲݼ�</option>
									<option value="R">�����̾� �Ϲݼ�</option>
									<option value="C">����Ͻ���</option>
									<option value="F">�ϵ</option>
								</select>
						</div>
						
		           </div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary"  data-dismiss="modal">Ȯ��</button>
		        <button type="button" class="btn btn-primary" onclick="closeModal('flightNum');" data-dismiss="modal">���</button>
		      </div>
		    </div>
		  </div>
		</div>
	
</form>

<jsp:include page="/toolbar/footer.jsp" />			
</body>
</html>