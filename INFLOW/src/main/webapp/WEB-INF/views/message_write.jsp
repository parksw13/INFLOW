<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
<meta charset="UTF-8">
<title>INFLOW</title>
<style type="text/css">
#tt {
	width: 150px;
	font-size: 20px;
	text-align: center;
	font-weight: bolder;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
	
   //아이디 실시간 중복확인을 위한 ajax
   $("#receive_id").keyup(
		   function() {
      $.ajax({
         url : "check_id",
         type : "POST",
         data : {
            id : $("#receive_id").val()
         },
         success : function(result) {
            if (result == 1) {
               $('font[name=check]').html("등록된 회원입니다.").css("color","green");
               $("#sendbtn").removeAttr("disabled");
            } else {
               $('font[name=check]').html("존재하지 않는 아이디입니다.").css("color","red");;
               $("#sendbtn").attr("disabled", "disabled");
            }
         },
      })
   });
})

</script>

</head>
<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 199.5px; left: 551.5px; display: none;" id="dialog"
			class="window">
			<h2>메시지 보내기</h2>
			<div id="lorem">
				<form action="m_write" method="post">
					<table>
						<tr>
							<td id="tt">보낸 아이디</td>
							<td><input type="hidden" name="send_id"
								value="${login_users.id}">${login_users.id}</td>
						</tr>
						<tr>
							<td id="tt">받는 아이디</td>
							<td><input type="text" name="receive_id" id="receive_id"
								value="${param.receive_id}"><font name="check" size="2"></font></td>
						</tr>
						<tr>
							<td id="tt">내용</td>
							<td><textarea name="m_contents" rows="6"
									style="height: 10%;" required="required"></textarea></td>
						</tr>

						<tr>
							<td id="tt">전송</td>
							<td><input type="submit" value="보내기" id="sendbtn">
								<button type="button" onclick="history.back()">취소</button></td>
						</tr>
					</table>

				</form>
				<div id="popupfoot">
					<button type="button" onclick="location.href='main'"
						class="close agree">닫기</button>
				</div>
			</div>
		</div>
		<div
			style="width: 1478px; font-size: 32pt; color: white; height: 602px; display: none; opacity: 0.8;"
			id="mask"></div>
	</div>
</body>
</html>