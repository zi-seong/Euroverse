<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>${plan.planTitle }</title>
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- ��Ʈ��Ʈ�� 4.4 �����ٰ� ����...............................�ߴٰ� �ٽ� 4.4��..  -->
	<!-- Bootstrap CSS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
	
	
	
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
	
	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- fontawesome CDN -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script> -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script> -->
	

	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>



	<!-- FullCalendar CDN -->
	<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
  	<link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
  	<link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />
	<link href='https://unpkg.com/@fullcalendar/list@4.3.0/main.min.css' rel='stylesheet' />
	
	<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>
	<script src='https://unpkg.com/@fullcalendar/list@4.3.0/main.min.js'></script>
	
	
	<!-- jquery Ui ��ũ (datePicker)  -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--datePicker CDN  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- boot strap File upload CDN  -->
	<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>
	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 70%;
        background-color: grey;
      }
      /* Optional: Makes the sample page fill the window. */
      
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #floating-panel {
        width: 440px;
      }
      #place-id {
        width: 250px;
      }
      
      .modal{
	    background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }
      
      .swiper-container {
      	border: 1px gray;
      	//padding: 5px;
      	height: 500px;
      	width: 100%;
      }
      .swiper-wrapper {
      }
      .swiper-slide {
      	height: 480px;
      	width: 270px;
      	background-color: white;
      	margin: 4px;
      	padding: 10px;
      	border-radius: 4px;
      	box-shadow:1px 3px 2px #ACC1CB;
      	border-color: #DDDDDD;
      	border-style: solid;
      	border-width: 1px;
      	position: relative;
      }
      
      
      .list-group-item{
      	height: 33px;
      	padding: 7px;
      	font-size: 13px;
      }
      
      
      .party-member-img{
      	height: 37px;
      	width: 37px;
      	border-style: solid;
      	border-width: thin;
      }
      .party-member-img.on{
      	border-width: 3px;
      	border-color: #F98F8A;
      }
      .party-member-img.off{
      	border-color: #C6C6C6;
      	border-width: 1px;
      }
      .plan-party-list-box{
      	border-radius: 5px;
      	border-style: solid; 
      	border-color: #DDDDDD;
      	border-width: thin;
      	padding: 5px 12px; 
      	background-color: white; 
      	display:scroll; 
      	position:fixed; 
      	top:280px; 
      	left:20px; 
      	margin: 15px; 
      	width: 165px;
      }
      
      /* ���� */
      .stuffItem{
      	/* display:inline-block; */
		position:relative;
      }
      .stuffName{
      	bottom:0;
      	margin-left: 7px;
		position:absolute;
      }
      
      
      
      /* fullCalendar ��ũ�� ���ֱ� */
      .fc-scroller {
		   overflow-y: hidden !important;
		}
      
      #calendar {
			border-style: solid;
			border-width: thin;
			border-color: #E0E0E0;
			padding: 10px;
		}
		.fc-header-toolbar{
			font-size: 12px;
			size: 12px;
		}
		.fc-button{
			padding: 3px;
			size: 10px;
			background-color: white;
			border: none;
			color: black;
		}
      
      .list-container{
      	margin-right: 300px;
      	//width:75%;
      	//min-width: 550px;
      }
      
	</style>
	
	
	<!-- Custom styles for this template -->
	<!-- ���� ���̵�ٸ� ���� CSS... �ȵż� �� ��ũ��Ʈ ��°�� �־�� -->
    <!-- <link href="/css/bootstrapDashboardCustomStyle.css" rel="stylesheet"> -->
	<style type="text/css">
		/* body {
		  font-size: .875rem;
		} */
		.feather {
		  width: 16px;
		  height: 16px;
		  vertical-align: text-bottom;
		}
		
		/* Sidebar */
		.sidebar {
/*		  position: absolute;*/
          /*margin-top: 70px;*/
		  /*top: 300px;*/
/*		  bottom: 0;*/
          max-height: 600px;
		  left: 0;
          width: 20%;
		  z-index: 40; /* Behind the navbar */
		  padding: 48px 0 0; /* Height of navbar */
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
		  background-color: white;
		}
		.sidebar-sticky {
		  position: relative;
		  top: 0;
		  /*height: calc(100vh - 48px);*/
		  padding-top: .5rem;
		  overflow-x: hidden;
		  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
		}
		@supports ((position: -webkit-sticky) or (position: sticky)) {
		  .sidebar-sticky {
		    position: -webkit-sticky;
		    position: sticky;
		  }
		}
		
		.sidebar .nav-link {
		  font-weight: 500;
		  color: #333;
		}
		.sidebar .nav-link .feather {
		  margin-right: 4px;
		  color: #999;
		}
		.sidebar .nav-link.active {
		  color: #00c2c7;
		}
		.sidebar .nav-link:hover .feather,
		.sidebar .nav-link.active .feather {
		  color: inherit;
		}
		.sidebar-heading {
		  font-size: .75rem;
		  text-transform: uppercase;
		}
		
		/* Content */
		
		[role="main"] {
		  padding-top: 133px; /* Space for fixed navbar */
		}
		@media (min-width: 768px) {
		  [role="main"] {
		    padding-top: 48px; /* Space for fixed navbar */
		  }
		}
		
		/* Navbar */
		/* .navbar-brand {
		  padding-top: .75rem;
		  padding-bottom: .75rem;
		  font-size: 1rem;
		  background-color: rgba(0, 0, 0, .25);
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
		} */
		.navbar .form-control {
		  padding: .75rem 1rem;
		  border-width: 0;
		  border-radius: 0;
		}
		.form-control-dark {
		  color: #fff;
		  background-color: rgba(255, 255, 255, .1);
		  border-color: rgba(255, 255, 255, .1);
		}
		.form-control-dark:focus {
		  border-color: transparent;
		  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
		}
	
	
		.bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	      }
	
	      @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }
	</style>

	<style>
	
	  #todo_list, #doing_list, #done_list{
	    //border-right: 1px solid #C1CDCC;
	    border-radius: 5px;
	    width: 100%;
	    min-height: 50%;
	    max-height: 85%;
	    list-style-type: none; 
	    margin: 8px;
	    padding: 6px 9px; 
	    float: left;
	    overflow: hidden auto;
	    font-size: 14px;
	  }
	  #todo_list_container, #doing_list_container, #done_list_container {
	  	min-height: 180px;
	    max-height: 180px;
	  }
	  #todo_list{
	  	background-color: #FAFAFA;
	  }
	  #doing_list{
	  	background-color: #F0F9FA;
	  }
	  #done_list{
	  	background-color: #E3F4F5;
	  }
	  
	 
	  #todo_list li, #doing_list li, #done_list li {
	    margin: 5px 5px 3px 5px;
	    padding: px 3px;
	    width: 100%;
	  }
	  
	  
	  .budgetIcon{
	  	width:30px; 
	  	font-size: 20px;
	  }
	  
	  
	  .plan-button{
	  	//margin-left: 8px;
	  	margin:6px;
	  	font-size:21px;
	  	color:#606060;
	  }
	  
 	</style>


	<!-- �Լ��� ������ -->
	<script type="text/javascript">
	
		var planId = ${plan.planId};	//���� ��ȸ���� plan�� ���̵� �ھƵα�
		
		/* ---------------------------------		Daily List ���� �Լ���		--------------------------------- */
		$(function(){
			$('#submitDaily').on('click', function(){
				submitDaily($(this).text());
			});
			
			$('#deleteDaily').on('click', function(){
				submitDaily($(this).text());
			});
		});
		
		function getDaily(planId, dayNo, dayTime){
			console.log("getDaily() ���� "+planId+"/"+dayNo+"/"+dayTime);
			
			$.ajax({
				url: "/planSub/json/getDaily",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					dayNo: dayNo,
					dayTime: dayTime
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	//console.log("���ϵ����� ����");		//���ϵ����Ͱ� ������ request.status 200���� ���ƿ�
					}else{ 		//console.log("���ϵ����� ����1! => "+JSONData.dailyCate);	
						$("input[name='dailyId']").val(JSONData.dailyId);
						$("select[name='dailyCate']").val(JSONData.dailyCate);
						$("input[name='dailyDetail']").val(JSONData.dailyDetail);
						$("input[name='budgetAmount']").val(JSONData.budgetAmount);
						$("select[name='budgetCurrency']").val(JSONData.budgetCurrency);
						
						$('#deleteDaily').show();
						$('#submitDaily').text('����');
					}
				},
				error:function(request,status,error){
					if( request.status == '200'){ 		//console.log("���ϵ����� ����");	
						$("input[name='dailyId']").val('');
						$('#deleteDaily').hide();
						$('#submitDaily').text('���� �߰�');
					}
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}	//getDaily
	
		function openDailyEdit(cityNames, dateString, dayNo, dayTime, planId) {
			console.log("cityNames="+cityNames+", dateString="+dateString+", dayNo="+dayNo +", dayTime="+dayTime+", planId="+planId);
			
			getDaily(planId, dayNo, dayTime);
			
			$('.city-names').text(cityNames);
			$('.city-date').text(dateString+",  D"+dayNo);
			
			$('#dayNo').val(dayNo);
			$('#dayTime').val(dayTime);
			
			setTimeout(function(){
				//$("#dailyEdit").show();
				$("#dailyEdit").modal();
			},100);
		}	//openDailyEdit
		
		
		function submitDaily(dailyButton){
			//var planId = $("input[name='planId']").val();		//��ũ��Ʈ �� ������ planId �ھƵα� ������ ó�� �����൵ ����!
			var dailyId = $("input[name='dailyId']").val();
			var dayNo = $("input[name='dayNo']").val();
			var dayTime = $("select[name='dayTime']").val();
			var dailyCate = $("select[name='dailyCate']").val();
			var dailyDetail = $("input[name='dailyDetail']").val();
			
			var budgetAmount = $("input[name='budgetAmount']").val();
			var budgetCurrency = $("select[name='budgetCurrency']").val();
			
			//if(budgetCurrency == null || budgetCurrency ==''){ budgetCurrency = 'K'; }; //���� ���Է½� �⺻�� ���� :: 0�� / KRW
			if(budgetAmount == null || budgetAmount =='' || budgetAmount=='0'){ budgetAmount = 0; };
			
			if(dailyDetail == null || dailyDetail ==''){
				alert("dailyDetail �� �Է����ּ���");
				return false;
			}
			console.log("planId="+planId+", dailyId="+dailyId+", dayNo="+dayNo+", dayTime="+dayTime+", dailyCate="+dailyCate+", dailyDetail="+dailyDetail+", budgetAmount="+budgetAmount+", budgetCurrency="+budgetCurrency);
			
			/* addDaily */
			if(dailyButton == '���� �߰�'){
				console.log("Add Daily ��ư Ŭ��! ");
				
				if(dailyId == null || dailyId=='' ){
					$.ajax({
						url: "/planSub/json/addDaily",
						method: "POST",
						dataType: "json",
						data: JSON.stringify({
							planId: planId,
							dayNo: dayNo,
							dayTime: dayTime,
							dailyCate: dailyCate,
							dailyDetail: dailyDetail,
							budgetAmount: budgetAmount,
							budgetCurrency: budgetCurrency
						}),
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){
								console.log("���ϵ����� ����");	
							}else{
								console.log("���ϵ����� ����! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
							}
							closeModal('dailyEdit');
							
							//swal("�߰��Ǿ����ϴ�!", "", "success");
							swal({
								  icon : 'success',
								  title : "�߰��Ǿ����ϴ�!",
								  text:" ",
								  button : false,
								  timer: 1000
								});
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				}
				
			/* updateDaily */
			}else if(dailyButton == '����'){
				console.log("Update Daily ��ư Ŭ��! ");
				
				if(dailyId != null && dailyId !='' ){
					$.ajax({
						url: "/planSub/json/updateDaily",
						method: "POST",
						dataType: "json",
						data: JSON.stringify({
							planId: planId,
							dailyId: dailyId,
							dayNo: dayNo,
							dayTime: dayTime,
							dailyCate: dailyCate,
							dailyDetail: dailyDetail,
							budgetAmount: budgetAmount,
							budgetCurrency: budgetCurrency
						}),
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){
								console.log("���ϵ����� ����");	
							}else{
								console.log("���ϵ����� ����! => "+JSONData);	
								
								var dailyList = JSONData;
								for( var i in dailyList){
									setDaily(dailyList[i]);
								}
								//swal("�����Ϸ�!", "", "success");
								swal({
									  icon : 'success',
									  title : "�����Ϸ�!",
									  text:" ",
									  button : false,
									  timer: 1000
									});
							}
							//closeModal('dailyEdit');
							$('#dailyEdit').modal('hide');
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				} 
				
			/* deleteDaily */
			}else if(dailyButton == '����'){
				console.log("Delete Daily ��ư Ŭ��! ");
				
				swal({
					title:"���� ����",
					text:"������ ������ ���� �Ұ����մϴ�. \n���� �����Ͻðڽ��ϱ�?",
					icon:"warning",
					buttons: [ "�ƴϿ�", "��"]
				}).then((YES) => {
					if(YES){
						swal("�����Ǿ����ϴ�!", "", "success");
						
						if(dailyId != null && dailyId !='' ){
							$.ajax({
								url: "/planSub/json/deleteDaily/"+dailyId,
								method: "GET",
								dataType: "json",
								headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
								success: function(JSONData, status){
									/* if( JSONData==null || JSONData=="" ){ alert("���ϵ����� ����");	 }
									closeModal('dailyEdit'); */
								},
								error:function(request,status,error){
									if( request.status == '200'){ 		//alert("���ϵ����� ����");	 but ���� (���� void��)
										
										var dailyIdString = '#daily_'+dayNo+"_"+dayTime;
										$(dailyIdString).text('');
										closeModal('dailyEdit');
									}
							    } 
							});
						}
					}
				});
				
				
			}
			setTimeout(function(){ 
				getBudgetOverviewList(planId); 
			},50);
			
		} //submitDaily
		
		function getDailyList(planId){
			
			$.ajax({
				url: "/planSub/json/getDailyList/"+planId,
				method: "GET",
				dataType: "json",
				/* data: JSON.stringify({
					planId: planId,
					planTotalDays: '${plan.planTotalDays}'
				}), */
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){		//alert("���ϵ����� ����");	
					}else{		//alert("���ϵ����� ����! => JSONData = "+JSON.stringify(JSONData));	
						var dailyList = JSONData;
						for( var i in dailyList){
							setDaily(dailyList[i]);
						}
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getDailyList
		
		function setDaily( daily ){
			var dailyIdString = '#daily_'+daily.dayNo+"_"+daily.dayTime;
			
			var bcolor;		//����(D), ����(T), ����(V), ����(R), �Ļ�(F), ����(S), ��Ÿ(E)
			if( daily.dailyCate =='D' ){ bcolor = 'yellow';
			}else if( daily.dailyCate =='T' ){ bcolor = 'red';
			}else if( daily.dailyCate =='V' ){ bcolor = 'navy';
			}else if( daily.dailyCate =='R' ){ bcolor = 'blue';
			}else if( daily.dailyCate =='F' ){ bcolor = 'green';
			}else if( daily.dailyCate =='S' ){ bcolor = 'orange';
			}else if( daily.dailyCate =='E' ){ bcolor = 'purple';
			}
			
			$(dailyIdString).text(daily.dailyDetail);		//$(dailyIdString).text(daily.dailyDetail).css("background-color", bcolor);
			var appendString = '<span style="padding-left:5px; border-right-width:10px; border-right-style: solid; border-color: '+bcolor+';"></span>'
			$(dailyIdString).append(appendString);
		} //setDaily
		
		//getDailyList(planId);	//������ �ε� �� ajax�� ���� ����Ʈ �����ͼ� ������� ����ǥ�� �ɾ��ֱ�
		setTimeout(function(){ 
			getDailyList(planId); 
			},50);
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
		/* ---------------------------------		Stuff List ���� �Լ���		--------------------------------- */
		$(function(){
			
			$('#stuffMode').on('click', function(){
				changeStuffMode($(this).text());
			});

		});
		
		function changeStuffMode(mode){
			console.log("changeStuffMode() ���� :: moed="+mode);
			var stuffIconHtml;
			
			if(mode == 'Edit Mode'){
				$('#stuffMode').text('List Mode');
				stuffIconHtml = '<i class="fas fa-edit" style="font-size: 25px; margin-right: 3px; margin-bottom: 15px;"></i>';
				
			}else if(mode == 'List Mode'){
				$('#stuffMode').text('Edit Mode');
				stuffIconHtml = '<i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i>';
			}
			$('#stuff_icon').html(stuffIconHtml);
			getStuffList(planId, mode);
		} //changeStuffMode(mode) END
		
		function checkStuff(stuffId){
			var checked = $("input[name='stuff_"+stuffId+"']").val();
			console.log("checkStuff(stuffId) ���� => checked="+checked+", stuffId="+stuffId);
			
			if(checked =='T'){
				checked = 'F';
				$('#stuffChecked').text( ( parseInt($('#stuffChecked').text()) - 1) );
			}else if(checked=='F'){
				checked = 'T';
				$('#stuffChecked').text( ( parseInt($('#stuffChecked').text()) + 1) );
			}
			$("input[name='stuff_"+stuffId+"']").val(checked);
			
			$.ajax({
				url: "/planSub/json/checkStuff/"+checked+"/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ console.log("���ϵ����� ����");	 }
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //checkStuff(stuffId) END
		
		
		
		function getStuffList(planId, mode){
			console.log("getStuffList("+planId+", "+mode+") ���� ");
			
			var stuffCheckedCnt = 0;
			var stuffUncheckedCnt = 0;
			
			$.ajax({
				url: "/planSub/json/getStuffList/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					
					//var stuffItemsHtml = '<div class="stuffItems">';
					var stuffItemsHtml = '';
					var addStuffHtml = '<div class="addStuff"><i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="���ο� �׸� �Է�"> <button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">�߰�</button> </div>';
					
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
						stuffItemsHtml += addStuffHtml;
						
					}else{ 		//alert("���ϵ����� ����1! => JSONData = "+JSON.stringify(JSONData));	

						if(mode == 'List Mode'){
							for( var i in JSONData){
								if( JSONData[i].stuffCheck == 'T' ){
									stuffCheckedCnt += 1;
									stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <input type="checkbox" name="stuff_'+JSONData[i].stuffId+'" checked value="T" onchange="checkStuff('+JSONData[i].stuffId+')"><span style="margin-left: 10px;"> '+JSONData[i].stuffName+'</span> </div>';
								}else if( JSONData[i].stuffCheck == 'F' ){
									stuffUncheckedCnt += 1;
									stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <input type="checkbox" name="stuff_'+JSONData[i].stuffId+'" value="F" onchange="checkStuff('+JSONData[i].stuffId+')"><span style="margin-left: 10px;"> '+JSONData[i].stuffName+'</span> </div>';
								}
							}
							//$('#stuffCount').text( "( "+stuffCheckedCnt+" / "+(stuffUncheckedCnt+stuffCheckedCnt)+" )");
							$('#stuffChecked').text(stuffCheckedCnt);
							$('#stuffUnchecked').text((stuffUncheckedCnt+stuffCheckedCnt));
							$('#stuffCount').show();
							
						}else if(mode == 'Edit Mode'){
							for( var i in JSONData){ 	// html �̺�Ʈ�ɾ ������ �ٲٴ� ���� $(~).on("click") �̺�Ʈ�� ������� ����.... �׷��� �±� �ȿ� onClick="�����Լ�" �� �־���� �Լ�ȣ���� ��������
								stuffItemsHtml += '<div class="stuffItem" style="margin: 7px;"> <i class="fas fa-minus-circle" onClick="deleteStuff('+JSONData[i].stuffId+')" style="margin-right:5px;" ></i> <span class="stuffName" id="stuff_'+JSONData[i].stuffId+'">'+JSONData[i].stuffName+'</span> </div>';
							}
							stuffItemsHtml += addStuffHtml;
							$('#stuffCount').hide();
						}
					}
					//stuffItemsHtml += '</div>';
					//$(".stuffItems").replaceWith(stuffItemsHtml);
					$(".stuffItems").html(stuffItemsHtml);
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getStuffList(planId, mode) END
		
		function deleteStuff(stuffId){
			
			/* alert("������ �غ��� ���� �Ұ����մϴ�")
			console.log('deleteStuff('+stuffId+') ����! ');
			
			$.ajax({
				url: "/planSub/json/deleteStuff/"+stuffId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	//alert("���ϵ����� ����");	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			        getStuffList(planId,'Edit Mode');			    
				} 
			}); */
			
			swal({
				title:"�غ� ����",
				text:"������ �غ��� ���� �Ұ����մϴ�. \n���� �����Ͻðڽ��ϱ�?",
				icon:"warning",
				buttons: [ "�ƴϿ�", "��"]
			}).then((YES) => {
				if(YES){
					//swal("�����Ǿ����ϴ�!", "", "success");
					$.ajax({
						url: "/planSub/json/deleteStuff/"+stuffId ,
						method: "GET",
						dataType: "json",
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							if( JSONData==null || JSONData=="" ){ 	//alert("���ϵ����� ����");	
							}
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					        getStuffList(planId,'Edit Mode');			    
						} 
					});
				}
			});
		} //deleteStuff(stuffId) END
		
		function addStuff(){
			var stuffName = $("input[name='stuffName']").val();
			console.log('addStuff() ���� : stuffName='+stuffName);
			
			if(stuffName == null || stuffName ==''){
				alert("stuffName �� �Է����ּ���");
				return false;
			}
			if( stuffName.length > 20 ){
				swal("�غ� �׸���� �ִ� 20�� �Դϴ�.");
				return;
			}
			
			$.ajax({		// GET������� addStuff �ߴ��� �ѱ��� ���� ���� POST�� �ٲ�
				url: "/planSub/json/addStuff" ,
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					planId: planId,
					stuffName: stuffName
				}),
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! +> JSONData = "+JSON.stringify(JSONData));	
					}
					getStuffList(planId,'Edit Mode');
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				} 
			});
		} //addStuff() END
		
		
		//getStuffList(planId, 'List Mode');
		setTimeout(function(){ 
			getStuffList(planId, 'List Mode');
			},50);
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------		BudgetOverview ���� �Լ���		--------------------------------- */
		
		function getBudgetOverviewList(planId){
			console.log("getBudgetOverviewList("+planId+") ���� ");
			
			var planTotalDays = '${plan.planTotalDays}';
			
			$.ajax({
				url: "/planSub/json/getBudgetOverviewList/"+planId+"/"+planTotalDays ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					//var budgetOverviewHtml = '';
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
					}else{ 		
						//console.log("���ϵ����� ����1! => JSONData = "+JSON.stringify(JSONData));	
						var budget_total = 0;
						
						for( var i in JSONData ){
							budget_total = budget_total + JSONData[i].budgetAmount;
							switch ( JSONData[i].dailyCate ) {
						        case 'D': $('#budget_D').text(JSONData[i].budgetAmount);	//����
						          break;
						        case 'T': $('#budget_T').text(JSONData[i].budgetAmount);	//����
						          break;
						        case 'V': $('#budget_V').text(JSONData[i].budgetAmount);	//����
						          break;
						        case 'R': $('#budget_R').text(JSONData[i].budgetAmount);	//����
						          break;
						        case 'F': $('#budget_F').text(JSONData[i].budgetAmount);	//�Ļ�
						          break;
						        case 'S': $('#budget_S').text(JSONData[i].budgetAmount);	//����
						          break;
						        case 'E': $('#budget_E').text(JSONData[i].budgetAmount);	//��Ÿ
						          break;
						        default:
						          var d = 'default';
						    } //switch
						}
					} //if-else
					$('#budget_total').text(budget_total);
					
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getBudgetOverviewList(planId) END
		
		//getBudgetOverviewList(planId);
		setTimeout(function(){ 
			getBudgetOverviewList(planId); 
		},50);
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------		Todo List ���� �Լ���			--------------------------------- */
		
		$(function(){
			$('#todoMode').on('click', function(){
				alert("#todoMode Ŭ�� => changeTodoMode() ����");
				changeTodoMode($(this).text());
			});
			
			/* $("#addTodoName").keydown(function(key){
				if( key.keyCode == 13){
					addTodo();
				}
			}); */
			
			$(document).on('keydown', '#addTodoName', 
				function(key) {
					if(key.keyCode == 13){
						addTodo();
					}
		    	}
			);

		});
		
		function deleteTodo( todoId ){
			
			/* if(confirm( "������ Todo ����Ʈ�� ���� �Ұ����մϴ�. \n���� �����Ͻðڽ��ϱ�? ")){
				$.ajax({
					url: "/plan/json/deleteTodo/"+todoId ,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){	//���ϵ����� ����
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				        if( request.status == 200){
				        	$('span:contains("'+ todoId +'")').parent().remove();
				        }
					} 
				});
			} */
			
			swal({
				title:"Todo ����Ʈ ����",
				text:"������ Todo ����Ʈ�� ���� �Ұ����մϴ�. \n���� �����Ͻðڽ��ϱ�?",
				icon:"warning",
				buttons: [ "�ƴϿ�", "��"]
			}).then((YES) => {
				if(YES){
					//swal("�����Ǿ����ϴ�!", "", "success");
					$.ajax({
						url: "/plan/json/deleteTodo/"+todoId ,
						method: "GET",
						dataType: "json",
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){	//���ϵ����� ����
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					        if( request.status == 200){
					        	$('span:contains("'+ todoId +'")').parent().remove();
					        }
						} 
					});
				}
			});
		}	//deleteTodo ��
		
		
		function addTodo(){
			
			var todoName = $("input[name='todoName']").val();
			
			if( todoName.length > 20 ){
				swal("Todo �׸���� �ִ� 20���Դϴ�.","","warning");
				return;
			}
			
			console.log('addTodo() ���� : todoName='+todoName);
			
			if(todoName == null || todoName ==''){
				alert("todoName �� �Է����ּ���");
				return false;
			}
			
			$.ajax({		// GET������� addStuff �ߴ��� �ѱ��� ���� ���� POST�� �ٲ�
				url: "/plan/json/addTodo" ,
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					planId: planId,
					todoName: todoName
				}),
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){ 	
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! +> JSONData = "+JSON.stringify(JSONData));	
						var todoHtml = '<li class="todo_item" >'+todoName+'<span hidden="hidden">'+ JSONData.todoId +'</span> &nbsp;<i class="fas fa-backspace deleteTodo" onclick="deleteTodo(\''+JSONData.todoId+'\')"></i></li>';
						
						$("#todo_list").append(todoHtml);
						$("input[name='todoName']").val('');
						$('.deleteTodo').hide();
						
						//swal("�߰��Ǿ����ϴ�!", "", "success");
						swal({
							  icon : 'success',
							  title : "�߰��Ǿ����ϴ�!",
							  text:" ",
							  button : false,
							  timer: 1000
							});
						
					}
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				} 
			});
			
		}	//addTodo ��
		
		$(document).ready(function(){
			$('.deleteTodo').hide();
            $('#blank-top').hide();
             $(window).scroll(function() {
                if ($(document).scrollTop() > 300) {
                    $('#blank-top').show();
                } else {
                    $('#blank-top').hide();
                }
             });

			
			/* $('.todo_item').hover(
		        function() {
		            $(this).css('color', '#089D94').css('fontWeight','bolder');
		            $(this).find('.deleteTodo').show();
		        },
		        function() {
		            $(this).css('color', 'black').css('fontWeight','normal');
		            $(this).find('.deleteTodo').hide();
		        }
		    ); */
			
			$(document).on('mouseover', '.todo_item', 
				function() {
		            $(this).css('color', '#03657E').css('fontWeight','bolder');
		            $(this).find('.deleteTodo').show();
		    	}
			);
		    $(document).on('mouseout', '.todo_item', 
		        function() {
		            $(this).css('color', 'black').css('fontWeight','normal');
		            $(this).find('.deleteTodo').hide();
		        }
			);
		    
		    
		    $('#stuffMode').hover(
	    		function() {
		            $(this).css('color', '#08B5BA');
		        },
		        function() {
		            $(this).css('color', 'black');
		        }
		    );
		    
		    
		});
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	PlanPartyMember ���� �Լ���		--------------------------------- */
		$(function(){
			$('#findUser').on('click', function(){
				console.log("#findUser(�˻�) Ŭ�� => findUser("+$('#findUserId').val()+") ����");
				findUser($('#findUserId').val());
			});
			
			$('#addOffer').on('click', function(){
				addOffer();
			});
			
			$('#deletePlanParty').on('click', function(){
				deletePlanParty('F');
			});
			
			$('#exitPlanButton').on('click', function(){
				//$('#exitPlanAlert').show();
				$('#exitPlanAlert').modal();
			})
			
			$('#exitPlan').on('click', function(){
				deletePlanParty('S');
			});
			
			$('#findUserId').keydown(function(key){
				if( key.keyCode == 13){
					findUser($('#findUserId').val());
				}
			})

		});
		
		function inviteUser() {
			console.log("inviteUser() ����");
			$('#offerMsgForm').hide();
			$('#addOffer').hide();
			$('.findUserResult').text('');
			//$("#inviteUser").show()
			$("#inviteUser").modal();
		}
		
		function deletePlanPartyAlert(partyUserId, partyUserNickname){
			$('#planMemberId').text(partyUserId);
			//$("#deletePlanPartyAlert").show();
			$("#deletePlanPartyAlert").modal();
		}
		
		function deletePlanParty(condition){
			var partyUserId;
			
			if( condition=='F'){
				partyUserId = $('#planMemberId').text();
				console.log("deletePlanParty("+condition+") ���� ==> "+partyUserId+" �����Ű��" );
			}else if( condition=='S'){
				partyUserId = '${user.userId}';
				console.log("deletePlanParty("+condition+") ���� ==> "+partyUserId+" ���� Ż��" );
			}
			
			$('#partyUserId').val(partyUserId);
			$('input[name="partyRole"]').val(condition);		//����� ����Ż��:S, �������� ����:F
			$('form.deleteMember').attr('method', 'POST').attr('action', '/plan/deletePlanParty').submit();
		}

		
		function findUser(findUserId) {
			console.log("findUser("+findUserId+") ����");
			if(findUserId == ''){
				alert("�˻��� ȸ���� ���̵� �Է����ּ���");
				return false;
			}
			
			$.ajax({
				url: "/plan/json/findUser/"+planId+"/"+findUserId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					console.log("���ϵ����� ����! +> JSONData = "+JSON.stringify(JSONData));	
					
					if(JSONData[0] == 'X'){	//�ʴ� �Ұ���
						$('.findUserResult').text(JSONData[1]);
						$('#offerMsgForm').hide();
						$('#addOffer').hide();
					}else if(JSONData[0] == 'A'){	//�ʴ� ����
						$('.findUserResult').text(JSONData[1]);
						$('#offerMsgForm').show();
						$('#addOffer').show();
					}
					$("input[name='findUserId']").val('');
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}	//findUser ��
		
		
		function addOffer() {	
			var toUserId = $($('.findUserResult')[0]).text();
			var offerMsg = $("input[name='offerMsg']").val();
			
			if(offerMsg == ''){
				alert("offerMsg�� �Է����ּ���");
				return false;
			}
			console.log("toUserId="+toUserId+", offerMsg="+offerMsg);
			
			$.ajax({
				url: "/plan/json/addOffer" ,
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					refId: planId,
					toUserId: toUserId,
					offerMsg: offerMsg
				}),
				success: function(JSONData, status){
					//String�� �ͼ� ����� ��ġ�� ����..
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        closeModal('inviteUser');
			        //alert(request.responseText+" �Կ��� �ʴ� �޽����� ���½��ϴ�.");
			        
			        //swal(request.responseText+" �Կ��� �ʴ� �޽����� ���½��ϴ�.", "", "success");
			        swal({
						  icon : 'success',
						  title : request.responseText + " �Կ��� �ʴ� �޽����� ���½��ϴ�.",
						  text:" ",
						  button : false,
						  timer: 1500
						});
			        
			      	//�ʴ� �޴� ������� push �ϱ�
					var receiverId = toUserId;
					var pushType = 'I';
					sendPush(receiverId, pushType);		//jsp:include�� ���Ե� toolBar.jsp�� �ִ� �Լ�!
			    } 
			});
		}	//addOffer ��
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		/* ---------------------------------	Plan Information ���� �Լ�		--------------------------------- */
		$(function(){
			
			$('.plan-button').hover(
				  function() {
				    $( this ).css("color", "#08B5BA");
				  }, function() {
				    $( this ).css("color", "#606060");
				  }
			);
			
			
			$('#updatePlanButton').on('click',function(){
				//$("#editPlan").show();
			});		
			$('#updatePlan').on('click', function(){
				updatePlan();
			});
			
			$('#deletePlanButton').on('click',function(){
				//$("#deletePlanAlert").show();
			});	
			$('#deletePlan').on('click', function(){
				deletePlan();
			});
			
			$('#planCompleteButton').on("click", function(){
				//$("#planCompleteAlert").show();
				$("#planCompleteAlert").modal();
			});
			$('#planComplete').on('click', function(){
				planComplete();
			});
			
			
			$('#uploadPlanButton').on('click', function(){
				$('#uploadPlanAlert').modal();
			});
			
			$('#uploadPlan').on('click', function(){
				uploadPlan( planId );
			});
			
			
			$( "#startDateString" ).datepicker({
			      showOptions: { direction: "up" },
				  defaultDate : '1995-02-10',
			      changeYear : true ,
			      changeMonth : true ,
			      //buttonImage: "/resources/images/userImages/CalendarICON.png",
			      dateFormat : "yy-mm-dd",
			      showAnim : "bounce",
			      autoclose: true
			});
			
			/* ��� �ڿ� ����Ʈ��Ŀ�� �������� ����... ������� �ذ� */
			$('#startDateString').on('click', function(){
				 $('#ui-datepicker-div').appendTo($('#editPlan'));
				 $(this).datepicker();
				 $(this).datepicker("show");
			});
			
			//�����̲� ���پ� - ���Ͽ뷮 üũ
			$(".custom-file-input").on("change",function(){
				  var fileSize = this.files[0].size;
				    var maxSize = 600 * 600;
				    if(fileSize > maxSize) {
				        $(".custom-file-label").html("<i class='fas fa-camera-retro'> size 600x600</i>");
				        alert("���Ͽ뷮�� �ʰ��Ͽ����ϴ�.");
				        //$("#preview").html("");
				        return;
				    }else{
						//readImg(this);
				    }
			});
			
			$(document).ready(function() {
				  bsCustomFileInput.init();
			});
			
			
			//alert-danger���� x Ŭ���� â �ݱ�
			$(".alert-danger button").on("click",function(){
				$(".alert-danger").prop("style","display:none");			
			})
			$(document).on('keyup','#planTitle',function(){
				if($('#planTitle').val().length > 0){
					$(".alert-danger").prop("style","display:none");	
				}
			});
			$(document).on('change','#startDateString',function(){
				if($('#startDateString').val().length > 0){
					$(".alert-danger").prop("style","display:none");	
				}
			});
			
		})
		
		function uploadPlan( planId ) {
			console.log("uploadPlan() ����!");
			
			//var string = "/plan/uploadPlan?planId="+planId;
			var string = "/community/addPost?boardName=E&planId="+planId;
			$(self.location).attr("href", string);
		}
		
		function updatePlan(){		//�÷��� ����
			console.log("updatePlan() ����!");
		
			var submitAlert = $(".alert-danger");
			var alertMessage = $(".alert-danger strong");
			
			var planTitle = $("input[name='planTitle']").val();
			var planImg = $("input[name='planImg']").val();
			var planType = $("input[name='planType']").val();
			var startDateString = $("input[name='startDateString']").val();
			
			//��ȿ�� üũ
			if ($.trim(planTitle)=="") {
				submitAlert.prop("style","display : block");
				alertMessage.html("�÷��� ������ �ʼ��Դϴ�.");
				return;
			}
			if ($.trim(startDateString)=="") {	//�� �ʿ����..
				submitAlert.prop("style","display : block");
				alertMessage.html("���� �������� �������ּ���.");
				return;
			}
			
			$('form.editPlan').attr('method', 'POST').attr("action" , "/plan/updatePlan").attr("enctype","multipart/form-data").submit();
		}
		
		function deletePlan(){		//�÷��� ����
			$('form.editPlan').attr('method', 'POST').attr('action', '/plan/deletePlan').submit();
		}
		
		function planComplete(){	//����Ϸ� Ȯ��
			$("input[name='planStatus']").val('C');
			$('form.editPlan').attr('method', 'POST').attr('action', '/plan/updatePlanStatus').attr("enctype","multipart/form-data").submit();
		}
		
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		
		/* GoogleMap control ��ư Ŭ�� */
		function controlClick(){
			console.log("controlClick() ����")
			
			var string = "/planSub/editRoute?planId="+planId;
			$(self.location).attr("href", string);
		}

	</script>
	
	<script>
	
		/* ���â �ݱ� */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
			}
			//$("#"+modalName).hide();
			$('#'+modalName).modal('hide');
		}
		
		/* ���� ���� */
		function shakeThat(){
			var rnd  = Math.round(Math.random() * 4);
			$('.stuffItem .stuffName').css({ 'bottom':rnd}); 	//Edit Mode�� �غ� ��� ���� ����
		}
		setInterval(shakeThat, 45);
		
		/* ��ũ�� �ε巴�� */
		jQuery(document).ready(function($) { 
			$(".scroll").click(function(event){ 
				event.preventDefault(); 
				$('html,body').animate({
					scrollTop:$(this.hash).offset().top
					}, 500); 
			}); 
		}); 
		
		
		
		//.show() -> .modal() �� �����ϸ鼭 closeModal�� ������ ��ɵ� �ٽ� �̺�Ʈ �ɾ��ֱ�...
		$(function() {
			
			$('.modal').on('hidden.bs.modal', function(){
				var modalId = $(this).attr('id');
				//closeModal(modalId);
				if( typeof $("."+modalId)[0] != "undefined" ){
					$("."+modalId)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
				}
				
			});
			
		});
		
	</script>
	
	
	<!-- Ķ���� ���� -->
	<script type="text/javascript">
	
		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  //var draggebleEl = document.getElementById('draggable');
		  //var containerEl = document.getElementById('external-events');
		  //var checkbox = document.getElementById('drop-remove');
		  
		  var Calendar = FullCalendar.Calendar;
		  //var Draggable = FullCalendarInteraction.Draggable;
		  
		  
		  var cityEventList = ${cityEventList};
			//alert("  cityEventList[0] = "+cityEventList[0].title);	
			
		  var defaultDate = new Date();
		  if( cityEventList[0] != null ){
			  defaultDate = cityEventList[0].start;
		  }
		  
		  //var eventString = cityEventList[0]+", "+cityEventList[1];
		  
		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		    defaultView: 'dayGridMonth',
		    defaultDate: defaultDate,
		    header: {
		      //left: 'prev, today',
		      left: 'prev',
		      center: 'title',
		      right: 'next'
		    },
		    height: 430,	// Ķ���� ũ��... ���� ����!
		    editable: false,
		    droppable: false, // this allows things to be dropped onto the calendar
		    //locale: 'ko',
		    buttonIcons: true, // show the prev/next text
		    events:[
		    	/* { title: '������ ����', start: '2020-02-10' } */
		    	//eventString
		    ]
		    //,eventRender:function(event, eventElement) {
            //    if(event.imageurl) {
            //        eventElement.find("span.fc-title").prepend("<img src='" + event.imageurl + "'>");
            //    }
            //}

		  });
		  
		  for( var i in cityEventList ){
			  console.log("    "+JSON.stringify(cityEventList[i]) );
				calendar.addEvent( cityEventList[i] );
			}
		  
		  calendar.render();
		  
		}); 
	
	</script>
	
	<style type="text/css">
		
		.memo{
			font-size:small;
			margin: 10px;
			padding:5px;
			width: 210px;
			height: 210px;
			//border: 1px solid gray;
			background-color:#FFD8D1;
			//background: white;
			position: absolute;
			box-shadow:3px 2px 4px #898989;
			z-index: 50;
			resize: none;
		}
		
		.memo > .top_nav{
			height: 32px; line-height: 32px;
		}
		
		.memo > .top_nav span{
			display: inline-block;
			padding: 0 5px;
			color: #666;
			text-decoration: none;
		}
		.memo > .top_nav span:hover{
			color: #FFF4B6; background: #666;
		}
		.memo > .top_nav >  span.addMemo{
			float: left;
		}
		.memo > .top_nav >  .right{
			float: right;
		}
		
		.memo > textarea{
			margin: 0; padding: 10px;
			box-sizing: border-box;
			width: 200px; height: 165px;
			background: #FFD8D1;
			//background: #FFF38B;
			border: none;
			resize: inherit;
			outline: none;
		}
		
	</style>
	
	<script type="text/javascript">
				
		/* -------------------------------------	Memo List ���� �Լ���		------------------------------------- */
		
		$(function(){
			
			//�޸���
			var memo_html = '<div class="memo">' +
								'<nav class="top_nav">' +
									'<span class="addMemo"><i class="fa fa-plus"></i></span>' + 
									'<span class="saveMemo"><i class="fa fa-save"></i></span>' + 
									'<div class="right">' +
										'<a href="#" class="getMemo"><i class="fa fa-list"></i></a>' +
										'<a href="#" class="deleteMemo"><i class="fa fa-times"></i></a>' +
									'</div>' +
								'</nav>' +
								'<textarea name="memoDetail" class="txt"></textarea>' + 
								'<nav class="side_nav"><ol></ol></nav>' +
							'</div>';
							
			var memo_html03 = '<div class="memo" >'+
								'<div>�޸� ����� : &nbsp; ${memo.memoRegDate} </div>' +
								'<div>�ۼ��� : &nbsp; ${memo.regUserNickname} </div>' +
								'<textarea name="memoDetail" class="txt"> ${memo.memoDetail} </textarea>' +
								'<div class="memo_id"> ${memo.memoId} </div>' +
								'</div>';
				
			//�޸� ��ü
			var Memo = {
					
				//�޸� �߰� �޼ҵ�
				addMemo : function( ex, ey ){
					alert("win_width = "+$('#memo_wrap').width() + "/ win_height="+$('#memo_wrap').height());

					var memo_html04 = '<div class="memo">'+
											'<nav class="top_nav">'+
												'<span class="addMemo"><i class="fa fa-plus"></i></span>'+
												'<span class="delMemo" onclick="deleteMemo(\'memoId\')"><i class="fa fa-trash"></i></span>'+
											'</nav>'+
											'<textarea name="memoDetail" class="memoDetail">'+''+'</textarea>'+
											'<div class="memo_id" hidden="hidden">memoId</div>'+
										'</div>';
					
					//â ũ�� ���ϱ�
					var win_width = $('#memo_wrap').width() - 250,
						win_height = $('#memo_wrap').height() - 300,
						x = Math.random() * win_width,	//�������� ��ǥ ����
						y = Math.random() * win_height;
					
					//$('#memo_wrap').append(memo_html);	//�޸� �߰�
					//$('.memoItem').last().parent().append(memo_html2);
					$('.memo_row').append(memo_html04);
					
					var $new_memo = $('.memo').last();	//���� ������ �޸� ��ü
					
					//$new_memo.css({
						//left: parseInt(x) + 'px',
						//top: parseInt(x) + 'px'
						//left: ex + 'px',
						//top: ey + 'px'
					//});
					//$('.memo').last().css('left','10px').css('top', '10px');
					/* $new_memo.css('left', ex+'px');
					$new_memo.css('top', ey+'px'); */
					
					$('.memo').css('zIndex', '50');	//�޸��� ���̾� �ʱ�ȭ
					$new_memo.css('zIndex', '99');	//�� �޸����� ���� ���̾��
					
				}	//addMemo
			};	//end Memo{}
			
			
			//�߰���ư
			$('#memo_wrap').on("click", '.addMemo', function(e){
				var event = e.originalEvent;	//������������ ���� �ڹٽ�ũ��Ʈ �̺�Ʈ ������ �ʿ�
				//var touchObj = event.changedTouches[0];		//��ġ �̺�Ʈ ��ü
				
				//���� �հ��� ��ġ
				var x = parseInt(event.pageX),
					y = parseInt(event.pageY),
					ex = x - 125,
					ey = y - 16;
				
				//Memo.addMemo( ex, ey );
				
				addMemo( '', x, y );
			});
			
			//���콺 �Է� : ���콺�� �޸��� ��ܿ� ��ġ�ϸ� �巡�� Ȱ��ȭ
			/* $('#memo_wrap').on('mouseover', '.top_nav', function(){
				console.log("mouseover")
				$(this).parent().draggable();
			}); */
			
			$('.top_nav').parent().draggable();
			
			//��ġ �Է�
			$('#memo_wrap').on('touchstart mousedown', '.memo', function(){	//���� �̺�Ʈ ����
				$('.memo').css('zIndex', '50');
				$(this).css('zIndex', '99');
			});
			
			//�޸� �̵�..
			$('#memo_wrap').on('mousemove', '.top_nav', function(e){
				//console.log("touchmove!");
				
				var $memo = $(this).parent();	//�޸� ��ü
				var event = e.originalEvent;	//������������ ���� �ڹٽ�ũ��Ʈ �̺�Ʈ ������ �ʿ�
				//var touchObj = event.changedTouches[0];		//��ġ �̺�Ʈ ��ü
				
				//���� �հ��� ��ġ
				/* var x = parseInt(touchObj.clientX),
					y = parseInt(touchObj.clientY), */
				var x = parseInt(event.pageX),
					y = parseInt(event.pageY),
					ex = x - 125,
					ey = y - 16;
			});
			
			//���콺 �� �ҽ� ��ǥ�� �޾Ƽ� ��ġ ����!
			$('#memo_wrap').on('mouseup', '.top_nav', function(e){
				
				var left_minus = $('.sidebar').width();
				var top_minus = $('.toolbar').height();
				
				var event = e.originalEvent;	//������������ ���� �ڹٽ�ũ��Ʈ �̺�Ʈ ������ �ʿ�
				var x2 = parseInt(event.pageX),
					y2 = parseInt(event.pageY),
					ex2 = x2 - 125,
					ey2 = y2 - 16;
				console.log("mouseup => memo left:"+ex2+"px / top:"+ey2+"px");
				
				var $memo = $(this).parent();	//�޸� ��ü
				/* var memoLeft = $memo.position().left - left_minus;
				var memoTop = $memo.position().top- top_minus;
				console.log("mouseup position => memo left:"+memoLeft+"px / top:"+memoTop+"px"); */
				
				var coordinates = $memo.offset();
				var memoLeft2 = coordinates.left - left_minus - 30;
				var memoTop2 = coordinates.top - top_minus - 102;
				console.log("coordinates = "+ memoLeft2 +"/"+ memoTop2 );
				
				var memoId = $memo.find('.memo_id').text();
				updateMemoCoordinates( memoId, memoLeft2, memoTop2 );
			});
			
			
			
			//�޸� ���� ����� update
			$('#memo_wrap').on('change', '.memoDetail', function(){
				
				var currDetail = $(this).val();
				var memoId = $(this).next().text();
				console.log("currDetail="+currDetail + " / memoId="+memoId);

				updateMemoDetail( currDetail, memoId );
			});
			
			
			$('.addMemoIcon').hover(
				  function() {
				    $( this ).css("color", "#FFD6CF");
				  }, function() {
				    $( this ).css("color", "black");
				  }
			);
			
		});


		//�޸� ��ǥ���� ��ġ�ϱ�! �����
		$(function() {
			var memoList = new Array;
			
			<c:forEach items="${plan.memoList}" var="memo">
				var json = new Object();
				json.memoId = "${memo.memoId}";
				json.pageX = "${memo.pageX}";
				json.pageY = "${memo.pageY}";
				memoList.push(json);
			</c:forEach>
			
			console.log("memo="+JSON.stringify(memoList) );
			
			for( var i in memoList ){
				setMemoCoordinates( memoList[i].memoId, memoList[i].pageX, memoList[i].pageY );
			}
		});
		
		//�޸� ��ǥ���� ��ġ�ϱ�!
		function setMemoCoordinates( memoId, pageX, pageY ){
			
			//�޸��� ��ġ ����
			$('.memo_id:contains("'+ memoId +'")').parent().css('left', pageX+'px');
			$('.memo_id:contains("'+ memoId +'")').parent().css('top', pageY+'px');
		}
		
		
		function updateMemoCoordinates( memoId, pageX, pageY ) {
			
			console.log("updateMemoCoordinates! => memoId="+memoId+"/ pageX="+pageX+"/ pageY="+pageY );
			
			$.ajax({
				url: "/planSub/json/updateMemoCoordinates",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					memoId: memoId,
					pageX: pageX,
					pageY: pageY
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSONData);	
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
			
		}
		
		function addMemo( memoDetail, x, y ){
			
			$.ajax({
				url: "/planSub/json/addMemo",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					memoDetail: memoDetail
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSONData.memoId);	
						/* var newMemoId = JSONData.memoId;
						alert( $('.memoDetail').index( $('.memoDetail:contains("'+memoDetail+'")') ) )
						$('.memoDetail:contains("'+memoDetail+'")').next().text(newMemoId);
						
						var delHtml = '<span class="delMemo" onclick="deleteMemo(\''+ newMemoId +'\')"><i class="fa fa-trash"></i></span>';
						$('.memoDetail:contains("'+memoDetail+'")').parent().find('.delMemo').remove();
						$('.memoDetail:contains("'+memoDetail+'")').prev().append(delHtml); */
						
						var newMemoId = JSONData.memoId;
						
						var memo_html05 = '<div class="memo">'+
											'<nav class="top_nav">'+
												'<span class="addMemo"><i class="fa fa-plus"></i></span>'+
												'<span class="delMemo" onclick="deleteMemo(\''+ newMemoId +'\')"><i class="fa fa-trash"></i></span>'+
											'</nav>'+
											'<textarea name="memoDetail" class="memoDetail">'+''+'</textarea>'+
											'<div class="memo_id" hidden="hidden">'+ newMemoId +'</div>'+
										'</div>';
						
						$('.memo_row').append(memo_html05);
						
						var $new_memo = $('.memo').last();	//���� ������ �޸� ��ü
						
						$('.memo').css('zIndex', '50');	//�޸��� ���̾� �ʱ�ȭ
						$new_memo.css('zIndex', '99');	//�� �޸����� ���� ���̾��
						$new_memo.draggable();
						$new_memo.offset({left: x, top: y});
						
						
						
						var memoPrevHtml = '<div class="memo_prev">'+
											'<span class="delMemo" onclick="deleteMemo(\''+ newMemoId +'\')"><i class="fa fa-trash"></i></span>'+
											'<span class="memoDetail_prev"> '+
												'<a href="#memo_'+ newMemoId +'" id="memo_prev_'+ newMemoId +'" class="scroll">-'+
												'</a>'+
											'</span>'+
										'</div>';
						$('.memo_prev_list').prepend(memoPrevHtml);
						
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
			
		} //addMemo
	
		function updateMemoDetail( memoDetail, memoId ){
			
			if( memoDetail.length > 200 ){
				//alert("�޸�� 200�� ���Ͽ��� �մϴ�.");
				swal("�޸�� 200�� ���Ͽ��� �մϴ�.", "", "warning");
				return;
			}
			
			$.ajax({
				url: "/planSub/json/updateMemo",
				method: "POST",
				dataType: "json",
				data: JSON.stringify({
					planId: planId,
					memoId: memoId,
					memoDetail: memoDetail
				}),
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSONData);	
						
						$('#memo_prev_'+ memoId ).text( memoDetail );
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //updateMemoDetail
		
		function deleteMemo( memoId ){
			
			/* if(confirm( "������ �޸�� ���� �Ұ����մϴ�. \n���� �����Ͻðڽ��ϱ�? ")){
				$.ajax({
					url: "/planSub/json/deleteMemo/"+memoId+"/"+planId,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						$('.memo_id:contains("'+ memoId +'")').parent().remove();
						$('#memo_prev_'+memoId).parent().parent().remove();
					},
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				    } 
				});
			} */
			
			swal({
				title:"�޸� ����",
				text:"������ �޸�� ���� �Ұ����մϴ�. \n���� �����Ͻðڽ��ϱ�? ",
				icon:"warning",
				buttons: [ "�ƴϿ�", "��"]
			}).then((YES) => {
				if(YES){
					swal("�����Ǿ����ϴ�!", "", "success");
					$.ajax({
						url: "/planSub/json/deleteMemo/"+memoId+"/"+planId,
						method: "GET",
						dataType: "json",
						headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
						success: function(JSONData, status){
							$('.memo_id:contains("'+ memoId +'")').parent().remove();
							$('#memo_prev_'+memoId).parent().parent().remove();
						},
						error:function(request,status,error){
					        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
					    } 
					});
				}
			});
			
		} //deleteMemo
		
		/* -------------------------------------	Memo List ���� �Լ���		------------------------------------- */
		
	</script>
	
	<style type="text/css">
	
		#click {
			position: fixed;
			right: 20px;
			top : 2%;
			border-radius: 50%;
			background-color:#81e0fc;
			box-sizing: border-box;
			width: 50px;
			height: 50px;
			text-align:center;
			line-height:60px;
			z-index: 200;
			opacity: 70%;
		}
         #planChat {
            height: 88%;
            width: 280px;
            transition: all 0.5s;
            color: #333;
            font-size: 10px;
            position: fixed;
            right: -350px;
            bottom: 20px;
            border: 1px solid #ccc;
            background-color: #C5ECE9;
            z-index: 190;
        }
        #planChat.on {
        	right: 10px;
        }

        .planChat.output {
            height: 94%;
            bottom: 40px;
            background-color: white;
            overflow:auto;
        }

        .planChat.input {
            height: 40px;
            bottom: 0px;
            background-color: #C5ECE9;
        }
	
	</style>

</head>

<body>
	<!-- ToolBar ���� -->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<!-- ToolBar �� -->
	
	
	
	
	<!-- ȭ�鱸�� div Start ///////////////////////////// -->
	<div class="container-fluid">
		
		<!-- �ٴ� ���̾ƿ� Start ///////////////////////////// -->
		<div class="row">
		
			<!-- ���� Plan ���� ���� Start /////////////////////////////////////////////////////////// -->
			<nav class="col-md-2 d-none d-md-block sidebar sticky-top" style="padding-top:0px; padding-left:20px;" id="navbar-scrollspy">
		      <div class="sidebar-sticky">
                <div id="blank-top" style="height: 70px"></div>
		        <ul class="nav flex-column">
		        
		          <li class="nav-item">
		            <a class="nav-link active" href="/plan/getPlanList">
		              <span data-feather="home"></span>
		              	�÷� ����Ʈ�� <span class="sr-only">(current)</span>
		            </a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoTodoList">
		              <span data-feather="check-square"></span> Todo ����Ʈ
		            </a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoCityRouteList">
		              <span data-feather="map"></span> �����Ʈ
		            </a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoBudgetOverviewList">
		              <span data-feather="dollar-sign"></span> ����
		            </a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoDailyList">
		              <span data-feather="calendar"></span> ����ǥ
		            </a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoStuffList">
		              <span data-feather="briefcase"></span> �غ�
		            </a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link scroll" href="#gotoMemoList">
		              <span data-feather="edit-3"></span> �޸�
		            </a>
		          </li>
		          
		        </ul>
		
		        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		          <span>Plan Members</span>
		          <!-- <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new member"> -->
		          	<c:if test="${plan.planStatus == 'R' }">
		           		<span data-feather="plus-circle" onclick="inviteUser()"></span>
		            </c:if>
		          <!-- </a> -->
		        </h6>
		        
		        <ul class="nav flex-column mb-2" style="margin: 15px;">
		          <c:forEach var="member" items="${plan.planPartyList}">
		          	<li class="nav-item media party-member" style="margin-bottom: 10px;">
		          		<img src="/resources/images/userImages/${member.userImg}" id="img_${member.userId}" class="rounded-circle align-self-center mr-2 party-member-img" alt="...">
						    <div class="media-body" style="font-size:12px;">
							    <h6 class="mt-0 mb-1">${member.userId} <c:if test="${member.role == 'K'}"> <i class="fa fa-crown" style="font-size: 13px;"></i></c:if></h6> 
							      ${member.nickname}
						    </div>
						    <c:if test="${ user.userId == plan.planMaster.userId && member.role=='M' }">
						    	<span data-feather="user-minus" onclick="deletePlanPartyAlert('${member.userId}','${member.nickname}')"></span>
						    </c:if>
					</li>
					</c:forEach>
		        </ul>
		        
		        <!-- plan-party-list  -->
				<!--  <div class="plan-party-list-box">
					<div style="font-weight: bolder;">members</div>
			
					<ul class="list-unstyled plan-party-list">
						<c:forEach var="member" items="${plan.planPartyList}">
							<li class="media party-member" style="margin-top: 10px;">
								<img src="https://pds.joins.com/news/component/htmlphoto_mmdata/201903/01/faf54c9e-e268-440d-995c-eea6834d559a.jpg" class="rounded-circle align-self-center mr-2 party-member-img ${member.role}" alt="...">
							    
							    <div class="media-body" style="font-size:12px;">
							      <h6 class="mt-0 mb-1">${member.userId}</h6>
							      ${member.nickname}
							    </div>
							</li>
						</c:forEach>
						
						<li class="media add-party-member" style="margin-top: 15px;">
							<i class="fas fa-user-plus" style="font-size: 22px; margin-left: 5px;" onclick="inviteUser()"></i>
						</li>
					</ul>
				</div> --> 
		        
		        <!-- Top ��ư -->
		        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
		        	<span></span>
		        	<span>
		        		<a href="#gotop" title="top" class="scroll"> top <span data-feather="arrow-up"></span></a>
		        	</span>
		        </h6>
		        
		      </div>
		    </nav>
			<!-- ���� Plan ���� ���� End //////////////////////////////////////////////////// -->
			
			
			
			<!-- top��ư �̵��� ���� div.... ����... -->
			<div id="gotop"></div>	
			<!-- Main ȭ�� ���� Start ///////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 container"> -->
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="padding-top: 20px;" id="memo_wrap">
				
				<!--	 Plan Information START	//////////////////////// 	-->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-0 mb-2 border-bottom list-container" >

					<div class="media" style="background-color: white; width: 100%; padding: 2px 15px; border-radius: 5px; font-size:14px; ">
					
						<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-1" alt="img loading.." style="border: 1px #D1D1D1 solid; width: 120px; height: 95px;">
					    <div class="media-body" style="margin-left: 13px; margin-top: 25px; height: 100px;display: inline-block;">
					    	<span style="color: #EE0D0D; font-weight: bolder;"><c:if test="${plan.planStatus == 'C'}">����Ϸ�!</c:if></span>
					    	<div class="plan_type">
								<c:choose>
									<c:when test="${plan.planType == 'A'}">����ȥ��</c:when>
									<c:when test="${plan.planType == 'B'}">����ȥ��</c:when>
									<c:when test="${plan.planType == 'C'}">���ڳ���</c:when>
									<c:when test="${plan.planType == 'D'}">���ڳ���</c:when>
									<c:when test="${plan.planType == 'E'}">��ü</c:when>
									<c:when test="${plan.planType == 'F'}">�θ�԰�</c:when>
									<c:when test="${plan.planType == 'G'}">Ŀ��</c:when>
								</c:choose>
							</div>
						      <div style="margin: 2px 0;"><div style="font-weight: bolder; font-size: 19px; display: inline-block;">${plan.planTitle} </div> &emsp;
						      			<c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
						                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if>
						                 ${plan.planPartySize}
						      </div>
						      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
						      <c:if test="${plan.planDday == 0}"> <b>D-Day</b> </c:if>
						      <c:if test="${plan.planDday > 0}"> <b>D - ${plan.planDday}</b> </c:if>
					    
					    </div> <!-- media body -->
						
						<div style="float:right;">
						
							<c:if test="${ plan.planTotalDays > 0 }">
								
								<i class="fas fa-share-alt plan-button" id="uploadPlanButton"><br/><span style="font-size:7px;">����</span></i>
							</c:if>
							
							<c:if test="${plan.planStatus != 'C' }">
								<i class="far fa-check-circle plan-button" id="planCompleteButton"><br/><span style="font-size:6px;">Ȯ��</span></i>
								
								<i class="far fa-edit plan-button" id="updatePlanButton" data-toggle="modal" data-target="#editPlan"><br/><span style="font-size:7px;">����</span></i> 
							</c:if>
							
							
							<c:if test="${ user.userId == plan.planMaster.userId }">
								<i class="far fa-trash-alt plan-button" id="deletePlanButton" data-toggle="modal" data-target="#deletePlanAlert"><br/><span style="font-size:7px;">����</span></i>
							</c:if>
							<c:if test="${ user.userId != plan.planMaster.userId }">
								<i class="fas fa-sign-out-alt plan-button" id="exitPlanButton"><br/><span style="font-size:7px;">Ż��</span></i>
							</c:if>
							
						</div>
						
						<!-- 
						<div style="float:right;">
							<c:if test="${plan.planStatus != 'C' }">
								<button type="button" class="btn btn-info btn-sm" id="planCompleteButton" style="margin-left: 5px;">����Ϸ� Ȯ��</button>
								<button type="button" class="btn btn-primary btn-sm" id="updatePlanButton" style="margin-left: 5px;"  data-toggle="modal" data-target="#editPlan">�÷��� ����</button> 
							</c:if>
							
							<c:if test="${ user.userId == plan.planMaster.userId }">
								<button type="button" class="btn btn-danger btn-sm" id="deletePlanButton" style="margin-left: 5px;" data-toggle="modal" data-target="#deletePlanAlert">�÷��� ����</button> 
							</c:if>
							<c:if test="${ user.userId != plan.planMaster.userId }">
								<button type="button" class="btn btn-secondary btn-sm" id="exitPlanButton" style="margin-left: 5px;">�÷��� Ż��</button> 
							</c:if>
							<c:if test="${ plan.planTotalDays > 0 }">
								<button type="button" class="btn btn-warning btn-sm" id="uploadPlanButton" style="margin-left: 5px;">�÷��� �����ϱ�</button> 
							</c:if>
						</div>
						-->
					</div>
				</div>
				<!--	 Plan Information END	//////////////////////// 	-->
				
				<!-- <br/> -->
				
				<script>
					$(function() {
						
						$('#addTodoButton').on('click', function(){
							var todoListHeight = $('#todo_list').height()
							
							if( $('#todo_list_container').find('.addTodo').text() == '' ){
								todoListHeight = todoListHeight - 50;
								var addTodoHtml = '<div class="addTodo row align-middle" style="width: 100%; margin-left:15px; padding-top:10px;"><i class="fas fa-pencil-alt" style="margin-top: 10px;width: 7%;"></i><input type="text" class="form-control" name="todoName" id="addTodoName" style="margin-left:5px; width: 70%; " placeholder="���ο� Todo �Է�"> <button style="margin-bottom: 5px; margin-left: 5px;width: 13%;" type="button" class="btn btn-primary" onclick="addTodo()">+</button> </div>';
								$('#todo_list').before($(addTodoHtml));
							}else{
								todoListHeight = todoListHeight + 50;
								$('#todo_list_container').find('.addTodo').remove();
							}
							$('#todo_list').height(todoListHeight);
						});
						
						$('#addTodoButton').hover(
							  function() {
								    $( this ).css("color", "#08B5BA");
								  }, function() {
								    $( this ).css("color", "black");
								  }
						);
						
						
						$( "#todo_list, #doing_list, #done_list" ).sortable({
							connectWith: ".connectedSortable",
							/* �巡�� ���۽� ȣ��Ǵ� �̺�Ʈ �ڵ鷯 */
							start: function( event, ui ){
								console.log("start => "+ "todoId="+ui.item.find('span').text()+"/todoCheck="+$('.connectedSortable').index(ui.item.parent()) );
							},
							/* ����� ȣ��Ǵ� �̺�Ʈ �ڵ鷯 */
							stop: function( event, ui ){
								var todoId = ui.item.find('span').text();
								var todoIndex = $('.connectedSortable').index(ui.item.parent());
								var todoStatus;
								
								if( todoIndex == 0 ){
									todoStatus = 'T';
								}else if( todoIndex == 1 ){
									todoStatus = 'I';
								}else if( todoIndex == 2 ){
									todoStatus = 'D';
								}
								console.log("end => "+ "todoId="+todoId+"/todoCheck="+ todoStatus );

								updateTodoStatus( todoId, todoStatus );
							}
						}).disableSelection();
					});
					
					
					function updateTodoStatus( todoId, todoStatus ){
						
						$.ajax({
							url: "/plan/json/checkTodo" ,
							method: "POST",
							dataType: "json",
							headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
							data: JSON.stringify({
								planId: planId,
								todoId: todoId,
								todoCheck: todoStatus
							}),
							success: function(JSONData, status){
								//String�� �ͼ� ����� ��ġ�� ����..
							},
							error:function(request,status,error){
						        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						    } 
						});
						
					}
				</script>
				
				
							
				<!--	 Todo List : ���� ����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoTodoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2 pb-3 mb-3 border-bottom list-container" id="gotoTodoList">
	
					<div class="d-flex justify-content-around flex-wrap flex-md-nowrap"  style="width: 99%;margin-bottom: 5px;">
						<div id="todo_list_container" style="width: 32%;">
							<p style="border-bottom:1px solid #797979; margin: 0 10px; font-weight: bolder; float: right;">&nbsp;Todo &nbsp;<span data-feather="pen-tool" id="addTodoButton"></span></p>
							<ul id="todo_list" class="connectedSortable">
							
								<c:if test="${plan.todoList.size()!=0}">
									<c:forEach var="todo" items="${plan.todoList}">
										<c:if test="${todo.todoCheck == 'T' }">
											<li class="todo_item" >${todo.todoName}<span hidden="hidden">${todo.todoId}</span> &nbsp;<i class="fas fa-backspace deleteTodo" onclick="deleteTodo('${todo.todoId}')"></i></li>
										
										</c:if>
									</c:forEach>
								</c:if>
								
							</ul>
							
						</div>
						
						<div id="doing_list_container" style="width: 32%;border-left: 1px #C1CDCC;">
							<p style="border-bottom:1px solid #797979; margin: 0 10px; font-weight: bolder; float: right;">Doing</p> 
							<ul id="doing_list" class="connectedSortable">
							
								<c:if test="${plan.todoList.size()!=0}">
									<c:forEach var="todo" items="${plan.todoList}">
										<c:if test="${todo.todoCheck == 'I' }">
											<li class="todo_item" >${todo.todoName}<span hidden="hidden">${todo.todoId}</span> &nbsp;<i class="fas fa-backspace deleteTodo" onclick="deleteTodo('${todo.todoId}')"></i></li>
										
										</c:if>
									</c:forEach>
								</c:if>
							
							</ul>
						</div>
						
						<div id="done_list_container" style="width: 32%;border-left: 1px #C1CDCC;">
							<p style="border-bottom:1px solid #797979; margin: 0 10px; font-weight: bolder; float: right;">Done</p> 
							<ul id="done_list" class="connectedSortable">
							
								<c:if test="${plan.todoList.size()!=0}">
									<c:forEach var="todo" items="${plan.todoList}">
										<c:if test="${todo.todoCheck == 'D' }">
											<li class="todo_item" >${todo.todoName}<span hidden="hidden">${todo.todoId}</span> &nbsp;<i class="fas fa-backspace deleteTodo" onclick="deleteTodo('${todo.todoId}')"></i></li>
										
										</c:if>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
						
				</div>
				<!--	 Todo List : ���� ����Ʈ END	//////////////////////// 	-->
				<!-- <br/> -->
				
				
				<!--	 CityRoute List : �����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoCityRouteList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 pl-2 mb-3 border-bottom list-container" style="height:650px;" id="gotoCityRouteList">
					
					<div id='calendar-container' style="float:right;width:45%; height:100%; margin: 5px 10px;max-width: 900px;">
					  <div id='calendar' style="margin-bottom:10px;"></div>
					  
					  <div class="text-center" style="border:solid thin #DDDDDD; border-radius:5px; padding: 5px 10px; background-color: white; height:160px;"  id="gotoBudgetOverviewList">
							<div class="d-flex justify-content-left mt-1 ml-3" style="font-weight: bolder; font-size: 16px;">���� ����</div>
							
							<!-- �����ΰ� ��ũ��Ʈ���� �������� �����ϱ� -->
							<div class="budgetOverview d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center" style="padding: 0px 3px 0px 0px;font-size: 14px;width:100%;">
								<div style="width:46%;margin: 3px;">
									<div class="row" style="margin: 4px 0;"> <span><i class="budgetIcon fas fa-walking" 		></i>����</span>  <div class="budget_amount" id="budget_D" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
									<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-bus" 			></i>����  <div class="budget_amount" id="budget_T" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
									<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-ticket-alt" 	></i>����  <div class="budget_amount" id="budget_V" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
									<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-ellipsis-h" 	></i>��Ÿ  <div class="budget_amount" id="budget_E" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
								</div>
								<div style="width:46%;margin: 3px;">
									<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-bed" 			></i>����  <div class="budget_amount" id="budget_R" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
									<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-utensils" 		></i>�Ļ�  <div class="budget_amount" id="budget_F" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
									<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-shopping-cart" ></i>����  <div class="budget_amount" id="budget_S" style="display: inline-block; width: 45%; text-align: right;">0</div>&nbsp;��</div>
									<div style="margin: 5px 0;text-align: right; color:#32D0BF; font-weight: bolder;"> ��  <div id="budget_total" style="font-size:23px; display: inline-block; width: 50%; text-align: right;">0</div>&nbsp;��</div>
								</div>
							</div>
						</div>
					</div>
					
					<div id="map" style="border:1px solid #e5e5e5;margin-bottom:0px;float:left;width:55%;height: 100%;"></div>
				
				</div>
				<!--	 CityRoute List : �����Ʈ END	//////////////////////// 	-->
			
				
				<!--	 BudgetOverview List : ���� ���� ����Ʈ START	//////////////////////// 	-->
				<!-- <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom list-container"  id="gotoBudgetOverviewList">
							<div></div>
							<div class="text-center" style="border:solid thin #DDDDDD ; border-radius:5px; padding: 5px 10px; background-color: white; width: 50%; ">
								<div class="d-flex justify-content-left mt-1 ml-3" style="font-weight: bolder; font-size: 17px;">���� ����</div>
								
								�����ΰ� ��ũ��Ʈ���� �������� �����ϱ�
								<div class="budgetOverview" style="padding: 5px;">
									<div style="float:left;width:45%;">
										<div style="margin: 4px 0;"> <i class="fas fa-walking" 		style="width:40px; font-size: 20px;"></i>����  <div class="budget_amount" id="budget_D" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
										<div style="margin: 4px 0;"> <i class="fas fa-bus" 			style="width:40px; font-size: 20px;"></i>����  <div class="budget_amount" id="budget_T" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
										<div style="margin: 4px 0;"> <i class="fas fa-ticket-alt" 	style="width:40px; font-size: 20px;"></i>����  <div class="budget_amount" id="budget_V" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
										<div style="margin: 4px 0;"> <i class="fas fa-ellipsis-h" 	style="width:40px; font-size: 20px;"></i>��Ÿ  <div class="budget_amount" id="budget_E" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
									</div>
									<div style="float:right;width:45%;">
										<div style="margin: 4px 0;"> <i class="fas fa-bed" 			style="width:40px; font-size: 20px;"></i>����  <div class="budget_amount" id="budget_R" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
										<div style="margin: 4px 0;"> <i class="fas fa-utensils" 	style="width:40px; font-size: 20px;"></i>�Ļ�  <div class="budget_amount" id="budget_F" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
										<div style="margin: 4px 0;"> <i class="fas fa-shopping-cart" style="width:40px; font-size:20px;"></i>����  <div class="budget_amount" id="budget_S" style="display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
										<div style="margin: 5px 0;text-align: right; color:#32D0BF;"> ��  <div id="budget_total" style="font-size:23px; display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
									</div>
								</div>
							</div>
							
				</div> -->
				<!--	 BudgetOverview List : ���� ���� ����Ʈ END	//////////////////////// 	-->
				
				

				<!--	 Daily List : ����ǥ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light" id="gotoDailyList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom list-container" id="gotoDailyList">
					<div class="container">
						<div style="font-weight: bolder;font-size: 20px;margin-bottom: 5px;">����ǥ</div>
						<div class="row">
						
							<c:if test="${plan.dayList.size() != 0}">
								<div class="swiper-container swiper">
								    <!-- <div class="swiper-wrapper"> -->
								    <div class="swiper-wrapper">
							    
							    		<c:forEach var="day" items="${plan.dayList}">
							    			<div class="swiper-slide">
							    			<div>
							    				<div class="dayInfo" style="padding-top:10px;padding-left:10px;text-align:left;padding-left:8px;font-size:14pt;color:#696969; font-weight: bold;">
													${day.dateString}  <br/>
													<span style="font-size:11pt;color:#32D0BF"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} ���� )</span>
												</div>
												
												<div style="margin-top: 10px;">
													<c:forEach var="i" begin="9" end="20">
														
														<div class="dailys" style="border-top:1px solid #efefef; height:30px;font-size:10pt;color:#9B9B9B;padding-left:10px; padding: 5px;" onclick="openDailyEdit( '${day.cityNames}', '${day.dateString}' ,${day.dayNo},${i},${plan.planId});">
															${i} <div style=" margin-left:10px; background-color: inherit; color:black; font-size:10pt; display:inline-block;" id="daily_${day.dayNo}_${i}"></div>
														</div>
													</c:forEach>
												</div>
											</div>
							    			</div>
							    		</c:forEach>
								    	
								    </div>
								    
								    <div class="swiper-button-prev" ></div>
								    <div class="swiper-button-next"></div>
									<!-- <div class="swiper-pagination"> -->
								    <!-- <div class="swiper-scrollbar"></div> -->
								</div>
							</c:if>
							
						</div>
					</div>
				</div>
				<!--	 Daily List : ����ǥ END	//////////////////////// 	-->

				
				
				<!--	 Stuff List : �غ� üũ����Ʈ START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoStuffList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom list-container" id="gotoStuffList">
					
					<div style="border:solid thin #DDDDDD ; border-radius:5px; padding:20px; background-color: white; width: 100%; ">
						<span id="stuff_icon"><i class="fas fa-tasks" style="font-size: 25px; margin-right: 6px; margin-bottom: 15px;"></i></span> <span style="margin-left:10px; font-size:large; font-weight:bolder;"> �غ� üũ����Ʈ</span>
						&nbsp;&nbsp;<span style="font-weight: bolder; font-size: 18px;" id="stuffMode">Edit Mode</span>
						<span id="stuffCount" style="margin-left: 15px;">( <span id="stuffChecked"></span> / <span id="stuffUnchecked"></span> )</span>
						<br/>
						 
						<div class="stuffItems"> <!-- �� div ���� �� getStuffList() �ٷ� ȣ���ؼ� �����ϱ� -->
							<%-- <c:forEach var="stuff" items="${plan.stuffList}">
								<div class="stuffItem" style="margin: 7px;">
									<c:if test="${stuff.stuffCheck=='T'}">
										<input type="checkbox" name="stuff_${stuff.stuffId}" checked value="T" onchange="checkStuff('${stuff.stuffId}')"><span style="margin-left: 10px;"> ${stuff.stuffName}</span>
									</c:if>
									<c:if test="${stuff.stuffCheck=='F'}">
										<input type="checkbox" name="stuff_${stuff.stuffId}" value="F" onchange="checkStuff('${stuff.stuffId}')"><span style="margin-left: 10px;"> ${stuff.stuffName}</span>
									</c:if>
								</div>
							</c:forEach>
							
							<c:if test="${plan.stuffList.size() == 0}">
								<div class="addStuff">
									<i class="fas fa-pencil-alt" style="margin: 7px;"></i><input type="text" class="form-control" name="stuffName" style="margin-left:5px; margin-top:5px; width: 200px; display:inline-block;" placeholder="���ο� �׸� �Է�">
									<button style="margin-bottom: 5px; margin-left: 5px;" type="button" class="btn btn-primary" onclick="addStuff()">�߰�</button> 
								</div>
							</c:if> --%>
						</div> 	
					</div>
							
							
							
							
				</div>
				<!--	 Stuff List : �غ� üũ����Ʈ END	//////////////////////// 	-->

				
				
				<!--	 Memo List : �޸� START	//////////////////////// 	-->
				<!-- <div class="album py-5 bg-light"  id="gotoMemoList"> -->
				<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom list-container" id="gotoMemoList">
					<div class="container">
					
						<div style="font-weight: bolder;font-size: 20px;margin-bottom: 5px;">�޸� <span class="addMemo"><i class="fa fa-marker addMemoIcon"></i></span> </div>
						<div class="memo_row">
							
							<!-- memo list -->
							<c:if test="${plan.memoList.size()!=0}">
								<c:forEach var="memo" items="${plan.memoList}">
								
									<%-- <div class="memoItem" style="font-size:small;  background-color:#FFF38B;padding: 18px;margin: 10px;height: 250px;width: 250px;border: medium;border-color: navy;box-shadow:3px 2px 4px #898989;">
										�޸� ������� : &nbsp; ${memo.memoRegDate}<br/>
										����� : &nbsp; ${memo.regUserNickname}<br/><br/>
										${memo.memoDetail}<br/>
									</div> --%>
								
									<div class="memo" id="memo_${memo.memoId}">
										<nav class="top_nav">
											<span class="addMemo"><i class="fa fa-plus"></i></span>
											<span class="delMemo" onclick="deleteMemo('${memo.memoId}')"><i class="fa fa-trash"></i></span>
										</nav>
										<%-- <div>�޸� ����� : &nbsp; ${memo.memoRegDate} </div>
										<div>�ۼ��� : &nbsp; ${memo.regUserNickname} </div> --%>
										<textarea name="memoDetail" class="memoDetail">${memo.memoDetail}</textarea>
										<div class="memo_id" hidden="hidden">${memo.memoId}</div>
									</div>
									
								</c:forEach>
							</c:if>
							
							<!-- memo prev list -->
							<div class="memo_prev_list" style="margin: 15px;">
								<c:if test="${plan.memoList.size()!=0}">
									<c:forEach var="memo" items="${plan.memoList}">
								
										<div class="memo_prev mb-1">
											<span class="delMemo" onclick="deleteMemo('${memo.memoId}')"><i class="fa fa-trash"></i></span>
											<span class="memoDetail_prev">
												<a href="#memo_${memo.memoId}" id="memo_prev_${memo.memoId}" class="scroll">
													<c:if test="${memo.memoDetail.length() > 50}">
														${memo.memoDetail.substring(0,50)} . . .
													</c:if>
													<c:if test="${memo.memoDetail.length() <= 50}">
														${memo.memoDetail}
													</c:if>
													<c:if test="${empty memo.memoDetail || memo.memoDetail == '' || memo.memoDetail.length() == 0}">
														 -
													</c:if>
												</a>
											</span>
										</div>
									
									</c:forEach>
								</c:if>
							</div>
							
						</div>
					</div>
				</div>
				<!--	 Memo List : �޸� END	//////////////////////// 	-->
				<br/>
				
				
			
				
				
			</main>
			<!-- Main ȭ�� ���� End ///////////////////////////// -->
			
			
		</div>
		<!-- �ٴ� ���̾ƿ� End ///////////////////////////// -->
		
	</div>
	<!-- ȭ�鱸�� div End ///////////////////////////// -->
	
	
	<!-- Footer Start /////////////////////////// -->
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>
	<!-- Footer End	/////////////////////////// -->
	
	
	<!-- //////////////////////////////////////// ��޸�� ����  //////////////////////////////////////// -->
	<!-- /////////////////////	Modal : editPlan 	///////////////////// -->
	<div class="modal fade" id="editPlan">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� ����</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>�÷��ʸ� �����մϴ�</h6>
	        </div>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('editPlan')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="form-horizontal editPlan" style="margin: 10px;">
	        	<br/>
				<div class="form-group row">
				    <label for="planTitle" style="text-align: right;" class="col-sm-4 col-form-label ">�÷��� ����</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="�÷��� ����" value="${plan.planTitle}">
				    </div>
				</div>
	        	
	        	<div class="form-group row">
					<label for="planType" style="text-align: right;" class="col-sm-4 col-form-label ">���� Ÿ��</label>
				    <div class="col-sm-7">
					    <select class="form-control" id="planType" name="planType"  value="${plan.planType}">
							<option value="A" <c:if test="${plan.planType == 'A'}">selected </c:if> >����ȥ��</option>
							<option value="B" <c:if test="${plan.planType == 'B'}">selected </c:if> >����ȥ��</option>
							<option value="C" <c:if test="${plan.planType == 'C'}">selected </c:if>>���ڳ���</option>
							<option value="D" <c:if test="${plan.planType == 'D'}">selected </c:if>>���ڳ���</option>
							<option value="E" <c:if test="${plan.planType == 'E'}">selected </c:if>>��ü</option>
							<option value="F" <c:if test="${plan.planType == 'F'}">selected </c:if>>�θ�԰�</option>
							<option value="G" <c:if test="${plan.planType == 'G'}">selected </c:if>>Ŀ��</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
				    <label for="planImgFile" style="text-align: right;" class="col-sm-4 col-form-label ">�÷��� �̹���</label>
				    <div class="col-sm-7 custom-file">
				    	<div class="input-group mb-2">
				    		<input type="file" class="form-control custom-file-input" id="planImgFile" name="planImgFile" placeholder="�÷��� �̹���" accept="image/*">
				      		<label class="custom-file-label" for="customFile"><i class="fas fa-camera-retro"> size 360x360</i></label>  
				    		
				    	</div>
				    </div>
				</div>
				
				<%-- <div class="form-group">
				    <label for="planImg" class="col-sm-offset-3 col-sm-5 control-label">�÷��� �̹���</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="planImg" name="planImg" placeholder="�÷��� �̹���" value="${plan.planImg}">
				    </div>
				</div> --%>
				
				<div class="form-group row">
				    <label for="startDateString" style="text-align: right;" class="col-sm-4 col-form-label ">���� ������</label>
				    
				    <div class="col-sm-7">
					    <div class="input-group mb-2">
					      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="���� ������" readonly="readonly"  value="${plan.startDateString.substring(0,10)}">
					      <div class="input-group-append">
					      	<div class="input-group-text"><span data-feather="calendar"></span></div>
					      </div>
					    </div>
				    </div>
				</div>
			
				<%-- <div class="form-group">
				    <label for="startDateString" class="col-sm-offset-3 col-sm-5 control-label">���� ������</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="���� ������" value="${plan.startDateString}">
				    </div>
				</div> --%>
				
				<!-- ����Ϸ� Ȯ�� �������� ���� ���� �� -->
				<input type="hidden" class="form-control" id="planStatus" name="planStatus" value="${plan.planStatus}">
				<input type="hidden" class="form-control" id="planId2" name="planId" value="${plan.planId}">
	        	
	        	<div class="alert alert-danger alert-dismissable" style="display: none;" >
				    <button type="button" class="close" >��</button>
				    <strong></strong><br/>���� �� �ٽ� �õ����ּ���.
				</div>
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('editPlan')">���</button>
	        <button type="button" class="btn btn-primary" id="updatePlan">����</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : editPlan ��	///////////////////// -->
	
	<!-- /////////////////////	Modal : dailyEdit 	///////////////////// -->
	<div class="modal fade" id="dailyEdit" >
	  <div class="modal-dialog">
	  <h4 style="color: #FFFFFF; margin-top: 100px;">���� ���</h4>
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <div class="modal-title">
	        	<h4 class="daily-info city-names">cityNames</h4>
	        	<h5 class="daily-info city-date">cityDate</h5>
	        </div>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('dailyEdit')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="form-inline dailyEdit" style="margin: 10px;">
	        	<input type="hidden" class="form-control" id="dayNo" name="dayNo" value="">
	        	<input type="hidden" class="form-control" id="planId1" name="planId" value="${plan.planId}">
	        	<input type="hidden" class="form-control" id="dailyId" name="dailyId" value="">
	        	
				<div class="form-group" >
				    <label for="dayTime" style="font-weight: bold;">�ð� &nbsp;</label>
			    	<select class="form-control" id="dayTime" name="dayTime" disabled="disabled">
						<c:forEach var="j" begin="9" end="20">
							<option value="${j}">${j}</option>
						</c:forEach>
					</select>
					 &nbsp; &nbsp;
					<label for="dailyCate" style="font-weight: bold;" >ī�װ� &nbsp;</label>
			    	<select class="form-control" id="dailyCate" name="dailyCate" >
						<option value="D">����</option>
						<option value="T">����</option>
						<option value="V">����</option>
						<option value="R">����</option>
						<option value="F">�Ļ�</option>
						<option value="S">����</option>
						<option value="E">��Ÿ</option>
					</select>
				</div>
				
				<div class="form-group" style="margin-top: 15px; margin-bottom: 20px; width: 440px;">
				    <label for="dailyDetail" class="control-label" style="font-weight: bold; margin-bottom: 5px;" >���� ����</label><br/>
				    <input type="text" class="form-control" id="dailyDetail" name="dailyDetail" placeholder="���� ������ �ۼ����ּ���" style="width:100%; height: 100px;">
				</div>
				
				<div class="form-group" >
					<label for="budgetAmount" style="font-weight: bold;" >���� &nbsp;</label>
			    	<input type="text" class="form-control" id="budgetAmount" name="budgetAmount" placeholder="0" style="width: 100px;"> 
					&nbsp; 
				    <label for="budgetCurrency" style="font-weight: bold;"> &nbsp;</label>
			    	<select class="form-control" id="budgetCurrency" name="budgetCurrency" >
						<option value="K">KRW</option>
						<option value="E">EUR</option>
						<option value="G">GBP</option>
					</select>
				</div>
		
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('dailyEdit')">���</button>
	        <button type="button" class="btn btn-danger" id="deleteDaily">����</button>
	        <button type="button" class="btn btn-primary" id="submitDaily">Edit Daily</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : dailyEdit ��	///////////////////// -->
	
	
	<!-- /////////////////////	Modal : inviteUser	///////////////////// -->	
	<div class="modal fade" id="inviteUser">
	  <div class="modal-dialog modal-lg" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��ʿ� ģ�� �ʴ��ϱ�</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
	        </div>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('inviteUser')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="inviteUser" style="margin: 10px;">
	        	<!-- <input type="hidden" class="form-control" id="planId" name="planId" value="${plan.planId}">  -->
		        <div class="input-group flex-nowrap" style="margin: 0 auto; width: 40%;">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="addon-wrapping">@</span>
				  </div>
				  <input type="text" class="form-control" name="findUserId" id="findUserId" placeholder="���̵� �Է��ϼ���" aria-label="findUserId" aria-describedby="addon-wrapping">
					 &nbsp; &nbsp;<button type="button" class="btn btn-primary" id="findUser">�˻�</button>
				</div>
	        
	        	<br/>
	        	
				<div class="findUserResult" style="text-align: center;"></div>
				
				<div class="form-group" id="offerMsgForm" style="margin: 30px 10px 10px 10px; width:auto;">
				    <label for="offerMsg" class="control-label" style="font-weight:bold; margin-bottom: 7px;" ><span class="findUserResult"></span> �Կ��� ������ �ʴ� �޽���</label><br/>
				    <input type="text" class="form-control" id="offerMsg" name="offerMsg" placeholder="�ʴ� �޽����� �Է��ϼ���" style="width:100%; height: 100px;">
				</div>
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('inviteUser')">���</button>
	        <button type="button" class="btn btn-primary" id="addOffer">�ʴ��ϱ�</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : inviteUser ��	///////////////////// -->	
	
	
	<!-- /////////////////////	Alert Modal : �÷��� ���� 	///////////////////// -->	
	<div class="modal fade" id="deletePlanAlert">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� ����</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <!-- <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
	        </div> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('deletePlanAlert')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	        <br/><span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <br/>
	        <span style="font-size:17px;"> �÷��ʸ� �����Ͻðڽ��ϱ�?</span>
	        <br/><br/>
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('deletePlanAlert')">�ƴϿ�</button>
	        <button type="button" class="btn btn-primary" id="deletePlan">��</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Alert Modal : �÷��� ���� ��	///////////////////// -->
	
	
	<!-- /////////////////////	Alert Modal : ����Ϸ� Ȯ��	///////////////////// -->	
	<div class="modal fade" id="planCompleteAlert">
	  <div class="modal-dialog modal-lg" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> ����Ϸ� Ȯ��</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <!-- <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
	        </div> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('planCompleteAlert')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	      <br/>
	        ${plan.startDateString} ���� ${plan.endDate} ����
	        <br/>
	        <span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <span style="font-size:17px;"> ��̰� �ٳ���̳���?</span>
	        <br/><br/><br/>
	        
	        <span style="font-weight:bold;">����Ϸ� Ȯ��</span> �� <br/>
	        	�� �������� ��迡 �÷��� ������ ��ϵ˴ϴ�.
	        	<br/><br/>
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('planCompleteAlert')">���</button>
	        <button type="button" class="btn btn-primary" id="planComplete">����Ϸ� Ȯ��</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Alert Modal : ����Ϸ� Ȯ�� ��	///////////////////// -->	
	
	
	<!-- /////////////////////	Alert Modal : �÷��� ���� �Խ��ǿ� �����ϱ�	///////////////////// -->	
	<div class="modal fade" id="uploadPlanAlert">
	  <div class="modal-dialog modal-lg" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� �����ϱ�</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('uploadPlanAlert')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	        
	        <br/>
	        <span style="font-size:23px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <!-- <span style="font-size:17px;"> �÷��� �Խ��ǿ� �����ұ��?</span> -->
	        <br/><span style="font-size:13px;margin-top: 0;"> ${plan.startDateString} - ${plan.endDate} </span><br/><br/>
	        
	        <span style="font-weight:bold;">�÷��� ����</span> �� <br/>
	        	�÷��� ���� �Խ��ǿ� �÷��ʰ� ��ϵ˴ϴ�.<br/><br/>
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('uploadPlanAlert')">���</button>
	        <button type="button" class="btn btn-primary" id="uploadPlan">�÷��� ����</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Alert Modal : �÷��� ���� �Խ��ǿ� �����ϱ� ��	///////////////////// -->	
	
	
	<!-- /////////////////////	Alert Modal : �÷��� ��� ����	///////////////////// -->	
	<div class="modal fade" id="deletePlanPartyAlert">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� ��� ����</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <!-- <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
	        </div> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('deletePlanPartyAlert')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	        <br/><span id="planMemberId" style="font-size:17px;font-weight:bold; color:#00AACC; "></span>
	        <span style="font-size:17px;"> ����</span> <br/> <span style="font-size:17px;">�÷��� �����ڿ��� ���ܽ�Ű�ðڽ��ϱ�? </span>
	        <br/><br/>
	        
	        <!-- �÷��� ��� ������ ���� �� -->
	        <form class="form-inline deleteMember">
	        	<input type="hidden" class="form-control" id="planId4" name="refId" value="${plan.planId}">
	        	<input type="hidden" class="form-control" id="partyUserId" name="partyUserId" value="">
	        	<input type="hidden" class="form-control" id="partyRole" name="partyRole" value="">
	        </form>
	        
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('deletePlanPartyAlert')">�ƴϿ�</button>
	        <button type="button" class="btn btn-primary" id="deletePlanParty">��</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Alert Modal : �÷��� ��� ���� ��	///////////////////// -->	


	<!-- /////////////////////	Alert Modal : �÷��� Ż�� 	///////////////////// -->	
	<div class="modal fade" id="exitPlanAlert">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> �÷��� Ż��</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <!-- <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
	        </div> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('exitPlanAlert')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	        <br/><span style="font-size:20px; color:#00AACC; font-weight:bold;">${plan.planTitle}</span> <br/>
	        <span style="font-size:17px;"> �÷��ʸ� Ż���Ͻðڽ��ϱ�?</span>
	        <br/><br/>
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('exitPlanAlert')">�ƴϿ�</button>
	        <button type="button" class="btn btn-primary" id="exitPlan">��</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Alert Modal : �÷��� Ż�� ��	///////////////////// -->


	<!-- //////////////////////////////////////// ��� ���� ��  //////////////////////////////////////// -->

	
	
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	
	

	
	<!-- body �ε� �� ����Ǿ�� �ϴ� ��ũ��Ʈ ����  -->
	<script>
	
	 	/* ------------------------------------ Google Map Script ------------------------------------ */
		var map;
		var geocoder;
		var overlay;
		var marker=[];
		var routelines=[];
		
		var uluru = {lat: -25.344, lng: 131.036};
		var paris = {lat: 48.856667, lng: 2.350833};
		var korea = {lat:37.497957 , lng:127.027780};
	
		function initMap(){
			
			geocoder = new google.maps.Geocoder();
		    map = new google.maps.Map(document.getElementById('map'), {
		        center: paris,
		        zoom: 3,			/* zoom: 1:World, 5:Landmass/continent, 10:City, 15:Streets, 20:Buildings */
		        //mapTypeId :'terrain',
		        //styles: [
		        	/* { "elementType": "geometry", "stylers": [ { "color": "#ffffff" } ] }, */
		        	  /* { "elementType": "labels.icon", "stylers": [ { "color": "#e5e5e5" }, { "visibility": "off" } ] },
		        	  { "elementType": "labels.text.fill", "stylers": [ { "color": "#c3c3c3" } ] },
		        	  { "featureType": "administrative", "elementType": "geometry", "stylers": [ { "visibility": "off" } ] }, */
		        	  /* { "featureType": "administrative.land_parcel", "stylers": [ { "visibility": "off" } ]}, */
		        	  /* { "featureType": "administrative.locality", "stylers": [ { "visibility": "simplified" } ] },
		        	  { "featureType": "administrative.neighborhood", "stylers": [ { "visibility": "off" } ] }, */
		        	  /* { "featureType": "poi", "stylers": [ { "visibility": "off" } ] }, */
		        	  /* { "featureType": "road", "stylers": [ { "visibility": "off" } ] }, */
		        	  /* { "featureType": "transit", "stylers": [ { "visibility": "off" } ] },
		        	  { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#B5F8FF" } ] }, */
		        	  /* { "featureType": "water", "elementType": "labels.text", "stylers": [ { "visibility": "off" } ] } */
		        //]
		    	styles: [
		    		{  "elementType": "geometry",
	    			    "stylers": [ { "color": "#ebe3cd"  } ] },
	    			  { "elementType": "labels.text.fill",
	    			    "stylers": [ { "color": "#79524f" } ] },
	    			  {  "elementType": "labels.text.stroke",
	    			    "stylers": [  { "color": "#f5f1e6" } ] },
	    			  { "featureType": "administrative",
	    			    "elementType": "geometry.stroke",
	    			    "stylers": [  { "color": "#c9b2a6" } ] },
	    			  { "featureType": "administrative.land_parcel",
	    			    "elementType": "geometry.stroke",
	    			    "stylers": [ { "color": "#dcd2be" } ] },
	    			  {  "featureType": "administrative.land_parcel",
	    			    "elementType": "labels",
	    			    "stylers": [ {  "visibility": "off" } ] },
	    			  {  "featureType": "administrative.land_parcel",
	    			    "elementType": "labels.text.fill",
	    			    "stylers": [  { "color": "#ae9e90" } ] },
	    			  { "featureType": "landscape.natural",
	    			    "elementType": "geometry",
	    			    "stylers": [ { "color": "#fcf9f5" } ] },
	    			  {  "featureType": "poi",
	    			    "elementType": "geometry",
	    			    "stylers": [ { "color": "#e7dec2"  } ] },
	    			  {  "featureType": "poi",
	    			    "elementType": "labels.text",
	    			    "stylers": [ { "visibility": "off" } ] },
	    			  { "featureType": "poi",
	    			    "elementType": "labels.text.fill",
	    			    "stylers": [ { "color": "#93817c" } ] },
	    			  { "featureType": "poi.business",
	    			    "stylers": [ {  "visibility": "off" } ] },
	    			  { "featureType": "poi.park",
	    			    "elementType": "geometry.fill",
	    			    "stylers": [ { "color": "#e8edde" } ] },
	    			  { "featureType": "poi.park",
	    			    "elementType": "labels.text",
	    			    "stylers": [ {  "visibility": "off" }  ] },
	    			  { "featureType": "poi.park",
	    			    "elementType": "labels.text.fill",
	    			    "stylers": [ {  "color": "#447530" }  ] },
	    			  {  "featureType": "road",
	    			    "stylers": [ { "visibility": "off" } ] },
	    			  { "featureType": "road",
	    			    "elementType": "geometry",
	    			    "stylers": [ { "color": "#f5f1e6" } ] },
	    			  {  "featureType": "road.arterial",
	    			    "elementType": "geometry",
	    			    "stylers": [ { "color": "#fdfcf8" } ] },
	    			  {  "featureType": "road.highway",
	    			    "elementType": "geometry",
	    			    "stylers": [  { "color": "#f8c967" } ] },
	    			  { "featureType": "road.highway",
	    			    "elementType": "geometry.stroke",
	    			    "stylers": [  { "color": "#e9bc62" } ] },
	    			  { "featureType": "road.highway.controlled_access",
	    			    "elementType": "geometry",
	    			    "stylers": [ { "color": "#e98d58" } ] },
	    			  { "featureType": "road.highway.controlled_access",
	    			    "elementType": "geometry.stroke",
	    			    "stylers": [ { "color": "#db8555" } ] },
	    			  {  "featureType": "road.local",
	    			    "elementType": "labels",
	    			    "stylers": [  { "visibility": "off" } ] },
	    			  {"featureType": "road.local",
	    			    "elementType": "labels.text.fill",
	    			    "stylers": [{"color": "#806b63"}]},
	    			  {"featureType": "transit.line",
	    			    "elementType": "geometry",
	    			    "stylers": [{"color": "#dfd2ae" }]},
	    			  {"featureType": "transit.line",
	    			    "elementType": "labels.text.fill",
	    			    "stylers": [ {"color": "#a0938b"}]},
	    			  { "featureType": "transit.line",
	    			    "elementType": "labels.text.stroke",
	    			    "stylers": [{"color": "#ebe3cd"}]},
	    			  { "featureType": "transit.station",
	    			    "elementType": "geometry",
	    			    "stylers": [
	    			      {"color": "#dfd2ae"}]},
	    			  { "featureType": "water",
	    			    "elementType": "geometry.fill",
	    			    "stylers": [{"color": "#daedec"}]},
	    			  {"featureType": "water","elementType": "labels.text.fill", "stylers": [{"color": "#83a39e"}] }
		    			]
		    });
		    /* marker = new google.maps.Marker({
		    	 position: paris, 
		    	 map: map,
		    	 title: 'marker Title!!'
	    	 }); */
		    
	    	 
	    	/* ��������! */
	    	var shape = {
		    			coords: [1, 1, 1, 12, 12, 12, 12, 1],
		    	        type: 'poly'
	    	        };
		 	var lineSymbol = {
		 			    path: google.maps.SymbolPath.FORWARD_OPEN_ARROW,
		 			    fillColor: '#696969',
		 			    fillOpacity: 1,
		 			    strokeWeight: 1,
		 			    scale: 1,
		 				rotation: 0,
		 				anchor: new google.maps.Point(0,0)
		 			}
	    	 
		    /* GoogleMap �� �Ѹ� �͵�  */
			function initMapItems(){
				console.log("initMapItems() ����");
				
				var bounds = new google.maps.LatLngBounds();
				
				var cityMarkerList = ${cityMarkerList};
				
				var myIconn = new google.maps.MarkerImage("/resources/images/icon/pin-red2.png", null, null, null, new google.maps.Size(25,25));
				
				for( var i in cityMarkerList ){
					console.log("cityMarkerList[i] = "+cityMarkerList[i])
					marker[i] = new google.maps.Marker({
							position: cityMarkerList[i].position,
							map: map,
							icon: myIconn,
							//shape: shape,
							title: cityMarkerList[i].title
					});
					
					if( i > 0 ){
						var path = [ marker[i-1].getPosition() , marker[i].getPosition() ];
						routelines[i-1] = new google.maps.Polyline({
							map: map,
							strokeColor: '#696969',
					        strokeOpacity: 1.0,
					        strokeWeight:1,
					        geodesic: false,
					        icons: [{
					            icon: lineSymbol,
					            offset: '95%'
					        }]
						});
						routelines[i-1].setPath(path);
					}
					
					bounds.extend(marker[i].getPosition());
				}
				map.fitBounds(bounds);
				
				if( cityMarkerList.length < 2 ){
					setTimeout(function(){
						map.setZoom(6);
					}, 30);
				}
				
			} //initMapItems ��
			
			initMapItems();
			
			//map.setCenter(cityMarkerList[0].position);
			//map.setZoom(5);
		    
			/* ���� ���� ��ư ����� */ 
			var leftControlDiv = document.createElement('div');
			var thtml = '<div class="text-center" style="margin-bottom:10px;margin-left:25px;font-weight:900; color:#024B5D; font-size:11pt;border:solid 1.3px #A6A6A6; border-radius:5px; padding:10px; background-color: white;" onClick="controlClick()"><div style="margin:5px 0;"><i class="fas fa-route" style="font-size: 30px;"></i></div><div>�����Ʈ ����</div></div>';
			leftControlDiv.innerHTML = thtml;
			map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(leftControlDiv);
			
			var rightControlDiv = document.createElement('div');
			var thtml2 = '<div class="text-center rounded-circle" style="margin:15px;font-weight:900; color:white; font-size:11pt;border:solid 1.3px #818181; padding:8px; background-color:#0080A0;"><div style="margin:5px;"><span style="font-size:27px;">'+ ${plan.planTotalDays} +'</span> ��</div></div>';
			rightControlDiv.innerHTML = thtml2;
			map.controls[google.maps.ControlPosition.RIGHT_TOP].push(rightControlDiv);
		    
		};
		/* ------------------------------------ Google Map Script ------------------------------------ */
		
		
		
		
		
		/* Plan Information ����Ϸ� ��ư  ���� �Լ� */
		var now = new Date();
		var planEndDate = "${plan.endDate.substring(0,10)}";
		var newPlanEndDate = new Date(planEndDate);
		
		console.log("now="+now+" / endDate="+newPlanEndDate);
		var planStatus = '${plan.planStatus}';
		
		if(now > newPlanEndDate && planStatus == 'R'){
			$('#planCompleteButton').show();
		}else{
			$('#planCompleteButton').hide();
		}
		
		
		/* ����ǥ ĭ ���콺���� �̺�Ʈ */
		$( ".dailys" ).hover(
		  function() {
		    $( this ).css("background", "#EEF7F7");
		  }, function() {
		    $( this ).css("background", "none");
		  }
		);
		
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
		
		/* Swiper�� ���� ��ũ��Ʈ */
		new Swiper ('.swiper-container', {
		    //direction: 'vertical',
		    //loop: true
		    slidesPerView:'auto',
		    slidesPerGroup: 5,
		    freeMode:true,
			navigation : {
				nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
				prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
			}
		  });
		
	</script>
	
	
	<!-- Google Map API -->
	<!-- ?key ���� ���۸� API Key �־��ֱ� -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap" type="text/javascript"></script>
	
	
</body>
</html>