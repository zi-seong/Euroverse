<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<!-- 
<style>
 .sidebar{
	position: fixed;
	top: 200px;
 
}
@media screen and (max-width: 1000px) { 
.sidebar {
 display: none; 
 
 } 
 }
</style>
 -->

	<!-- Custom styles for this template -->
	<!-- ���� ���̵�ٸ� ���� CSS... �ȵż� �� ��ũ��Ʈ ��°�� �־�� -->
    <!-- <link href="/css/bootstrapDashboardCustomStyle.css" rel="stylesheet"> -->
	<style type="text/css">
		/* body {
		  font-size: .875rem;
		} */
		.feather {
		  width: 16px;
		  height: 16px;
		  vertical-align: text-bottom;
		}
		
		/* Sidebar */
		.sidebar {
		 /* position: fixed;
		  top: 300px;
		  bottom: 0;*/
		  left: 0;
		  z-index: 40; /* Behind the navbar */
		  padding: 48px 0 0; /* Height of navbar */
          width: 20%;
		}
		.sidebar-sticky {
		  position: relative;
		  top: 0;
		  height: calc(100vh - 48px);
		  padding-top: .5rem;
		  overflow-x: hidden;
		  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
		}
		@supports ((position: -webkit-sticky) or (position: sticky)) {
		  .sidebar-sticky {
		    position: -webkit-sticky;
		    position: sticky;
		  }
		}
		
		.sidebar .nav-link {
		  font-weight: 500;
		  color: #333;
		}
		.sidebar .nav-link .feather {
		  margin-right: 4px;
		  color: #999;
		}
		.sidebar .nav-link.active {
		  color: #00c2c7;
		}
		.sidebar .nav-link:hover .feather,
		.sidebar .nav-link.active .feather {
		  color: inherit;
		}
		.sidebar-heading {
		  font-size: .75rem;
		  text-transform: uppercase;
		}
		
		/* Content */
		
		[role="main"] {
		  padding-top: 133px; /* Space for fixed navbar */
		}
		@media (min-width: 768px) {
		  [role="main"] {
		    padding-top: 48px; /* Space for fixed navbar */
		  }
		}
		
		/* Navbar */
		/* .navbar-brand {
		  padding-top: .75rem;
		  padding-bottom: .75rem;
		  font-size: 1rem;
		  background-color: rgba(0, 0, 0, .25);
		  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
		} */
		.navbar .form-control {
		  padding: .75rem 1rem;
		  border-width: 0;
		  border-radius: 0;
		}
		.form-control-dark {
		  color: #fff;
		  background-color: rgba(255, 255, 255, .1);
		  border-color: rgba(255, 255, 255, .1);
		}
		.form-control-dark:focus {
		  border-color: transparent;
		  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
		}
	
	
		.bd-placeholder-img {
	        font-size: 1.125rem;
	        text-anchor: middle;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	      }
	
	      @media (min-width: 768px) {
	        .bd-placeholder-img-lg {
	          font-size: 3.5rem;
	        }
	      }
	</style>
	
	<!-- ICON ����� ���� ��ũ��Ʈ ����Ʈ -->
	<!-- https://feathericons.com/ -->
	<script src="https://unpkg.com/feather-icons"></script>
	

	<script>
	
		$(function(){
			$(".nav-link:contains('����')").on("click" ,function(){
				$(self.location).attr("href","/user/getUser");
			});
			
		/* 	$(".nav-link:contains('�� ���� ����')").on("click" ,function(){
				$(self.location).attr("href","/user/updateUser");
			}); */
			
			$(".nav-link:contains('����Ʈ')").on("click" ,function(){
				$(self.location).attr("href","/myPage/pointList");
			});
			
			$(".nav-link:contains('�Խñ�')").on("click" ,function(){
				$(self.location).attr("href","/myPage/myPostCommentList");
			});
			
			$(".nav-link:contains('�ϸ�ũ')").on("click" ,function(){
				$(self.location).attr("href","/myPage/myBookMarkList");
			});
			
			
			$(".nav-link:contains('�ʴ�')").on("click" ,function(){
				//alert("������");
				$(self.location).attr("href","/myPage/myOfferList");
			});
			
/* 			$("#myOfferList").on("click" ,function(){
				$(self.location).attr("href","/myPage/myOfferList");
			}); */
			
			
			$(".nav-link:contains('��ǰ')").on("click" ,function(){
				//alert("������");
				$(self.location).attr("href","/myPage/likeOrderList");
			});
			
			$(".nav-link:contains('����')").on("click" ,function(){
				$(self.location).attr("href","/myPage/addQnaAndQnaList");
			});
			
			/* $(".nav-link:contains('1:1���Ǹ��')").on("click" ,function(){
				alert("������");
				//$(self.location).attr("href","/user/getUser");
			});
			 */
		/* 	$(".nav-link:contains('�⼮üũ')").on("click" ,function(){
				$(self.location).attr("href","/user/getUser");
			}); */
			
		});
		
		function checkMyPageCode(){

			$('.nav-link').each( function(index){
				
				var myPageCodeThis = $(this).attr('href').substring(1,2);
				console.log(myPageCodeThis);
				
				if( myPageCodeThis == maPageCode ){
					//var appendHtml = '<span class="sr-only">(current)</span>';
					//$(this).append(appendHtml);
					$(this).addClass('active');
				}
			});
		}
		
		setTimeout(function(){
			checkMyPageCode();
		},5);
		
		
		
	</script>





	<!-- ���� Plan ���� ���� Start /////////////////////////////////////////////////////////// -->
	<nav class="col-md-2 d-none d-md-block sidebar sticky-top" style="padding-top:0px; padding-left:25px;padding-right: 20px;">
      <div class="sidebar-sticky">
       <div id="blank-top" style="height: 70px"></div>
        <ul class="nav flex-column" style="text-align: right;">
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#M">
              �� ���� ��ȸ &nbsp; <span data-feather="smile"></span>
            </a>
          </li>
   <!--        <li class="nav-item">
            <a class="nav-link scroll" href="#E">
              �� ���� ���� &nbsp;<span data-feather="settings"></span>
            </a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link scroll" href="#P">
              ����Ʈ ��� ���� &nbsp; <span data-feather="database"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#C">
              ���� �Խñ� / ��� &nbsp; <span data-feather="edit"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#B">
              ���� �ϸ�ũ &nbsp; <span data-feather="bookmark"></span>
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link scroll" href="#O">
              �÷��� �ʴ� &nbsp; <span data-feather="users"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#L">
              ���� ���� ��ǰ  &nbsp; <span data-feather="heart"></span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link scroll" href="#Q">
              1:1 ����  &nbsp; <span data-feather="help-circle"></span>
            </a>
          </li>
<!--           <li class="nav-item">
            <a class="nav-link scroll" href="#A" id="choolCheck">
              �⼮üũ  &nbsp; <span data-feather="calendar"></span>
            </a>
          </li> -->
        </ul>


        <!-- Top ��ư -->
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-5 mb-1 text-muted">
        	<span></span>
        	<span>
        		<a href="#" title="top" class="scroll"> top <span data-feather="arrow-up"></span></a>
        	</span>
        </h6>
        
      </div>
    </nav>
	<!-- ���� Plan ���� ���� End //////////////////////////////////////////////////// -->
	
	
	<script>
		/* icon ����� ���� ��ũ��Ʈ */
		/* https://github.com/feathericons/feather#feather ���� */
		feather.replace();
         $('#blank-top').hide();
             $(window).scroll(function() {
                if ($(document).scrollTop() > 270) {
                    $('#blank-top').show();
                } else {
                    $('#blank-top').hide();
                }
             });
	</script>


 