<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Melbourne_Campus.aspx.cs" Inherits="Melbourne_Campus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Melbourne Campus
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
                    <h1>Melbourne Campus</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Melbourne Campus</li>
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
                        <h2>Melbourne Campus</h2>
                        <%-- <blockquote>
                            A man who has never gone to school may steal from a freight car; but if he has a university education, he may steal the whole railroad.
                       
                        </blockquote>--%>
                        <p>
                           Nortwest College offers a wide range of courses in General English, Business, Management, Project Management,IT, Trade, Commercial Cookery and Hospitality Management from Certificates up to Diploma and Graduate Diploma level. We have carefully chosen the courses and use industry representatives to consult on our curriculum. Our training focuses on gaining real experience with industry benchmark.
                       
                        </p>
                        <a class="btn circle btn-theme effect btn-md" href="#">Know More</a>
                    </div>
                    <div class="col-md-6 thumb">
                        <div class="thumb">
                            <img src="assets/img/800x600.png" alt="Thumb" />
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
                   <%-- <div class="equal-height col-md-3 col-sm-6">
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
                    </div>--%>
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
                   
                    <%-- <div class="col-md-12 new-sec" style="padding: 0;">
                        <div class="col-md-2"></div>
                        <div class="col-sm-12 col-md-4 col-lg-4 bg-color-border blue" style="padding: 0; border: solid 5px; margin-left: 0; flex-basis: 40%;">
                            <a href="https://nortwest.edu.au/college-courses/">
                                <p></p>
                              
                                <div class="aca-para" style="text-align: center !important;">Find Your Course</div>
                            </a>
                            <p><a href="https://nortwest.edu.au/college-courses/"></a></p>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-sm-12 col-md-4 col-lg-4 bg-color-border blue" style="padding: 0; border: solid 5px; flex-basis: 40%;">
                            <a href="https://nortwest.edu.au/academic-enrolment-calendar/">
                                <p></p>
                                <div class="aca-img teach-blue"></div>
                                <div class="aca-para" style="text-align: center !important;">Course in take</div>
                            </a>
                            <p><a href="https://nortwest.edu.au/academic-enrolment-calendar/"></a></p>
                        </div>
                        <div class="col-md-2"></div>
                    </div>--%>
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
  
    <div class="features-area bg-gray default-padding bottom-less">
        <div class="container">

          <%--  <div class="col-md-12 contact-details caps" style="margin-top: 10px !important; font-size: 20px; color: black; text-align: center;">
                <strong>GEORGE STREET CAMPUS</strong><br />
                <span style="font-size: 15px">LEVEL 2, 531 GEORGE STREET,<br />
                    SYDNEY NSW 2000 AUSTRALIA<br />
                    PHONE: +61 449 955 272
                </span>
            </div>--%>
            <div class="col-md-12" style="padding-top: 20px">
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12607.720517387303!2d144.97189765016876!3d-37.81510553775917!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642c92c70b903%3A0x1a52b8f482d3e7ff!2s9%2F108%20Lonsdale%20St%2C%20Melbourne%20VIC%203000%2C%20Australia!5e0!3m2!1sen!2sin!4v1741327930874!5m2!1sen!2sin" width="1050" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script>
        // Function to trigger fullscreen mode
        document.getElementById('vrIframe').addEventListener('click', function () {
            var iframe = document.getElementById('vrIframe');

            if (iframe.requestFullscreen) {
                iframe.requestFullscreen();
            } else if (iframe.mozRequestFullScreen) { // Firefox
                iframe.mozRequestFullScreen();
            } else if (iframe.webkitRequestFullscreen) { // Chrome, Safari, Opera
                iframe.webkitRequestFullscreen();
            } else if (iframe.msRequestFullscreen) { // IE/Edge
                iframe.msRequestFullscreen();
            }
        });
    </script>
</asp:Content>

