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


 
 <!-- ��Ʈ��Ʈ�� ������ ��� cdn fontawesome.com  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<!-- CSS �Ӽ��� -->
<style>
.outer{
	background-color: #E6E2E2;
	padding: 30px; 
	padding-top: 2px;
	width:auto;
	height: auto;
	display: inline-block;
}

.inner{
	display: inline-block;
	background-color: white;
	border-bottom-left-radius : 15px;
	border-bottom-right-radius : 15px;
	box-shadow : 5px 5px 7px #C3C0C0;
	height: auto;
	width:940px;
}
</style>


<script type="text/javascript">

	
</script>



</head>


<body>

	<form>
		<!-- =============== ���ι��� ���� ��Ŭ���  ========== -->
		<div class="tollbar">
			<jsp:include page="/toolbar/toolBar.jsp"></jsp:include> 
		</div>
		<!-- =========== �̱���  ================ -->
		
		<table class="outer" style="margin-top:15px; border-top:1px;">
		  <tbody class="inner">
			<tr>
			<td valign="top">
			  <table style="margin-top:15px;">
			    <tbody>
			      <tr>
			        <td style="allign:center;">
					  <img  style="width:40px; margin: 10px;" alt="" src="\resources\images\admin\Qicon.png">
				    </td>
				   </tr>
				  <tr>
				    <td align="center" height="33"></td>
			      </tr>
			    </tbody>
			  </table>
			</td>
		   <td valign="top">
		   	 <table style="margin-top:15px;">
		   	   <tbody>
		   	    <tr>
		   	      <td width="680px;">
		   	        <table>
		   	          <tbody>
		   	            <tr>
		   	              <td colspan="2">
		   	                <table>
		   	                   <tbody>
		   	                    <tr>
		   	                      <td>
								    <font>	
								  	  asdfasdfasdfAasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfadas
								    </font>
								   </td>
							     </tr>
							     <tr>
							      <td style="font-size:9pt;font-family:����; color:#4EC2F8;">����</td>
						   		  <td></td>
							     </tr>
							   </tbody>
							  </table>
							</td>
						  </tr>
						 <tr>
						  <td>
				 	       <font style= "font-size:11pt; color: rgb(240, 168, 72);">
				 	         <i class="fas fa-clock"></i>
	 					            ���������� ������ �����ϼ̽��ϴ�.
					       </font>
					     </td>
						</tr>
					   </tbody>
					  </table>
					 </td>
					</tr>
				  <tr>
				   <td>
			         <table>
			           <tbody>
			             <tr>
			               <td valign="top">
			                 <img style="width :40px;margin: 10px;" src="\resources\images\admin\Aicon.png">
			               </td>
			               <td valign="top">
			                <table>
			                  <tbody>
			                    <tr>
			                      <td>
			                       <label for="exampleFormControlTextarea1"></label>
	     			 		   	   <textarea class="form-control"  style="width:460px; transform: translate(0%,-15px);min-height: 100px" id="exampleFormControlTextarea1" rows="3"></textarea>
	     			 		   	  </td>
	     			 		   	  <td valign="top" >
	     			 		   	  	<button type="button" class="btn btn-primary"  style=" margin:10px; height: 70px;">�亯�ϱ�</button>
	     			 		   	  </td>
	     			 		   	 </tr>
	     			 		   	</tbody>
	     			 		  </table>
	   	 			 		 </td>
	   	 			 		</tr>
	   	 			 	  </tbody>
	   	 			 	 </table>
	   	 			 </td>
	   	 			</tr>
	   	 			<!-- �亯�� �� ���� html -->
	   	 		  <tr>
	   	 			<td>
	   	 			 <table>
	   	 			  <tbody>
	   	 			  <!-- ������� append -->
	   	 			   <tr>
	   	 			    <td valign="top">
	   	 			      <img style="width :40px;margin: 10px;" src="\resources\images\admin\Aicon.png">
						</td>
						 <td valign="bottom">
						  <table>
						   <tbody>
						    <tr>
						     <td>
						      <font>
						                 ������ �亯������ �亯������ �亯������ �亯������ �亯������ �亯������ �亯������ �亯
						      </font>
						     </td>
						    </tr>
						     <tr>
   	 			 			  <td>
   	 			        	  <font style= "font-size:11pt; color: rgb(240, 168, 72);">
   	 			        	   <i class="fas fa-user-clock"></i>
 					  		       �����ڴ��� ������ �亯�ϼ̽��ϴ�.
				    			</font>
   	 			  			 </td>
   	 			 			 </tr>
						   </tbody>
						  </table>
						 </td>	   	 			   
	   	 			   </tr>
	   	 			  </tbody>
	   	 			 </table>
	   	 			</td>
	   	 	      </tr>
	   	 	      <!-- ������ ��� html ��  -->
	   	 		</tbody>
		   	   </table>
		   	 </td>
		   	</tr>
		   </tbody>
		  </table>
		 </form>
		
		
		
	  
	  
	  
	  
</body>

</html>