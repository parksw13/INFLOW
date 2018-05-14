<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<% String pagefile=(String)request.getAttribute("page");
	if(pagefile==null){pagefile="nb_list";}%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/*모달창 헤더 */
#header{
   height:15%;
   background:skyblue;

}
/*모달창 사이드바*/
#side{         

    width: 20%;
    height: 70%;
    float: left;
    background: red;

}
/*모달창 컨텐츠 */
#contents{
   float:right;
   background:green;
   height:70%;
   width:80%;
   
}
#footer{
   float:left;
    background: blue;
    height: 15%;
    width: 100%;

}
</style>

</head>
<body>
       <div id="header">
          헤더 영역
       </div>
       <div id="body">
          <div id="side">
          <a href="nb_list">공지사항</a>
          <a href="qna_list">Q&A</a>
          <a href="sr_list">학습자료실</a>
          <a href="sb_list">학습게시판</a>
          <a href="resources_list">교보재</a>
          <a href="main">교보재</a>
          </div>
          <div id="contents">
          <jsp:include page='<%=pagefile+".jsp"%>'/>
            </div>
         </div>
        <div id="footer">
          푸터영역
         </div>
         <div></div> 
</body>
</html>