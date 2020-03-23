<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
<head>
<title>���� �˻�</title>
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
	<link rel="stylesheet" href="/resources/css/kronos.css" />
	<script src="/resources/javascript/kronos.js"></script>
	
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

	  td{
	  font-size:11px;
	  text-align: center;
	  width : 100px;
	  }
	  #domestic ,  #domestic  {
	  	z-index: 3;
	  }
	  #to , #from , div{
	  	z-index: 2;
	  }
	  #domestic {
	   text-ailgn : center;
	   background-color: white;
		/*  border-collapse: separate;  */
		border:5px solid white;
	  }
/* 	  .container{
	   position: relative;
	   
	  }
	   .container:after{
	   		content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 300px;
		    opacity : 0.7;
	   		background-color: #646464;
			box-sizing: border-box;
			z-index : -1;
	  } */
	  /* ��� ��¥ ��� css */
		#depIcon , #arrIcon {
			position: relative;
		}
		
		#depIcon:after , #arrIcon:after {
			content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-color: lightblue; 
		    width: 100%;
		    height: 100px;
		    opacity : 0.7;
		    z-index: -3;
		}
		/* ���Ǽ� , �ο��� ��� css */
		#num1 , #num2 , #num3{
			position: relative;
			
		}
		#num1:after , #num2:after , #num3:after{
			content : "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    background-color: lightskyblue; 
		    width: 100%;
		    height: 100px;
		    opacity : 0.6;
		    z-index: -3;
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
		    background-image: url('/resources/images/orderImg/2.jpg'); 
		    width: 100%;
		    height: 460px;
		    opacity : 0.7;
		    z-index: -4;
		}
		/* �޷� css */
		element.style {
		    height: 350px;
		} 
		/* �ο� ���� */
		#decreaseQuantity , #decreaseQuantity2 , #decreaseQuantity3 , #decreaseQuantity4{
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
		#increaseQuantity , #increaseQuantity2 , #increaseQuantity3, #increaseQuantity4{
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
		/*  #numberUpDown{
		width: 300px;
		  height: 50px;
		  background-color: gray;
		  border: none;
		} */
		.round-trip.on{
		line-height: 1.2;
		color: #646464;
		word-break: break-all;
		list-style: none;
		padding: 0;
		margin: 0;
		font-size: 13px;
		font-family: "Nanum Gothic", malgun Gothic, dotum;
		letter-spacing: -.3px;
		display: table-cell;
		width: 33.33%;
		box-sizing: border-box;
		text-align: center;
		}
		
		/* �޷� css */
		.kronos-outer .kronos-inner { Padding-top:10px;Padding-left:10px;Padding-right:10px;Padding-bottom:10px;font-size: 14px; }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

/* $(function() {
	 $( '.btn.btn-info' ).on("click" , function() {
			$("form").attr("method" , "POST").attr("action" , "/room/searchRoom").submit();

	});
});	 */

		/* ---------------- �ε�......  ---------------- */
		
		
		
		$(function(){
		
			$('.btn.btn-info').on("click",function(){
							
						var loading = document.getElementById("loading");
						
						loading.style.display = 'block';
						$("form").attr("method" , "POST").attr("action" , "/room/searchRoom").submit();
						setTimeout(function() {
							loading.style.display = 'none';
							 $('#loading').hide();  
								}, 100000);
			
							
		 
		 	})
		})
		/* ---------------- �ε�......��!!!  ---------------- */


	/* ---------------- �޷� ���� ---------------- */

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
		    if($('input#from').val() == ''){
		        alert('�������� �������ּ���.');
		        $('input#from').focus();
		        return false;
		    }else if($('input#to').val() == ''){
		        alert('�������� �������ּ���.');
		        $('input#to').focus();
		        return false;
		    }
		 });
	 
		
	});
	/* ---------------- �޷� ���� ��!!! ---------------- */
	
	/* ---------------- �������� ���̺� hide , show ---------------- */
	function doShow() { 
		if ($('#domestic').css("display","none")) { 
			$("#domestic").css("display","block");
			$("#depIcon").hide();
			$("#arrIcon").hide();
			$("#search").show();
			$('footer').css("margin-top","-109");
			
		}
	}
	
	function domestic(obj) {
		// ���� Ŭ���� Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		// tr.text()�� Ŭ���� Row �� tr�� �ִ� ��� ���� �����´�.
		var roomCity = $("#roomCity").val(obj);
		if ($('#domestic').css("display","block")) { 
			$("#domestic").css("display","none");
			$("#depIcon").show();
			$("#arrIcon").show();
			$('footer').css("margin-top","150");
			
			if ($("#roomNum").val() == 2) {
				$('footer').css("margin-top","50");
			}
		}
	};
	
	/* ---------------- �������� ���̺� hide , show ������ ---------------- */

	/* ---------------- �ο��� ���� , ����~  ---------------- */
	
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
		$("#peopleChoice").val("��	 "+adult+child+inf);
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
			var grade = $("#grade").text();
			$("#peopleChoice").val("��	 "+adult+child+inf);
			});
		});
		
	/* �Ƶ��� */
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
		$("#peopleChoice").val(total+"/�Ҿ�"+num+"�� ")
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
			$("#peopleChoice").val("��	 "+adult+child+inf);
			});
		});
	/* ���� ��  2*/
	$(function(){
		$('#decreaseQuantity3').click(function(e){
			e.preventDefault();
			var stat = $('#numberUpDown3').val();
			var num = parseInt(stat,10);
			num--;
		if(num<=0){
			alert('���̻� ���ϼ� �����ϴ�.');
			num =1;
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
			var adult = $('#numberUpDown3').val(num);
			var grade = $("#grade").text();
			});
		});
		
	/* �Ƶ��� 2 */
		$(function(){
			$('#decreaseQuantity4').click(function(e){
				e.preventDefault();
				var stat = $('#numberUpDown4').val();
				var num = parseInt(stat,10);
				num--;
			if(num<=-1){
				alert('���̻� ���ϼ� �����ϴ�.');
				num =0;
			}
			$('#numberUpDown4').val(num);
			});
				$('#increaseQuantity4').click(function(e){
				e.preventDefault();
				var stat = $('#numberUpDown4').val();
				var num = parseInt(stat,10);
				num++;
			
					if(num>10){
						alert('���̻� �ø��� �����ϴ�.');
						num=10;
					}
				var child = $('#numberUpDown4').val(num);
				});
			});
	
	/* ���� �� 2�� Ŭ�� �� */
	$(function() {
		$('#roomNum').click(function (){
			if ($("#roomNum").val() == 2) {
				$("#hiding").css("display","block");
				$('footer').css("margin-top","50");
				$("#numberUpDown3").val(1);
				
			}else if($("#roomNum").val() == 1){
				$("#hiding").css("display","none");
				$('footer').css("margin-top","150");
			}
			
		});
	});

	/* ---------------- �ο��� ���� , ����~ ��~~~  ---------------- */
	
	/* ---------------- �޷� ũ��... ---------------- */
	
		/* 	$(function() {
				$("#from").click(function() {
					$(".kronos-inner").css("height","320");
				});
				$("#to").click(function() {
					$(".kronos-inner").css("height","320");
				});
			}); */
	
	/* ----------------  �޷� ũ��...  ---------------- */
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

            <br/><br/>
			<div class="container">
				<div class="row">
			     <div class="col-md-5">
				     	<div class="row">
				    	 <input type="text" class="form-control" placeholder="���������� �Է��ϼ���" name="roomCity" id="roomCity" style="width:380px;height:30px;font-size:13px;float:left;" onclick="javascript:doShow();">
						 <div class="input-group-append">
						  <span class="input-group-text" id="basic-addon2" style="background-color:white;"><i class="fas fa-suitcase-rolling" id="iconf" style="font-size:15px;"></i></span>
				  			
				  		</div>
				  	<table class="table" id="domestic" style="width: 380px; display: none;">
					 <tbody>	
						<tr>
						<th rowspan="9" align="center" style="text-align: center;width: 70px;height: 100px;line-height: 100px;">����</th>
						</tr>			
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�ĸ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���׳�</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�θ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�̽�ź��</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">����ũǪ��Ʈ</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���帮��</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�ж��</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�ٸ����γ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�븮��</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">��������</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���Ű</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���׹�</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">���Ͻ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�δ��佺Ʈ</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�Ͻ��׸���</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�κ�κ��ũ</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">��ũ��</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�����׶��</td>
							</tr>
						</tbody>
					</table>
				  			
				  		</div>
			  		<br/><br/><br/>
			  		<div class="row">
			  		<div class="col-sm-5" id="depIcon">
			   		 <h5 align="center" style="color:white;margin-top:10px;">Check In</h5>
			    	<input type="text" class="form-control" readonly="readonly" placeholder="��߳�¥ ����" style="background-color:white;width:120px;font-size:14px;height:30px;float:left;" id="from" name="checkIn">
					  <div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2" style="background-color:white;">
					    <i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
					  </div>
					
					</div>
			   		 <div class="col-sm-5" id="arrIcon">
			   		 <h5 align="center" style="color:white;margin-top:10px;">Check Out</h5>
			   		 	 <input type="text" class="form-control" readonly="readonly" placeholder="������¥ ����"  style="background-color:white;width:120px;font-size:14px;height:30px;float:left;" id="to" name="checkOut">
						  <div class="input-group-append">
						    <span class="input-group-text" id="basic-addon2" style="background-color:white;">
						    <i class="far fa-calendar-alt" style="font-size:15px;"></i></span>
						  </div>
			   		 </div>
			   		 </div>
			  </div>
			  
			  
				<div class="col-md-7">
			   		 <div class="row">
			   		 <div class="col-sm-3"  id="num1">
			   		 	<!-- <h6 align="center">���� ��</h6> -->
			   		 	<select class="custom-select" name="roomNum" id="roomNum" style="width:80%;margin-top:30px;">
						  <option selected value="1">1</option>
						  <option value="2">2</option>
						</select>
			   		 </div>
			   		 
			   		 <div class="col-sm-9" id="num2">
			   		 	<!-- ���� �� 2���϶� �ο� �� ���ؼ� ������ ���� hidden -->
				   		 <!-- <input type="hidden" name="adultNum" id="adultNum" value="" >
				   		 <input type="hidden" name="childNum" id="childNum" value="" > -->
			   		 	<label for="Chd" style="font-size:13px;color:white;"><strong>����</strong><br/>
										�� 18�� �̻�</label>
						<span class="ctrl-num">
				        	<button type="button" id="decreaseQuantity" class="plus" style="margin-top:30px;"></button>
								 <input style="font-size:15px;width:30px;height:45px;display: table-cell;margin-top:30px;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
								 		 id="numberUpDown" name="adultNum" type="text" value="1" >
							<button type="button" id="increaseQuantity" class="del" style="margin-top:30px;"></button>
						</span>
						
						<label for="Chd" style="font-size:13px;color:white;"><strong>�Ƶ�</strong><br/>
											�� 17�� ����</label>
						<span class="ctrl-num">
				        	<button type="button" id="decreaseQuantity2" class="plus" style="margin-top:30px;"></button>
								 <input style="font-size:15px;width:30px;height:45px;display: table-cell;margin-top:30px;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
								 		 id="numberUpDown2" name="childNum" type="text" value="0" > 
							<button type="button" id="increaseQuantity2" class="del" style="margin-top:30px;"></button>
						</span>
			   		 </div>
			   		 </div>
			   		 
			   		 <div class="row" id="hiding" style="display:none;">
				 			<div class="col-sm-9" style="margin-left:170px;margin-top:5px;" id="num3">
				   		 	<label for="Chd" style="font-size:13px;color:white;"><strong>����</strong><br/>
											�� 18�� �̻�</label>
							<span class="ctrl-num">
					        	<button type="button" id="decreaseQuantity3" class="plus" style="margin-top:30px;"></button>
									 <input style="font-size:15px;width:30px;height:45px;display: table-cell;margin-top:30px;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
									 		 id="numberUpDown3" name="adultNum2" type="text" value="0" >
								<button type="button" id="increaseQuantity3" class="del" style="margin-top:30px;"></button>
							</span>
							
							<label for="Chd" style="font-size:13px;color:white;"><strong>�Ƶ�</strong><br/>
											�� 17�� ����</label>
							<span class="ctrl-num">
					        	<button type="button" id="decreaseQuantity4" class="plus" style="margin-top:30px;"></button>
									 <input style="font-size:15px;width:30px;height:45px;display: table-cell;margin-top:30px;margin-bottom:20px;text-align: center;vertical-align: middle;border: none;"
									 		 id="numberUpDown4" name="childNum2" type="text" value="0" > 
								<button type="button" id="increaseQuantity4" class="del" style="margin-top:30px;"></button>
							</span>
				   		 </div>
				 		</div>
			   		 <br/><br/>
			   		 <div class="btn-area" id="search">
	                  <button type="button" id="searchButton" class="btn btn-info" title="���� �˻�">
	                    <span class="ico-search">���� �˻�</span>
	                  </button>
	                </div> 
			 		</div>
		  			<div>
			  </div> 
			    
		  			
		  			
			  		<!-- <table class="table" id="domestic" style="width: 300px; display: none;">
					 <tbody>	
						<tr>
						<th rowspan="9" align="center">����</th>
						</tr>			
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�ĸ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���׳�</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�θ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�̽�ź��</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">����ũǪ��Ʈ</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���帮��</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�ж��</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�ٸ����γ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�븮��</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">��������</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���Ű</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">���׹�</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">���Ͻ�</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�δ��佺Ʈ</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�Ͻ��׸���</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">����</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">������</td>
							</tr>
							<tr>
								<td onclick="javascript:domestic($(this).closest('td').text());">�κ�κ��ũ</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">��ũ��</td>
								<td onclick="javascript:domestic($(this).closest('td').text());">�����׶��</td>
							</tr>
						</tbody>
					</table> -->
			    </div><br><br>
			</div>
			
			

		
<br><br><br>

			

</div>	

	
</form>			
			  <jsp:include page="/toolbar/footer.jsp" />
</body>
</html>