<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="include/header_des.jsp" />


    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
            
            		<div class="breadcrumbs-content">
                        <h1 class="page-title" >About Our Project</h1>
                    </div>           
                
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->


  <!-- Start About Area -->
    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
                        <img src="/images/about/description.png" alt="#">
                     
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <!-- content-1 start -->
                    <div class="content-right wow fadeInRight" data-wow-delay=".5s">
                        <!-- Heading -->
                     <!--    <h2>About Our Project</h2> -->
                            <h2>저희 프로젝트를 소개합니다.</h2>
                        <p><b>Stocker</b> 서비스는 경제 뉴스 <b>헤드라인 긍·부정과 주가 데이터 간의 상관분석을 통한 의사결정 지원</b>을 위한 플랫폼입니다.</p><br>
                        
                        <p>	뉴스 헤드라인의 긍부정 분석 및 주가와 상관관계 분석을 통해 선택한 종목의 Candle Chart,
                        긍부정 분석결과와 주가의 관계를 보여주는 Line Chart, ​상관관계 정도를 보여주는 Heatmap Chart, 
                        뉴스 헤드라인에 따른 키워드를 추출해 핵심 단어를 시각화 시키는 WordCloud를 볼 수 있습니다.</p><br>
                        
                        <p>조회 가능한 종목으로는 시가 총액 상위 기업(2022.03.04 오후 6시 30분 기준) 중 동일 계열사가 아닌 10개 종목을 선정하여 제공합니다.​</p><br>
                        
                        <p>경제 뉴스 데이터는 종합 일간지, 경제지, 지역일간지, 방송사 등을 포함한 국내 최대의 기사 DB를 제공해주는 <a href="https://www.bigkinds.or.kr/v2/news/index.do"><b>Big Kinds</b></a> 에서 수집을 진행하였습니다.<br>
                        주가 데이터의 경우 한국거래소의 데이터를 스크래핑 할 수 있는 <a href="https://github.com/sharebook-kr/pykrx"><b>PyKrx API</b></a>를 통해 종목별 OHLCV 데이터를 수집하였습니다.​</p><br>
                        
                        <p>「2017.01.
                        01 ~ 2021.12.31」 총 5년간의 각 종목별 분석결과를 제공합니다. ​</p>
                        <!-- End Heading -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End About Area -->



<jsp:include page="include/footer.jsp" />