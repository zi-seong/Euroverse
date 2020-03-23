<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>


 <!-- : http://getbootstrap.com/css/  -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- =========================================================================================  -->
	
	
	
	<!-- �۾�ü ������ �ɾ�� link -->
	<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
	 <!-- =========================================================================================  -->
	 
	 
	 
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- ===================================================================================  -->
	<!-- =================================================================================== -->
	
	

	<!-- fontawesome CDN -->
	<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
	 -->
 
	 <!-- ��Ʈ��Ʈ�� ������ ��� cdn fontawesome.com  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


	<!-- CSS �Ӽ��� -->
	<style>
		
		/*include�� ���� ui ������  */
		.tollbar{
			padding: 15px;
		}
		
		h3{
		font-size: 27px;
		}
		/* �̰� �־ȵ���?????????  */
		table thead > tr{
			border-color: blue;
		}
		.text-right{
			padding : 8px;
		}
		.table-hover{
		}
		
		.text-primary{
			font-size: 14px;
		}
        .badge {
            font-size: 100%;
        }
	</style>


	<script type="text/javascript">

	/* //=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	 */
	 function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/admin/getUserList").submit();
	};//end of getUserList(CurrentPage)
	 
	
	/*======== �˻��� �������� 1�������� ����������] =============  */
	$(function() {
		 $( ".fas.fa-search" ).on("click" , function() {
		 	fncGetUserList(1);
		 }); 
	});//end of function
	
	/*===== ȸ���������� ��ȸ ===========  */
	$(function() {
		 $( "td:nth-child(2)" ).on("click" , function() {
			 alert('click?');
			 var userId = $(this).find($("input[name='userId']")).val();
			 self.location = "/admin/getUser?userId="+userId;
		 }); 
	});/*========= end of function =========*/
	
	
	/*===== ȸ���������� ��ȸ ajax ó���� ajaxó���� tag append����̿��� �⺻ �������� �������� ����....===========  */
	function getUser(userId){
			 self.location = "/admin/getUser?userId="+userId;
	}/*========= end of function =========*/
	
	
	$(function() {
		 
		$(".form-control").keyup(function(){
			
			var searchCondition = $(".form-control option:selected").val();
			var searchKeyword = $("#searchKeyword").val();
			
			// ȸ������� �˻��� ��� 
			$.ajax({
				url: "/admin/json/getUserList",
				method: "POST",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				data: JSON.stringify({
					searchKeyword: searchKeyword,
			 		searchCondition: searchCondition  
				}),
				success: function(JSONData, status){
					if( JSONData==null || JSONData=="" ){
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSONData);	
						
						//html�� ���� append�ϱ����� ""����
						$('.userTab').children().remove();
						
						for(var i=0; i<JSONData.list.length; i++){
							
							//milliSeconds �ð��� date�� ��Ƽ� ���ε� �ð����� ǥ���ϱ� ���� ���
							var regdate = new Date(JSONData.list[i].regDate);
							var splitDate = regdate.getFullYear()+"-";
							if(parseInt(regdate.getMonth())<9){
								splitDate += "0"+parseInt(regdate.getMonth()+1)+"-";
							}else{
							splitDate += regdate.getMonth()+1+"-";
							}
							if(parseInt(regdate.getDate())<9){
								splitDate += "0"+parseInt(regdate.getDate());
							}else{
								splitDate += regdate.getDate();
							}
							
							//var splitDate = regDate.split(' ');
							//alert(splitDate);
							
							//ȸ����� �÷��� ���� ��������� �ֱ�����  if��
							
							var stringRole = '';
							
							if(JSONData.list[i].role == 'Q'){
								stringRole = '<div style=": #17a2b8;" class="badge badge-info">����ȸ��</div>'; 
							}else if(JSONData.list[i].role = 'G'){
								stringRole = '<div class="badge badge-light">������ȸ��</div>';
							}else if(JSONData.lsit[i].role == 'A') {
								stringRole = '<div class="badge badge-warning">������</div>';
							}else if(JSONData.list[i].role == 'X' ){
								stringRole = '<div class="badge badge-dark">Ż��ȸ��</div>'
							}
							
							var appendHtml = "<tr>"+
												"<th style='text-align:right;' scope='row'>"+(i+1)+"</th>"+
												"<td style='text-align:center; font-weight: bold; color: dimgray;'>"+JSONData.list[i].userId+
												"</td>"+
												"<td>"+JSONData.list[i].userName+"</td>"+
												"<td>"+stringRole+"</td>"+
												"<td>"+JSONData.list[i].nickname+"</td>"+
												"<td>"+JSONData.list[i].totalPoint+"</td>"+
												"<td>"+JSONData.list[i].sex+"</td>"+
												"<td>"+splitDate+"</td></tr>";
												
							$('.userTab').append(appendHtml);
						}/* end of for  */
					}/* end of else  */
					
				},/* end of seccess  */
				
				error:function(request,status,error){
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    }/* end of error  */
			});/* end of ajax  */
		}); /* keyUp event end  */
		
	}); /* function end  */
		
</script>



</head>


<body>

	<!-- =============== ���ι��� ���� ��Ŭ���  ========== -->
		<jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
	<!-- =========== �̱���  ================ -->
	
	<!-- Ǫ���� ��Ŭ���  -->
	<jsp:include page="/toolbar/pushBar.jsp"></jsp:include>
	<!-- ��Ŭ��� end--> 
		

	<div class="container" style="width:70%;margin:auto;">
		
	<div class="page-header">

		<div class="h4 viewPost" style="font-family:'NIXGONM-Vb';display:inline-block;background-color:#ffde3e;font-weight: bold; margin-top: 40px;margin-bottom:20px; padding-left:10px;opacity: 1;border-bottom: 1px solid white;">
              ȸ�� ���
            </div><span style="font-size: 15px;font-family: 'NIXGONM-Vb';color:black;"> >>��ü ${resultPage.totalCount}��</span>
	
	 </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
	    	<!-- �˻����� �� �� ��, ���� ������ ��Ÿ���� �۾�  -->
		    <div class="col-md-6 text-left">
		    	<p class="">
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right d-flex justify-content-end">
		    
		     <!-- =========================== �˻����� ����â =========================== -->
			    <form class="form-inline" name="detailForm">
			      <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 30px; width: 85px; font-size: 13px; margin-right: 2px;" >
						<c:if test="${empty search.searchCondition }">
						<option class="from-option" value="0" selected="selected" >���̵�</option>
						<option class="from-option" value="1" >�г���</option>
						<option class="from-option" value="2" >�̸�</option>
						</c:if>
						
						<c:if test="${!empty search.searchCondition }">
						<option class="from-option" value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>���̵�</option>
						<option class="from-option" value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
						<option class="from-option" value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�̸�</option>
						</c:if>
					</select>
				  </div>
				  <!-- ======================== �˻����� ����â ��  ========================= -->
				  
				  <!-- ========================== ������ �˻��Ҽ� �ִ� �˻�â ================================   -->
				  <div class="form-group ">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" 
				    			 style="height: 30px; font-size: 13px;" onkeydown="javascript:if(event.keyCode == 13) {fncGetUserList(1)}">
				  </div>
				  <!--======================== �����˻�â ��  =========================================== -->
				
				  <!-- ������ ������  fontawesome.com-->
				  &nbsp;&nbsp;<i class="fas fa-search" style="font-size: x-large"></i>
				 
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<div class="table-responsive">
		
		<!-- =============================== ������� �Խ��� ���̺�  ���� ============================-->
			<table class="table table-hover">
	        <thead>
		        <tr class="top shadow-sm p-3 mb-5 bg-white rounded " style="font-size:small;">
		            <th style="text-align:right;" scope="col">��ȣ</th>
		            <th style="text-align:center;" scope="col">ȸ�����̵�</th>
		            <th scope="col">ȸ���̸�</th>
		            <th scope="col">ȸ�����</th>
		            <th scope="col">�г���</th>
		            <th scope="col">����Ʈ</th>
		            <th scope="col">����</th>
		            <th scope="col">�������</th>
		          </tr>
	        </thead>
		
			<tbody class="userTab" style="font-size: small;">
			  <c:set var="i" value="0" />
			  <c:forEach var="user" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr>
				  <th style="text-align:right;" scope="row">${ i }</th>
				  <td style="text-align:center; font-weight: bold; color: dimgray;">
				  ${user.userId}
				  <input type="hidden" id="userId" name="userId" value="${user.userId}"/></td>
				  <td>${user.userName}</td>
				  <c:if test="${user.role == 'Q' }">
				  <td><div style=": #17a2b8;" class="badge badge-info">����ȸ��</div></td>
				  </c:if>
				  <c:if test="${user.role == 'G' }">
				  <td><div class="badge badge-light">������ȸ��</div></td>
				  </c:if>
				  <c:if test="${user.role == 'A' }">
				  <td><div class="badge badge-warning">������</div></td>
				  </c:if>
				  <c:if test="${user.role == 'X' }">
				  <td><div class="badge badge-dark">Ż��ȸ��</div></td>
				  </c:if>
				  <td>${user.nickname }</td>
				  <td>${user.totalPoint }</td>
				  <td>${user.sex }</td>
				  <td>
				  <c:set var="regDate" value="${fn:split(user.regDate,' ')}"></c:set>
					<c:out value="${regDate[0]}"></c:out></td>
				</tr>
	          </c:forEach>
		
			</tbody>

			</table>
			</div>
			<!--================================ ���̺�   =====================================-->
		
	</div>
	<!-- ================== div : Container End  ================-->	
	
		<!-- pageNavigator include  -->
		<jsp:include page="../../common/pageNavigator_new.jsp"/>
		
		<!-- Ǫ�� ��Ŭ���  -->
		<jsp:include page="/toolbar/footer.jsp"></jsp:include>
		<!-- ��Ŭ��� end--> 

</body>

</html>