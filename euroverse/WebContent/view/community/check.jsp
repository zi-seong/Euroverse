<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<title>Euroverse</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<style type="text/css">

		.bg {
		    position:relative;
		    z-index:1;
		    width:100%;
		    margin-left: 0;
		    margin-right: 0;
		}
	
		.bg:after{
			background-image: url('/resources/images/mainImg/santo_main2.jpg');
		    top:0;
		    left:0;
		    position:absolute;
		    background-size:100%;
		    opacity:0.5!important;
		    filter:alpha(opacity=50);
		    z-index:-1;
		    content:"";
		    width:100%;
		    height:100%;
		}
	</style>

	<script>
	
	$( document ).ready(function() {
	    console.log( "ready!" );
	    
	    if('${delete}'=='delete'){
		    swal({
				icon : 'error',
				title : "������ �Խñ��Դϴ�.",
				text:" ",
				button : false,
			})
	    	setTimeout(function() {     
	    		self.location = "/community/getPostList?boardName=C";
	    	}, 700);
	    }
	});
	
	$(function(){

		$("#authButton").on("click",function(){
			var phone1 = $("#phone1").val();
			var phone2 = $("#phone2").val();
			var phone3 = $("#phone3").val();
			var phone = phone1+"-"+phone2+"-"+phone3;
				
		 	if($.trim(phone).length <10){
				swal({
					   icon : 'warning',
					  title : "�޴�����ȣ�� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			} 
	
			$.ajax({
						url : "/user/json/checkPhone",
						method : "post",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							phone : phone
						}),
						beforeSend : function() {
							$("#errorMsg").text("���� �߼� ���Դϴ�.");
						},
						success : function(JSONData, Status) {
							console.log(Status);
							console.log(JSONData);
							if (JSONData.result == "done") {
								$("input[name='phoneCheck']").val(
										JSONData.phoneCheck);
								$("#errorMsg").text("�Է��Ͻ� ��ȣ�� ���� �߼��� �Ϸ�Ǿ����ϴ�.");
								$("#phoneCheckDiv").css("display","block")
								$("input[name='phoneValue']").attr("type",
										"text").attr("placeholder", "������ȣ �Է�").attr("id","phoneValue");

								$('#sendPhone').hide();
								$('#removeDiv').hide();
								$('#phoneConfirm').show();

							}
						}
					})
			})
		})
	
	
		$(function(){
			$("#userAuth").on("click",function(){
				$("#authModal").modal("show");
			})
		})
		
		function auth(){
		var phoneCheck = $("input[name='phoneCheck']").val();
		var phoneValue = $("input[name='phoneValue']").val();
		
		
			if(phoneCheck == phoneValue){
					$.ajax({
						url : "/user/json/updateRole",
						method : "get",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, Status) {
							swal({
								icon : 'success',
								title : "���� �Ϸ��߽��ϴ�.",
								text:" ",
								button : false,
							})
					    	setTimeout(function() {     
								$("#authModal").modal("hide");
				    			$(self.location).attr("href", "/community/getPostList?boardName=D");
					    	}, 700);
						}
					})	
			}else{
				swal({
					icon : 'error',
					title : "���� �����߽��ϴ�.",
					text:" ",
					button : false,
				})
			}
		}
	
		$(function(){
			$("#addUserButton").on("click", function() {
		        location.href = "/user/addUser";
		    });
		});
	</script>

</head>
<body>

	<!-- ToolBar ���� -->
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/toolbar/pushBar.jsp" />
	
	<div class="row">
            
        <div style="width:100%;">
        

	<!-- ToolBar �� -->

	<!-- ȭ�鱸�� div Start ///////////////////////////// -->
	<!-- <div class="container"> -->
	
	<c:if test="${empty user}">	
		<!-- <div class="h4" style="text-align:center;">�Խñ� ��ȸ�� �α��� �� �̿� �����մϴ�.</div> -->
		<div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center">
			<div class="bg" style="">
				<div style="opacity: 100%;padding: 140px 300px; float: left;text-align: left;">
				  <!-- <h1 class="display-4">���ι����� ���Ű� ȯ���մϴ�!</h1> -->
				  <p class="lead" style="font-weight: 500;">���ι����� �Խñ��� ��ȸ�Ͻ÷���<br/>ȸ������ �α��� �Ǿ��־�� �մϴ�.</p>
				  <hr class="my-4">
				  <p>������ �����Ű���? �α��� �� �Խ����� �̿��� �ּ���</p>
				  <!-- <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a> -->
					  <div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">�α���</button>
						<button type="button" class="btn btn-secondary" id="addUserButton">ȸ������</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${ !empty user && user.role == 'G'}">
		<c:if test="${post == null && addAcc == null}">
			<div class="h4" style="text-align:center;height: 220px;"></div>
		</c:if>
		<c:if test="${post == null && addAcc != null}">
		  <div style="height: 120px;"></div>
			<div class="h4" style="text-align:center;">����ã��� ���������� ��� �����մϴ�.</div>
			<div style="text-align: center;margin-top: 50px;">
			<button type="button" class="btn btn-outline-info" id="userAuth">�޴������� ���������ϱ�</button>
		  </div>
		</c:if>
		<c:if test="${post != null}">
		  <div style="height: 120px;"></div>
			<div class="h4" style="text-align:center;">����ã��� ���������� ��� �����մϴ�.</div>
			<div style="text-align: center;margin-top: 50px;">
			<button type="button" class="btn btn-outline-info" id="userAuth">�޴������� ���������ϱ�</button>
		  </div>
		</c:if>
	</c:if>	
	
	<c:if test="${ !empty user && user.role != 'G'}">
		<c:if test="${post == null}">
			<div class="h4" style="text-align:center;height: 220px;"></div>
		</c:if>
	</c:if>
		
	<!-- </div> -->
		
		<!-- Modal -->
		<div class="modal fade" id="authModal">
		  <div class="modal-dialog bounceln animated"  role="document">
		    <div class="modal-content" id="authContent" style="width: 600px; height: 330px; margin-top: 150px;">
		      <div class="modal-body" id="authBody" style="text-align: center; padding: 20px 60px;">
		       	  <p style="font-size: 30px; font-weight:bold; margin: 15px;">��������</p>
		       	  <p>�޴��� ��ȣ�� �Է��� �� ���������� �����ּ���</p>
		 		<div class="input-group-prepend  align-items-center" style="margin-top: 50px;">
		 		  <span class="input-group-text" style="height: 38px;"><i class="fas fa-phone"></i></span>&nbsp;
			      <input type="text" class="form-control" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"> &nbsp;-&nbsp; 
			      <input type="text" class="form-control" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> &nbsp;-&nbsp; 
			      <input type="text" class="form-control" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">&nbsp;
			      <input type="hidden" name="phone" id="phone"> 
			      <input type="button" value="������ȣ ����" id="authButton" class="btn btn-outline-primary">  
					<!-- <input type="hidden" id="updatePwd" onclick="javascript:auth()" class="btn btn-outline-primary"> -->
				  	<input type="hidden" name="phoneCheck" value="">
			    </div>
			    
			    <div style="height: 10px"></div>
			    
			    <div id="errorMsg"></div>
			    <div style="height: 10px"></div>
			    
				<input type="hidden" name="phoneValue" value="">
			    <button type="button" style="display: none" id="phoneConfirm" class="btn btn-outline-primary" onclick="javascript:auth()">����</button>
		      </div>
		    </div>
		  </div>
	    </div>
        </div>
    </div>
	<!-- ȭ�鱸�� div End ///////////////////////////// -->
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>

</body>
</html>