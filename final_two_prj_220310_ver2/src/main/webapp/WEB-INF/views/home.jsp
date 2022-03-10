<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="css/edit.css">
<title>stocker | 주식 분석 플랫폼</title>
</head>


<body>
	<div class="brand" style="margin-top: 13%; margin-left: 6%;">
		<span id="typed"></span> <span class="typed-cursor"></span>
	</div>
	<div id="logo" style="text-align: center; justify-content: center;">
	<br>
		<section style="color: white; font-size: 20px;">
		증권 뉴스 헤드라인 긍·부정 감성분석과 코스피 주가 데이터 간</section><p>
		<section style="color: white; font-size: 20px;">
		상관분석을 통한 의사결정 및 시장 분석 도우미 플랫폼</section><br><br>
		<a href="explain"><button id="href" style="background-color: #003566; color:white; width: 100px; height: 40px; border-radius: 15px;">설명 page</button></a>
		<a href="home2"><button id="href" style="background-color: #003566; color:white; width: 100px; height: 40px; border-radius: 15px;">분석 page</button></a>
	</div>
	<div>
		<div class="landing" style="text-align: center; position: relative; top: 50%;">
			<script src="js/jquery.js"></script>
			<script src="js/typed.js"></script>
			<script>
			$(function(){
				$("#logo").hide();
				$("#typed").typed({
					strings: ["주식을 몰라도 좋아요,", "분석을 몰라도 좋아요", "지금 들어오세요!"],
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
