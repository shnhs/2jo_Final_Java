<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header_home2.jsp" />
<jsp:include page="../charts/highchart.jsp" />


<!-- Start Hero Area -->
<section class="hero-area overlay">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1 col-md-12 col-12">
				<div class="hero-text text-center">
					<!-- Start Hero Text -->
					<div class="section-heading">
						<h2 class="wow fadeInUp" data-wow-delay=".3s">뉴스 헤드라인과 주가
							상관관계 조회하기</h2>
						<p class="wow fadeInUp" data-wow-delay=".5s">동작, 페이지 설명</p>
					</div>
					<!-- End Search Form -->

					<!-- Start Search Form -->
					<form id="fileUploadForm" method="post" enctype="multipart/form-data">
						<div class="search-form wow fadeInUp" data-wow-delay=".7s">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-12 p-0">
									<div class="search-input">
										<label for="keyword"><i class="lni lni-search-alt theme-color"></i></label> 
										<select name="stock" id="category">
											<option value="none" selected disabled>종목선택</option>
											<option value="삼성전자">삼성전자</option>
											<option value="하이닉스">하이닉스</option>
											<option value="네이버">네이버</option>
										</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-input">
										<label for="category"><i class="lni lni-grid-alt theme-color"></i></label>
										<input type="text" name="startdate" id="startDate" placeholder="시작날짜">
										<!--select name="category" id="category">
                                            <option value="none" selected disabled>시작날짜</option>
                                            <option value="none">Vehicle</option>
                                        </select-->
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-input">
										<label for="category"><i class="lni lni-grid-alt theme-color"></i></label> 
										<input type="text"name="enddate" id="endDate" placeholder="종료날짜">
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-input">
										<label for="category"><i class="lni lni-grid-alt theme-color"></i></label> 
										<select name="day" id="category">
											<option value="none" selected disabled>뉴스기간</option>
											<option value="1">1일</option>
											<option value="3">3일</option>
											<option value="7">7일</option>
											<option value="30">1개월</option>
										</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-input">
									<select name="holiday" id="category">
									<option value="none" selected disabled>휴일 뉴스 사용 여부</option>
									<option value="0">익일 주가 사용</option>
									<option value="1">휴일 뉴스 삭제</option>
									</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-input">
									<select name="moveavg" id="category">
									<option value="none" selected disabled>주가 이동평균 여부</option>
									<option value="1">주가 이동평균 사용</option>
									<option value="0">주가 이동평균 미사용</option>
									</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-input">
									<select name="shift" id="category">
									<option value="none" selected disabled>뉴스·주가 사이 기간</option>
									<option value="0">뉴스의 익일 주가 분석</option>
									<option value="1">뉴스의 작일 주가 분석</option>
									</select>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-12 p-0">
									<div class="search-btn button">
									<button class="btn" id="button1" type="button" value="조회하기"><i class="lni lni-search-alt"></i>조회하기</button>

								</div>
							</div>
						</div>
					</form>
				<!-- End Search Form -->

			</div>
		</div>
	</div>
	</div>
</section>
<!-- End Hero Area -->


<!-- Start Items Grid Area -->
<section class="items-grid section custom-padding">
	<div class="container">
		<div class="single-head">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2 class="wow fadeInUp" data-wow-delay=".4s">주가 데이터</h2>
					</div>

					<!-- Start Single Grid -->
					<div class="single-grid wow fadeInUp" data-wow-delay=".2s">
						<div class="image">
							<!-- 이미지 칸에 차트를 넣을 경우 위치. -->
							<!-- 기존 html은 이미지 경로로 설정 되어 있기 때문에 차트가 안 뜰시 고정된 차트 이미지 삽입도 고려 -->
							<!-- 차트 삽입 위치 -->
							<div id="candlecontainer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Single Grid -->
	</div>
</section>
<!-- /End Items Grid Area -->
<!-- 차트  끝-->

<jsp:include page="footer.jsp" />