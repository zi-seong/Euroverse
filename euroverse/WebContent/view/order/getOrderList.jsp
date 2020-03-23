<%@ page language="java"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.*" %>

<html>

<head>
    <title>���� �����ȸ</title>
    <meta charset="EUC-KR">
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
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />




    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- asome icon CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        image {
            border: 1px solid lightpink;
        }

        h3 {
            color: white;
            font-family: Consolas;
        }

        #flight,
        #room {
            width: 100%;
            margin: auto;
            font-size: 11pt;
        }

    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">
        $(document).ready(function() {
            Show();
            $("div.h4.flightList").on("click",function(){
                Show();
            })
            $("div.h4.roomList").on("click",function(){
                doShow();
            })
            
        })

        function fncGetUserList(currentPage) {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/order/getOrderList").submit();
        }

        $(function() {
            $("button.btn.btn-default").on("click", function() {
                fncGetUserList(1);
            });
        });
        $(function() {
            $(".btn.btn-info").click(function() {
                self.location = "/order/getOrderListAdmin";
            })
        })

        function doShow() {
            $('div.h4.roomList').css('opacity','1');
            $('div.h4.flightList').css('opacity','0.5');
            if ($('#flight').is(":visible")) {
                $('#flight').hide();
                $('#iconf').hide();
                $('#room').show();
            }
        }

        function Show() {
            $('div.h4.flightList').css('opacity','1');
            $('div.h4.roomList').css('opacity','0.5');
            if ($('#room').is(":visible")) {
                $('#room').hide();
                $('#iconr').hide();
                $('#flight').show();
            }
        }

        $(function() {
            $('.fas.fa-list').on("click", function() {
                //var flightId = $("#flightId").val();
                var flightId = $(this).next().val();
                var orderId = $(this).next().next().val();
                self.location = "/order/getFlightOrder?flightId=" + flightId + "&orderId=" + orderId;
            })
            $('.fas.fa-list-ul').on("click", function() {
                var roomId = $(this).next().val();
                var orderId = $(this).next().next().val();
                self.location = "/order/getRoomOrder?roomId=" + roomId + "&orderId=" + orderId;
            })
        })

        ////////////////////////////////////////////////////


        /*     $( function () {
        		$('.delete:contains("��")').on("click" , function () {
              jQuery.ajax({
                "url": "http://www.myservice.com/payments/cancel",
                "type": "POST",
                "contentType": "application/json",
                "data": JSON.stringify({
                  "merchant_uid": "mid_" + new Date().getTime(), // �ֹ���ȣ
                  "cancel_request_amount": 100, // ȯ�ұݾ�
                  "reason": "�׽�Ʈ ���� ȯ��" // ȯ�һ���
                  //"refund_holder": "ȫ�浿", // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� ������
                 // "refund_bank": "88" // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� �����ڵ�(ex. KG�̴Ͻý��� ��� ���������� 88��)
                  //"refund_account": "56211105948400" // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� ��ȣ
                }),
                "dataType": "json"
              });
            });
            }); */


        ////////////////////////////////////////////////////

    </script>

</head>

<body>
        <jsp:include page="/toolbar/toolBar.jsp" />
        <jsp:include page="/toolbar/pushBar.jsp" />
        <div class="container" style="width:70%;margin: auto;">
    <form>
            <div class="container">

            <div class="h4 flightList" style="font-family:'NIXGONM-Vb';display:inline-block;background-color:#ffde3e;font-weight: bold; margin-top: 40px;margin-bottom:20px; padding-left:10px;">
                �װ� �ֹ�����
            </div>
            <div class="h4" style="font-family:'NIXGONM-Vb';display:inline-block;font-weight: bold; margin-top: 40px;margin-bottom:20px;opacity: 1;">
                |
            </div>
            <div class="h4 roomList" style="font-family:'NIXGONM-Vb';display:inline-block;background-color:#ffde3e;font-weight: bold; margin-top: 40px;margin-bottom:20px; padding-left:10px;">
                ���� �ֹ�����
            </div>

        </div>


        <table class="table table-hover" id="flight">
            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">�װ���</th>
                    <th scope="col">���</th>
                    <th scope="col">����</th>
                    <th scope="col">�ҿ�ð�(����)</th>
                    <th scope="col">����</th>
                    <th scope="col">�����Ͻ�</th>
                    <th scope="col">�ֹ�����</th>
                </tr>
            </thead>

            <tbody>

                <c:set var="i" value="0" />
                <c:forEach var="flight" items="${list}">
                    <c:set var="i" value="${i+1}" />
                    <tr>
                        <th scope="row">
                            <i class="fas fa-list" id="f"></i>
                            <input type="hidden" name="flightId" id="flightId" value="${flight.flightId}" />
                            <input type="hidden" name="orderId" id="orderId" value="${flight.orderId}" />
                        </th>
                        <td id="refund">${flight.airline}</td>
                        <td>${flight.depCity}<br />${flight.depDate.substring(0,4)}/${flight.depDate.substring(4,6)}/${flight.depDate.substring(6,8)} ${flight.depTime}</td>
                        <td>${flight.arrCity}<br />
                            <c:if test="${flight.arrDate=='none'}">${flight.depDate.substring(0,4)}/${flight.depDate.substring(4,6)}/${flight.depDate.substring(6,8)}</c:if>
                            <c:if test="${flight.arrDate!='none'}">${flight.arrDate.substring(0,4)}/${flight.arrDate.substring(4,6)}/${flight.arrDate.substring(6,8)}</c:if>
                            ${flight.arrTime}
                        </td>
                        <td>${flight.leadTime}(${flight.stopOver})</td>
                        <td>
                            <fmt:formatNumber value="${flight.price}" pattern="###,###" />��</td>
                        <td>${flight.orderDate}</td>
                        <td>
                            <c:if test="${flight.orderStatus == 'O' }">
                                �ֹ��Ϸ�
                            </c:if>
                            <c:if test="${flight.orderStatus == 'A' }">
                                ȯ�ҽ�û
                            </c:if>
                            <c:if test="${flight.orderStatus == 'R' }">
                                ȯ�� ó����
                            </c:if>
                            <c:if test="${flight.orderStatus == 'C' }">
                                ȯ�ҿϷ�
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>



        <table class="table table-hover" id="room">

            <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col">������</th>
                    <th scope="col">����</th>
                    <th scope="col">üũ�� - üũ�ƿ�</th>
                    <th scope="col">���Ǽ�/�����ο�</th>
                    <th scope="col">����</th>
                    <th scope="col">�����Ͻ�</th>
                    <th scope="col">�ֹ�����</th>
                </tr>
            </thead>

            <tbody>

                <c:set var="i" value="0" />
                <c:forEach var="room" items="${list2}">
                    <c:set var="i" value="${i+1}" />
                    <tr>
                        <th scope="row">
                            <i class="fas fa-list-ul"></i>
                            <input type="hidden" name="roomId" id="roomId" value="${room.roomId}" />
                            <input type="hidden" name="orderId" id="orderId" value="${room.orderId}" />
                        </th>
                        <td>${room.roomCity }</td>
                        <td>${room.roomName}</td>
                        <td>${fn:trim(room.checkIn).substring(0,4)}/${fn:trim(room.checkIn).substring(4,6)}/${fn:trim(room.checkIn).substring(6,8)}
			      		- ${fn:trim(room.checkOut).substring(0,4)}/${fn:trim(room.checkOut).substring(4,6)}/${fn:trim(room.checkOut).substring(6,8)}</td>
                       
                        <td>${room.roomNum}��<br />���� ${room.adultNum}��, ���� ${room.childNum}��</td>
                        <td>
                            <fmt:formatNumber value="${room.price}" pattern="###,###" />�� </td>
                        <td>${room.orderDate}</td>
                        <td>
                            <c:if test="${room.orderStatus == 'O' }">
                                �ֹ��Ϸ�
                            </c:if>
                            <c:if test="${room.orderStatus == 'A' }">
                                ȯ�ҽ�û
                            </c:if>
                            <c:if test="${room.orderStatus == 'R' }">
                                ȯ�� ó����
                            </c:if>
                            <c:if test="${room.orderStatus == 'C' }">
                                ȯ�ҿϷ�
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- <button type="button" class="btn btn-info" style="margin-top:-10px;width:120px;" >Admin</button> -->
    </form>
    </div>
    <jsp:include page="/toolbar/footer.jsp" />
</body>

</html>
