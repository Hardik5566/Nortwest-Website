<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/adelaide_campus.aspx.cs" Inherits="adelaide_campus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Adelaide Campus
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .about-area .about-info h2 {
            font-size: 47px;
        }

        .features-area .features .item a {
            display: block;
            box-shadow: 0;
            background: #ffffff;
            border: 1px solid #e7e7e7;
            box-shadow: none;
            padding: 30px !important;
        }

        .features-area .features .item {
            text-align: center;
        }

            .features-area .features .item .icon img {
                width: 60px;
                margin-bottom: 30px;
            }

            .features-area .features .item a h4 {
                font-weight: 500;
                font-size: 15px;
                line-height: 22px;
                min-height: 44px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Adelaide Campus</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Adelaide Campus</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="about-area default-padding">
        <div class="container">
            <div class="row">
                <div class="about-items">
                    <div class="col-md-6 about-info">
                        <h2>Adelaide Campus</h2>
                       <%-- <blockquote>
                            A man who has never gone to school may steal from a freight car; but if he has a university education, he may steal the whole railroad.
                       
                        </blockquote>--%>
                        <p>
                        Nortwest College offers a wide range of courses in Business, Management, Marketing, Project Management and Website Development from Certificates up to Diploma and Advanced Diploma level. We have carefully chosen the courses and use industry representatives to consult on our curriculum. Our training focuses on gaining real experience with industry benchmark.
                       
                        </p>
                        <a class="btn circle btn-theme effect btn-md" href="#">Know More</a>
                    </div>
                    <div class="col-md-6 thumb">
                        <div class="thumb">
                            <img src="assets/img/800x600.png" alt="Thumb">
                            <a href="https://www.youtube.com/watch?v=DKz_EEoJRs4" class="popup-youtube light video-play-button">
                                <i class="fa fa-play"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="features-area bg-gray default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>About Campus</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="features">
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/desktop.png" />
                                </div>
                                <div class="info">
                                    <h4>Mac and Windows computers</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/teacher.png" />
                                </div>
                                <div class="info">
                                    <h4>Experienced Trainers</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/studyroom.png" />
                                </div>
                                <div class="info">
                                    <h4>Exclusive class for each subject</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/care.png" />
                                </div>
                                <div class="info">
                                    <h4>Student Support</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/system-update.png" />
                                </div>
                                <div class="info">
                                    <h4>Ensure software updates.</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/translate.png" />
                                </div>
                                <div class="info">
                                    <h4>multilingual team</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/job-search.png" />
                                </div>
                                <div class="info">
                                    <h4>Job Opportunities & News board</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/printer.png" />
                                </div>
                                <div class="info">
                                    <h4>Scanner & Printer</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/relax.png" />
                                </div>
                                <div class="info">
                                    <h4>Relax areas</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/dinner-table.png" />
                                </div>
                                <div class="info">
                                    <h4>Allocated dining areas</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/fridge.png" />
                                </div>
                                <div class="info">
                                    <h4>kitchen with fridge & microwave</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="#">
                                <div class="icon">
                                    <img src="assets/img/vending-machine.png" />
                                </div>
                                <div class="info">
                                    <h4>vending machine</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <div class="event-area flex-less" style="padding-top:30px">
        <div class="container">
            <div class="row">
                <div class="event-items">

                    <div class="col-md-6 col-sm-6 equal-height" style="height: 191px;">
                        <div class="item">
                            <div class="info">
                                <div class="info-box">
                                    <div class="date">
                                        <img src="assets/img/calender.jpg" width="85px">
                                    </div>
                                    <div class="content">
                                        <h4>
                                            <a href="academic_enrolment_calenda.aspx">Course in take</a>
                                        </h4>
                                        <div class="bottom">
                                            <a href="academic_enrolment_calenda.aspx" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-chart-bar"></i>Click Here
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 equal-height" style="height: 191px;">
                        <div class="item">
                            <div class="info">
                                <div class="info-box">
                                    <div class="date">
                                        <img src="assets/img/course.png" width="85px">
                                    </div>
                                    <div class="content">
                                        <h4>
                                            <a href="Courses.aspx">Find Your Course</a>
                                        </h4>
                                        <div class="bottom">
                                            <a href="Courses.aspx" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-chart-bar"></i>Click Here
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id="portfolio" class="portfolio-area default-padding" style="padding-top:30px">
        <div class="container">
            <div class="portfolio-items-area text-center">
                <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Campus Images</h2>
                        <p>Have a tour on our campus images</p>
                    </div>
                </div>
            </div>
                <div class="row">
                    <div class="col-md-12 portfolio-content">
                        
                        <div class="row magnific-mix-gallery masonary text-light">
                            <div id="portfolio-grid" class="portfolio-items col-3">
                                <div class="pf-item ceremony students">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_1.jpg" alt="thumb" />
                                        <div class="overlay">
                                            <a href="assets/img/Banner/ad_g_1.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item teachers ceremony">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_2.jpg" alt="thumb" />
                                        <div class="overlay">
                                           
                                            <a href="assets/img/Banner/ad_g_2.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item campus education">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_3.jpg" alt="thumb" />
                                        <div class="overlay">
                                            
                                            <a href="assets/img/Banner/ad_g_3.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item education students">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_4.jpg" alt="thumb" />
                                        <div class="overlay">
                                           
                                            <a href="assets/img/Banner/ad_g_4.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item teachers campus">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_5.jpg" alt="thumb" />
                                        <div class="overlay">
                                           
                                            <a href="assets/img/Banner/ad_g_5.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item ceremony teachres">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_6.jpg" alt="thumb" />
                                        <div class="overlay">
                                           
                                            <a href="assets/img/Banner/ad_g_6.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item teachers campus">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_7.jpg" alt="thumb" />
                                        <div class="overlay">
                                            <h4>Live Drawing</h4>
                                            <a href="assets/img/Banner/ad_g_7.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="pf-item ceremony teachres">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_8.jpg" alt="thumb" />
                                        <div class="overlay">
                                           
                                            <a href="assets/img/Banner/ad_g_8.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fas fa-link"></i></a>
                                        </div>
                                    </div>
                                </div>
                                 <div class="pf-item ceremony students">
                                    <div class="item-effect">
                                        <img src="assets/img/Banner/ad_g_1.jpg" alt="thumb" />
                                        <div class="overlay">
                                            <a href="assets/img/Banner/ad_g_1.jpg" class="item popup-link"><i class="fa fa-eye"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

