<%@ page contentType="text/html; charset=UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	font-family: 'Nanum Gothic Coding', monospace;
</style>
  <!-- Start Footer Area -->
    <footer class="footer">
        <!-- Start Footer Top -->
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer mobile-app">
                            <h3>Git Hub</h3>
                            <div class="app-button">
                                <a href="https://github.com/shnhs/2jo_Final_Java" class="btn">
                                    <i class="lni lni-github-original"></i>
                                    <span class="text">
                                        <span class="small-text">Get It On</span>
                                        JAVA | Repo</span>
                                </a>
                                <a href="https://github.com/shnhs/2jo_Final_Python" class="btn">
                                    <i class="lni lni-github"></i>
                                    <span class="text">
                                        <span class="small-text">Get It On</span>
                                        Python | Repo</span>
                                </a>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer f-link">
                            <h3>Crew</h3>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <ul>
                                        <li><a href="javascript:void(0)">김도연 bukdy7@gmail.com</a></li>
                                        <li><a href="javascript:void(0)">김주성 joosung1117@gmail.com</a></li>
                                        <li><a href="javascript:void(0)">손유리 u2son5949@gmail.com</a></li>
                                    </ul>
                                </div>
                                <!--div class="col-lg-6 col-md-6 col-12">
                                    <ul>
                                        <li><a href="javascript:void(0)">&nbsp;</a></li>
                                        <li><a href="javascript:void(0)">&nbsp;</a></li>
                                        <li><a href="javascript:void(0)">&nbsp;</a></li>
                                        <li><a href="javascript:void(0)">&nbsp;</a></li>
                                    </ul>
                                </div-->
                            </div>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer f-link">
                            <!--h3>Quick Links</h3-->
                            <ul>
                                
                                <li><a href="javascript:void(0)">&nbsp;</a></li>
                                <li><a href="javascript:void(0)">&nbsp;</a></li>
                                <li><a href="javascript:void(0)">신희섭 <br> shs3271@gmail.com</a></li>
                                <li><a href="javascript:void(0)">육지현 <br> landhyun13@naver.com</a></li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer f-contact">
                            <h3>Contact</h3>
                            <ul>
                                <li>빅데이터 AI 융합 개발자 양성과정</li>
                                <li>From. KOSA <br></li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Footer Middle -->
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="content">
                                <ul class="footer-bottom-links">
                                    <li><a href="javascript:void(0)">김도연</a></li>
                                    <li><a href="javascript:void(0)">김주성</a></li>
                                    <li><a href="javascript:void(0)">손유리</a></li>
                                    <li><a href="javascript:void(0)">신희섭</a></li>
                                    <li><a href="javascript:void(0)">육지현</a></li>
                                </ul>
                                <p class="copyright-text">Developed by © <a href="search"><strong>stocker</strong></a>
                                </p>
                                <ul class="footer-social">
                                    <li><a href="https://github.com/shnhs/2jo_Final_Java"><i class="lni lni-github-original"></i></a></li>
                                    <li><a href="https://github.com/shnhs/2jo_Final_Python"><i class="lni lni-github"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Middle -->
    </footer>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top btn-hover">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/glightbox.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        //========= Category Slider 
        tns({
            container: '.category-slider',
            items: 3,
            slideBy: 'page',
            autoplay: false,
            mouseDrag: true,
            gutter: 0,
            nav: false,
            controls: true,
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 2,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 5,
                },
                1170: {
                    items: 6,
                }
            }
        });
    </script>
</body>

</html>