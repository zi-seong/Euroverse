<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<title>getPlanList</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- ��Ʈ��Ʈ�� 4.4 �����ٰ� ����...............................�ߴٰ� �ٽ� 4.4��..  -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



	<!-- boot strap File upload CDN  -->
	<script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.js"></script>

	<!-- FontAwesome CDN -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<!-- jquery Ui ��ũ (datePicker)  -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--datePicker CDN  -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	


	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>

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
      
      .modal .ui-datepicker{
      	z-index: 2147483647!important
      }
      
      
      
       .custom-file-input ~ .custom-file-label::after {
		    content: "image";
		}
		
		      
	</style>


	<script type="text/javascript">
	
		$(function(){
			
			$('.showAddPlanModal').on('click', function(){
				$('#addPlanModal').show();
			});
			
			$('#addPlan').on('click', function(){
				addPlan();
			});
			
			$('#showUpdateSlotModal').on('click', function(){
				$('#updateSlotModal').show();
			});
			
			$('#updateUserSlot').on('click', function(){
				updateUserSlot();
			});
			
			$('div.plan').on('click', function(){
				var planId = $(this).children('div .planId').text().trim();
				var string = "/plan/getPlan?planId="+planId;
				$(self.location).attr("href", string);
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
			
		});
			
		function addPlan(){
			console.log("addPlan ����");
			
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
			
			$('form.addPlanModal').attr('method', 'POST').attr("action" , "/plan/addPlan").attr("enctype","multipart/form-data").submit();
		}
		
		
		function showEditPlan(indexOfPlan){
			
			alert(indexOfPlan);
			planId = '10000';
			
			/* $.ajax({
				url: "/plan/json/getPlan/"+planId ,
				method: "GET",
				dataType: "json",
				headers: { "Accept" : "application/json", "Content-Type" : "application/json" },
				success: function(JSONData, status){
					alert("���ϰ� ���� => "+JSON.stringify(JSONData));
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			    } 
			}); */
			
			$('#editPlan').show();
		}
		
		function updatePlan(){
			alert("updatePlan() ����!");
		}
		
		
		function updateUserSlot(){
			var userId = '${user.userId}';
			var userSlot = '${user.slot}';
			console.log("updateUserSlot() ����! userId="+userId+", slot="+userSlot);
			
			var string = "/plan/updateUserSlot?userId="+userId;
			$(self.location).attr("href", string);
		}
		
	</script>

</head>
<body>
	<script>
		
		/* ���â �ݱ� */
		function closeModal(modalName) {
			console.log("closeModal : modalName="+modalName);
			if( typeof $("."+modalName)[0] != "undefined" ){
				$("."+modalName)[0].reset();		//form�� ��� �̸��� ���� Ŭ������ �ֱ�
			}
			$("#"+modalName).hide();
		}
	</script>
	
	
	<br/>
	<a href="/index.jsp" >�ٽ� ��������</a><br/>
	userId = ${user.userId} , userSlot = ${user.slot} , user.totalPoint = ${user.totalPoint}
	<br/><br/>
	
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
			
				<c:if test="${list.size() != 0}">
					<c:forEach var="plan" items="${list}">
						
						<div class="col-md-4 plan">
							<div class="planId" hidden="hidden">${plan.planId}</div>
				          
				          <div class="card mb-4 shadow-sm">
				          
				            <svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
					            <rect width="100%" height="100%" fill="#99E1FF"/>
					            <image xlink:href="/resources/images/planImg/${plan.planImg}" x="0" y="0" height="230" width="100%"/>
					            <text x="50%" y="50%" fill="#eceeef" dy=".3em">${plan.planTitle}</text>
					        </svg>
				            
				            <div class="card-body">
				              	<div class="d-flex justify-content-between align-items-center">
				              		<div style="font-weight: 500; color: #6D6D6D;">
						              	<c:if test="${plan.planDday < 0}"> &nbsp; </c:if>
							            <c:if test="${plan.planDday == 0}"> D-Day </c:if>
										<c:if test="${plan.planDday > 0}"> D-${plan.planDday} </c:if>
						            </div>
									<div>${plan.planType}</div>
				              	</div>
					            <div class="card-text">
					            	<div style="font-weight: bolder; font-size: large; margin: 15px 3px;"> ${plan.planTitle}</div>
						            <div>${plan.startDateString} <c:if test="${plan.endDate != null}"> ~ ${plan.endDate} </c:if></div>
						            <div> 
						            	 <c:if test="${plan.planTotalDays!=0}"> ${plan.planTotalDays-1} �� ${plan.planTotalDays} �� </c:if>&nbsp;
						            </div>
						            <br/>
						        </div>
				              
					            <div class="d-flex justify-content-between align-items-center">
					              	<div class="btn-group">
					                	<%-- <button type="button" class="btn btn-sm btn-outline-secondary" onClick="showEditPlan('${list.indexOf(plan)}')">Edit</button> --%>
					                </div>
					                <div>
						                <c:if test="${plan.planPartySize > 1}"><span data-feather="users"></span></c:if>
						                <c:if test="${plan.planPartySize == 1}"><span data-feather="user"></span></c:if>
						                 ${plan.planPartySize}
					                </div>
					            </div>
				            </div><!-- card-body end -->
				            
				          </div>
				        </div>
				        
					</c:forEach>		
				</c:if>
			
				<!-- �÷��� ��� ��ư -->
				<c:if test="${!empty user.slot }">
					<c:forEach var="i" begin="1" end="${user.slot - list.size()}">
						<div class="col-md-4">
				          <div class="card mb-4 shadow-sm showAddPlanModal">
				          
				            <div class="card-body">
				              <div class="card-text text-center"><br/><span data-feather="plus-circle"></span><br/><br/>���ο� �÷��� �����<br/><br/> </div>
				            </div>
				            
				          </div>
						</div>
					</c:forEach>
				</c:if>
				
			
				<!-- ���� �߰� ��ư -->
				<div class="col-md-4">
		          <div class="card mb-4 shadow-sm" id="showUpdateSlotModal">
		            <div class="card-body">
		              <p class="card-text text-center"><br/><span data-feather="lock"></span><br/><br/>���� �ø���<br/><br/> </p>
		            </div>
		          </div>
				</div>
			
			</div>
		</div>
	</div>
	
	
	
	<!-- /////////////////////	Modal : addPlan	///////////////////// -->
	<div class="modal" id="addPlanModal" >
	  <div class="modal-dialog">
	  <h4 style="color: #FFFFFF; margin-top: 100px;">�÷��� �����</h4>
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <h5 class="modal-title">���ο� �÷��� ����� ������ �غ��غ�����</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('addPlanModal')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body">
	        
	        <form class="form-horizontal addPlanModal">
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
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('addPlanModal')">Close</button>
	        <button type="button" class="btn btn-primary" id="addPlan">Add Plan</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : addPlan	///////////////////// -->
	
	<!-- /////////////////////	Modal : editPlan 	///////////////////// -->
	<!-- 
	<div class="modal" id="editPlan">
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
	        	
				
	        </form>
	        
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('editPlan')">Close</button>
	        <button type="button" class="btn btn-primary" id="updatePlan">����</button>
	      </div>
	    </div>
	  </div>
	</div>
	-->
	<!-- /////////////////////	Modal : editPlan ��	///////////////////// -->
	
	<!-- /////////////////////	Modal : ���� �ø��� 	///////////////////// -->	
	<div class="modal" id="updateSlotModal">
	  <div class="modal-dialog" >
	  	<h4 style="color: #FFFFFF; margin-top: 100px;"> ���� ����</h4>
	  
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <!-- <div class="modal-title">
	        	<h6 style="margin-left:15px; align-self: center; font-weight: bolder;"><br/>ģ���� �ʴ��� �÷��ʸ� �Բ� �ۼ��ϰ� ������ ����������</h6>
	        </div> -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="closeModal('updateSlotModal')">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      <div class="modal-body text-center">
	        <br/>
	        <c:if test="${ empty user.totalPoint || user.totalPoint < 500 }">
	        	 <span style="font-size:17px;"> �÷��� ������ �����ϱ� ���ؼ�</span><br/>
				 <span style="font-size:17px;">���� ����Ʈ�� 500P �̻��̾�� �մϴ�</span><br/><br/>
	        </c:if>
	        <c:if test="${user.totalPoint >= 500 }">
	        	<span style="font-size:17px;"> �÷��� ������ �ø��ðڽ��ϱ�?</span><br/>
	         	<span style="font-size:17px;"> ���� �����ϰ� ��� ${user.totalPoint}P �� 500P �� ����մϴ�</span><br/><br/>
	        </c:if>
	      </div>
	      
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="closeModal('updateSlotModal')">�ƴϿ�</button>
	      	<c:if test="${user.totalPoint >= 500 }">
	      		<button type="button" class="btn btn-primary" id="updateUserSlot">��</button>
	      	</c:if>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- /////////////////////	Modal : ���� �ø��� ��	///////////////////// -->

	
	
	
	<script>
	
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
		
	
	</script>


</body>
</html>