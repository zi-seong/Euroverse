<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
    /*���� ä�� div �����̵�*/
    #acc-slide * {
        margin: 0;
        padding: 0;
    }

    ul,
    li {
        list-style: none;
    }

    #acc-slide {
        font-family: 'NanumBarunGothic';
        font-weight: 400;
        background-color: white;
        display: none;
        height: 500px;
        width: 300px;
        /*position: relative;*/
        border: solid 1px #D2D2D2;
        position: fixed;
        right: 10px;
        bottom: 30px;
        overflow: hidden;
        z-index: 300;
    }

    #acc-slide ul {
        width: 200%;
        height: 100%;
        transition: 0.5s;
    }

    #acc-slide ul:after {
        content: "";
        display: block;
        clear: both;
    }

    #acc-slide li {
        float: left;
        width: 50%;
        height: 100%;
    }

    #acc-slide input[type=radio] {
        display: none;
    }

    #acc-slide label {
        display: inline-block;
        vertical-align: middle;
        width: 10px;
        height: 10px;
        border: 2px solid #666;
        background: #fff;
        transition: 0.3s;
        border-radius: 50%;
        cursor: pointer;
    }

    #acc-slide .pos {
        display: none;
        text-align: center;
        position: absolute;
        bottom: 10px;
        left: 0;
        width: 100%;
        text-align: center;
    }

    #pos1:checked~ul {
        margin-left: 0%;
    }

    #pos2:checked~ul {
        margin-left: -100%;
    }


    #pos1:checked~.pos>label:nth-child(1) {
        background: #666;
    }

    #pos2:checked~.pos>label:nth-child(2) {
        background: #666;
    }

    /*���� ä�ù� style*/
    #accChat {
        height: 100%;
        width: 100%;
        color: #333;
        font-size: 10px;
        background-color: #C5ECE9;
        z-index: 190;
    }

    .accChat.info {
        position: static;
        height: 7%;
        background-color: #C5ECE9;
    }

    .accChat.output {
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 700;
        position: static;
        height: 85%;
        width: 100%;
        background-color: white;
        overflow-y: auto;
        overflow-x: hidden;
    }

    .accLobby.content::-webkit-scrollbar, .output::-webkit-scrollbar {
        width: 10px;
    }

    .accLobby.content::-webkit-scrollbar-thumb, .output::-webkit-scrollbar-thumb {
        background-color: #858585;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
    }

    .accLobby.content::-webkit-scrollbar-track, .output::-webkit-scrollbar-track {
        background-color: transparent;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
    }

    .accChat.input {
        position: static;
        height: 40px;
        background-color: #C5ECE9;
    }


    /*�����ܵ�*/
    div.push-bar-menu {
        position: fixed;
        display: table;
        top: 3px;
        right: 10px;
        z-index: 9999;
    }
    
    div.push-bar-menu.shrink {
        position: fixed;
        display: table;
        top: 18px;
        right: 10px;
        z-index: 9999;
    }
    
    
    div.icon {
        display: table-cell;
        vertical-align: middle;
        /*border: solid 2px #858585;
        border-radius: 5px;*/
        width: 40px;
        height: 40px;
        color: #858585;
        font-size: 17pt;
        /*text-align: center;*/
    }



    /*Ǫ�ø���Ʈ*/
    #push-layer {
        background-color: white;
        font-weight: 300;
        border: solid 1px #D2D2D2;
        display: none;
        height: 500px;
        width: 300px;
        position: fixed;
        right: 10px;
        bottom: 30px;
        z-index: 300;
    }

    /*�÷���ä��â*/
    #plan-chat-layer {
        display: none;
        border: solid 1px #D2D2D2;
        height: 500px;
        width: 300px;
        position: fixed;
        right: 10px;
        bottom: 30px;
        background-color: white;
        z-index: 300;
    }

    .planChat.output {
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 700;
        height: 92%;
        position: static;
        background-color: white;
        overflow: auto;
    }

    .planChat.input {
        height: 40px;
        position: static;
        background-color: #C5ECE9;
    }

    .push-bar-menu>div>div:hover {
        color: #339999;
    }
    

</style>


<div class="push-bar-menu">
   <div class="icon-table" style=��display:table-row;��>
        <div class="icon push-list" title="Ȱ���˸�">
            <i class="fas fa-bell" ></i>
            <span class="unreadCount" style='position: relative; right: 10px; top:-10px; '></span>
        </div>
    </div>
    <div class="icon-table" style=��display:table-row;��>
        <div class="icon acc-chat" title="����ä��">
            <i class="fas fa-comments" ></i>
        </div>
    </div>
    <div class="icon-table" style=��display:table-row;��>
        <div class="icon plan-chat" title="�÷��� ä��">
            <i class="fas fa-comment fa-flip-horizontal"></i>
        </div>
    </div>
</div>


<div id="push-layer">
    <div class="deletePush" style='padding: 5%;background-color:#8ad0d6;font-weight: 700'>
        <span>Ȱ�� �˸�&ensp;</span><span class="totalCount"></span>
        <span style='float:right;'><a href='javascript:deletePush()'><i class="far fa-trash-alt" style="color:white;"></i></a></span>
    </div>
    <div class="pushList" style="overflow-y:auto; width:298px; height:88%;"></div>
</div>




<div id="acc-slide">
    <input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <ul>
        <!-- ä�ø�� -->
        <li>
            <div class="accLobby title" style='padding: 5%;background-color:#8ad0d6;font-weight:700'>
                ���� ä��
            </div>
            <div class="accLobby content" style="overflow-y:auto; width:300px; height:88%;"></div>
        </li>
        <!--ä�ù�-->
        <li>
            <div id="accChat">
                <div id="accChat">
                    <div class="accChat info">
                        <i class="fas fa-arrow-left fa-2x" style="float:left;margin:5px;"><span style="margin:5px;"></span></i>
                        <p style="float:right;margin: 5px;"><i class="fas fa-bars fa-2x" data-toggle="modal" data-target="#accModal"></i></p>
                    </div>
                    <div class="accChat output" style="padding:5px"></div>
                    <div class="accChat input" style="padding:5px">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-sm" id="input-accChat" placeholder="�޽����� �Է��ϼ���">
                            <span class="input-group-btn" onclick="sendAccMessage()">
                                <button class="btn btn-default btn-sm" type="button"><i class="fab fa-telegram-plane"></i></button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</div>



<div id="plan-chat-layer">
    <div class="planChat output" style="padding:5px"></div>
    <div class="planChat input" style="padding:5px">
        <div class="input-group">
            <input type="text" class="form-control form-control-sm" id="myChat" placeholder="�޽����� �Է��ϼ���">
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="button"><i class="fab fa-telegram-plane"></i></button>
            </span>
        </div>
    </div>
</div>

<!--ä�� ������ ��� ���-->
<div class="modal fade" id="accModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accModalLabel">ä�ù� ����</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-group accModal">
                    ä�� ������ ���
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var userId = '${user.userId}';
    var pushAddr = "ws://localhost:8080/userSocket/";
    var userSocket;

    if (userId != null && userId != '') { // �α��� ���� ���� ������ ����
        pushAddr += userId;
        console.log("������ �ּ� "+pushAddr);
        userSocket = new WebSocket(pushAddr);
    
        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
        userSocket.onopen = function(message) {
            console.log('[push] : ����ƴ�.')
            //�� ���Ͽ��� �޽����� ���� ���� �� ȣ��Ǵ� �̺�Ʈ
            userSocket.onmessage = function(message) {
                console.log("push �Դ� ::: " + message.data)
                var obj = JSON.parse(message.data);
                var pushType = obj.pushType;
                //console.log("pushType :: " + pushType);
                if (pushType == 'P') {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 5000,
                        timerProgressBar: true,
                        onOpen: (toast) => {
                            toast.addEventListener('click', function() {
                                self.location = "/plan/getPlan?planId=" + obj.refId;
                            })
                        }
                    })

                    Toast.fire({
                        icon: 'success',
                        title: obj.pushMsg + ', ���� �����̳���?'
                    });
                } else {
                    getPushList(userId);
                    getUnreadCount(userId);
                }
            };
            console.log('[push] : �����������.')
        };
        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
        userSocket.onclose = function(message) {
            console.log("push ������ ���������ϴ�.\n");
        };
        //�� ������ ������ ���� �� ȣ��Ǵ� �̺�Ʈ
        userSocket.onerror = function(message) {
            console.log("push ������ �߻��߽��ϴ�.\n");
        };
    }
    //������ ����
    function disconnect() {
        userSocket.close();
    }

    function sendPush(receiverId, pushType) {
        console.log('push ������.');
        var push = new Object();
        console.log("[sendPush] receiverId : " + receiverId + " || pushType : " + pushType);
        push.receiverId = receiverId;
        push.pushType = pushType;
        userSocket.send(JSON.stringify({
            push
        }));
        //console.log("push ������ ::" + JSON.stringify({push}));
    }

    function getPushList(userId) {
        $.ajax({
            url: "/push/json/getPushList/" + userId,
            type: "GET",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function(result) {
                console.log(result);
                var list = result.list;
                var resultPage = result.resultPage;
                var search = result.search;
                var totalCount = result.totalCount;
                $(".totalCount").html(totalCount);
                //console.log("totalCount : " + totalCount);
                //console.log("list.size : " + list.size);
                $(".pushList").html("");
                if ( totalCount == 0 ) {
                    $('.pushList').append("<p style='margin:1em;font-size:10pt;text-align:center;color:#999999'><i class=\"far fa-bell fa-2x\"></i><br/>Ȱ���˸��� �����ϴ�.<br/>�� �ۿ� �޸� ���, �����û, �÷����ʴ� �� ���ο� �ҽ��� �˷��帳�ϴ�.</p>");
                } else {
                    $.each(list, function(index, vo) {
                        showList(vo, 0);
                    })
                }

                //console.log("resultPage : " + resultPage);
                //console.log("search : " + search);
            },
            error: function(error, status) {
                console.log("�˸� ���� ��� ����");
                console.log(error.responseText);
                console.log(status);
            }
        })
    }

    // <���ѽ�ũ�� ----------------------------------------------------------------------------
    var pushPage = 2;
    var end = false;

    // ��ũ�� ����
    $(".pushList").scroll(function() {
        var scrollTop = $(this).scrollTop(); // ���� ��ũ���� ��ġ
        var innerHeight = $(this).innerHeight(); // �е����� ������ ���� .pushList ������ ����
        var scrollHeight = $(this).prop('scrollHeight'); // ��ũ�� ��Ű�� �ʾ��� ���� ��ü ����
        //console.log("ScrollTop : "+scrollTop+"|| innerHeight : "+innerHeight+"|| scrollHeight : "+scrollHeight);
        if (scrollTop + innerHeight >= scrollHeight) { // scrollTop() �� innerHeight() ���� ���� ���� scrollHeight() ���� ���ų� ũ�� �Ǹ� �� �Ʒ� ���� ����
            scrollList();
        }
    })

    // ��ũ�� ���ϴܿ� ��ġ �� �۵��� function(���ѽ�ũ��) : ����Ʈ ȣ��
    function scrollList() {
        if (end == true) { //�� �̻� �ҷ��� data�� ���� ��� return
            return;
        }
        var search = new Object();
        search.currentPage = pushPage;
        $.ajax({
            url: "/push/json/getPushList/" + userId,
            type: "POST",
            data: JSON.stringify({
                search
            }),
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function(list) {
                var length = list.length;
                if (length < 5) {
                    isEnd = true;
                }
                $.each(list, function(index, vo) {
                    showList(vo);
                })

                pushPage++;
            },
            error: function(error) {
                console.log("fetchList ����");
                console.log(error);
            }
        })
    }

    // Ǫ�ø���Ʈ ȣ�� �� �۵��� function : ����Ʈ ȭ�鿡 ���
    function showList(vo, type) {
        var tag = "";
        tag += "<table style='margin:5%;width:90%;'>"
        tag += "<tbody style='width:100%;'>"
        tag += "<tr>"
        tag += "<td style='text-align:center;width:10%;'>"
        tag += "<input type='checkbox' name='chk' id='" + vo.pushId + "' value='" + vo.pushId + "'>"; // style='display:none;'
        tag += "</td>"
        tag += "<td style='text-align:left;width:90%;'>"
        tag += "<font size='2'  font color='black'>"
        if (vo.pushType.trim() == 'C' || vo.pushType.trim() == 'R') {
            tag += "<a href='/community/getPost?postId=" + vo.refId + "&boardName=" + vo.boardName + "'>";
        } else if (vo.pushType.trim() == 'I') {
            tag += "<a href='/myPage/myOfferList' >"; // �ʴ� ��� ����Ʈ ��ũ
        } else if (vo.pushType.trim() == 'A') {
            tag += "<a href='/myPage/myOfferList?searchKeyword=party' >" // ���� ��û ��� ����Ʈ ��ũ
        }
        tag += vo.pushMsg + "</font></td>";
        tag += "<tr>";
        tag += "<td colspan='2' style='text-align:right;vertical-align:top;'>";
        tag += "<font size='1' font color='gray'>" + vo.pushTime + "</font></a>";
        tag += "</td>";
        tag += "</tr>";
        tag += "</tbody>"
        tag += "</table>"
        tag += "<style>"
        tag += "label { font-weight: normal; font-color: white; }"
        tag += "</style>";

        $(".pushList").append(tag);
    }

    // ----------------------------------------------------------------------------------------- ���ѽ�ũ��>

    function getUnreadCount(userId) {
        $.ajax({
            url: "/push/json/getUnreadCount/" + userId,
            type: "GET",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function(result) {
                console.log("�� ���� �˸� ���� ��� ���� : " + result + "��")
                var h = "<sup class=\"badge badge-pill badge-danger\" style='font-size: 3pt;'>" + result + "</sup>";
                $(".unreadCount").html(h);
            },
            error: function(error) {
                console.log("�� ���� �˸� ���� ��� ����");
                console.log(error);
            }
        })
    }

    function readPush(userId) {
        $.ajax({
            url: "/push/json/readPush/" + userId,
            type: "GET",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function() {
                console.log("�˸� �б� ����")
            },
            error: function(error) {
                console.log("�˸� �б� ����");
                console.log(error);
            }
        })
    }

    function deletePush() {
        console.log("���� ����")

        var arrayParam = new Array();
        //each�� loop�� ���鼭 checkbox�� check�� ���� ������ ����ش�.
        $("input:checkbox[name='chk']:checked").each(function() {
            arrayParam.push($(this).val());
        });
        //console.log("�迭!!! \n");
        //console.log(arrayParam);

        var formData = JSON.stringify(arrayParam);

        $.ajax({
            url: "/push/json/deletePush",
            type: "POST",
            data: formData,
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function() {
                console.log("�˸� ���� ����");
                getPushList(userId);
            },
            error: function(error) {
                console.log("�˸� ���� ����");
                console.log(error);
            }
        })
    }

    // ���� ä�� ���� function ================================================
    var chatRoomId;
    var accChatSocket;
    var accChatLayer = $(".accChat.output");
    var inputAccChat = $("#input-accChat");
    var chatRoomName;

    function getChatRoomList() {
        $.ajax({
            url: "/chat/json/getChatRoomList/" + userId,
            type: "GET",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function(result) {
                console.log("ä�ù� ��ȸ ����");
                if (result.length == 0 ) {
                    $(".accLobby.content").html("<p style='margin:1em;font-size:10pt;text-align:center;color:#999999'><i class=\"far fa-question-circle fa-2x\"></i><br/>���� ���� ���� ä���� �����ϴ�.<br/>�޴��� �������� ������ ��ģ �� ���࿡ �����Ͻ� �� �ֽ��ϴ�.</p>");
                } else {
                    showRoomList(result);
                }
            },
            error: function(error) {
                console.log("ä�ù� ��ȸ ����");
                console.log(error);
            }
        });
    }

    function showRoomList(list) {
        var html = "";
        //console.log("ä�ù� ��� ���� : " + list.length);
        html += "<table class='roomTable' style='border-collapse: separate;border-spacing:0 15px;width:90%;margin:5%;' >"
        for (var i in list) {
            html += "<tr onclick='enterRoom(\"" + list[i].chatRoomId + "\")'>";
            //html += "<input type='hidden' name='chatRoomId' value='"+list[i].chatRoomId+"'>";
            html += "<td class='td1' style='text-align:left;width:40px;'>";
            //=\"/resources/images/chatImg/"+list[i].chatImg+"\" 
            if( list[i].chatImg != 'null' ) {
                html += "<img style='border: 2px solid #ccc;border-radius: 50%;width:35px;height:35px;' src=\"/resources/images/chatImg/"+list[i].chatImg+"\">"
            } else {
                html += "<img style='border: 2px solid #ccc;border-radius: 50%;width:35px;height:35px;' src=\"/resources/images/userImages/defaultUserImage.jpg\">"
            }
            html += "</td>"
            html += "<td class='td2' style='text-align:left;min-width:150px;'>";
            html += "<b><font size='3'>" + list[i].chatRoomName + "&ensp;</font></b><font color=gray>" + list[i].chatMems.length + "</font><br/>";
            html += "<font size=2 color=gray>";
            try {
                if (list[i].lastChat.chatContent.length > 12) {
                    html += list[i].lastChat.chatContent.substring(0, 12) + '..';
                } else {
                    html += list[i].lastChat.chatContent
                }
                html += "</font>";
                html += "</td>";
                html += " <td class='td3' style='padding:4;text-align:left;' valign='top'>";
                html += "<font size=1 color=gray>" + list[i].lastChat.sendTime + "</font>";
                html += "</td>";
            } catch (e) {
            }
            html += "</tr>";
        }
        html += "</table>"
        $(".accLobby.content").html(html);
    }


    function enterRoom(roomId) {
        $('#pos2').prop('checked', true);
        chatRoomId = roomId;
        console.log("������ ä�ù� ��ȣ : " + roomId);
        var accChatAddr = "ws://192.168.0.82:8080/accSocket/" + roomId + "/" + userId;
        accChatSocket = new WebSocket(accChatAddr);
        //�� ������ ����Ǿ��� �� ȣ��Ǵ� �̺�Ʈ
        accChatSocket.onopen = function(message) {
            console.log('[accChat] : connection opened. || �� ��ȣ : ' + roomId)
            accChatLayer.html("");
            loadChat(roomId); // ������ ���� �Ǹ� ���� ��ȭ ���� �ҷ��� 
            loadChatRoomInfo(roomId); // ä�ù� ���� �ҷ���

            //�� ���Ͽ��� �޽����� ������� �� ȣ��Ǵ� �̺�Ʈ
            accChatSocket.onmessage = function(message) {
                //console.log("�޽��� ���ƿ� :: " + message)
                var data = JSON.parse(message.data)
                data.readers = [userId];
                receiveAccChat(data);
                //readChat(data);
                $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
            };
        };
        //�� ������ ������ �� ȣ��Ǵ� �̺�Ʈ
        accChatSocket.onclose = function(message) {
            accChatLayer.value += "������ ���������ϴ�.\n";
        };
        //�� ������ ������ ���� �� ȣ��Ǵ� �̺�Ʈ
        accChatSocket.onerror = function(message) {
            accChatLayer.value += "accChat ������ �߻��߽��ϴ�.\n";
        };
    }

    var userNickname = '${user.nickname}';

    function receiveAccChat(chat) {
        //console.log("���Ե�~!")
        var html = "";
        if (chat.senderId == 'system') {
            html += "<div class='msgA center' style=\"text-align:center;margin: 20px;background-color:#D8D8D8;border-radius:10px;\">";
            html += "<font color='#424242' size=2>" + chat.chatContent + "</font>";
            html += "</div>"
        } else if (chat.user.nickname == userNickname) {
            html += "<div class='msgA right' style=\"text-align:right;margin:10px;\">"
            html += "<font color='#cccccc' size=1>" + chat.sendTime + "&ensp;</font>";
            html += "<div style='display: inline-block;background-color:#C5ECE9;height:auto;min-height:25px;max-width:150px;vertical-align:middle;border-radius:10px;padding:2px;text-align:justify;word-wrap:break-word;padding:5px;'>";
            html += "<font color='black' size=2>" + chat.chatContent + "</font>";
            html += "</div>"
            html += "</div>"
        } else {
            if ($("div.msgA").last().hasClass('left') == true && $($("div.msgA").last()).find('div.sender  font.senderId').html() == chat.user.nickname) {
                html += "<div class='msgA left' style=\"text-align:left;margin:10px;\">"
                html += "<div class='sender' style='text-align:center;display: inline-block;vertical-align: center;'>";
                html += "<font class='senderId' style='display:none;'>" + chat.user.nickname + "</font>";
                html += "<img  style='visibility:hidden;width:30px;height:2px;margin:5px 2px 5px 2px;' src=\"/resources/images/userImages/" + chat.user.userImg + "\">";
                html += "</div>"
            } else {
                html += "<div class='msgA left' style=\"text-align:left;margin:10px;\">"
                html += "<div class='sender' style='text-align:center;display: inline-block;vertical-align: center;'>";
                html += "<font class='senderId'>" + chat.user.nickname + "</font><br/>";
                html += "<img  style='border: 2px solid #C5ECE9;width:30px;height:30px;margin:2px;' class='rounded-circle' src=\"/resources/images/userImages/" + chat.user.userImg + "\">";
                html += "</div>"
            }
            html += "<div style='display: inline-block;background-color:#F2F2F2;height:auto;min-height:25px;max-width:150px;vertical-align:middle;text-align:justify;border-radius:10px;padding:2px;word-wrap:break-word;padding:5px;'>";
            html += "<font color='black' size=2>" + chat.chatContent + "</font>";
            html += "</div>"
            html += "<font color='#cccccc' size=1> " + chat.sendTime + "</font>";
            html += "</div>"
        }
        accChatLayer.append(html);
    }

    function sendAccMessage(quitUser) {
        if (quitUser != null) {
            var chat = new Object();
            chat.senderId = "system";
            chat.chatContent = quitUser + "���� ���࿡�� Ż���ϼ̽��ϴ�."
            chat.chatRoomId = chatRoomId;
            accChatSocket.send(JSON.stringify({
                chat
            }));
            console.log("Ż�� �޽��� ���� :: ");
            console.log(chat);
        }

        if (inputAccChat.val().trim() != "") {
            console.log("���� �Է� > ����");
            var chat = new Object();
            chat.senderId = userId;
            chat.chatContent = inputAccChat.val();
            chat.chatRoomId = chatRoomId;
            accChatSocket.send(JSON.stringify({
                chat
            }));
        }
        inputAccChat.val('');
        $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
    }

    function disconnectAcc() {
        accChatSocket.close();
    }

    function loadChat(roomNo) {
        console.log(roomNo + "�� �� ä�ø޽��� �ҷ����� ����")
        $.ajax({
            url: "/chat/json/getChat/" + roomNo,
            type: "GET",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function(result) {
                var list = JSON.stringify({
                    result
                });
                console.log("getChat() ���� : " + result.length + " || " + result);
                if (result.length != 0) {
                    var html = "";
                    for (var i in result) {
                        receiveAccChat(result[i]);
                    }
                } else {
                    var chat = new Object();
                    chat.senderId = "system";
                    chat.chatContent = "����ä���� �����Ǿ����ϴ�.";
                    chat.chatRoomId = roomNo;
                    accChatSocket.send(JSON.stringify({
                        chat
                    }));
                }
                $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
            },
            error: function(error) {
                console.log("getChat() ����")
                console.log(error);
            }
        })
    }

    function loadChatRoomInfo(roomId) {
        $.ajax({
            url: "/chat/json/getChatRoom/" + roomId,
            type: "GET",
            dataType: "json",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function(result) {
                var userList = result.userList;
                chatRoomName = result.chatRoomName;
                var html = "<b><font size=3 color=black>" + chatRoomName + "</font></b>";
                html += "<font size=3 color=gold>" + userList.length + "</font>";
                $(".accChat.info span").html(html);
                $("#accModalLabel").html(chatRoomName + "(" + userList.length + ")");

                var tag = ""
                for (var i in userList) {
                    tag += "<div style='margin-bottom:20px;text-align:left;'>"
                    tag += "<img  style='border: 2px solid gold;border-radius: 7px;-moz-border-radius: 7px;-khtml-border-radius: 7px; -webkit-border-radius: 7px;width:30px;height:30px;margin-right:10px;' src=\"/resources/images/userImages/" + userList[i].userImg + "\">";
                    tag += userList[i].nickname;
                    if (userId == result.creator && userId != userList[i].userId) {
                        tag += "<button type='button' class='btn btn-outline-danger' style='float:right;' onclick='quitAcc(\"" + userList[i].userId + "\")'>����</button>";
                    } else if(userId != result.creator && userId == userList[i].userId){
                         tag += "<button type='button' class='btn btn-outline-danger' style='float:right;' onclick='quitAcc(\"" + userList[i].userId + "\")'>������</button>";
                    }
                    tag += "</div>"
                }
                $(".form-group.accModal").html(tag);
            },
            error: function(error) {
                console.log("ä�ù� ���� ��ȸ ���� :: " + error);
            }
        })

    }

    function readChat(chat) {
        console.log("readChat ����")
        $.ajax({
            url: "/chat/json/readChat/",
            type: "POST",
            data: JSON.stringify(chat),
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function() {
                console.log("readChat() ����");
            },
            error: function(error) {
                console.log("readChat() ����")
                console.log(error);
            }
        })

    }

    function quitAcc(quitId) {
        console.log("�����ų user : " + quitId);
        if ( userId != quitId ) {
            Swal.fire({
                title: '���� �������ðڽ��ϱ�?',
//                text: "�� �� �����Ű�ø� ä�ù�Ӹ� �ƴ϶� ���࿡���� ������ �˴ϴ�.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '��',
                cancelButtonText: '�ƴϿ�',
            }).then((result) => {
                if (result.value) {
                    var chatRoom = new Object();
                    chatRoom.chatRoomId = chatRoomId;
                    chatRoom.chatMems = [quitId];
                    $.ajax({
                        url: "/chat/json/quitChatRoom/",
                        type: "POST",
                        data: JSON.stringify(chatRoom),
                        dataType: "text",
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(result) {
                            //console.log(result);
                            console.log("quitChatRoom() ���� :: " + quitId + " || db���� ������ �г��� : " + result);
                            sendAccMessage(result);
                            getChatRoomList();
                            loadChatRoomInfo(chatRoomId);
                            Swal.fire(
                                '�Ϸ�',
                                '�ش� ȸ���� ���࿡�� ���ܵǾ����ϴ�.'
                            )
                        },
                        error: function(error) {
                            console.log("quitChatRoom() ����")
                            console.log(error);
                        }
                    })
                }
            })
        } else {
            Swal.fire({
                title: '���� �����ðڽ��ϱ�?',
//                text: "�� �� �����Ű�ø� ä�ù�Ӹ� �ƴ϶� ���࿡���� ������ �˴ϴ�.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '��',
                cancelButtonText: '�ƴϿ�',
            }).then((result) => {
                if (result.value) {
                    var chatRoom = new Object();
                    chatRoom.chatRoomId = chatRoomId;
                    chatRoom.chatMems = [quitId];
                    $.ajax({
                        url: "/chat/json/quitChatRoom/",
                        type: "POST",
                        data: JSON.stringify(chatRoom),
                        dataType: "text",
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(result) {
                            //console.log(result);
                            console.log("quitChatRoom() ���� :: " + quitId + " || db���� ������ �г��� : " + result);
                            sendAccMessage(result);
                            getChatRoomList();
                            $('#accModal').modal('hide');
                            $('#pos1').prop('checked', true);
                            disconnectAcc();
                            
                            Swal.fire(
                                '�Ϸ�'
                            )
                        },
                        error: function(error) {
                            console.log("quitChatRoom() ����")
                            console.log(error);
                        }
                    })
                }
            })
        }
    }


    /* -----------------------------------------  �÷��� ä�� ��ũ��Ʈ  --------------------------------------- */
    var planId = '${plan.planId}';
    var planChatSocket;
    var planChatLayer = $("div.planChat.output");
    var myChat = $("#myChat");


    function connectPlanChat() {
        var addr = "ws://192.168.0.82:8080/planSocket/" + planId + "/" + userId;
        planChatSocket = new WebSocket(addr);

        planChatSocket.onopen = function(message) {
            console.log("�����ߴ�." + addr);

            planChatSocket.onmessage = function(message) {
                //console.log("�޽��� �޾Ҵ�.")
                var json = JSON.parse(message.data);
                //console.log(Array.isArray(json));
                if (Array.isArray(json)) {
                    checkOnlineMembers(json);
                    //console.log("checkOnlineMembers")
                } else {
                    //console.log("receivePlanChat")
                    receivePlanChat(json);
                }
                $(".planChat.output").scrollTop($(".planChat.output")[0].scrollHeight);
            };

        };
        planChatSocket.onclose = function(message) {
            console.log("������ ���������ϴ�.\n");
        };
        planChatSocket.onerror = function(message) {
            console.log("������ �߻��߽��ϴ�.\n");
        };

    }

    function receivePlanChat(chat) {
        //console.log("���Ե�~!")
        var html = "";
        if (chat.senderId == 'system') {
            html += "<div class='msg center' style=\"text-align:center;margin:20px;background-color:#D8D8D8;border-radius:10px;\">";
            html += "<font color='#424242' size=2>" + chat.chatContent + "</font>";
            html += "</div>"
        } else if (chat.senderId == userId) {
            html += "<div class='msg right' style=\"text-align:right;margin:10px;\">"
            html += "<font color='#cccccc' size=1>" + chat.sendTime + "&ensp;</font>";
            html += "<div style='display: inline-block;background-color:#C5ECE9;height:auto;min-height:25px;vertical-align:middle;border-radius:10px;padding:5px'>";
            html += "<font color='black' size=2;>" + chat.chatContent + "</font>";
            html += "</div>"
            html += "</div>"
        } else {
            html += "<div class='msg left' style=\"text-align:left;margin:10px;\">"
            //console.log("T ? F ? :: " + $("div.msg").last().hasClass('left') + " || " + $($("div.msg").last()).find('div.sender  font.senderId').html());
            if ($("div.msg").last().hasClass('left') == true && $($("div.msg").last()).find('div.sender font.senderId').html() == chat.senderId) {
                html += "<div class='sender' style='text-align:center;display: inline-block;vertical-align: center;'>";
                html += "<font class='senderId' style='display:none;'>" + chat.senderId + "</font>";
                html += "<img  style='visibility:hidden;width:30px;height:2px;margin:5px 2px 5px 2px;' src=\"/resources/images/userImages/" + chat.user.userImg + "\">";
                html += "</div>"
            } else {
                html += "<div class='sender' style='text-align:center;display: inline-block;vertical-align: center;'>";
                html += "<font class='senderId' style='font-size:8pt;font-weight:400;'>" + chat.senderId + "</font><br/>";
                html += "<img  style='border: 2px solid #C5ECE9;width:30px;height:30px;margin:2px;' class='rounded-circle' src=\"/resources/images/userImages/" + chat.user.userImg + "\">";
                html += "</div>"
            }
            html += "<div style='display: inline-block;background-color:#F2F2F2;height:auto;min-height:25px;vertical-align:middle;border-radius:10px;padding:5px'>";
            html += "<font color='black' size=2>" + chat.chatContent + "</font>";
            html += "</div>"
            html += "<font color='#cccccc' size=1> " + chat.sendTime + "</font>";
            html += "</div>"
        }
        planChatLayer.append(html);
    }

    function checkOnlineMembers(data) {
        <c:forEach var="member" items="${plan.planPartyList}">
            $("#img_${member.userId}").removeClass("on");
        </c:forEach>
        for (var i in data) {
            console.log("������ ȸ�� id : " + data[i].userId);
            $("#img_" + data[i].userId).addClass("on");
        }
    }

    function sendMessage() {
        if (myChat.val().trim() != "") {
            var chat = new Object();
            chat.senderId = userId;
            chat.chatContent = myChat.val();

            planChatSocket.send(JSON.stringify({
                chat
            }));
        }
        myChat.val('');
        $(".planChat.output").scrollTop($(".planChat.output")[0].scrollHeight);
    }

    /*      ---------------------------------------------------   */


    jQuery(document).ready(function($) {
        console.log("���� �α����� ȸ�� : " + userId);

        $("div.icon.push-list").click(function() {
            $('#push-layer').slideToggle(300);
            $('#acc-slide').fadeOut(300);
            $('#plan-chat-layer').fadeOut(300);
            if (userId != null && userId != '') {
                setTimeout(() => readPush(userId), 20);
                setTimeout(() => getUnreadCount(userId), 50);
            }
        });

        $("div.icon.acc-chat").click(function() {
            $('#acc-slide').slideToggle(300);
            $('#push-layer').fadeOut(300);
            $('#plan-chat-layer').fadeOut(300);
        });

        $("div.icon.plan-chat").click(function() {
            $('#plan-chat-layer').slideToggle(300);
            $('#push-layer').fadeOut(300);
            $('#acc-slide').fadeOut(300);
        })

        if (planId.length == 0 || '${boardName}' == 'E') {
            $('div.icon.plan-chat').hide();
        } else if ('${boardName}' != 'E' && planId.length !=0 ){
            $('div.icon.plan-chat').hide();
            $('div.icon.plan-chat').fadeIn(200).effect( "shake", { direction: "up", times: 3, distance: 1} );
            
            connectPlanChat();
        }


        $("#myChat").keydown(function(key) {
            if (key.keyCode == 13) {
                sendMessage();
                myChat.val();
            }
        });
        $("#click").on("mouseover", function() {
            $("#click").css({
                "background-color": "#2ECCFA"
            });
        }).on("mouseout", function() {
            $("#click").css({
                "background-color": "#81e0fc"
            });
        });

        $(".fa-comment-dots").on("click", function() {
            $("#planChat").toggleClass('on');
        });
        $(".fa-telegram-plane").on("click", function() {
            sendMessage();
        })







        if (userId != null && userId != '') {
            setTimeout(() => getPushList(userId), 10);
            setTimeout(() => getUnreadCount(userId), 10);
            setTimeout(() => getChatRoomList(), 20);
        }


        $(".accChat.output").scrollTop($(".accChat.output")[0].scrollHeight);
        $("#input-accChat").keydown(function(key) {
            if (key.keyCode == 13) {
                sendAccMessage();
                inputAccChat.val();
            }
        });
        $(".fas.fa-arrow-left").on("click", function() {
            $('#pos1').prop('checked', true);
            disconnectAcc();
        });
        
        $(window).scroll(function() {
           
            if ($(document).scrollTop() > 160) {
                $('.icon-table').css('display', 'inline-block');
                $('.push-bar-menu').css('margin-top', '10px');
                $('div.icon').css('color','#323232');
                $('div.icon').hover(function() {
                    $(this).css('color','#339999');
                }, function() {
                    $(this).css('color','#323232');
                })
            } else {
                $('.icon-table').css('display','table-row');
                $('div.icon').css('color','#858585');
                $('.push-bar-menu').css('margin-top', '0px');
                
            }
        });







    });

</script>
