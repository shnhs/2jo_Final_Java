<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
   <title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {
    $.datepicker.setDefaults($.datepicker.regional['ko']); 
    $( "#startDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dateFormat: "yymmdd",
         maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
              //시작일(startDate) datepicker가 닫힐때
              //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             $("#endDate").datepicker( "option", "minDate", selectedDate );
         }    

    });
    $( "#endDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         dateFormat: "yymmdd",
         maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
             // 종료일(endDate) datepicker가 닫힐때
             // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
             $("#startDate").datepicker( "option", "maxDate", selectedDate );
         }    

    });    
});
   $(function() {
      $("input[type=button]").click(function() {
         console.log()
         var form = $("#fileUploadForm")[0];
         var form_data = new FormData(form);
         $("input[type=button]").prop("disabled", true);
        
         $.ajax({
            url : "http://127.0.0.1:5000/",
            async : true,
            type : "POST",
            data : form_data,
            processData : false,
            contentType : false,
            success : function(data) {
               console.log(data)
               console.log(data[0])
               $("#result").text(JSON.stringify(data))
               $("input[type=button]").prop("disabled", false);
            },
            error : function(e) {
               console.log("ERROR : ", e);
               alert("fail");
            }
         });
      })
   });
</script>
</head>
<body>
<h1>
   Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<form id="fileUploadForm" method="post" enctype="multipart/form-data">
종목명 : <input type="text" name="stock" placeholder="종목명 또는 종목코드를 입력해주세요"> <p>

시작일 : <input type="text" name="startdate" id="startDate"><p>
종료일 : <input type="text" name="enddate" id="endDate"><p>
<input type="radio" name="day" value="1">1일
<input type="radio" name="day" value="3">3일
<input type="radio" name="day" value="7">7일
<input type="radio" name="day" value="30">1개월
<input type="button" value=" 비동기 요청">
</form>

<div id="result"> 여기에 요청 결과가 출력 되어야 합니다.</div>
</body>
</html>