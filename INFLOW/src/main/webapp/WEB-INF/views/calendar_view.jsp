<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' type='text/css'
	href='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.css' />
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery.js'></script>
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery-ui-custom.js'></script>
<script type='text/javascript'
	src='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.min.js'></script>
<script type='text/javascript'>

   $(document).ready(function() {
   
      var date = new Date();
      var d = date.getDate();
      var m = date.getMonth();
      var y = date.getFullYear();
  	
      $('#calendar').fullCalendar({
    	  
         header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
         },
         editable: true,
         
         events: [
         
            <c:forEach var="list" items="${c_list}">
            {
               
               title: '${list.c_num}번 일정 -> ${list.c_title}',
               url : 'calendar_contents_view?c_num=${list.c_num}',
               start: '${list.c_start_date}',
               end: '${list.c_end_date}'
                     
             },
            </c:forEach>
             
         ] , 
           eventClick:function(event) {
             if(event.url) {
            	
            	 /* window.open(event.url,'','width=500, height=200, scrollbars=no, toolbar=no, menubar=no, resizable=no, top=400, left=1100'); */
             location.href=event.url;
            	 return false;
                }
            }      
      });   
});      
</script>
<title>INFLOW</title>
</head>
<body>
	<div id='calendar' style="width: 100%; height: 820px;"></div>

	<c:if test="${login_users.grade eq 'A'}">
		<div style="text-align: center;">
			<button type="button" onclick="location.href='calendar_write_view'">일정등록</button>
			<button type="button" onclick="location.href='calendar_delete'">일정삭제</button>
		</div>
	</c:if>

</body>
</html>