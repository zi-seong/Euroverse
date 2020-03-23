<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>Euroverse</title>
    <!-- ���� : http://getbootstrap.com/css/   ���� -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/carousel/">
    <!-- sweetalert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
    

    <!-- Use Swiper from CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>


    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!-- AOS CDN2 :: https://michalsnik.github.io/aos/-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!--owl carousel CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
        .post-sm {
                font-size: 9pt;
        }
        .euro-btn {
            color: white;
            background-color: #009688;
        }
        .euro-btn:hover {
            color:lightgray;
            background-color: #005582;
        }
        .category {
            font-size: 12pt;
            font-weight: 400;
            color: #999999;
        }
        .category span:hover{
            font-size: 12pt;
            font-weight: 700;
            color: #00c2c7;
        }
        .ctgr-on {
            color:#00c2c7;
            font-weight: 700;
        }
        .ctgr-off {
            color: #999999;
        }
        
        .upper-wrap {
            
        }
        .category {
            float:left;
            vertical-align: middle;
        }
        .search-section {
            float:right;
            vertical-align: middle;
        }
        #boardTitle {
            display: inline-block;
            background-color:#ffde3e;
            font-family: 'NIXGONM-Vb';
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/community/getPostList").submit();
		}
		
		 $(function() {
			 $( ".fas.fa-search" ).on("click" , function() {
			 	fncGetUserList(1);
			 });
		 });
		
		 $(function() {
			 
			 var boardName = $("input[name='boardName']").val();
			 
			$( "td:nth-child(2)" ).on("click" , function() {
			     var postId = $(this).find($("input[name='postId']")).val();
			     var boardName = $(this).find($("input[name='boardName']")).val();
				 self.location ="/community/getPost?postId="+postId+"&boardName="+boardName;
			});
			
			$("#boardTitle").on("click", function(){
				self.location = "/community/getPostList?boardName="+boardName;
			});
		});	
		 
		function bestPost(sorting){

			if(sorting == 0){
				$("select[name='sorting']").val("0").prop("selected", true);
			}else if(sorting == 1){
				$("select[name='sorting']").val("1").prop("selected", true);
			}else{
				$("select[name='sorting']").val("2").prop("selected", true);
			}
			fncGetUserList(1);
		}
		
		function onKeyDown() {
			if(event.keyCode == 13) {
		    	fncGetUserList(1);
		    }
		}
        
        jQuery(document).ready(function($) {
         
            var size = '${search.sorting}';
            if(size.length==0 ) {
                console.log(size.length+" badge-info");
                $('.post-ctgr').addClass('ctgr-on');
            } else {
                console.log(size.length+" badge-secondary");
                $('.post-ctgr').addClass('ctgr-off');
            }
            
        });
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar/toolBar.jsp" />
	<jsp:include page="/toolbar/pushBar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="row">
            <jsp:include page="/view/community/sidebar.jsp"/>
            
        <div style="width:60%;margin-left:5%;">
	
		<div class="h4" id="boardTitle" style="font-weight: bold; margin-top:40px;padding-left:10px;">
			�α�۰Խ���
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
		    
		    <div class="col-md-12 text-right" style="margin: 10px 0 15px 0">

		    	<div style="float:left;padding-top:20px;padding-left:10px;font-size:19px;">
		    	  <c:if test="${search.sorting == 0}">
		    		<span class="badge badge-info" onclick="bestPost('0');">�ϰ��α��</span>
		    	  </c:if>
		    	  <c:if test="${search.sorting != 0}">
		    		<span class="badge badge-secondary" onclick="bestPost('0');">�ϰ��α��</span>
		    	  </c:if>
		    	  <c:if test="${search.sorting == 1}">
		    		<span class="badge badge-info" onclick="bestPost('1');">�ְ��α��</span>
		    	  </c:if>
		    	  <c:if test="${search.sorting != 1}">
		    		<span class="badge badge-secondary" onclick="bestPost('1');">�ְ��α��</span>
		    	  </c:if>
		    	  <c:if test="${search.sorting == 2}">
		    		<span class="badge badge-info" onclick="bestPost('2');">�����α��</span>
		    	  </c:if>
		    	  <c:if test="${search.sorting != 2}">
		    		<span class="badge badge-secondary" onclick="bestPost('2');">�����α��</span>
		    	  </c:if>	
		    	</div>

			    <form class="form-inline mt-2 mt-md-0" name="detailForm" style="float:right;">
			      <input type="hidden" id="boardName" name="boardName" value="${param.boardName}"/>
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" style="height: 35px; width: 85px; font-size: 13px; margin-right: 2px;" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>����</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�г���</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>�±�</option>
					</select>
				  </div>
				  
				  <div class="form-group" style="display:none;">
				    <select class="form-control" name="sorting" style="height: 35px; width: 120px; font-size: 13px; margin-right: 2px;" >
						<option value="0"  ${ ! empty search.sorting && search.sorting==0 ? "selected" : "" }>�ϰ��α��</option>
						<option value="1"  ${ ! empty search.sorting && search.sorting==1 ? "selected" : "" }>�ְ��α��</option>
						<option value="2"  ${ ! empty search.sorting && search.sorting==2 ? "selected" : "" }>�����α��</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control mr-sm-2" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" style="height: 35px; font-size: 13px;" onKeyDown="onKeyDown();">
				  </div>
				  
				  &nbsp;<i class="fas fa-search"></i>
			
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
	<div class="table-responsive" style="font-size:14px;">	
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover" style="text-align:center;">
      
        <thead>
          <tr>
            <th scope="col" style="width: 10%">�۹�ȣ</th>
            <th scope="col" style="width: 50%">����</th>
            <th scope="col" style="width: 16%">�ۼ���</th>
            <th scope="col" style="width: 10%">�ۼ���</th>
            <th scope="col" style="width: 7%">��ȸ��</th>
            <th scope="col" style="width: 7%">��õ��</th>
          </tr>
        </thead>

        <tbody>

          <c:set var="i" value="0" />
          <c:forEach var="post" items="${list}">
            <tr>
                <c:if test="${post.postGrade == 'N'}">
                    <th scope="row" style="color:#CE1717;">���� <i class="fas fa-bullhorn"></i></th>
                    <td style="text-align:left;">
                        <input type="hidden" id="postId" name="postId" value="${post.postId}" />
                        <input type="hidden" id="boardName" name="boardName" value="${post.boardName}" />
                        <span>${post.postTitle}</span> <span style="color:red;">(${post.comments})</span></td>
                </c:if>
                <c:if test="${post.postGrade == 'B' || post.postGrade == null}">
                    <c:set var="i" value="${ i+1 }" />
                    <th scope="row"><font class='post-sm'>${post.postId}</font></th>
                    <td style="text-align:left;">
                        <input type="hidden" id="postId" name="postId" value="${post.postId}" />
                        <input type="hidden" id="boardName" name="boardName" value="${post.boardName}" />
                        <c:if test="${post.boardName=='A'}">
                            [�����Խ���]
                        </c:if>
                        <c:if test="${post.boardName=='B'}">
                            [��������]
                        </c:if>
                        <c:if test="${post.boardName=='D'}">
                            [����ã��]
                        </c:if>
                        <c:if test="${post.boardName=='E'}">
                            [�÷��ʰ���]
                        </c:if>
                        <c:if test="${post.boardName=='F'}">
                            [�����ı�]
                        </c:if>
                        <c:if test="${post.boardName=='G'}">
                            <c:if test="${post.qnaKategorie=='G'}">
                                [QnA ��Ʈ]
                            </c:if>
                            <c:if test="${post.qnaKategorie=='H'}">
                                [QnA ����]
                            </c:if>
                            <c:if test="${post.qnaKategorie=='I'}">
                                [QnA ����]
                            </c:if>
                            <c:if test="${post.qnaKategorie=='J'}">
                                [QnA ����]
                            </c:if>
                            <c:if test="${post.qnaKategorie=='K'}">
                                [QnA ����,���,ȯ��]
                            </c:if>
                            <c:if test="${post.qnaKategorie=='L'}">
                                [QnA ��Ÿ]
                            </c:if>
                        </c:if>
                        ${post.postTitle} <span style="color:red;">(${post.comments})</span>
                    </td>

                </c:if>
                <td><img src='/resources/images/userImages/${post.user.userImg}' style='border-radius:50%;width:25px;height:25px;border:solid 2px #009688;margin-right:0.5em;'>${post.nickName}</td>
                <td>
                    <font class='post-sm'>
                        <fmt:formatDate value="${post.postDate}" pattern="yyyy.MM.dd" />
                    </font>
                </td>
                <td><font class='post-sm'>${post.views}</font></td>
                <td><font class='post-sm'>${post.postLikeCount}</font></td>
            </tr>
           </c:forEach>

          </tbody>

          </table>
        
        </div>
        </div>
    </div>
    <!--  ȭ�鱸�� div End /////////////////////////////////////-->

    <!-- PageNavigation Start... -->
    <jsp:include page="../../common/pageNavigator_new.jsp" />
    <!-- PageNavigation End... -->

    <jsp:include page="/toolbar/footer.jsp" />
</body>

</html>