<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Euroverse</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jquery Ui ��ũ (datePicker)  -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!--datePicker CDN  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- boot strap File upload CDN  -->
<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>

<!-- swiper CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<!--========================= -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	
<style>
	div.carousel-inner {
		width: 540px;
		height: 320px;
		margin-left: -40px;
	}
	
	.carousel-inner {
		
	}
	
	.carousel-inner>.carousel-item {
		width: 100%;
		height: 450px;
	}
	
	.addH6 {
		color: red;
		margin: 10px;
	}
	
	.custom-file-input ~ .custom-file-label::after {
		content: "�����ʻ��� ���";
	}
	
	.form-group {
		content: '';
		dispaly: table;
		clear: both;
	}
	
	#preview img {
		border: 100px;
		border-color: #E6E6E6;
	}
	
	.col {
		font-size: 12px;
	}
	
	.ui-datepicker-trigger{
		margin-left:3px;
		padding:6px;
		width: 40px;
	}
</style>


<script>
	$( function() {
	    $( "#datepicker" ).datepicker({
	      showOptions: { direction: "up" },
		  defaultDate : '1996-05-31',
	      changeYear : true ,
	      changeMonth : true ,
	      showOn: "button",
	      buttonImage: "/resources/images/userImages/CalendarICON.png",
	      buttonImageOnly: true,
	      buttonText: "Select date",
	      dateFormat : "yy-mm-dd",
	      showAnim : "bounce"
	    });
	});
	
	
	$(document).ready(function () {
		  bsCustomFileInput.init()
	})
		
	
	
	$(function(){
		
		
		
		
		
		$(".nav-link:contains('ȸ������')").addClass("disabled");
			
			var userId = $("#userId");
			var pwd = $("#pwd");
			var pwdConfirm = $("#pwdConfirm");
			var userName = $("#userName");
			var nickname = $("#nickname");
			
			if($("#choiceEmail option:selected").val()!='self'){
				$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
			}else if($("#choiceEmail").val()=='self'){
				$("input[name='email']").val($("#emailId").val()+"@"+$("#selfEmail").val());
			}
	
			
			var email =  $("#email");
			var emailId = $("#emailId");
			var birth = $("input[name='birth']");
			var sex = $("input[name='sex']");
			$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
			var phone = $("input[name='phone']");
			var phone1 = $("#phone1");
			var phone2 = $("#phone2");
			var phone3 = $("#phone3");
			var image = $("input[name='image']");
			var h6 = document.getElementsByClassName('addH6');
			
			
	
		$(document).on('keyup', '#userId', function(event) {
			for(var i=0;i<userId.val().length;i++){
				if(userId.val()[i] == " "){
					userId.val(userId.val().replace(" ", ""));
				}
				userId.val(userId.val().replace(/[^\\!-z]/gi,""));
				userId.val(userId.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
			}
			if(userId.val().length <4 || userId.val().length > 12 ){
				h6[0].innerHTML ="���̵�� 4~12�� �Դϴ�.";
			}else{
				if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,12}$/.test(userId.val()) == false){
					h6[0].innerHTML = "���̵�� �ּ� �ϳ��� �ҹ���,�빮�� �� ���ڰ� ���ԵǾ�� �մϴ�."
				}else{
					h6[0].innerHTML = "";
				}
			}
			
			if(userId.val().length >=4 && userId.val().length <= 12 ){
				$.ajax({
					url : "/user/json/checkDuplicate",
					method : "post",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						userId : userId.val()
					}),
					success : function(JSONData){
						if(JSONData.result == 'ok'){
							//h6[0].innerHTML ="";
						}else{
							h6[0].innerHTML ="�ߺ��� ���̵��Դϴ�.";
						}
					}//success
				})//ajax
			}
			h6[2].innerHTML ="";
		});
		
		
		$(document).on('keyup','#pwd',function(){
			
			for(var i=0;i<pwd.val().length;i++){
				if(pwd.val()[i] == " "){
					pwd.val(pwd.val().replace(" ", ""));
					return;
				}
			}
			
			if(pwd.val().length <6  || pwd.val().length >20 ){
				h6[1].innerHTML = "��й�ȣ�� 6~20�� �Դϴ�.";
			}else{
				if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.val()) == false){
					h6[1].innerHTML = "��й�ȣ�� �ּ� �ϳ��� �ҹ���,�빮�� �� ���ڰ� ���ԵǾ�� �մϴ�."
				}else{
					h6[1].innerHTML = "";
				}
			}
			if(pwd.val() != pwdConfirm.val()){
				h6[2].innerHTML = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			}else{
				h6[2].innerHTML = "";
			}
			h6[2].innerHTML ="";
		});
		
		$(document).on('keyup','#pwdConfirm',function(){
			for(var i=0;i<pwdConfirm.val().length;i++){
				if(pwdConfirm.val()[i] == " "){
					pwdConfirm.val(pwdConfirm.val().replace(" ", ""));
					return;
				}
			}
			if(pwd.val() != pwdConfirm.val()){
				h6[2].innerHTML = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			}else{
				h6[2].innerHTML = "";
			}
		});
		
		
		$(document).on('keyup','#userName' , function(){
			for(var i=0;i<userName.val().length;i++){
				if(userName.val()[i] == " "){
					userName.val(userName.val().replace(" ", ""));
				}
				userName.val(userName.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
			}
			if(userName.val().length > 5){
				h6[3].innerHTML = "�ܱ�����ΰ���? �̸��� ���� ����..."
			}else{
				h6[3].innerHTML = "";
			}
		});
		
		$(document).on('keyup','#nickname',function(){
			for(var i=0;i<nickname.val().length;i++){
				if(nickname.val()[i] == " "){
					nickname.val(nickname.val().replace(" ", ""));
				}
			}
			if(nickname.val().length <2 || nickname.val().length > 10){
				h6[4].innerHTML = "�г����� 2~10�� �Դϴ�.";
			}else{
				h6[4].innerHTML = "";
			}
			
			if(nickname.val().length >=2 || nickname.val().length <= 10){
				$.ajax({
					url : "/user/json/checkDuplicate",
					method : "post",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						nickname : nickname.val()
					}),
					success : function(JSONData){
						if(JSONData.result == 'ok'){
							//h6[4].innerHTML ="";
						}else{
							h6[4].innerHTML ="�ߺ��� �г����Դϴ�.";
						}
					}//success
				})//ajax
			}
		})
		
		$(document).on('keyup' , '#emailId' , function(){
			for(var i=0;i<emailId.val().length;i++){
				if(emailId.val()[i] == " "){
					emailId.val(emailId.val().replace(" ", ""));
				}
				emailId.val(emailId.val().replace(/[^\\!-z]/gi,""));
				emailId.val(emailId.val().replace(/[~!@\]\[\#$%;,.\/^&*\()\-=+_'\\\"]/gi,""));
			}
		})
		
/* 		$(document).on('keyup','#phone1',function(){
			if(phone1.val().length > 3){
				h6[8].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
			}else{
				h6[8].innerHTML="";
			}
			for(var i=0;i<phone1.val().length;i++){
				if(phone1.val()[i] == " "){
					phone1.val(phone1.val().replace(" ", ""));
					return;
				}
			}
			
		})
		
		$(document).on('keyup','#phone2',function(){
			if(phone2.val().length > 4){
				h6[8].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
			}else{
				h6[8].innerHTML="";
			}
			for(var i=0;i<phone2.val().length;i++){
				if(phone2.val()[i] == " "){
					phone2.val(phone2.val().replace(" ", ""));
					return;
				}
			}
		})
		
		$(document).on('keyup','#phone3',function(){
			if(phone3.val().length > 4){
				h6[8].innerHTML="�ڵ��� ��ȣ�� Ȯ�����ּ���.";
			}else{
				h6[8].innerHTML="";
			}
			for(var i=0;i<phone3.val().length;i++){
				if(phone3.val()[i] == " "){
					phone3.val(phone3.val().replace(" ", ""));
					return;
				}
			}
		}) */
		
		
		
		
	})
		
			
	$(function(){
		$(".addUser").on("click",function(){
			var userId = $("#userId");
			var pwd = $("#pwd");
			var pwdConfirm = $("#pwdConfirm");
			var userName = $("#userName");
			var nickname = $("#nickname");
			
			if($("#choiceEmail").val()!='self'){
				$("input[name='email']").val($("#emailId").val()+"@"+$("#choiceEmail").val());
			}else if($("#choiceEmail").val()=='self'){
				$("input[name='email']").val($("#emailId").val()+"@"+$("#selfEmail").val());
			}
			var email =  $("#email");
			var birth = $("input[name='birth']");
			var sex = $("input[name='sex']");
			$("input[name='phone']").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
			
			var phone = $("#phone");
			
			
			var image = $("input[name='image']");
			var dreamCountry = $("input[name='dreamCountry']");
			var tripStyle = $("input[name='tripStyle']");
			
			var submitAlert = $(".alert-danger");
			var alertMessage = $(".alert-danger strong");
			
			var h6 = document.getElementsByClassName('addH6');
	
			
			for(var i=0 ; i<h6.length ; i++){
				if(h6[i].innerHTML != ""){
					swal({
						   icon : 'info',
						  title : h6[i].innerHTML,
						  text:" ",
						  button : false,
						})
					
					return;
				}
			}
			
			
			if($.trim(userId.val())==""){
				swal({
					   icon : 'info',
					  title :"���̵� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			}else if($.trim(userId.val()) != userId.val()){
				swal({
					   icon : 'info',
					  title : "���̵� ����� ����� �� �����ϴ�.",
					  text:" ",
					  button : false,
					})
				return;
			}
			
			if($.trim(pwd.val())==""){
				swal({
					   icon : 'info',
					  title : "��й�ȣ�� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			}else if($.trim(pwd.val()) != pwd.val()){
				swal({
					   icon : 'info',
					  title : "��й�ȣ�� ����� ����� �� �����ϴ�",
					  text:" ",
					  button : false,
					})
				return;
			}
			
			if($.trim(pwdConfirm.val()) ==""){
				swal({
					   icon : 'info',
					  title : "��й�ȣ�� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			}
			
			if($.trim(userName.val())==""){
				swal({
					   icon : 'info',
					  title : "�̸��� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			}else if($.trim(userName.val()) != userName.val()){
				swal({
					   icon : 'info',
					  title : "�̸��� ����� ����� �� �����ϴ�",
					  text:" ",
					  button : false,
					})
				return;
			}
			
			if($.trim(nickname.val()) ==""){
				swal({
					   icon : 'info',
					  title : "�г����� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			}else if($.trim(nickname.val()) != nickname.val()){
				swal({
					   icon : 'info',
					  title : "�г��ӿ� ����� ����� �� �����ϴ�.",
					  text:" ",
					  button : false,
					})
				return;
			}
			
			if($.trim(email.val())=="@"+null){
				swal({
					   icon : 'info',
					  title : "�̸����� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			}else if ($.trim(email.val()) != "" && (email.val().indexOf('@') < 1 || email.val().indexOf('.') == -1)) {
				swal({
					   icon : 'info',
					  title : "�̸��� ������ �ƴմϴ�.",
					  text:" ",
					  button : false,
					})
				return;
			}else if($.trim(email.val()) != email.val()){
				swal({
					   icon : 'info',
					  title : "�̸��Ͽ� ����� ����� �� �����ϴ�.",
					  text:" ",
					  button : false,
					})
				return;
			} 
			
 		 	/* if($.trim(phone.val()).length <10){
				swal({
					   icon : 'info',
					  title : "�޴��� ��ȣ�� Ȯ�����ּ���.",
					  text:" ",
					  button : false,
					})
				return;
			} 
			 */
			  
			for(var i=1;i<=$("input:checkbox[class=dreamCountry]").length;i++){
				 if($("input:checkbox[id=dreamCountry"+i+"]").is(":checked") == true) {
					  var value = $("input:checkbox[id=dreamCountry"+i+"]").val();
					  var countryImg = $("#countryImg"+i).val();
					  
					  $("#checkDreamCountry").append("<input type='hidden' name='dreamCountry' value='"+value+"'>");
					  $("#checkDreamCountry").append("<input type='hidden' name='countryImg' value='"+countryImg+"'>'")
				} 
			}/* for End */	 
			
			for(var i=1;i<=$("input:checkbox[class=tripStyle]").length;i++){
				if($("input:checkbox[id=tripStyle"+i+"]").is(":checked")==true){
					var value = $("input:checkbox[id=tripStyle"+i+"]").val();
					var styleImg = $("#styleImg"+i).val();
					
					 $("#checkTripStyle").append("<input type='hidden' name='tripStyle' value='"+value+"'>");
					 $("#checkTripStyle").append("<input type='hidden' name='styleImg' value='"+styleImg+"'>");
				}
			}/* for End(tripStyle) */
			
			sweetMan();
		});/* btn-primary End */
	});/* function End */
	
	
	
	
	
	
	$(function(){
		
		$(".alert-danger button").on("click",function(){
			$(".alert-danger").prop("style","display:none");			
		})
		
		$("#letsGoMain").on("click",function(){
			$(location).attr("href","/main.jsp");		
		})
		
		
		$("input[class='dreamCountry']").on("click",function(){
			if($("input:checkbox[class=dreamCountry]:checked").length > 5){
				swal({
					   icon : 'warning',
					  title : "������� ����� 5�������� ���� �����մϴ�.",
					  text:" ",
					  button : false,
					})
				$("input:checkbox[id=dreamCountry"+$(this).prev().val()+"]").prop("checked",false);
			}
		})
		
		$("input[class='tripStyle']").on("click",function(){
			if($("input:checkbox[class=tripStyle]:checked").length > 3){
				swal({
					   icon : 'warning',
					  title : "���ེŸ���� 3�������� ���� �����մϴ�.",
					  text:" ",
					  button : false,
					})
				$("input:checkbox[id=tripStyle"+$(this).prev().val()+"]").prop("checked",false);
			}
		})
		
	 
		$(".custom-file-input").on("change",function(){
			  var fileSize = this.files[0].size;
			    var maxSize = 1200 * 1200;
			    if(fileSize > maxSize) {
			        alert("���Ͽ뷮�� �ʰ��Ͽ����ϴ�.");
			        $(".custom-file label").html("<i class='fas fa-camera-retro'>size 360x360</i>");
			        $("#preview").html("");
			        return;
			    }else{
					readImg(this);
			    }
		});
		
		$("#choiceEmail").change(function(){
			
			if($(this).val() == 'self'){
				$("#selfEmail").css("display","block");
			}else{
				$("#selfEmail").css("display","none");
			}
			
			
		})
		
		
	})
	
	function readImg(input){
		if(input.files && input.files[0]){
				var render = new FileReader();
				render.onload = function(e){
				var image = $('#preview').attr('src',e.target.result).attr('width','300px').attr('height','300px').css('overflow' , 'hidden');
				console.log(e.target.result);
				$("#preview").html("<img src="+e.target.result+" style='border-color: #E6E6E6; border: 10px; overflow : hidden'>");
			}
			 render.readAsDataURL(input.files[0]);
		}
	}
	
	
	
	function sweetMan(){
		swal({
			   icon : 'info',
			  buttons: {confirm:{value:"T",text:"��",className:"btn btn-outline-primary",},cancle:{value:"F",text:"�ƴϿ�",className:"btn btn-outline-secondary",},},
			  text : "���������� ���� �˸� ���񽺸� �����ϰ��ֽ��ϴ�. �˸� ���񽺸� �̿��Ͻðڽ��ϱ�?" 
			}).then((value) =>{
				if(value=='T'){
					$("#pushAgreeTrue").prop("checked",true);
					$("#pushAgreeFalse").prop("checked",false);
					
					
					swal({
						   icon : 'success',
						  title : "ȸ������ ����",
						  text:" ",
						  button : false,
						})
			    	setTimeout(function() {     
						$("#addUserForm").attr("action","addUser").attr("method","post").attr("enctype","multipart/form-data").submit();
			    	}, 700);
					
					
				}
				else if(value=='F'){
					$("#pushAgreeTrue").prop("checked",false);
					$("#pushAgreeFalse").prop("checked",true);
					swal({
						   icon : 'success',
						  title : "ȸ������ ����",
						  text:" ",
						  button : false,
						})
			    	setTimeout(function() {     
						$("#addUserForm").attr("action","addUser").attr("method","post").attr("enctype","multipart/form-data").submit();
			    	}, 700);
				}
			});
	}	
</script>

</head>
<body>
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	<input type="hidden" id="hehe" value="123123">
	<!-- <p style="font-size:30px; margin-left:500px; margin-top: 50px; margin-bottom: -20px" >
		ȸ������
		<br><hr style="width: 600px;margin-bottom: -5px;">
		<small style="margin-left:500px; ">������ �Է����ּ���.</small>
	</p> -->
	
	<div class="container" style="max-width: 1000px;">
	
		<div class="mx-auto" style="width: 50%;margin: 30px 30px;">
			<c:if test="${empty snsLogin}">
				<div style="border-bottom: 1px solid #A6C0C1;padding-bottom: 5px;margin-bottom: 0px;font-size: 30px;font-weight: bolder;">ȸ������</div>
				<div>������ �Է����ּ���.</div>
			</c:if>
			<c:if test="${!empty snsLogin}">
				<div style="border-bottom: 1px solid #A6C0C1;padding-bottom: 5px;margin-bottom: 0px;font-size: 30px;font-weight: bolder;">SNS����ȸ������</div>
			</c:if>
			
		</div>
	
		<form id="addUserForm">
			<div class="form-group">
				<div class="col-6 mx-auto">
					<b>���̵�<i class="fas fa-asterisk" style="font-size: 10px;"></i></b>
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span> &nbsp;
						<c:if test="${empty snsLogin }">
							<input type="text" class="form-control" placeholder="userId" id="userId" name="userId" style="ime-mode:inactive;">
						</c:if>
						<c:if test="${!empty snsLogin }">
							<input type="text" class="form-control" placeholder="userId" id="userId" name="userId" value="${snsLogin.userId}" style="ime-mode:inactive;" readonly="readonly">
						</c:if>
					
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
		
			<div class="form-group">
				<div class="col-6 mx-auto">
					<b>��й�ȣ<i class="fas fa-asterisk" style="font-size: 10px;"></i></b>
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-lock"></i></span> &nbsp;
						<input type="password" class="form-control" placeholder="password" id="pwd" name="pwd">
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-6 mx-auto">
					<b>��й�ȣ Ȯ��<i class="fas fa-asterisk" style="font-size: 10px;"></i></b>
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-lock"></i></span> &nbsp;
						<input type="password" class="form-control" placeholder="password Confirm" id="pwdConfirm">
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
		
	
		
			<div class="form-group">
				<div class="col-6 mx-auto">
					<b>�̸�<i class="fas fa-asterisk" style="font-size: 10px;"></i></b>
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span> &nbsp;
						<c:if test="${empty snsLogin}">
							<input type="text" class="form-control" placeholder="Only Korean" name="userName" id="userName" onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;">
						</c:if>
						<c:if test="${!empty snsLogin}">
							<input type="text" class="form-control" placeholder="Only Korean" name="userName" id="userName" value="${snsLogin.userName}" onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;">
						</c:if>
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-6 mx-auto">
				<b>�г���<i class="fas fa-asterisk" style="font-size: 10px;"></i></b>
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span> &nbsp;
						<c:if test="${empty snsLogin}">
							<input type="text" class="form-control" placeholder="Nickname" name="nickname" id="nickname">
						</c:if>
						<c:if test="${!empty snsLogin}">
							<input type="text" class="form-control" value="${snsLogin.nickname}" name="nickname" id="nickname">
						</c:if>
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
		
			<div class="form-group">
				<div class="col-6 mx-auto">
				<b>�������</b>
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 40px;"><i class="fas fa-baby"></i></span> &nbsp;
						<span class="input-group-append"><input type="text" class="form-control" placeholder="birth" name="birth" readonly="readonly" id="datepicker"></span>
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
		
			<div class="form-group">
				<div class="col-6 mx-auto">
					<b>�̸���<i class="fas fa-asterisk" style="font-size: 10px;"></i></b>
					<div class="input-group-prepend ">
						<span class="input-group-text" style="width: 40px;"><i class="fas fa-globe"></i></span> &nbsp;
							<c:if test="${empty snsLogin}">
							<input type="text" class="form-control" placeholder="email" id="emailId">
							</c:if>
							
							<c:if test="${!empty snsLogin}">
							<input type="text" class="form-control" placeholder="email" id="emailId" value="${snsLogin.emailId}">
							</c:if>
							
							<span class="input-group-append pt-2">&nbsp;&nbsp;<i class="fas fa-at"></i>&nbsp;&nbsp;</span>
							
							<input type="text" style="width: 150px;display: none; " id="selfEmail">
							<select class="custom-select" id="choiceEmail">
								<option value="" disabled selected hidden>please choice....</option>
							    <option value="gmail.com">gmail.com</option>
							    <option value="naver.com">naver.com</option>
							    <option value="daum.net">daum.net</option>
							    <option value="self">�����Է�</option>
							    
						 	</select>
						 	
						 	
					 	<input type="hidden" name="email" id="email">
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
		
		
		
			<div class="form-group">
				<div class="col-6 mx-auto">
				<b>����</b>
					<div class="input-group-prepend">
						<span class="input-group-text" style="height: 38px;width:40px;"><i class="fas fa-venus-mars"></i></span>&nbsp;&nbsp;
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="sex" id="male" value="M">
							<label class="form-check-label" for="inlineRadio1">Male <i class="fas fa-male"></i></label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="sex" id="female" value="F">
						  <label class="form-check-label" for="inlineRadio2">Female <i class="fas fa-female"></i></label>
						</div>
					</div>
					<h6 class="addH6"></h6>
				</div>
			</div>
		
	
	
			 <div class="form-group">
			 	<div class="col-6 mx-auto">
			 		<b>�޴��� ��ȣ</b>
			 		<div class="input-group-prepend align-items-center">
				 		<span class="input-group-text" style="height: 38px;width: 40px;"><i class="fas fa-phone"></i></span> &nbsp;
					    <input type="text" class="form-control" id="phone1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="3"> &nbsp;-&nbsp; 
					    <input type="text" class="form-control" id="phone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4"> &nbsp;-&nbsp; 
					    <input type="text" class="form-control" id="phone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4">
					    <input type="hidden" name="phone" id="phone"> 
				    </div>
				    <h6 class="addH6"></h6>
				</div>
		 	 </div>

			 <div class="form-group">
				<div class="col-6 mx-auto">
					<b>������ �̹���</b>
					<c:if test="${empty snsLogin}">
						<div class="custom-file">
						  <input type="file" class="custom-file-input" id="image" name="image" accept="image/*" >
						  <label class="custom-file-label" for="customFile" ><i class="fas fa-camera-retro"> Insert Image</i> </label>  
						</div>
						<h6 class="addH6"></h6>
					</c:if>
					<div id="preview" style="text-align: center;">
						<c:if test="${!empty snsLogin}">
							<img alt="" src="${snsLogin.userImg}">
							<input type="hidden" name="userImg" value="${snsLogin.userImg}">
						</c:if>
					</div>
				</div>
			 </div>
		
	
	
			<div class="form-group" style="margin-top:50px; margin-bottom: 0px;padding-bottom: 0px;">
				 <div class="col-6 mx-auto ">	
			      <div id="country-carousel" class="carousel slide" data-ride="carousel">
			      
					<span data-feather="flag"></span> &nbsp;<b>������� ����</b><small> ( �ִ� 5�� ) </small>
			            <!-- �����̵� �� -->
			            <div class="carousel-inner">
			                <!--ù��° �����̵�-->
			                <div class="carousel-item active" style="">
			                    <!--<img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide">-->
			                    <!-- <div class="carousel-caption d-none d-md-block" style=""> -->
			                    <div class="row">
			
									<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="0" end="9">
											<div class="col" style="margin-top: 30px; text-align: center;">
									    		<img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;margin-bottom: 10px;">
					 							<input type="hidden" value="${status.index}">
									   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
									   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
									   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
											</div>
									</c:forEach> 
			                    </div>
			                </div>
			                <!--�ι�° �����̵�-->
			                <div class="carousel-item" style="">
			                     <div class="row">
									<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="10" end="19">
											<div class="col" style="margin-top: 30px; text-align: center;">
									    		<img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;margin-bottom: 10px;">
					 							<input type="hidden" value="${status.index}">
									   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
									   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
									   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
											</div>
									</c:forEach>                     
			                    </div>
			                </div>
			                
			                <div class="carousel-item" style="">
			                     <div class="row">
									<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="20" end="29">
											<div class="col" style="margin-top: 30px; text-align: center;">
									    		<img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;margin-bottom: 10px;">
					 							<input type="hidden" value="${status.index}">
									   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
									   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
									   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
											</div>
									</c:forEach>                     
			                    </div>
			                </div>
			                
			                
			                <div class="carousel-item" style="">
			                     <div class="row">
									<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="30" end="39">
											<div class="col" style="margin-top: 30px; text-align: center;">
									    		<img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;margin-bottom: 10px;">
					 							<input type="hidden" value="${status.index}">
									   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
									   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
									   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
											</div>
									</c:forEach>                     
			                    </div>
			                </div>
			                
			                
			                <div class="carousel-item" style="">
			                     <div class="row">
									<c:forEach var="dreamCountry" items="${countryList}" varStatus="status" begin="40" >
											<div class="col" style="margin-top: 30px; text-align: center;">
									    		<img alt="" src="/resources/images/tripInfoimges/${dreamCountry.surveyImg}" width="80px" height="80px" style="overflow: hidden;margin-bottom: 10px;">
					 							<input type="hidden" value="${status.index}">
									   	 		<input  type="checkbox" id="dreamCountry${status.index}" value="${dreamCountry.surveyChoice}" class="dreamCountry">
									   	 		<input type="hidden" id="countryImg${status.index}" value="${dreamCountry.surveyImg}">
									   	 	 	<label  for="dreamCountry${status.index}">${dreamCountry.surveyChoice}</label>
											</div>
									</c:forEach>                     
			                    </div>
			                </div>
			                
			                
			                <!-- ���� ������ ȭ��ǥ ��ư ���� -->
			                <a class="carousel-control-prev" href="#country-carousel" data-slide="prev" style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
			                	<i class="far fa-caret-square-left"></i>
			                </a>
			
			                <a class="carousel-control-next" href="#country-carousel" data-slide="next" style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
			                	<i class="far fa-caret-square-right"></i>
			                </a>
			                <!-- ���� ������ ȭ��ǥ ��ư �� -->
			            </div>
			        </div>
				</div>
			</div>	
			
			<div class="form-group">
				<div class="col-6 mx-auto ">	
				
					<span data-feather="compass"></span> &nbsp;<b>���� ���ེŸ��</b><small> ( �ִ� 3�� ) </small>
			     	<div id="main-carousel" class="carousel slide" data-ride="carousel">
			            <!-- �����̵� �� -->
			            <div class="carousel-inner">
			                <!--ù��° �����̵�-->
			                <div class="carousel-item active" style="">
			                    <div class="row">
									<c:forEach var="style" items="${tripStyleList}" varStatus="status" begin="0" end="9">
										<div class="col" style="margin-top: 30px; text-align: center;">
									    	<img alt="" src="/resources/images/tripInfoimges/${style.surveyImg}" style="overflow: hidden;margin-bottom: 10px;" width="80px;"height="80px;">
					 							<input type="hidden" value="${status.index}">
									   	 		<input  type="checkbox" id="tripStyle${status.index}" value="${style.surveyChoice}" class="tripStyle">
									   	 		<input type="hidden" id="styleImg${status.index}" value="${style.surveyImg}">
									   	 	 	<label  for="tripStyle${status.index}">${style.surveyChoice}</label>
										</div>
									</c:forEach> 
			                    </div>
			                </div>
			                
			                <!--�ι�° �����̵�-->
			                <div class="carousel-item" style="">
			                     <div class="row">
									<c:forEach var="style" items="${tripStyleList}" varStatus="status" begin="10" end="19">
											<div class="col" style="margin-top: 30px; text-align: center;">
									    		<img alt="" src="/resources/images/tripInfoimges/${style.surveyImg}" style="overflow: hidden;margin-bottom: 10px;" width="80px;"height="80px;">
						 						<p class="card-text"> 
						 							<input type="hidden" value="${status.index}">
										   	 		<input  type="checkbox" id="tripStyle${status.index}" value="${style.surveyChoice}" class="tripStyle">
										   	 		<input type="hidden" id="styleImg${status.index}" value="${style.surveyImg}">
										   	 	 	<label  for="tripStyle${status.index}">${style.surveyChoice}</label>
						  						</p>
											</div> 
									</c:forEach>                       
			                    </div>
			                </div>
			                <!-- ���� ������ ȭ��ǥ ��ư ���� -->
			                <a class="carousel-control-prev" href="#main-carousel" data-slide="prev" style="height: 50px; vertical-align: middle; margin-top: 130px;color: black;font-size: 30px;">
								<i class="far fa-caret-square-left"></i>
			                </a>
			
			                <a class="carousel-control-next" href="#main-carousel" data-slide="next" style="height: 50px; vertical-align: middle; margin-top: 130px;color:black; font-size: 30px;">
								<i class="far fa-caret-square-right"></i>
			                </a>
			                
			                <!-- ���� ������ ȭ��ǥ ��ư �� -->
			            </div>
			        </div>
				</div>
			</div>
			
			
			
				
			<div class="form-group">
				<div class="alert alert-danger alert-dismissable" style="display: none;" >
				    <button type="button" class="close" >��</button>
				    <strong></strong>&nbsp; ���� �� �ٽ� �õ����ּ���.
				</div>
		 		<div class="col-6 mx-auto"style="text-align: center;">
					<button type="button" class="btn btn-outline-primary addUser"  data-backdrop="static" data-keyboard="false">ȸ������</button>
					<button type="button" class="btn btn-outline-secondary" id="letsGoMain">���</button>
		
				</div>
			</div> 
					
			<div id="checkDreamCountry"></div>
			<div id="checkTripStyle"></div>	
			
				
				
			<!-- Modal -->
				<div class="modal fade" id="myModal" >
				  <div class="modal-dialog" role="document">
						<h2 style="color: white;"><b>�˸����ſ���üũ</b></h2>
				    <div class="modal-content">
				      <div class="modal-body">
				      	<p>
				      	<b>Euroverse</b>�� ���������� ���� �˸� ���񽺸� �����ϰ��ֽ��ϴ�.
				      	�˸� ���񽺸� �̿��Ͻðڽ��ϱ�?
						</p>      	
				
						<input type="radio" name="pushAgree" id="pushAgreeTrue" value="T">
						<label for="pushAgreeTrue">�����ϰڽ��ϴ�.</label>
						
						<input type="radio" name="pushAgree" id="pushAgreeFalse" value="F">
						<label for="pushAgreeFalse">�����ϰڽ��ϴ�.</label>		
						
				      </div>
				    </div>
				  </div>
				</div>
		
		</form>

	</div>
	
	<script>
		/* icon ����� ���� ��ũ��Ʈ */
		feather.replace();
	</script>
	
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</body>
	
</html>