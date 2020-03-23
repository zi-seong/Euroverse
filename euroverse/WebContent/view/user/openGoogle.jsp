<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<script type="text/javascript">

$(function(){
	$.ajax({
	    url: "/user/json/googleLoginUrlMake", // �ܼ� URL�� ����� ���� UserController 
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
})

</script>

</head>
<body>

</body>
</html>