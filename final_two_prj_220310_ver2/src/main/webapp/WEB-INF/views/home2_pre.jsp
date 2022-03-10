<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="include/header_home2.jsp" />
<jsp:include page="charts/highchart.jsp" />

<!-- Start Hero Area -->
<section class="hero-area overlay" style="text-align: center; justify-content: center;">
   <div class="container" style="display: inline-block; text-align: center; align-items: center; justify-content: center;">
      <div class="row">
         <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
            <div class="hero-text text-center" >
            
               <!-- Start Hero Text -->
               <!-- div class="section-heading" >
                  <h2 class="wow fadeInUp" data-wow-delay=".3s">분석 시작하기</h2>
                  <!-- 
                  <p class="wow fadeInUp" data-wow-delay=".5s">뉴스 헤드라인과 주가의 상관관계가 궁금하다면?</p>
                  <p class="wow fadeInUp" data-wow-delay=".5s">검색 옵션에 값을 넣고 분석을 눌러보세요! </p> -->
               </div -->
               <!-- End Hero Text -->
                

               <!-- Start Search Form -->
               <form id="fileUploadForm" method="post" enctype="multipart/form-data">
                  <div class="search-form wow fadeInUp" data-wow-delay=".7s">
                     <div class="row">
                        <div class="col-lg-2 col-md-2 col-12 p-0" style="margin: 15px 20px 15px 0px; padding: 10px;">
                           <div class="search-input">
                              <label for="keyword"><i class="lni lni-search-alt theme-color"></i></label> 
                              <select name="stock" id="category">
                                 <option value="none" selected disabled>종목 선택</option>
                                 <option value="삼성전자">삼성전자</option>
                                 <option value="SK하이닉스">SK하이닉스</option>
                                 <option value="네이버">네이버</option>
                              </select>
                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12 p-0" style="margin: 15px 20px 15px 0px; padding: 10px;">
                           <div class="search-input">
                              <label for="category"><i class="lni lni-calendar"></i></label>
                              <input type="text" name="startdate" id="startDate" placeholder="시작날짜">
                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12 p-0" style="margin: 15px 20px 15px 0px; padding: 10px;">
                           <div class="search-input">
                              <label for="category"><i class="lni lni-calendar"></i></label> 
                              <input type="text"name="enddate" id="endDate" placeholder="종료날짜">
                           </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-12 p-0" style="margin: 15px 20px 15px 0px; padding: 10px;">
                           <div class="search-input">
                              <label for="category"><i class="lni lni-grid-alt theme-color"></i></label> 
                              <select name="day" id="category">
                                 <option value="none" selected disabled>증권뉴스 이동평균 기간</option>
                                 <option value="1">1일</option>
                                 <option value="3">3일</option>
                                 <option value="7">7일</option>
                                 <option value="30">1개월</option>
                              </select>
                           </div>
                        </div>
                        
                        <div class="col-lg-3 col-md-3 col-12 p-0" style="margin: 7px 27px 15px 0px; padding: 10px;">
                           <div class="search-input">
                           <label for="category"><i class="lni lni-popup"></i></label> 
                           <select name="holiday" id="category">
                           <option value="none" selected disabled>휴일 뉴스</option>
                           <option value="0">적용</option>
                           <option value="1">미적용</option>
                           </select>
                           </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-12 p-0" style="margin: 7px 27px 15px 0px; padding: 10px;">
                           <div class="search-input">
                           <label for="category"><i class="lni lni-popup"></i></label> 
                           <select name="moveavg" id="category">
                           <option value="none" selected disabled>주가 이동평균</option>
                           <option value="1">적용</option>
                           <option value="0">미적용</option>
                           </select>
                           </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-12 p-0" style="margin: 7px 25px 15px 5px; padding: 10px;">
                           <div class="search-input">
                              <label for="keyword"><i class="lni lni-popup"></i></label> 
                              <input type="text" name="shift" id="shift" placeholder="주가 시간축 이동, 정수">
                           </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12 p-0" style="position: relative; left: 0px; top: -30px;">
                           <div class="search-btn button">
                           <button class="btn" id="button1" type="button" value="조회하기"><i class="lni lni-search-alt"></i>분석</button>
                           <div id="result"></div>
                           </div>
                        </div>

                     </div>
                  </div>
               </form>
            <!-- End Search Form -->
				<!-- Start Hero Text -->
				<div class="search-form wow fadeInUp" data-wow-delay=".7s">
                  <h5 class="wow fadeInUp" data-wow-delay=".3s" style="color:#ddd; text-align :left;"> <big>검색 옵션이 어떤 옵션인가요?</big> </h5><br>
                  <p class="wow fadeInUp" data-wow-delay=".5s" style="color:#ddd; text-align :left;">
                  	<b>종목 선택</b> : 분석하고 싶은 주식 종목을 선택할 수 있습니다.
                  <br> - 선택 가능한 종목 : 삼성전자, SK하이닉스, 네이버,
                  <br> 
                  <br> <b>시작 날짜, 종료 날짜</b> : 분석을 원하는 시작, 종료 시점을 선택할 수 있습니다.
                  <br> 
                  <br> <b>증권뉴스 이동평균 기간</b> : 선택한 기간의 뉴스 데이터를 n일 이동평균을 선택할 수 있습니다.
                  <br> (이동평균이란? )
                  <br> (시작, 종료 날짜 구간보다 적은 숫자를 선택해주세요.)
                  <br>
                  <br> <b>휴일 뉴스 사용</b> : 주가 데이터가 없는 휴일(공휴일, 주말)의 뉴스를 분석에 적용할지 여부를 선택할 수 있습니다.
                  <br> (적용시 다음 영업일의 주가로 채워집니다.)
                  <br>
                  <br> <b>주가 이동평균</b> : 주가 분석에 이동평균 사용 여부를 선택할 수 있습니다.
                  <br>
                  <br> <b>주가 쉬프트 / 주가 시간축 이동</b> : 뉴스 선/후반영을 확인할 수 있도록 주가의 시간축을 이동합니다.
                  <br> - 입력값 : 정수 
                  <br> (예시)
                  <br> +1 입력 : n일의 뉴스와 n+1일의 주가의 상관관계 분석합니다.
                  <br> -1 입력 : n일의 뉴스와 n-1일의 주가의 상관관계를 분석합니다.  </p>
                  
               <!-- End Hero Text -->
               </div>
         </div>
      </div>
   </div>
   </div>
</section>
<!-- End Hero Area -->


<!-- Start Items Grid Area -->
<section class="items-grid section custom-padding">
	<div class="container">
			<div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">상관관계 확인하기</h2>
                    </div>
                </div>
            </div>
		<div class="single-head">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-12">

					<!-- Start Single Grid -->
					<div class="single-grid wow fadeInUp" data-wow-delay=".2s">
					<div class="content">
                                <div class="top-content">
                                    <h3 class="title">
                                        <a href="item-details.html">주가 그래프</a>
                                    </h3>
                                    <p>조회한 기간의 주가 그래프입니다. </p>
                                </div>
                            </div>
						<div class="chart">
							<!-- 이미지 칸에 차트를 넣을 경우 위치. -->
							<!-- 기존 html은 이미지 경로로 설정 되어 있기 때문에 차트가 안 뜰시 고정된 차트 이미지 삽입도 고려 -->
							<!-- 차트 삽입 위치 -->
							<div id="candle_chart"></div>
							
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".4s">
                         <div class="content">
                                <div class="top-content">
                                    <h3 class="title">
                                        <a href="item-details.html">주가 등락률 - 뉴스 긍부정 그래프</a>
                                    </h3>
                                    <p>뉴스 긍부정과 주가 등락률 간의 그래프를 확인해보세요.</p>
                                </div>
                            </div>
                            <div class="chart">
                                <div id="line_chart"></div>
                            </div>
                           
                        </div>
                        <!-- End Single Grid -->
                    </div>
                <div class="col-lg-6 col-md-6 col-12">

					<!-- Start Single Grid -->
					<div class="single-grid wow fadeInUp" data-wow-delay=".2s">
					<div class="content">
                                <div class="top-content">
                                    <h3 class="title">
                                        <a href="item-details.html">주가 등락률 - 뉴스 긍부정 피어슨 상관 그래프</a>
                                    </h3>
                                    <p>뉴스 긍부정과 주가 등락률 간의 피어슨 상관계수 그래프를 확인해보세요. 피어슨 상관계수가 궁금하다면?</p>
                                </div>
                            </div>
						<div class="chart">
							<!-- 이미지 칸에 차트를 넣을 경우 위치. -->
							<!-- 기존 html은 이미지 경로로 설정 되어 있기 때문에 차트가 안 뜰시 고정된 차트 이미지 삽입도 고려 -->
							<!-- 차트 삽입 위치 -->
							<div id="heatmap_chart"></div>
						</div>
						
					</div>
				</div>
				
				<div class="col-lg-6 col-md-6 col-12">
                        <!-- Start Single Grid -->
                        <div class="single-grid wow fadeInUp" data-wow-delay=".4s">
                        <div class="content">
                                <div class="top-content">
                                    <h3 class="title">
                                        <a href="item-details.html">뉴스 헤드라인 단어 분포도</a>
                                    </h3>
                                    <p>뉴스 헤드라인의 단어 분포 분석 결과입니다. 파란색은 긍정, 빨간색은 부정 단어를 나타냅니다. 긍정 단어만 보고 싶다면 부정을, 부정 단어만 보고 싶다면 긍정을 선택하세요. </p>
                                </div>
                            </div>
                            <div class="chart">
                                <div id="wordcloud_chart">  </div> 
                       		</div>
                       		
                        <!-- End Single Grid -->
                    </div>
			</div>
			
		</div>
		<!-- End Single Grid -->
	</div>
	
</section>
<!-- /End Items Grid Area -->

<jsp:include page="include/footer.jsp" />