<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<!DOCTYPE html>

<style>

.input-container{
	position:relative;
	margin-bottom:25px;
}
.input-container label{
	position:absolute;
	top:0px;
	left:0px;
	font-size:16px;
    pointer-event:none;
	transition: all 0.5s ease-in-out;
}
.input-container input{ 
  border:0;
  border-bottom:1px solid #555;  
  background:transparent;
  width:100%;
  padding:8px 0 5px 0;
  font-size:16px;
}
.input-container input:focus{ 
 border:none;	
 outline:none;
 border-bottom:1px solid #e74c3c;	
}
/* .btn{
	color:#fff;
	background-color:#e74c3c;
	outline: none;
    border: 0;
    color: #fff;
	padding:10px 20px;
	text-transform:uppercase;
	margin-top:50px;
	border-radius:2px;
	cursor:pointer;
	position:relative;
} */
/*.btn:after{
	content:"";
	position:absolute;
	background:rgba(0,0,0,0.50);
	top:0;
	right:0;
	width:100%;
	height:100%;
}*/
.input-container input:focus ~ label,
.input-container input:valid ~ label{
	top:-12px;
	font-size:12px;
	
}











#loginModal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        #loginModal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
#loginModalDialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
   
</style>


<script>

    $(function() {
        // ���̹� ���̵�� �α��� �̹��� Ŭ�� �� 
        $("#naverLogin").on("click", function() {
        	
    		window.open("/view/user/openNaver.jsp",
					"popWin",
					"left=500, top=100, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
/*             $.ajax({
                url: "/user/json/naverLoginUrlMake",
                method: "get",
                dataType: "json",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(JSONData) {
                    self.location = JSONData.url;
                }
            }) */
        })

        $("#googleLogin").on("click", function() {
        	window.open("/view/user/openGoogle.jsp",
					"popWin",
					"left=500, top=100, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
        
        
        })

/*         $("#kakaoLogin").on("click", function() {
            $.ajax({
                url: "/user/json/kakaoLoginUrlMake", // �ܼ� URL�� ����� ���� UserController 
                method: "get", // �Ѱ� �� Data�� �����Ƿ� get
                dataType: "json", // �޾� �� data�� Type�� json���� ���� 
                headers: { // dataType�� json�̹Ƿ� ���� ��(Accept)�� ���� ��(Content-Type)�� ��� application/json���� ����  
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(JSONData) { // success ��, 
                    self.location = JSONData.url; // json/kakaoLoginUrlMake���� return�� Map<String, String>���� ������
                }
            })
        }) */
        
        
        $("#kakaoLogin").on("click", function(){
				// ���� �˾�â���� īī�� �α����� �����ϱ� ���� �ƹ� �ǹ̾��� jsp�� ����
				window.open("/view/user/openKakao.jsp",
						"popWin",
						"left=500, top=100, width=537, height=750, marginwidth=0, marginheight=0, fullscreen=no, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
			})
    })

 /*    $(document).ready(function() {      //���̵� �����ϴ� �Լ�
        var userInputId = getCookie("userInputId"); //����� ��Ⱚ ��������
        $("#loginUserId").val(userInputId);

        if ($("#loginUserId").val() != "") { // �� ���� ID�� �����ؼ� ó�� ������ �ε�
            // ���̵� �����ϱ� üũ�Ǿ����� ��,
            $("#idSaveCheck").attr("checked", true); // ID �����ϱ⸦ üũ ���·� �α�.
        }

        $("#idSaveCheck").change(function() { // üũ�ڽ��� ��ȭ�� �߻���
            if ($("#idSaveCheck").is(":checked")) { // ID �����ϱ� üũ���� ��,
                var userInputId = $("#loginUserId").val();
                setCookie("userInputId", userInputId, 7); // 7�� ���� ��Ű ����
            } else { // ID �����ϱ� üũ ���� ��,
                deleteCookie("userInputId");
            }
        });

        // ID �����ϱ⸦ üũ�� ���¿��� ID�� �Է��ϴ� ���, �̷� ���� ��Ű ����.
        $("#loginUserId").keyup(function() { // ID �Է� ĭ�� ID�� �Է��� ��,
            if ($("#idSaveCheck").is(":checked")) { // ID �����ϱ⸦ üũ�� ���¶��,
                var userInputId = $("#loginUserId").val();
                setCookie("userInputId", userInputId, 7); // 7�� ���� ��Ű ����
            }
        });
    }); 
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) end = cookieData.length;
           		cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
*/

    $(function() {
        var userId = $('#loginUserId');
        var pwd = $('#loginPwd');
        var h6 = document.getElementsByClassName('loginH6');
        $("#loginUserId").keydown(function(key) {
            if (key.keyCode == 13) {
                loginAjax(userId, pwd);
            }
        });

        $("#loginPwd").keydown(function(key) {
            if (key.keyCode == 13) {
                loginAjax(userId, pwd);
            }
        });

        $("#loginButton").on("click", function() {
            loginAjax(userId, pwd);
        });
    })

    function loginAjax(userId, pwd) {
        $.ajax({
            url: "/user/json/login",
            method: "post",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            data: JSON.stringify({
                userId: userId.val(),
                pwd: pwd.val()
            }),
    		success : function(JSONData){
    			console.log(JSONData);
    			if(JSONData.result == 'ok'){
    				$("#loginModal").modal("hide");
    				var userId = JSONData.userId;
    				swal({
						   icon : 'success',
						  title : userId+"�� ȯ���մϴ�.",
						  text:" ",
						  button : false,
						})
			    	setTimeout(function() {     
	    				location.reload();
			    	}, 700);
    				
    			}else if(JSONData.result=='unReg'){
    				swal({
    					   icon : 'info',
    					  buttons: {confirm:{value:"T",text:"��",className:"btn btn-outline-primary",},cancle:{value:"F",text:"�ƴϿ�",className:"btn btn-outline-secondary",},},
    					  title : "Ż���� ȸ���Դϴ�.",
    					  text : "�����Ͻðڽ��ϱ�?" 
    					}).then((value) =>{
    						if(value=='T'){
    							$(self.location).attr("href","/user/comeBack?userId="+JSONData.userId);
    						}
    						else if(value=='F'){
    						}
    					
    					});
    			}else if(JSONData.result =='errorId'){
    				swal({
 					   icon : 'info',
 					  title : "�������� �ʴ� ���̵��Դϴ�.",
 					  text:" ",
 					  button : false,
 					})
    			}else if(JSONData.result =='errorPwd'){
    				swal({
 					   icon : 'info',
 					  title : "��й�ȣ�� Ʋ�Ƚ��ϴ�.",
 					  text:" ",
 					  button : false,
 					})
    			}else{
    				swal({
  					  icon : 'warning',
  					  title : "����",
  					  text:" ",
  					  button : false,
  					})
    			}
    		}//success
        }) //ajax
    }
</script>

	<div class="modal fade " id="loginModal">
	    <!-- <div class="modal-dialog modal-lg"> -->
	    <div class="modal-dialog" id="loginModalDialog">
	        <div class="modal-content"  style="width: 800px;height:400px; margin-left: -140px;">
	             <div class="modal-body">
			                <img alt="" src="/resources/images/userImages/login.jpg" width="500px" height="398px;" style="margin-left: -20px;margin-top: -16px;">
	                <form id="modalForm" style="margin-left: 500px;margin-top: -380px;font-family: 'NIXGONM-Vb';"> 
	                	<div style="text-align: center; height: 110px;">
	                		<img alt="" src="/resources/images/icon/euroverse_text.png" width="150px" height="auto;">
	                	</div>
	                	
	                	
	                	
	                	<div>
							<div class="input-container">
								<input type="text" name="userId" id="loginUserId" required=""/>
								<label><b>���̵�</b></label>		
							</div>
							<div class="input-container">		
								<input type="password" name="pwd" id="loginPwd" required="" style="font-family: serif;"/>
								<label><b>��й�ȣ</b></label>
							</div>
							
							<div style="text-align:center;font-size: 12px;">
								<a href="/user/searchId"><b>���̵�ã��</b></a>
								��
								
								<a href="/user/findPwd"><b>��й�ȣã��</b></a>
							
							</div>
							
							<div style="text-align: center;margin-top: 5px;">
								<img id="kakaoLogin" src="/resources/images/userImages/kakaoImage.png" width="30" height="30" style="border-radius: 100px;cursor: pointer;"/>
	                        <img id="naverLogin" src="/resources/images/userImages/naverImage.PNG" width="30" height="30" style="border-radius: 100px; margin-left: 10px;cursor:pointer;" />
	                        <img id="googleLogin" src="/resources/images/userImages/googleImage.png" width="30" height="30" style="border-radius: 100px;margin-left:10px;cursor:pointer;"/>
							
							</div>
							
							
							<div style="text-align: center;margin-top: 10px;">
							<button type="button" id="loginButton" class="btn btn-outline-primary" style="width:200px;">�α���</button>
							</div>
	                	</div>
	                </form>
	            </div>
	            <!--modal body End  -->
	        </div>
	        <!--modal content End  -->
	    </div>
	    <!--modal dialog End  -->
	</div>
	<!--myModal End  -->
	
<!--���� �α����� ���� ��ũ��Ʈ�±�  -->
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
