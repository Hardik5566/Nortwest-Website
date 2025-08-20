<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Internationl College in Sydney
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .top-course-items .item .thumb .overlay img {
            height: auto;
            width: 160px;
            border: 6px solid #ffffff;
            z-index: 1;
            border-radius: 5px;
            background-color: white;
        }

        .blog-items h4 {
            font-size: 15px;
        }


        .campus {
            font-size: 17px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <!-- Start Banner 
    ============================================= -->
    <div class="banner-area">
        <div id="bootcarousel" class="carousel content-less text-light top-pad text-dark slide animate_text" data-ride="carousel">

            <!-- Wrapper for slides -->
            <div class="carousel-inner carousel-zoom">
                <div class="item active bg-cover" style="background-image: url(assets/img/Banner/b1.jpg);">
                    <div class="box-table">
                        <div class="box-cell shadow dark">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="content">
                                            <h4 data-animation="animated fadeInUp">Welcome to Nortwest</h4>
                                            <h2 data-animation="animated fadeInLeft">Connecting Students Worldwide for a Brighter Future.</h2>
                                            <a data-animation="animated fadeInDown" class="btn btn-light border btn-md" href="#home_about">Learn More</a>
                                            <a data-animation="animated fadeInUp" class="btn btn-theme effect btn-md" href="Courses.aspx">View Courses</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item bg-cover" style="background-image: url(assets/img/Banner/b2.jpg);">
                    <div class="box-table">
                        <div class="box-cell shadow dark">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="content">
                                            <h4 data-animation="animated fadeInUp">Welcome to Nortwest</h4>
                                            <h2 data-animation="animated fadeInLeft">Global Learning, Endless Opportunities for Every Student.</h2>
                                            <a data-animation="animated fadeInDown" class="btn btn-light border btn-md" href="#home_about">Learn More</a>
                                            <a data-animation="animated fadeInUp" class="btn btn-theme effect btn-md" href="Courses.aspx">View Courses</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Wrapper for slides -->

            <!-- Left and right controls -->
            <a class="left carousel-control shadow" href="#bootcarousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control shadow" href="#bootcarousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="about-area default-padding" id="home_about">
        <div class="container">
            <div class="row">
                <div class="about-items">
                    <div class="col-md-6 about-info">
                        <h2>Welcome ! <span style="font-size: 26px">We're International Education Academy</span></h2>
                        <blockquote>
                            Nortwest College has been Australia’s premier provider of education to overseas students since 2007. Nortwest College focuses on up-to-date, industry-endorsed courses in Business, Management, Project Management, IT, Trade, Commercial Cookery and Hospitality Management, and English. We have students from all over the world studying with us and experiencing life, study, and work in Australia with our support.
                       
                        </blockquote>

                    </div>
                    <div class="col-md-6 features text-light">
                        <div class="row">
                            <div class="equal-height col-md-6 col-sm-6">
                                <div class="item mariner">
                                    <a href="#">
                                        <div class="icon">
                                            <i class="ti-panel"></i>
                                        </div>
                                        <div class="info">
                                            <h2>12</h2>
                                            <h4>Expert faculty</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="equal-height col-md-6 col-sm-6">
                                <div class="item brilliantrose">
                                    <a href="#">
                                        <div class="icon">
                                            <i class="ti-ruler-pencil"></i>
                                        </div>
                                        <div class="info">
                                            <h2>68</h2>
                                            <h4>Best Teachers</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="equal-height col-md-6 col-sm-6">
                                <div class="item casablanca">
                                    <a href="#">
                                        <div class="icon">
                                            <i class="ti-server"></i>
                                        </div>
                                        <div class="info">
                                            <h2>120</h2>
                                            <h4>Online Courses</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="equal-height col-md-6 col-sm-6">
                                <div class="item malachite">
                                    <a href="#">
                                        <div class="icon">
                                            <i class="ti-desktop"></i>
                                        </div>
                                        <div class="info">
                                            <h2>689</h2>
                                            <h4>Scholarship</h4>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="popular-courses-area weekly-top-items bottom-less" style="padding-top: 15px; padding-bottom: 50px">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Our Campus</h2>
                        <p>
                            Welcome to our educational institution with three campuses in different cities, offering quality learning opportunities nationwide.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="top-course-items">

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/sydney.jpg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb">
                                <div class="overlay">
                                    <a href="George_Street_Campus.aspx">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_sydney-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="George_Street_Campus.aspx">George Street Campus</a>
                                </h4>
                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;SYDNEY</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/sydney.jpg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb">
                                <div class="overlay">
                                    <a href="York_Street_Campus.aspx">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_sydney-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="York_Street_Campus.aspx">York Street Campus</a>
                                </h4>
                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;SYDNEY</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/Adelaide_campus.jpg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb">
                                <div class="overlay">
                                    <a href="adelaide_campus.aspx">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_adelaide-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="adelaide_campus.aspx">Adelaide Campus</a>

                                </h4>

                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;ADELAIDE</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/Melbourn.jpeg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb">
                                <div class="overlay">
                                    <a href="Melbourne_Campus.aspx">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_melbourne-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="Melbourne_Campus.aspx">Melbourne Campus</a>
                                </h4>
                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;MELBOURNE</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="category-area bg-gray default-padding">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Academic</h2>
                        <p>
                            Discourse assurance estimable applauded to so. Him everything melancholy uncommonly but solicitude inhabiting projection off. Connection stimulated estimating excellence an to impression. 
                       
                        </p>
                    </div>
                </div>
            </div>
            <div class="category-items">
                <div class="row">
                    <!-- Single Item -->
                    <div class="col-md-4 col-sm-6 equal-height">
                        <div class="item mariner">
                            <a href="EPT_Test.aspx">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-pulse"></i>
                                    </div>
                                    <div class="info">
                                        <h5>Test Your English</h5>
                                        <span>Test Now</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-4 col-sm-6 equal-height">
                        <div class="item java">
                            <a href="Student_Support_Service.aspx">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-desktop"></i>
                                    </div>
                                    <div class="info">
                                        <h5>Student Support Service</h5>
                                        <span>View Detail</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-4 col-sm-6 equal-height">
                        <div class="item malachite">
                            <a href="Student_Forms.aspx">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-server"></i>
                                    </div>
                                    <div class="info">
                                        <h5>Online Forms</h5>
                                        <span>View Form</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-4 col-sm-6 equal-height">
                        <div class="item brilliantrose">
                            <a href="https://appform.nortwest.edu.au/">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-panel"></i>
                                    </div>
                                    <div class="info">
                                        <h5>Enrolment Form</h5>
                                        <span>View Form</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-4 col-sm-6 equal-height">
                        <div class="item casablanca">
                            <a href="academic_enrolment_calenda.aspx">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-ruler-pencil"></i>
                                    </div>
                                    <div class="info">
                                        <h5>Intake Dates</h5>
                                        <span>View Dates</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-4 col-sm-6 equal-height">
                        <div class="item emerald">
                            <a href="assets/img/document/Nortwest-Brochure.pdf">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-file"></i>
                                    </div>
                                    <div class="info">
                                        <h5>Download Brochure</h5>
                                        <span>Download Now</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                </div>
            </div>
        </div>
    </div>

    <div class="campus-story-area video-bg-live text-light text-center bg-fixed" style="background-image: url(assets/img/2440x1578.png);">
        <div class="player" data-property="{videoURL:'DKz_EEoJRs4',containment:'.video-bg-live', showControls:false, autoPlay:true, zoom:0, loop:true, mute:true, startAt:39, opacity:1, quality:'default'}"></div>
        <div class="story-items default-padding shadow dark-hard">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="heading">
                            <h2>Campus Story</h2>
                        </div>
                        <div class="content campus-carousel owl-carousel owl-theme">
                            <div class="item">
                                <h4>Adelaide Campus</h4>
                                <p>
                                    Decisively surrounded all admiration and not you. Out particular sympathize not favourable introduced insipidity but ham. Rather number can and set praise. Distrusts an it contented perceived attending oh. Thoroughly estimating introduced stimulated why but motionless. 
                               
                                </p>
                                <a href="https://www.youtube.com/watch?v=DKz_EEoJRs4" class="popup-youtube relative light video-play-button item-center">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <div class="item">
                                <h4>Sydney Campus</h4>
                                <p>
                                    Decisively surrounded all admiration and not you. Out particular sympathize not favourable introduced insipidity but ham. Rather number can and set praise. Distrusts an it contented perceived attending oh. Thoroughly estimating introduced stimulated why but motionless. 
                               
                                </p>
                                <a href="https://www.youtube.com/watch?v=DKz_EEoJRs4" class="popup-youtube relative light video-play-button item-center">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                            <div class="item">
                                <h4>Melbourne Campus</h4>
                                <p>
                                    Decisively surrounded all admiration and not you. Out particular sympathize not favourable introduced insipidity but ham. Rather number can and set praise. Distrusts an it contented perceived attending oh. Thoroughly estimating introduced stimulated why but motionless. 
                               
                                </p>
                                <a href="https://www.youtube.com/watch?v=DKz_EEoJRs4" class="popup-youtube relative light video-play-button item-center">
                                    <i class="fa fa-play"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="blog-area default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Latest News</h2>
                        <p>
                            Discourse assurance estimable applauded to so. Him everything melancholy uncommonly but solicitude inhabiting projection off. Connection stimulated estimating excellence an to impression. 
                       
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="blog-items">
                    <div class="col-md-4 single-item">
                        <div class="item">
                            <div class="thumb">
                                <a href="#">
                                    <img src="assets/img/800x600.png" alt="Thumb">
                                </a>
                            </div>
                            <div class="info">
                                <div class="meta">
                                    <ul>
                                        <li><i class="fas fa-calendar-alt"></i>13 Jan, 2025</li>
                                    </ul>
                                </div>
                                <div class="content">
                                    <h4>
                                        <a href="#">Faust Analysis Publication Literary casino betfair login works Book</a>
                                    </h4>
                                    <a href="#"><i class="fas fa-plus"></i>Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 single-item">
                        <div class="item">
                            <div class="thumb">
                                <a href="#">
                                    <img src="assets/img/800x600.png" alt="Thumb">
                                </a>
                            </div>
                            <div class="info">
                                <div class="meta">
                                    <ul>
                                        <li><i class="fas fa-calendar-alt"></i>13 Jan, 2025</li>
                                    </ul>
                                </div>
                                <div class="content">
                                    <h4>
                                        <a href="#">agesordnungspunkt Trumps Match: World Football Stars, Runde...</a>
                                    </h4>
                                    <a href="#"><i class="fas fa-plus"></i>Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 single-item">
                        <div class="item">
                            <div class="thumb">
                                <a href="#">
                                    <img src="assets/img/800x600.png" alt="Thumb">
                                </a>
                            </div>
                            <div class="info">
                                <div class="meta">
                                    <ul>
                                        <li><i class="fas fa-calendar-alt"></i>13 Jan, 2025</li>
                                    </ul>
                                </div>
                                <div class="content">
                                    <h4>
                                        <a href="#">GameDuell Kartenspiele Online, Würfelspiele und Brettspiele...</a>
                                    </h4>
                                    <a href="#"><i class="fas fa-plus"></i>Read More</a>
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

