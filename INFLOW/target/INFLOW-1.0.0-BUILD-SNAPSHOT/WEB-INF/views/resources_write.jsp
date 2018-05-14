<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>resources_submit</title>
</head>
<body>
<h1>resources_submit.jsp 파일</h1>

<form action="resources_write" method="post" enctype="multipart/form-data">


구분 
<select name="division">
<option value="교보재">교보재</option>
<option value="장비" >장비</option>
</select><br/>

제품 이름 <input type="text" name="r_name"/><br/>

현 재고 <input type="text" name="stock"/><br/>
총수량 <input type="text" name="max_stock"/><br/>

제품 사진 등록 <input type="file" name="r_file"/><br/>

<input type="submit" value="등록">

</form>
</body>
</html>