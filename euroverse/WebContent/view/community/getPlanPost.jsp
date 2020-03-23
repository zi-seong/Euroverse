<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>${post.postTitle}</title>
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'> 
	
	<!-- �÷��ʸ� ���� CDN..... -->
	<!-- Use Swiper from CDN -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

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
	
	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ : https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	
	<script async type="text/javascript" src="//cdn.carbonads.com/carbon.js?serve=CKYIE23M&placement=ianlunncouk" id="_carbonads_js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		.view_comment {
		    position: relative;
		}
		.comment_wrap.show, .gall_listwrap.album .comment_wrap.show, .comment_box .reply.show {
		    overflow: visible;
		    height: 100%;
		}
		.comment_wrap {
		    overflow: hidden;
		    width: 100%;
		    height: 38px;
		    font-family: '����',Gulim;
		    font-size: 13px;
		    color: #333;
		}
		.comment_count {
		    height: 38px;
		    line-height: 38px;
		    font-weight: bold;
		}
		.comment_count .num_box {
		    width: 50%;
		}
		.comment_box {
		    position: relative;
		    border-top: 1px solid silver;
		}
		ol, ul {
		    list-style: none;
		    padding: 0 0 0 10px;
		}
		.cmt_list li:first-child .cmt_info {
		    border-top: none;
		    margin-left: 65px;
    		padding-top: 20px;
		}
		.view_comment .cmt_info {
		    padding: 0;
		}
		.cmt_info {
		    position: relative;
		    padding: 9px 12px 7px;
		    border-top: 1px solid #eee;
		}
		.cmt_nickbox {
		    float: left;
		    margin-top: 3px;
		}
		.gall_writer {
		    position: relative;
		    font-size: 13px;
		    cursor: pointer;
		}
		.nickname.me {
		    padding: 3px 1px 1px 2px;
		}
		.comment_box .nickname {
		    font-size: 12px;
		    color: #777;
		    vertical-align: top;
		}
		.comment_box .nickname.in > em {
		    max-width: 110px;
		    padding-right: 1px;
		}
		.comment_box .nickname > em {
		    display: inline-block;
		    max-width: 84px;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		    vertical-align: top;
		}
		.writer_nikcon img {
		    vertical-align: middle;
		}
		.cmt_txtbox {
		    float: left;
		}
		.comment_wrap .comment_dccon {
		    float: left;
		}
		.usertxt, .comment_wrap .comment_dccon {
		    width: 820px;
		    cursor: pointer;
		}
		.comment_dccon {
		    position: relative;
		    margin: 3px 0 5px;
		}
		.coment_dccon_img {
		    float: left;
		    height: 100px;
		    cursor: pointer;
		}
		.fr {
		    float: right;
		}
		.date_time {
		    float: left;
		    font-size: 12px;
		    color: #999;
		    vertical-align: top;
		    margin-top: 3px;
		}
		.view_comment .bottom_paging_box {
		    height: 69px;
		}
		.comment_box .bottom_paging_box {
		    margin-top: 0;
		}
		.comment_wrap .bottom_paging_box {
		    border-top: 1px #eee solid;
		}
		.bottom_paging_box {
		    position: relative;
		    margin-top: 18px;
		    text-align: center;
		    line-height: 20px;
		}
		.cmt_paging {
		    padding: 23px 0 28px;
		}
		.bottom_paging_box a:first-child, .bottom_paging_box em:first-child {
		    margin-left: 0;
		}
		.bottom_paging_box em {
		    text-decoration: underline;
		    color: #d31900;
		}
		.bottom_paging_box a, .bottom_paging_box em, .bottom_paging_box span {
		    display: inline-block;
		    margin-left: 9px;
		    font-size: 14px;
		    font-weight: bold;
		}
		.view_comment .cmt_write_box {
		  
		}
		.cmt_write_box {
		    padding: 10px 10px 10px;
		    width: 910px;
		}
		.user_info_input:first-child {
		    margin-top: 0px;
		}
		.user_info_input {
		    width: 140px;
		    height: 30px;
		    margin-top: 5px;
		    border: 1px solid #cecdce;
		    background: #fff;
		}
		.user_info_input input, .cmt_write_box .user_info_input.id > label {
		    width: 126px;
		    height: 25px;
		    line-height: 29px;
		    padding: 1px 7px 0;
		    border: none;
		    font-family: '����',Gulim;
		    font-size: 12px;
		    vertical-align: top;
		}
		.user_info_input {
		    width: 140px;
		    height: 30px;
		    margin-top: 5px;
		    border: 1px solid #cecdce;
		    background: #fff;
		}
		.cmt_txt_cont {
		    float: right;
		    width: 890px;
		}
		.cmt_write {
		    position: relative;
		}
		.cmt_textarea_label {
		    position: absolute;
		    left: 13px;
		    top: 13px;
		    font-size: 12px;
		    color: #999;
		    line-height: 18px;
		}
		.cmt_txt_cont textarea {
			float: left;
			margin: 10px 0 10px 0;
		    width: 890px;
		    height: 78px;
		    padding: 13px;
		    border: 1px solid #cecdce;
		    background: #fff;
		    font-family: '����',Gulim;
		    font-size: 13px;
		    color: #333;
		    line-height: 18px;
		}
		.cmt_cont_bottm {
		    margin-top: 8px;
		}
		.view_wrap .view_comment .btn_blue, .view_comment .btn_blue.small {
		    width: 85px;
		    margin-left: 0;
		}
		.view_comment .btn_lightblue {
		    font-weight: normal;
		}
		.btn_blue {
		    background: #00A8C1;
		    border-color: #3c4790;
		    text-shadow: 0px -1px #343d8e;
		    color: #fff;
		}
		.btn_lightblue {
		    background: #00A8C1;
		    border-color: #525eaa;
		    text-shadow: 0px -1px #4b559c;
		    color: #fff;
		}
		.btn_lightgreen.small, .btn_yeongrey.small, .btn_lightpurple.small, .btn_blue.small, .btn_lightblue.small, .btn_grey.small, .btn_jeangrey.small, .btn_white.small, .btn_red.small, .btn_lightgrey.small, .btn_red.small, .btn_green.small {
		    height: 31px;
		    line-height: 30px;
		    margin-left: 3px;
		    border-width: 1px;
		    border-style: solid;
		    border-radius: 2px;
		    font-size: 12px;
		    font-weight: bold;
		}
		.clear:after {
		    clear: both;
		    display: block;
		    visibility: hidden;
		    content: "";
		}
		.cmt_info p {
		    line-height: 20px;
		}
		.usertxt {
		    float: left;
		    line-height: 20px;
		    cursor: pointer;
		    word-break: break-all;
		    overflow: hidden;
		}
		.usertxt, .comment_wrap .comment_dccon {
		    width: 700px;
		    cursor: pointer;
		}
		.cmt_like {
			float: left;
		} 
		.clear.cmt_txtbox.btn_reply_write_all {
			clear: both;
			width: 700px;
			margin-left: 70px;
		}
		.modal {
        text-align: center;
		}
		@media screen and (min-width: 768px) { 
		        .modal:before {
		                display: inline-block;
		                vertical-align: middle;
		                content: " ";
		                height: 100%;
		        }
		}
		.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
		}
		.card {
			width: 85px;
		    height: 85px; 
		    border-radius: 70%;
		    overflow: hidden;
		    margin-left: 10px;
		} 
	</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		var boardName = '${post.boardName}';
		
		//============= ȸ���������� Event  ó�� =============	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".fr .updatePost" ).on("click" , function() {
					self.location = "/community/updatePost?postId=${post.postId}&boardName="+boardName;
			 });
			
			 $("#boardTitle").on("click", function(){
				 self.location = "/community/getPostList?boardName=${param.boardName}";
			 });
		});
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".fr .deletePost" ).on("click" , function() {
	
				 swal({
						title:"�Խñ��� �����Ͻðڽ��ϱ�?",
						text:" ",
						icon:"warning",
						buttons: [ "�ƴϿ�", "��"]
					}).then((YES) => {
						if(YES){
							
							swal({
								icon : 'success',
								title : "�����Ǿ����ϴ�!",
								text:" ",
								button : false,
							})
					    	setTimeout(function() {     
					    		self.location = "/community/deletePost?postId=${post.postId}&boardName="+boardName;
					    	}, 700);
						}
				    });
			 });
		});
		
		//���ƿ� ����
		function like(){
			console.log($('#likeform').serialize());
			$.ajax({
				url: '/community/json/likeUpdate',
				type: "POST",
				cache: false,
				dataType: "json",
				data: $('#likeform').serialize(), //���̵� like_form�� ���� ��� ������ ������ �Ķ���� ���� ����(ǥ�� ��������)�� �������
				success: function(data){ //ajax��� ������ �Ѿ���� ������ ��° �̸� =data
					
					if(data.like != null){
						swal({
               				icon : 'success',
               			    title : "���ƿ� �Ϸ�!",
               			    text : " ",
               			    button : false,
               			    timer : 700
               			});
						
						$(".up_num_box span").html(data.like); //id���� like_result�� html�� ã�Ƽ� data.like������ �ٲ��ش�.
					}
				},
				error: function (request, status, error){
					swal({
           				icon : 'error',
           			    title : "�Խñ� ���ƿ�� �ѹ��� �����մϴ�.",
           			    text : " ",
           			    button : false,
           			    timer : 700
           			});
				}
			});
		}

		function reportshow(refId, repTar){ 
	    	$("#refId").attr('value',''+refId+'');
	    	$("#reportTarget").attr('value',''+repTar+'');
	    	$('#sendReport').on('shown.bs.modal'); 
	    };
	    
	    $(function(){
	    	$("#addReport").on("click", function(){

	    		if( !$("input:radio[name='reportReason']:checked").val() ){
            		swal({
           				icon : 'warning',
           			    title : '�Ű������ �ݵ�� �������ּ���.',
           			    text : " ",
           			    button : false,
           			    timer : 700
           			});
	    			return;
	    		}
	    		
	    		if( $("input:radio[id='customRadio4']").is(":checked") == true ){
            		
                	var reportContent = $("input[name='reportContent']").val();
                	
            		if(reportContent == null || reportContent.length<1){
            			swal({
               				icon : 'warning',
               			    title : '������ �ݵ�� �Է��ϼ���.',
               			    text : " ",
               			    button : false,
               			    timer : 700
               			});
            			return;
            		}
	    		}else if( $("input:radio[id='customRadio4']").is(":checked") == false ){
	    			
	    			if( $("input[name='reportContent']" ).val() != ""){
	    				swal({
               				icon : 'warning',
               			    title : '��Ÿ���ý� ���� �ۼ��� �����մϴ�.',
               			    text : " ",
               			    button : false,
               			    timer : 700
               			});
	    				return;
	    			}
	    		}
            	
                $.ajax({
                	url : '/community/json/addReport' ,
                	type : "POST" ,
                	data : $("#reportform").serialize() ,
                	dataType : "json" ,
                	success : function(JSONData , status){
                		closeModal('sendReport');
                		swal({
               				icon : 'success',
               			    title : JSONData.msg,
               			    text : " ",
               			    button : false,
               			    timer : 700
               			});
                	}
                });
	    	});
	    });
	    
		function closeModal(modalName) {
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();	
			}
			$("#"+modalName).modal("hide");
		}
		
		function addBookMark(postId){

			$.ajax({
				url : '/community/json/addBookMark/'+postId ,
				type : "GET" ,
				cache : false ,
				dataType : "json" ,
				success : function(data) {
			
					if(data.likeCheck == 'F'){
						
					  swal({
               		  	  icon : 'success',
               			  title : "�ϸ�ũ ���",
               			  text : " ",
               			  button : false,
               			  timer : 700
               		  });
					  
					  $(".fas.fa-bookmark").attr('class','far fa-bookmark fa-2x');
					}else{
						
					  swal({
	               		  icon : 'success',
	               		  title : "�ϸ�ũ ��Ͽ� �߰��Ǿ����ϴ�!",
	               		  text : " ",
	               		  button : false,
	               		  timer : 700
	               	  });
						
					  $(".far.fa-bookmark").attr('class','fas fa-bookmark fa-2x');
					}      
				},
				error: function(request, status, error){
					swal("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		function getPost(postId) {
			self.location = "/community/getPost?postId="+postId+"&boardName="+boardName;
		}

		function tagSearch(tagSort){
			fncGetUserList(1, tagSort);
		}
	
		function fncGetUserList(currentPage, tagSort) {
			$("#currentPage").val(currentPage)
			$("form[id='tagForm"+tagSort+"']").attr("method" , "POST").attr("action" , "/community/getAllPostList").submit();
		}
		
	</script>
	
	<style type="text/css">
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
			
		.budgetIcon{
		  	width:30px; 
		  	font-size: 20px;
		  }
		  
		  
		.swiper-container {
      	border: 1px gray;
      	//padding: 5px;
      	height: 500px;
      }
      .swiper-wrapper {
      }
      .swiper-slide {
      	height: 480px;
      	width: 40px;
      	background-color: white;
      	margin: 4px;
      	padding: 10px;
      	border-radius: 4px;
      	box-shadow:1px 3px 2px #ACC1CB;
      	border-color: #DDDDDD;
      	border-style: solid;
      	border-width: 1px;
      }
		  
	</style>
	
	<script type="text/javascript">
		
		var planId = ${plan.planId};	//���� ��ȸ���� plan�� ���̵� �ھƵα�
	
		/* ---------------------------------		Daily List ���� �Լ���		--------------------------------- */
		function getDailyList(planId){
			$.ajax({
				url: "/planSub/json/getDailyList/"+planId ,
				method: "GET",
				dataType: "json",
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
			}else if( daily.dailyCate =='E' ){ bcolor = 'purple'; }
			
			$(dailyIdString).text(daily.dailyDetail);		//$(dailyIdString).text(daily.dailyDetail).css("background-color", bcolor);
			var appendString = '<span style="padding-left:5px; border-right-width:10px; border-right-style: solid; border-color: '+bcolor+';"></span>'
			$(dailyIdString).append(appendString);
		} //setDaily
		
		//getDailyList(planId);	//������ �ε� �� ajax�� ���� ����Ʈ �����ͼ� ������� ����ǥ�� �ɾ��ֱ�
		setTimeout(function(){ 
			getDailyList(planId); 
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
			        swal("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		} //getBudgetOverviewList(planId) END
		
		//getBudgetOverviewList(planId);
		setTimeout(function(){ 
			getBudgetOverviewList(planId); 
		},50);
		/* ------------------------------------------------------------------------------------------------------ */
		
		
		
		$(function(){
		
			$('#downloadPlanButton').on('click', function(){
				//alert("downloadPlanButton Ŭ��!");
				
				checkPlanCount('${user.userId}');
			});
			
			$('#addPlan').on('click', function(){
				addPlan();
			});
			
			$( "#startDateString" ).datepicker({
			      showOptions: { direction: "up" },
				  //defaultDate : '1995-02-10',
			      changeYear : true ,
			      changeMonth : true ,
			      //buttonImage: "/resources/images/userImages/CalendarICON.png",
			      dateFormat : "yy-mm-dd",
			      showAnim : "bounce",
			      autoclose: true
			});
			
			/* ��� �ڿ� ����Ʈ��Ŀ�� �������� ����... ������� �ذ� */
			$('#startDateString').on('click', function(){
				 $('#ui-datepicker-div').appendTo($('#addPlanModal'));
				 $(this).datepicker();
				 $(this).datepicker("show");
			});


			//�����̲� ���پ� - ���Ͽ뷮 üũ
			$(".custom-file-input").on("change",function(){
				  var fileSize = this.files[0].size;
				    var maxSize = 360 * 360;
				    if(fileSize > maxSize) {
				        $(".custom-file-label").html("<i class='fas fa-camera-retro'> size 360x360</i>");
				        swal("���Ͽ뷮�� �ʰ��Ͽ����ϴ�.");
				        //$("#preview").html("");
				        return;
				    }else{
						//readImg(this);
				    }
			});
			
			//$(document).ready(function() {
			//	  bsCustomFileInput.init();
			//});
			
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
			
		});
		
		function checkPlanCount( userId ){
			console.log("checkPlanCount("+userId+") ����!");
			
			$.ajax({
				url: "/plan/json/checkPlanCount/"+userId,
				method: "GET",
				dataType: "text",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(data, status){
					var slot = '${user.slot}';
					var slotCanUse = (slot - data);
					
					if( slotCanUse <= 0){
						 swal({
								title:"���� ���� �����մϴ�. �÷��� ����Ʈ���� ������ �������ּ���.",
								text:"������ �����Ϸ� ���ðڽ��ϱ�?",
								icon:"warning",
								buttons: [ "�ƴϿ�", "��"]
							}).then((YES) => {
								if(YES){
							    	self.location = "/plan/getPlanList";
								}
						    });

					}else{
						$('#addPlanModal').modal();
					}
				},
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			});
		}
		
		function addPlan(){
			console.log("addPlan(=downloadPlan) ����");
			
			var submitAlert = $(".alert-danger");
			var alertMessage = $(".alert-danger strong");
			
			var userId = $("input[name='userId']").val();
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
			if ($.trim(startDateString)=="") {
				submitAlert.prop("style","display : block");
				alertMessage.html("���� �������� �������ּ���.");
				return;
			}
			
			$('form.addPlanModal').attr('method', 'POST').attr("action" , "/plan/downloadPlan").attr("enctype","multipart/form-data").submit();
		}
	
	</script>
	
	
	<!-- Ķ���� ���� -->
	<script type="text/javascript">
	
		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  var Calendar = FullCalendar.Calendar;
		  
		  var cityEventList = ${cityEventList};
		
		  var defaultDate = new Date();
		  if( cityEventList[0] != null ){
			  defaultDate = cityEventList[0].start;
		  }
		  
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
		    height: 420,	// Ķ���� ũ��... ���� ����!
		    editable: false,
		    droppable: false, // this allows things to be dropped onto the calendar
		    //locale: 'ko',
		    buttonIcons: true, // show the prev/next text
		    events:[
		    	/* { title: '������ ����', start: '2020-02-10' } */
		    	//eventString
		    ]
		  });
		  
		  for( var i in cityEventList ){
			  console.log("    "+JSON.stringify(cityEventList[i]) );
				calendar.addEvent( cityEventList[i] );
			}
		  
		  calendar.render();
		}); 
	
	</script>
	
	
	
	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/toolbar/pushBar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
   		<div class="row">
            <jsp:include page="/view/community/sidebar.jsp"/>
            
        <div style="width:60%;margin-left:5%;">
   	
   	<div class="modal" tabindex="-1" role="dialog" id="sendReport" >
	  <div class="modal-dialog" role="document" style="width:300px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">�Ű� �ۼ�</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModal('sendReport');">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	            <p>�Ű���� ����</p>
            <form id="reportform" class="sendReport">
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio1" name="reportReason" class="custom-control-input" value="F">
				  <label class="custom-control-label" for="customRadio1" style="font-size:13px; padding-bottom:6px;">�弳</label>
				</div>
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio2" name="reportReason" class="custom-control-input" value="A">
				  <label class="custom-control-label" for="customRadio2" style="font-size:13px; padding-bottom:6px;">������</label>
				</div>
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio3" name="reportReason" class="custom-control-input" value="R">
				  <label class="custom-control-label" for="customRadio3" style="font-size:13px; padding-bottom:6px;">�������</label>
				</div>
				<div class="custom-control custom-radio">
				  <input type="radio" id="customRadio4" name="reportReason" class="custom-control-input" value="E">
				  <label class="custom-control-label" for="customRadio4" style="font-size:13px;">��Ÿ</label>
				  <input type="text" class="form-control" id="reportContent" name="reportContent" placeholder="��Ÿ ������ �Է��ϼ���." style="font-size:13px;"/>
				</div>
				  <input type="hidden" id="refId" name="refId" value="">
	              <input type="hidden" id="reportTarget" name="reportTarget" value="">
			</form>	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal('sendReport');">Close</button>
	        <button type="button" class="btn btn-primary" id="addReport">send report</button>
	      </div>
	    </div>
	  </div>
	</div>
   
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" style="max-width: 930px;">
	
	<br>
	
	  <div class="page_head clear">
		<div class="h4" id="boardTitle" style="text-align: center;font-weight: bold;">
		  �÷��ʰ���
	    </div>
	  </div>
	
	  <hr>
	  
	     <div class="recom_bottom_box clear" style="width: 890px;"> 
          <c:if test="${post.postLikeFlag == 'F' || post.postLikeFlag == null}">
	   		<i onclick="addBookMark(${post.postId})" class="far fa-bookmark fa-2x" style="float: right;"></i>
	      </c:if>
	      <c:if test="${post.postLikeFlag == 'T' }">
	  		<i onclick="addBookMark(${post.postId})" class="fas fa-bookmark fa-2x" style="float: right;"></i>
	      </c:if>
         	<i class="far fa-angry" data-toggle="modal" data-target="#sendReport" onclick="reportshow('${post.postId}','P');" style="float: right; padding: 15px 30px 10px 10px; font-size: 11px;"> �Ű��ϱ�</i>
	     	  <h3 class="title ub-word" style="margin-bottom: 10px;">
		      	<span class="title_subject" style="font-weight:bold;">
		      	<c:if test="${post.postGrade == 'N'}">
		      	[����]
		      	</c:if>
		      	${post.postTitle}</span>
		      </h3>
	     </div>
	     
	      <div>
	      
		 	<div class="media" style="background-color: white; width: 100%; padding: 3px; border-radius: 5px; font-size:14px; ">
				<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-1" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border: 1px #D1D1D1 solid; width: 120px; height: 95px;">
			    <div class="media-body" style="margin-left: 13px; margin-top: 25px; height: 100px;">
			    	
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
				      <div style="margin: 2px 0;"><div style="font-weight: bolder; font-size: 19px; display: inline-block;">${plan.planTitle} </div> &emsp;</div>
				      
				      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
				      <%-- <c:if test="${plan.planDday == 0}"> D-Day </c:if>
				      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if> --%>
			    
			    </div> <!-- media body -->
			</div>
	 	</div>
	     
		
	<div class="view_content_wrap">
	 <div class="gallview_head clear ub-content">
	  <div class="gall_writer ub-writer">
	    <div class="fl">
	      <span class="nickname in" style="font-size: 14px; color: gray;">
	        ${post.nickName}
	      </span>
	      <span class="gall_date" style="font-size: 14px; color: gray;">
	        &emsp;${post.postDate}
	      </span>
	    <div class="post_history" style="float: right;">
	      <i class="far fa-eye" style="font-size: 13px;"> ${post.views}</i>
	      &nbsp;&nbsp;&nbsp;<i class="far fa-thumbs-up" style="font-size: 13px;"> ${post.postLikeCount}</i>
	      &nbsp;&nbsp;&nbsp;<i class="far fa-comments" style="font-size: 13px;"> ${post.comments}</i>
	    </div>
	    </div>
	  </div>
	 </div>
	 
	 <hr>
	 
	 
	 
	 
	 <!-- ////////////////////////////////			�÷��� ���� ����			/////////////////////////////// -->
	 
	 <!-- 
	 <div >
	 
	 	<div class="media" style="background-color: white; width: 100%; padding: 2px 15px; border-radius: 5px; font-size:14px; ">
			<img src="/resources/images/planImg/${plan.planImg}" class="align-self-center mr-1" alt="https://travel-echo.com/wp-content/uploads/2019/11/polynesia-3021072_640-400x250.jpg" style="border: 1px #D1D1D1 solid; width: 120px; height: 95px;">
		    <div class="media-body" style="margin-left: 13px; margin-top: 25px; height: 100px;">
		    	
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
			      <div style="margin: 2px 0;"><div style="font-weight: bolder; font-size: 19px; display: inline-block;">${plan.planTitle} </div> &emsp;</div>
			      
			      ${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate}</c:if> ( ${plan.planTotalDays}�� ) &nbsp;&nbsp;&nbsp;&nbsp; 
			      <%-- <c:if test="${plan.planDday == 0}"> D-Day </c:if>
			      <c:if test="${plan.planDday > 0}"> D - ${plan.planDday} </c:if> --%>
		    
		    </div> 
		</div>
		
	 </div>
	 -->
	 
	 
	 
	 <!--	 CityRoute List : �����Ʈ START	//////////////////////// 	-->
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center p-3 mb-2 list-container" style="height:485px;">
		
		<div id="map" style="border:1px solid #e5e5e5;margin-bottom:0px;float:left;width:50%;height: 98%;"></div>
	
	
		<div id='calendar-container' style="float:right;width:50%; height:100%; margin-left: 15px;margin-top:10px; max-width: 900px;">
		  <div id='calendar' style="margin-bottom:10px;"></div>
		  
		  <!-- <div class="text-center" style="border:solid thin #DDDDDD; border-radius:5px; padding: 5px 10px; background-color: white; height:160px;"  id="gotoBudgetOverviewList">
				<div class="d-flex justify-content-left mt-1 ml-3" style="font-weight: bolder; font-size: 16px;">���� ����</div>
				
				�����ΰ� ��ũ��Ʈ���� �������� �����ϱ�
				<div class="budgetOverview d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center" style="padding: 0px 3px 0px 0px;font-size: 14px;width:100%;">
					<div style="width:46%;margin: 3px;">
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-walking" 		></i>����  <div class="budget_amount" id="budget_D" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-bus" 			></i>����  <div class="budget_amount" id="budget_T" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-ticket-alt" 	></i>����  <div class="budget_amount" id="budget_V" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-ellipsis-h" 	></i>��Ÿ  <div class="budget_amount" id="budget_E" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
					</div>
					<div style="width:46%;margin: 3px;">
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-bed" 			></i>����  <div class="budget_amount" id="budget_R" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-utensils" 		></i>�Ļ�  <div class="budget_amount" id="budget_F" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						<div class="row" style="margin: 4px 0;"> <i class="budgetIcon fas fa-shopping-cart" ></i>����  <div class="budget_amount" id="budget_S" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						<div style="margin: 5px 0;text-align: right; color:#32D0BF; font-weight: bolder;"> ��  <div id="budget_total" style="font-size:23px; display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
					</div>
				</div>
			</div> -->
		</div>
		
	</div>
	<!--	 CityRoute List : �����Ʈ END	//////////////////////// 	-->
	 
	 
	 
	<!--	 Daily List : ����ǥ START	//////////////////////// 	-->
	<!-- <div style="font-weight: bolder;font-size: 20px;margin-bottom: 5px;">����ǥ</div> -->
	<%-- <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center p-2 mb-2 list-container">

		<c:if test="${plan.dayList.size() != 0}">
			<div class="swiper-container">
			    <div class="swiper-wrapper">
		    
		    		<c:forEach var="day" items="${plan.dayList}">
		    			<div class="swiper-slide">
		    			<div >
		    				<div class="dayInfo" style="padding-top:10px;padding-left:10px;text-align:left;padding-left:8px;font-size:14pt;color:#696969; font-weight: bold;">
								${day.dateString}  <br/>
								<span style="font-size:11pt;color:#32D0BF"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} ���� )</span>
							</div>
							
							<div style="margin-top: 10px;">
								<c:forEach var="i" begin="9" end="20">
									
									<div class="dailys" style="border-top:1px solid #efefef; height:30px;font-size:10pt;color:#9B9B9B;padding-left:10px; padding: 5px;">
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
			</div>
		</c:if>
				
	</div> --%>
	
	
	<div style="padding: 10px 30px;">
		<c:forEach var="day" items="${plan.dayList}">
			<div class="day_container" style="margin: 5px;border-bottom: 1px solid gray; padding: 5px;">
			
				<div class="dayInfo" style="padding-left:10px;text-align:left;font-size:14pt;color:#696969; font-weight: bold; margin-right: 10px;width: 30%;">
					${day.dateString}  <br/>
					<span style="font-size:11pt;color:#32D0BF"> ${day.cityNames} &nbsp;&nbsp; ( ${day.dayNo} ���� )</span>
				</div>
				
				<div class="daily_list" style="padding-top: 10px;padding-left: 140px;">
					<c:forEach var="daily" items="${plan.dailyList}">
						<c:if test="${daily.dayNo eq day.dayNo}">
							<div style="margin: 2px;">
								${daily.dayTime} �� : ${daily.dailyDetail}
							</div>
						</c:if>
					</c:forEach>
				</div>
				
			</div>
		</c:forEach>
		
	</div>
	
	
	<!--	 Daily List : ����ǥ END	//////////////////////// 	-->
	
	 
	 
	<!--	 Stuff List : �غ� üũ����Ʈ START	//////////////////////// 	-->
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center p-2 mb-2 list-container" style="height: 200px;">
				
				
				
				<div class="text-center" style="border:solid thin #DDDDDD; border-radius:5px; padding: 5px 10px; background-color: white; height:100%;width: 49%;margin-right: 5px;"  id="gotoBudgetOverviewList">
					<div class="d-flex justify-content-left mt-1 ml-3" style="font-weight: bolder; font-size: 16px;">���� ����</div>
										
					<div class="budgetOverview d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center" style="padding: 0px 3px 0px 0px;font-size: 14px;width:100%;">
						<div style="width:46%;margin: 3px;">
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-walking" 		></i>����  <div class="budget_amount" id="budget_D" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-bus" 			></i>����  <div class="budget_amount" id="budget_T" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-ticket-alt" 	></i>����  <div class="budget_amount" id="budget_V" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-ellipsis-h" 	></i>��Ÿ  <div class="budget_amount" id="budget_E" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
						</div>
						<div style="width:46%;margin: 3px;">
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-bed" 			></i>����  <div class="budget_amount" id="budget_R" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-utensils" 		></i>�Ļ�  <div class="budget_amount" id="budget_F" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
							<div class="row" style="margin: 7px 0;"> <i class="budgetIcon fas fa-shopping-cart" ></i>����  <div class="budget_amount" id="budget_S" style="display: inline-block; width: 55%; text-align: right;">0</div> ��</div>
							<div style="margin: 5px 0;text-align: right; color:#32D0BF; font-weight: bolder;"> ��  <div id="budget_total" style="font-size:23px; display: inline-block; width: 50%; text-align: right;">0</div> ��</div>
						</div>
					</div>
				</div>
				
				
				<div style="border:solid thin #DDDDDD ; border-radius:3px; padding:10px 15px; background-color: white; width: 49%;height:100%; ">
					<span id="stuff_icon"><i class="fas fa-tasks" style="font-size: 20px; margin-right: 6px; margin-bottom: 15px;"></i></span> <span style="margin-left:5px; font-size: 16px; font-weight:bolder;"> �غ� ����Ʈ</span>
		
					<br/>
					 
					<div class="stuffItems" style="overflow-y:auto; height: 80%;"> 
						<c:forEach var="stuff" items="${plan.stuffList}">
							<div class="stuffItem">
								<i class="fas fa-check"></i> <span style="margin-left: 10px;"> ${stuff.stuffName}</span>
							</div>
								
						</c:forEach>
					</div> 	
				</div>
				
	</div>
	<!--	 Stuff List : �غ� üũ����Ʈ END	//////////////////////// 	-->
		 
	 
	 <!-- ////////////////////////////////			�÷��� ���� ��			/////////////////////////////// -->
	 
	 
	 
	 <hr>
	 
	<div style="text-align:center;">
	   <button type="button" class="btn btn-outline-info" id="downloadPlanButton">�÷��� �����ޱ�</button>
	</div>

	  <div class="gallview_contents">
	    <div class="inner clear">
	      <div class="writing_view_box">
	        <pre></pre>
	        <div style="overflow:hidden;">
				${post.postContent}
	        </div>
	      </div>
	    </div>
	    
	    <div class="btn_recommend_box clear">
	    <form id="likeform">
	        <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
	      <div class="inner fl" style="text-align: center;">
	        <div class="up_num_box" style="margin: 50px 0 50px 0">
	          <span class="up_num font_red" style="color: tomato; font-size: 20px; margin-right: 10px">${post.postLikeCount} </span>
	          <i onclick="like()" class="fas fa-heart fa-2x" style="color: tomato;"></i>
	        </div>
	      </div>
	    </form>
	    </div>
	  </div>
	  
	  <div class="tag_content_box">
	     <div class="tagbox" style="font-size: 12px;">
	       <i class="fas fa-tags"> �±� </i>
	       <span>
	         <c:set var="i" value="0"/>
			 <c:forEach var="tag" items="${tag}" varStatus="last">
			 <c:set var="i" value="${ i+1 }"/>
	            <form id="tagForm${i}" style="display:inline-block;">
				   <input type="hidden" name="searchCondition" value="2"/>
				   <input type="hidden" name="searchKeyword" value="${tag.tagContent}"/>
		           <a style="color: gray;" type="button" onclick="tagSearch('${i}');">#${tag.tagContent}</a>
		        </form>
	         <c:if test="${!last.last}">
	           <i> </i>
	         </c:if>
	         </c:forEach>
	       </span>  
		   <c:if test="${user.userId == post.postWriterId}">
			 <div class="fr" style="float: right;">
			   <span class="updatePost">����</span>
			   <span class="deletePost">����</span>
			 </div>
		   </c:if>
	     </div>
	   </div>
	   
	   <hr>
	   
	   <ul class="list-group list-group-flush" style="font-size: 13px;">
	    <c:if test="${post.prevTitle == '�������� �����ϴ�'}">
		  <li class="list-group-item">������ <i class="fas fa-angle-double-right"> ${post.prevTitle}</i></li>
	    </c:if>
	    <c:if test="${post.prevTitle != '�������� �����ϴ�'}">
		  <li class="list-group-item">������ <i class="fas fa-angle-double-right" onclick="getPost('${post.prevId}')"> ${post.prevTitle}</i></li>
		</c:if>
		<c:if test="${post.nextTitle == '�������� �����ϴ�'}">
		  <li class="list-group-item">������ <i class="fas fa-angle-double-right"> ${post.nextTitle}</i></li>
	    </c:if>
	    <c:if test="${post.nextTitle != '�������� �����ϴ�'}">
		  <li class="list-group-item">������ <i class="fas fa-angle-double-right" onclick="getPost('${post.nextId}')"> ${post.nextTitle}</i></li>
		</c:if>
	   </ul>
	   
 	 </div>
 	 
   </div> 
 	
 	<!-- ��� jsp include -->
	<jsp:include page="/view/community/comment.jsp"/>
	
	
	
	<!-- /////////////////////	Modal : addPlan	///////////////////// -->
	<div class="modal fade" id="addPlanModal" >
	  <div class="modal-dialog">
	  <h4 style="color: #FFFFFF;">�÷��� �����</h4>
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title">�÷��ʸ� �����޾� ������ �غ��غ�����</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('addPlanModal')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      
	      <div class="modal-body">
	        
	        <form class="form-horizontal addPlanModal">
	        	<input type="hidden" id="planId" name="planId" value="${plan.planId}">
	        	<br/>
				<div class="form-group row">
				    <label for="planTitle" style="text-align: right;" class="col-sm-4 col-form-label ">�÷��� ����</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control" id="planTitle" name="planTitle" placeholder="�÷��� ����">
				    </div>
				</div>
				
				<div class="form-group row">
					<label for="planType" style="text-align: right;" class="col-sm-4 col-form-label ">���� Ÿ��</label>
				    <div class="col-sm-7">
					    <select class="form-control" id="planType" name="planType">
							<option value="A">����ȥ��</option>
							<option value="B">����ȥ��</option>
							<option value="C">���ڳ���</option>
							<option value="D">���ڳ���</option>
							<option value="E">��ü</option>
							<option value="F">�θ�԰�</option>
							<option value="G">Ŀ��</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
				    <label for="planImgFile" style="text-align: right;" class="col-sm-4 col-form-label ">�÷��� �̹���</label>
				    <div class="col-sm-7 custom-file">
				    	<div class="input-group mb-2">
				    		<input type="file" class="form-control custom-file-input" id="planImgFile" name="planImgFile" placeholder="�÷��� �̹���" accept="image/*">
				      		<label class="custom-file-label" for="customFile"><i class="fas fa-camera-retro"> size 360x360</i></label>  
				    		<div class="input-group-append">
						      	<div class="input-group-text"><i class="fas fa-camera-retro"></i></div>
						    </div>
				    	</div>
				    </div>
				</div>
				
				<div class="form-group row">
				    <label for="startDateString" style="text-align: right;" class="col-sm-4 col-form-label ">���� ������</label>
				    
				    <div class="col-sm-7">
					    <div class="input-group mb-2">
					      <input type="text" class="form-control" id="startDateString" name="startDateString" placeholder="���� ������" readonly="readonly">
					      <div class="input-group-append">
					      	<div class="input-group-text"><span data-feather="calendar"></span></div>
					      </div>
					    </div>
				    </div>
				</div>
				
				<div class="alert alert-danger alert-dismissable" style="display: none;" >
				    <button type="button" class="close" >��</button>
				    <strong></strong><br/>���� �� �ٽ� �õ����ּ���.
				</div>
				
	        </form>
	        
	      </div>
	      
	      <div class="modal-footer">
	        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('addPlanModal')">Close</button> -->
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('addPlanModal')">Close</button>
	        <button type="button" class="btn btn-primary" id="addPlan">Add Plan</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : addPlan	///////////////////// -->
	
	<!-- Footer Start /////////////////////////// -->
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>
	<!-- Footer End	/////////////////////////// -->
	
	<script type="text/javascript">
	
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
		        disableDefaultUI: true,
		    	scrollwheel: false,
		    	disableDoubleClickZoom: false,
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
		    
	    	/* ��������! */
	    	//var shape = { coords: [1, 1, 1, 12, 12, 12, 12, 1], type: 'poly'  };
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
					
					/* marker[i].addListener('click', function() {
						alert(" ��Ŀ Ŭ�� => cityName="+cityMarkerList[i].title);
					}); */
				}
				map.fitBounds(bounds);
				
			} //initMapItems ��
			
			initMapItems();
		};
		/* ------------------------------------ Google Map Script ------------------------------------ */
		

	
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
		
		/* Swiper�� ���� ��ũ��Ʈ */
		new Swiper ('.swiper-container', {
		    //direction: 'vertical',
		    //loop: true
			navigation : {
				nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
				prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
			}
		  });
	
	</script>
	
	<!-- Google Map API -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMoE1_1g-id6crD_2M4nCDF4IsmcncLU4&callback=initMap" type="text/javascript"></script>

</body>

</html>