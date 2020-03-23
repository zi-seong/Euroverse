<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Euroverse</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script>
	$(function(){
		$(".nav-link:contains('��й�ȣã��')").addClass("disabled");
	});

	window.onload = function(){
		var pwd = document.getElementById("pwd");
		var pwdConfirm = document.getElementById("pwdConfirm");
		var h6 = document.getElementsByTagName("h6");
		var updatePwd = document.getElementById("updatePwd");
		var firstPwd = $("#firstPwd");
		var secondPwd = $("#secondPwd");
		pwd.onkeyup = function(event) {
			if(pwd.value.length<6 || pwd.value.length>20){
				firstPwd.html("��й�ȣ�� 6��~20�� �Դϴ�.");
				return;
			}else if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.value) == false){
					firstPwd.html( "��й�ȣ�� �ּ� �ϳ��� �ҹ���,�빮�� �� ���ڰ� ���ԵǾ�� �մϴ�.");
				return;
			}else{
				firstPwd.html("");
			}
			
		}
		pwdConfirm.onkeyup = function(event){
			if(pwd.value != pwdConfirm.value){
				secondPwd.html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			}else{
			    h6[1].innerHTML = " ";
			    if(pwdConfirm.value.length<6 || pwdConfirm.value.length>20){
			    
			    }else{
			    	secondPwd.html("");
			    }
			}
			
		}	
		document.getElementById('updatePwd').onclick = function() {
			
			if(pwd.value != pwdConfirm.value){
				swal({
					  icon : 'warning',
					  title : "��й�ȣ�� ��ġ���� �ʽ��ϴ�.",
					  text:" ",
					  button : false,
				})
			}else if( pwd.value.length < 6 || pwd.value.length > 20){
				swal({
					  icon : 'warning',
					  title : "��й�ȣ�� 6~20���Դϴ�.",
					  text:" ",
					  button : false,
				})
			}else if(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/.test(pwd.value) == false){
				swal({
					  icon : 'warning',
					  title : "��й�ȣ�� �ּ� �ϳ��� �ҹ���,�빮�� �� ���ڰ� ���ԵǾ�� �մϴ�.",
					  text:" ",
					  button : false,
				})
			}else{
				var form = $("#pwdUpdateForm")
				form.attr("action","/user/updatePwd");
				form.attr("method","post");
				form.submit();
			}
		}
	}
</script>

</head>
<body>
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>

	<div class="container" style="margin-top: 70px;">
		<p style="font-size:30px;margin-left:300px; margin-top: 50px; margin-bottom: -20px" >
			��й�ȣ����
			<br><hr style="width: 530px;margin-bottom: -5px;">
			<small style="margin-left:300px; ">���ο� ��й�ȣ�� �Է����ּ���.</small>
		</p>

		<form  id="pwdUpdateForm">
			<div class="row">
				<div style="width: 300px;"></div>
				<div class="form-group" style="width: 540px;">
					<input type="hidden" name="userId" id="userId" value="${userId}">
					������ ��й�ȣ<input type="password" class="form-control"  name="pwd" id="pwd">
					<div id="firstPwd" style="height: 20px; color: red;"></div>
					<br>				
					������ ��й�ȣ Ȯ��<input type="password" class="form-control"  id="pwdConfirm">
					<div id="secondPwd" style="height: 20px; color: red;"></div>
					<br>
									
					<div style="text-align: center;">
					<input type="button"  class="btn btn-outline-primary" id="updatePwd" value="��й�ȣ ����">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
	<jsp:include page="/toolbar/footer.jsp"></jsp:include>
</html>