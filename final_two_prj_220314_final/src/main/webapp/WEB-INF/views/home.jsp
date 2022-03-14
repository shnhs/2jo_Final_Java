<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="css/edit.css">
<title>stocker | 주식 분석 플랫폼</title>


    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.svg" />
    <!-- Place favicon.ico in the root directory -->
    
    
</head>


<body>
	<div class="brand" style="margin-top: 13%; margin-left: 6%;">
		<span id="typed" style="justify-content: center; text-align: center;"></span> <span class="typed-cursor"></span>
	</div>
	<div id="logo" style="text-align: center; justify-content: center;">
	<br>
		<section style="color: white; font-size: 20px;">
		경제 뉴스 헤드라인 긍·부정과 주가 데이터 간</section><p>
		<section style="color: white; font-size: 20px;">
		상관분석을 통한 의사결정 지원 플랫폼</section><br><br>
		<div class="wrap">
  		<a href="AboutUs"><button class="button1">about us</button></a>
  		<a href="search">&nbsp;&nbsp;&nbsp;&nbsp;<button class="button2">search</button></a>
  		</div>
	</div>
	<div>
		<div class="landing" style="text-align: center;">
			<script src="js/jquery.js"></script>
			<script src="js/typed.js"></script>
			<script>
			$(function(){
				$("#logo").hide();
				$("#typed").typed({
					strings: ["주식을 몰라도 좋아요,", "분석을 몰라도 좋아요.", "지금 들어오세요!"],
					typeSpeed: 50,
			        callback: function(){
			        	$("#logo").delay(1000);
			        	$("#logo").show("slow");
			        	}
					});
				});
    		</script>
		</div>
	</div>
</body>
</html>
