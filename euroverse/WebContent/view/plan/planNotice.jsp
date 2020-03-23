<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
        
<!-- ///////////////////////////// �α��ν� Forward  /////////////////////////////////////// -->
	<c:if test="${ ! empty user }">
		<jsp:forward page="/plan/getPlanList"/>
	</c:if>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->

        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>Euroverse, ���� ������ ����</title>

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


	<!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	
	
	<script>
		
		/* ���â �ݱ� */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
			}
			$("#"+modalName).hide();
		}
		
		$(function(){
			$("#addUserButton").on("click", function() {
		        location.href = "/user/addUser";
		    });
		});
		
	</script>

	<style type="text/css">
	
	.bg {
	    position:relative;
	    z-index:1;
	    width:100%;
	    margin-left: 0;
	    margin-right: 0;
	}

	.bg:after{
		background-image: url('/resources/images/mainImg/plan_main.jpg');
	    top:0;
	    left:0;
	    position:absolute;
	    background-size:100%;
	    opacity:0.45!important;
	    //filter:alpha(opacity=50);
	    z-index:-1;
	    content:"";
	    width:100%;
	    height:100%;
	}
	
	</style>
</head>
<body>

	<!-- ToolBar ���� -->
	<jsp:include page="/toolbar/toolBar.jsp"></jsp:include>
	<!-- ToolBar �� -->

	
		<!-- �ٴ� ���̾ƿ� Start ///////////////////////////// -->
		<div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center">
		
			<!-- <h4> �÷��� ����� ����Ͻ÷��� �α��� �Ǿ��־�� �մϴ�</h4>
			<hr/>
			<div>
				<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#loginModal">�α���</button>
				<button type="button" class="btn btn-outline-secondary" id="addUserButton">ȸ������</button>
			</div> -->
			
			<!--  style="background-image: url('/resources/images/mainImg/venice_main2.jpg');  -->
			<div class="bg" style="">
				<div style="opacity: 100%;padding: 140px 300px; float: right;text-align: right;">
				  <!-- <h1 class="display-4">���ι����� ���Ű� ȯ���մϴ�!</h1> -->
				  <p class="lead" style="font-weight: 500;">���ι����� �÷��� ����� ����Ͻ÷���<br/>ȸ������ �α��� �Ǿ��־�� �մϴ�.</p>
				  <hr class="my-4">
				  <p>������ �����Ű���? �α��� �� ������ �÷��ʸ� �ۼ��غ�����</p>
				  <!-- <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a> -->
					  <div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">�α���</button>
						<button type="button" class="btn btn-secondary" id="addUserButton">ȸ������</button>
					</div>
				</div>
			</div>


		</div>
		<!-- �ٴ� ���̾ƿ� End ///////////////////////////// -->
	
	
	<script>
		/* icon ����� ���� ��ũ��Ʈ */
		feather.replace();
	</script>
	
	<jsp:include page="/toolbar/pushBar.jsp" />
    <jsp:include page="/toolbar/footer.jsp" />

</body>
</html>