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

.a{
	padding: 3px;
}
.b{
	padding: 3px;
}


.inner{
	display: inline-block;
	background-color: white;
	border-bottom-left-radius : 15px;
	border-bottom-right-radius : 15px;
	box-shadow : 5px 5px 7px #C3C0C0;
	height: 100%;
	width:100%;
	margin-bottom: 10px;
}
</style>


<script type="text/javascript">

	/* ss���� mm���� hh�ð��� ���ϴ� �ڵ�  */
	/* function fn_dateTimeToFormatted(dt) {
		var min = 60 * 1000;
		var c = new Date()
		var d = new Date(dt);
		var minsAgo = Math.floor((c - d) / (min));

		var result = {
			'raw': d.getFullYear() + '-' + (d.getMonth() + 1 > 9 ? '' : '0') + (d.getMonth() + 1) + '-' + (d.getDate() > 9 ? '' : '0') +  d.getDate() + ' ' + (d.getHours() > 9 ? '' : '0') +  d.getHours() + ':' + (d.getMinutes() > 9 ? '' : '0') +  d.getMinutes() + ':'  + (d.getSeconds() > 9 ? '' : '0') +  d.getSeconds(),
			'formatted': '',
		};

		if (minsAgo < 60) { // 1�ð� ��
			result.formatted = minsAgo + '�� ��';
		} else if (minsAgo < 60 * 24) { // �Ϸ� ��
			result.formatted = Math.floor(minsAgo / 60) + '�ð� ��';
		} else { // �Ϸ� �̻�
			result.formatted = Math.floor(minsAgo / 60 / 24) + '�� ��';
		};

		return formatDate;
	};
	//end �ð����ϱ�

	/* //=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	 */
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/admin/getAdminQnAList").submit();
	};//end of getUserList(CurrentPage)
	
	
	/*======== �˻��� �������� 1�������� ����������] =============  */
	$(function() {
		 $( ".form-control" ).change(function() {
		 	fncGetUserList(1);
		 }); 
	});//end of function */
	
	
	 function close(){
     	$("#con").remove();
     }
	
	//�����ڰ� ����Ʈ�� Ŭ��������� �󼼺���
		function getAdminQnaList(postId,postContent,qnaFirstCate,postWriterId) {
			
			if(qnaFirstCate == "A"){
				
				qnaFirstCate = '�ֹ�����';
			}
			if(qnaFirstCate == "B"){
				
				qnaFirstCate = '��ǰ����';
			}
			if(qnaFirstCate == "C"){
				
				qnaFirstCate = '��Ÿ';
			}
        
			var display = 
				'<div id="con" class="container">'+
			        '<div class="inner" id="inner'+postId+'">'+
			            '<div style="padding:10px 25px" class="row">'+
			                '<div style="margin:8px;text-align:right;display: inline-block; height: auto; width: 105px;">'+
			                    '<img id="qimg" style="width:40px; "alt="" src=\"/resources/images/admin/Qicon.png"\></div>'+
//            '<div>'+
			                    '<div style="width: 600px; height:20px; margin: 10px 5px 5px 29px;">'+postContent+'</div>'+
//			                    '<div style="height:20px; font-size:9pt;font-family:����; color:#4EC2F8; height:20px; margin: 2px 5px 5px 5px;">'+qnaFirstCate+'</div>'+
//			                    '<div style="font-size:11pt; color: rgb(240, 168, 72);"><i class="fas fa-clock"></i>'+postWriterId+'���� �������� �����ϼ̽��ϴ�.</div>'+
//                                '</div>'+
                        '</div></div>';
			           
        
	    	$("#con").remove();//�ٸ� �Խñ��� Ŭ���Ұ�� �����±� ����
	        $("#"+postId+"").html(display);//�Խñ��� Ŭ���Ұ�� �±� �����
			 
	        	$.ajax({
					url: "/admin/json/getQnaCommentList/"+postId,
					method: "GET",
					dataType: "json",
					headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
					success: function(JSONData, status){
						
						if( JSONData==null || JSONData=="" ){
							console.log("���ϵ����� ����");	
						}else{
							console.log("���ϵ����� ����! => ");
                            console.log(JSONData.list.length);
							if(JSONData.list.length != 0){
                                var date = new Date(JSONData.list[0].cmtDate);
                                
					            var appendHtml =
									'<div id="delCmt" style="padding:5px 25px" class="row">'+
									'<div style="display: inline-block; height: auto; width: 110px;"></div>'+
									'<div style="margin:8px;text-align:right;display: inline-block; height: 70px; width: 70px;">'+
						            '<img style="width:40px;" src="/resources/images/admin/Aicon.png"></div>'
                                    +'<div>'+
						            '<div class="qnaComment" style="width: 600px; height:auto; margin: 10px 5px 5px 20px;">'+JSONData.list[0].cmtContent+
						            '<br><br><span style="color:darkgray">'+
                                    date.getFullYear()+"�� "+parseInt(date.getMonth()+1)+"�� "+date.getDate()+"�� "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+'</span><button type="button" class="btn btn-outline-danger btn-sm" style="margin-left:5px;" onclick="deleteCmt('+JSONData.list[0].cmtId+','+JSONData.list[0].postId+')">����</button></div>'+'</div></div>';
//						            '<div style="height:20px; font-size:9pt;font-family:����; color:#4EC2F8; height:20px; margin: 2px 5px 5px 5px;">����</div>'+
//						            '<div style="font-size:11pt; color: rgb(240, 168, 72);"><i class="fas fa-user-clock"></i>������ �亯�ϼ̽��ϴ�.</div>'+
						        	
                                
						         	
							 $("#inner"+postId).append(appendHtml);
                            
							} else {
                                
                                var adminReply = '<div id="append" style=" height: auto; padding:15px 25px" class="row">'+
                                    '<div style="display: inline-block; height: auto; width: 110px;"></div>'+
			                         '<div style="text-align:right;display: inline-block; height: 70px; width: 70px;">'+
			                         '<img style="width:40px;" src=\"/resources/images/admin/Aicon.png"\></div><div>'+
			                         '<div style="width: 600px; height:100%; margin: 0px 5px 5px 10px;"><textarea id="content" class="form-control" style="min-height: 100px;margin-left:20px;">'+
			                         '</textarea></div></div><div>'+
			                         '<button type="button" class="btn btn-info btn-sm" onclick="answer('+postId+')" style=" margin-left:20px; height:auto; display: inline-block">���</button></div>'+
			                         '</div></div></div></div>';
                                $("#inner"+postId).append(adminReply);
                            }
						}//end of else
					    
					},//end of success
						
					error:function(request,status,error){
				        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
				    }// end of error  
					    
				 });// end of ajax
		};//end of getAdminQnaList
					            
	
	
	
	//�������� 1:1���� �亯 �����ڰ� �� ���Ǵ� �亯�� �Ѱ��� �޼��ֵ��� ����¥����
	function answer(postId){ 
		
       	var cmtContent = $('#content').val().replace(/\n/g,"<br>");
       	$('#content').val('');	
       	
       	 $.ajax({
			url: "/admin/json/addQnaComment",
			method: "POST",
			dataType: "json",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data:JSON.stringify({
				postId: postId,
				cmtWriterId : 'admin',
				nickName:'Euroverse',
		 		cmtContent : cmtContent
			}),
			success: function(JSONData, status){
				//restController���� comments�� ���� �̹� �����ϸ� error�޼����� ���� 
				if(JSONData.returnMsg=='error'){
					
					alert("�亯�� �Ѱ��� �����մϴ�.")
				
				//����� �ϳ��� ������ ajax ����
				}else if(JSONData.returnMsg=='ok'){
					
					if( JSONData==null || JSONData=="" ){
						console.log("���ϵ����� ����");	
					}else{
						console.log("���ϵ����� ����! => "+JSONData);
                        var date = new Date(JSONData.list[0].cmtDate);
				        var appendHtml =
									'<div id="delCmt" style="padding:5px 25px" class="row">'+
									'<div style="display: inline-block; height: auto; width: 110px;"></div>'+
									'<div style="margin:8px;text-align:right;display: inline-block; height: 70px; width: 70px;">'+
						            '<img style="width:40px;" src="/resources/images/admin/Aicon.png"></div>'
                                    +'<div>'+
						            '<div class="qnaComment" style="width: 600px; height:auto; margin: 10px 5px 5px 20px;">'+JSONData.list[0].cmtContent+
						            '<br><br><span style="color:darkgray">'+
                                    date.getFullYear()+"�� "+parseInt(date.getMonth()+1)+"�� "+date.getDate()+"�� "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+'</span><button type="button" class="btn btn-outline-danger btn-sm" style="margin-left:5px;" onclick="deleteCmt('+JSONData.list[0].cmtId+','+JSONData.list[0].postId+')">����</button></div>'+'</div></div>';
						         	
                        $("#append").hide();
                        $("#inner"+postId).append(appendHtml);
                        $("#badge"+postId).removeClass('badge-secondary');
                        $("#badge"+postId).addClass('badge-success');
                        $("#badge"+postId).html('�亯�Ϸ�');
					
					}// end of else
				}//end of elseIf
						
			},// end of success
			error:function(request,status,error){
		        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
		    }// end of error  
					
		});// end of ajax
			
	};//end of fuction
        
		
	function deleteCmt(cmtId, postId){
        $('#delCmt').hide();
		$.ajax({
			url: "/admin/json/deleteQnaComm",
			method: "POST",
			headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
			data: JSON.stringify({
				postId: postId,
				cmtId : cmtId
			}),
            success : function() {
                
                var adminReply = '<div id="append" style=" height: auto; padding:15px 25px" class="row">'+
                                    '<div style="display: inline-block; height: auto; width: 110px;"></div>'+
			                         '<div style="text-align:right;display: inline-block; height: 70px; width: 70px;">'+
			                         '<img style="width:40px;" src=\"/resources/images/admin/Aicon.png"\></div><div>'+
			                         '<div style="width: 600px; height:100%; margin: 0px 5px 5px 10px;"><textarea id="content" class="form-control" style="min-height: 100px;margin-left:20px;">'+
			                         '</textarea></div></div><div>'+
			                         '<button type="button" class="btn btn-info btn-sm" onclick="answer('+postId+')" style=" margin-left:20px; height:auto; display: inline-block">���</button></div>'+
			                         '</div></div></div></div>';
                $("#inner"+postId).append(adminReply);
                $("#badge"+postId).removeClass('badge-success');
                $("#badge"+postId).addClass('badge-secondary');
                $("#badge"+postId).html('�亯����');
            },
            error : function(err, status) {
                console.log(err+status);
            }

		});
		
	};//end deleteCmt()
	
</script>



</head>


<body>

    <jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
    <jsp:include page="/toolbar/pushBar.jsp"></jsp:include> 


	<div onclick='close()' class="container" style="width:70%;margin:auto;">
	
	<div class="page-header text-info">

		<div class="h4" style="font-family:'NIXGONM-Vb';display:inline-block;background-color:#ffde3e;font-weight: bold; margin-top: 40px;margin-bottom:20px; padding-left:10px;color:black;">
        1:1 ���� ���
		</div><span style="font-size: 15px;font-family: 'NIXGONM-Vb';color:black;"> >>��ü ${resultPage.totalCount}��</span>
	
	 </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
	    	<!-- �˻����� �� �� ��, ���� ������ ��Ÿ���� �۾�  -->
		    <div class="col-md-6 text-left">
<!--
		    	<p style="font-size:10pt;">
		    		Total  ${resultPage.totalCount }
		    	</p>
-->
		    </div>
		    
		    
		    <div class="col-md-6 text-right d-flex justify-content-end">
		    
		    <!-- =========================== �˻����� ����â =========================== -->
		     <form class="form-inline" name="detailForm">
			      <input type="hidden" id="qnaFirstCate" name="qnaFirstCate" value="${param.qnaFirstCate}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 30px; width: 120px; font-size: 13px; margin-right: 2px;" >
						<c:if test="${empty search.searchCondition }">
						<option class="from-option" value="" >��ü</option>
						<option class="from-option" value="A" >�ֹ�����</option>
						<option class="from-option" value="B" >��ǰ����</option>
						<option class="from-option" value="C" >��Ÿ</option>
						</c:if>
						
						<c:if test="${!empty search.searchCondition }">
						<option class="from-option" value="" >��ü</option>
						<option class="from-option" value="A"  ${ ! empty search.searchCondition && search.searchCondition=='A' ? "selected" : "" }>�ֹ�����</option>
						<option class="from-option" value="B"  ${ ! empty search.searchCondition && search.searchCondition=='B' ? "selected" : "" }>��ǰ����</option>
						<option class="from-option" value="C"  ${ ! empty search.searchCondition && search.searchCondition=='C' ? "selected" : "" }>��Ÿ</option>
						</c:if>
					</select>
				  </div>
				   <!-- ======================== �˻����� ����â ��  ========================= -->
		    
		      		<!-- ������ ������  fontawesome.com-->
				  &nbsp;&nbsp;<i class="fas fa-search" style="font-size: x-large"></i>
				  
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
	    	 </form>
	    	</div>
		</div>
		
		
		
		
		<div class="table-responsive">
		
			<table class="table table-hover">
	        <thead>
		        <tr class="top shadow-sm p-3 mb-5 bg-white rounded " style="font-size:small;">
		            <th scope="col" style= "width:7%;">��ȣ</th>
		            <th scope="col" style= "width:7%;">����</th>
		            <th scope="col" style= "width:50%; text-align:center;">����</th>
		            <th scope="col" style= "width:10%;">�з�</th>
		            <th scope="col" style= "width:10%;">�۾���</th>
		            <th scope="col"	style="width:10%;">��¥</th>
		          </tr>
	        </thead>
	        
		<!-- ========���̺� ���� ���� ========== -->
			<tbody class="userTab" style="font-size: small;">
			  <c:set var="i" value="0" />
			  <c:forEach var="post" items="${list }">
				<c:set var="i" value="${i+1 }" />
				<tr>
				
				<!-- �Խñ۹�ȣ -->
				  <td class="no" >${ i }</td>
				    
				  <td class="state" style="font-weight: bold; color: dimgray;">
					  <c:if test="${post.postGrade != 'Q' }">
			   				<span id="badge${post.postId}" class="badge badge-pill badge-secondary">�亯����</span>
			   			 </c:if>	
						<c:if test="${post.postGrade == 'Q' }">
			   			<span id="badge${post.postId}" class="badge badge-pill badge-success">�亯�Ϸ�</span>
				   		</c:if>
				  </td>
				  
				  <td class="postclick"  onclick="getAdminQnaList('${post.postId}','${post.postContent}','${post.qnaFirstCate}','${post.postWriterId}')" style="text-align: left;">
				  <input type="hidden" id="postId" name="postId" value="${post.postId}"/>
				  <input type="hidden" id="postContent" name="postContent" value="${post.postContent}"/>
				  <input type="hidden" id="qnaCate" name="qnaCate" value="${post.qnaFirstCate}"/>
				  <input type="hidden" id="userId" name="userId" value="${post.postWriterId}"/>
				  ${post.postTitle}</td>
				  <td> 
				   <c:if test="${post.qnaFirstCate == 'A' }">
                                        �ֹ����� >
                    </c:if>
                    <c:if test="${post.qnaFirstCate == 'B' }">
                        ��ǰ���� >
                    </c:if>
                    <c:if test="${post.qnaFirstCate == 'C' }">
                        ��Ÿ
                    </c:if>
                    <c:if test="${post.qnaSecondCate=='D'}">
                        ����
                    </c:if>
                    <c:if test="${post.qnaSecondCate=='E'}">
                        ȯ��
                    </c:if>
                    <c:if test="${post.qnaSecondCate=='F'}">
                        �װ���
                    </c:if>
                    <c:if test="${post.qnaSecondCate=='G'}">
                        ����
                    </c:if>
					</td>  
				  <td>${post.postWriterId }</td>
				  <td><c:set var="regDate" value="${fn:split(post.postDate,' ')}"></c:set>
					<c:out value="${regDate[0]}"></c:out></td>
				</tr>
				<tr>
	          		<td id="${post.postId}" colspan="6" bgcolor="#E6E2E2" style="margin:0px;padding:0px 0px 0px 0px;"></td>
	          	</tr>
	          </c:forEach>
	     		
			</tbody>
			</table>
				<!-- ========== ���̺� ���� �� ============ -->
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