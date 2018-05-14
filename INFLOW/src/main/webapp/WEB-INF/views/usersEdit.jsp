<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>INFLOW</title>
<style type="text/css">
.img_wrap {
	width: 50%;
	margin: auto;
}

.img_wrap img {
	width: 150px;
	height: 200px;
}

#td {
	text-align: center;
}

#th {
	font-weight: bolder;
}
</style>

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='resources/css/main2.css' media='all' rel='stylesheet'
	type='text/css' />
</head>

<!-- 비밀번호 확인용 keyup jquery  -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(function() {
		$('#pw').keyup(function() {
			$('font[name=check]').text('');
		}); //#pw.keyup

		$('#confirm_pw').keyup(function() {
			if ($('#pw').val() != $('#confirm_pw').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림").css("color", "red");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음").css("color", "green");
			}
		}); //#confirm_pw.keyup
	});
</script>



<!-- 비밀번호 재확인시 일치하지 않으면 alert창 출력  -->
<script type="text/javascript">
	function pwc() {
		var pw = document.getElementById("pw").value;
		var confirm_pw = document.getElementById("confirm_pw").value;

		if (pw != confirm_pw) {
			alert('비밀번호가 일치하지 않습니다');
			return false;
		} else {
			if (confirm("회원정보를 수정하시겠습니까?")) {
			} else {
				return false;
			}
		}
	}
</script>
<!-- if (confirm("회원정보를 수정하시겠습니까?") == true) {} -->
<!--업로드한 이미지파일 미리보기를 위한 script  -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js" charset="utf-8"></script>
<script>
	var sel_file;

	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 형식만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	//프로필 '사진변경'버튼을 눌렀을 때 작동되는 제이쿼리
	$(function imgChangeCk() {
		$("#imgChange").click(function() {

			//업로드할 사진의 값을 changeImg라는 id를 가진 input태그의 value값을 'Img'라는 변수에 저장
			var Img = document.getElementById("changeImg").value;
			
			
			if (Img == "") {
				alert('변경할 사진을 선택해주세요.');
			} else {
				if (confirm("사진을 변경하시겠습니까?")) {
					/* document.form1.action = "profile_edit";
					document.form1.submit(); */
					document.getElementById("form1").submit();
				} else {
					return false;
				}
			}
		})
	})
</script>



<body>
	<jsp:include page="main.jsp"></jsp:include>
	<div id="boxes">
		<div style="top: 50px; left: 551.5px; display: none; width: 800px;"
			id="dialog" class="window">
			<div style="padding-top: 150px;"></div>
			<h3>회원정보 수정</h3>
			<div id="lorem">
				<div class="card card-register mx-auto mt-5">
					<div class="card-body">
						<form action="profile_edit" method="post" name="form1" id="form1"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${usersEdit.id}">
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">프로필사진 변경</p>

										<input class="form-control" name="profile_img" id="changeImg"
											type="file"> <font color="red" size="2">
											'사진변경' 버튼을 눌러야 사진이 변경됩니다.</font><br> <br>
										<div class="button" style="text-align: center;">
											<button type="button" onclick="imgChangeCk()" id="imgChange"
												class="btn btn-primary">사진변경</button>
										</div>
									</div>
								</div>
							</div>
						</form>


						<form action="edit" method="post">
							<input type="hidden" name="profile_img"
								value="${usersEdit.profile_img}">
							<%-- <input type="hidden" name="profile_img" value="${usersEdit.profile_img}">
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								프로필사진
								<div class="form-control">
									<img id="img" width=150px;
										src="resources/upload/${usersEdit.profile_img}" />
								</div>
							</div>

						</div>
					</div> --%>

							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">프로필사진</p>
										<div class="img_wrap">
											<img id="img" src="resources/upload/${usersEdit.profile_img}" />
										</div>
									</div>
								</div>
							</div>



							<div class="form-group">
								<div class="form-row">
									<div class="col-md-7">
										<p id="th">아이디</p>
										<input style="width: 85%;" class="form-control" name="id"
											type="text" value="${usersEdit.id}" required="required"
											readonly="readonly">
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">비밀번호</p>
										<input class="form-control" name="pw" id="pw" type="password"
											placeholder="비밀번호를 입력해주세요" required="required">
									</div>
									<div class="col-md-6">
										<p id="th">비밀번호 확인</p>
										<input class="form-control" name="confirm_pw" id="confirm_pw"
											type="password" placeholder="비밀번호를 입력해주세요"
											required="required"> <font name="check" size="2"></font>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">이름</p>
										<input class="form-control" name="name" id="name" type="text"
											value="${usersEdit.name}" required="required"
											readonly="readonly">
									</div>
									<div class="col-md-6">
										<p id="th">이메일</p>
										<input class="form-control" name="email" id="email"
											type="email" value="${usersEdit.email}" required="required"
											autocomplete="on">
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">주소</p>
										<div class="form-group">
											<input type="button" onclick="sample3_execDaumPostcode()"
												value="주소검색" required="required">
										</div>
										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
										<input class="form-control" type="text" id="sample3_postcode"
											placeholder="우편번호">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-12">
										<input class="form-control" type="text" name="addr"
											id="sample3_address" value="${usersEdit.addr}"
											required="required">
									</div>
								</div>
							</div>

							<!--주소검색 api  -->
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
								// 우편번호 찾기 찾기 화면을 넣을 element
								var element_wrap = document
										.getElementById('wrap');

								function foldDaumPostcode() {
									// iframe을 넣은 element를 안보이게 한다.
									element_wrap.style.display = 'none';
								}

								function sample3_execDaumPostcode() {
									// 현재 scroll 위치를 저장해놓는다.
									var currentScroll = Math.max(
											document.body.scrollTop,
											document.documentElement.scrollTop);
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 각 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var fullAddr = data.address; // 최종 주소 변수
													var extraAddr = ''; // 조합형 주소 변수

													// 기본 주소가 도로명 타입일때 조합한다.
													if (data.addressType === 'R') {
														//법정동명이 있을 경우 추가한다.
														if (data.bname !== '') {
															extraAddr += data.bname;
														}
														// 건물명이 있을 경우 추가한다.
														if (data.buildingName !== '') {
															extraAddr += (extraAddr !== '' ? ', '
																	+ data.buildingName
																	: data.buildingName);
														}
														// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
														fullAddr += (extraAddr !== '' ? ' ('
																+ extraAddr
																+ ')'
																: '');
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
													document
															.getElementById('sample3_address').value = fullAddr;

													// iframe을 넣은 element를 안보이게 한다.
													// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
													element_wrap.style.display = 'none';

													// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
													document.body.scrollTop = currentScroll;
												},
												// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
												onresize : function(size) {
													element_wrap.style.height = size.height
															+ 'px';
												},
												width : '100%',
												height : '100%'
											}).embed(element_wrap);

									// iframe을 넣은 element를 보이게 한다.
									element_wrap.style.display = 'block';
								}
							</script>

							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">주민번호("000000-0000000")</p>
										<input class="form-control" name="num" id="num" type="text"
											value="${usersEdit.num}" pattern="\d{6}-\d{7}"
											required="required" readonly="readonly">
									</div>
									<div class="col-md-6">
										<p id="th">전화번호("010-0000-0000")</p>
										<input class="form-control" name="tel" id="tel" type="text"
											value="${usersEdit.tel}" pattern="\d{3}-\d{4}-\d{4}"
											required="required">
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<p id="th">구분코드</p>
										<input class="form-control" name="grade"
											value="${usersEdit.grade}" readonly="readonly">
									</div>
									<div class="col-md-6">
										<p id="th">클래스코드</p>
										<input class="form-control" name="class_name"
											value="${usersEdit.class_name}" readonly="readonly"><br>
									</div>
								</div>
							</div>

							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit"
									onclick="return pwc()">수정완료</button>
							</div>
						</form>

						<form action="usersView" method="POST">
							<input type="hidden" name="id" value="${usersEdit.id}">
							<div style="text-align: center;">
								<button class="btn btn-info" type="submit">취소</button>
							</div>
						</form>
					</div>
				</div>

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
