<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vet_Orientation.aspx.cs" Inherits="Vet_Orientation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Vet Student Orientation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .responsive-iframe {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
            height: 0;
            overflow: hidden;
            border: 2px solid #44887c;
        }

            .responsive-iframe iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;

            }

        .h2, h2 {
            font-size: 23px;
        }

        .campus_info p {
            margin-bottom: 5px;
        }

        .top-course-items .item .thumb .overlay img {
            height: auto;
            width: 160px;
            border: 6px solid #ffffff;
            z-index: 1;
            border-radius: 5px;
            background-color: white;
        }
        .campus_info h4{
            font-size:17px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>New Vet Student Orientation</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">New Vet Student Orientation</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="blog-area full-blog blog-standard full-blog default-padding" style="padding-top: 50px">

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="site-heading text-center" style="margin-bottom: 15px">
                            <div class="col-md-8 col-md-offset-2">
                                <h2>Welcome to Orientation!</h2>
                            </div>
                        </div>
                    </div>
                    <div class="responsive-iframe">
                        <iframe
                            src="https://www.youtube.com/embed/WlcmStlNZFc"
                            title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            style="padding: 6px;"
                            allowfullscreen></iframe>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="row">
                        <div class="site-heading text-center" style="margin-bottom: 15px">
                            <div class="col-md-8 col-md-offset-2">
                                <h2>Unique Student Identifier (USI)</h2>
                            </div>
                        </div>
                    </div>
                    <div class="responsive-iframe">
                        <iframe
                            src="https://www.youtube.com/embed/WlcmStlNZFc"
                            title="YouTube video player"
                            frameborder="0"
                            style="padding: 6px;"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            allowfullscreen></iframe>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <div class="event-area flex-less">
        <div class="container">
            <div class="row">
                <div class="event-items">

                    <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item">
                            <div class="info">
                                <div class="info-box">
                                    <div class="date">
                                        <img src="assets/img/driving-license.png" width="75px" />
                                    </div>
                                    <div class="content">
                                        <h4>
                                            <a href="#">Click Here to create Your USI</a>
                                        </h4>
                                        <div class="bottom">
                                            <a href="#" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-chart-bar"></i>Click Here
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item">
                            <div class="info">
                                <div class="info-box">
                                    <div class="date">
                                        <img src="assets/img/disaster-recovery.png" width="72px" />
                                    </div>
                                    <div class="content">
                                        <h4>
                                            <a href="#">Click Here for recovery of your USI</a>
                                        </h4>
                                        <div class="bottom">
                                            <a href="#" class="btn circle btn-dark border btn-sm">
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

    <div class="popular-courses-area weekly-top-items bottom-less" style="padding-top: 15px; padding-bottom: 50px">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Campus Location & Contact Detailss</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="top-course-items">

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/sydney.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_sydney-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="#">George Street Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 449 955 272
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>sso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>GEORGE STREET CAMPUS LEVEL2, 531 GEORGE STREET SYDNEY NSW 2000 Australia
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/sydney.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_sydney-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="#">York Street Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 469 738 090
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>englishsso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>Level 2, The Grace Hotel Building, 77 York Street, Sydney, NSW 2000, Australia.
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/Adelaide_campus.jpg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_adelaide-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="adelaide_campus.aspx">Adelaide Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 492 938 782
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>sso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>Suite 1,Level 2 66-68 Grenfell Street Adelaide SA 5000 Australia
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>
                      <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/Melbourn.jpeg" alt="Thumb">
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_melbourne-campus.png" alt="Thumb">
                                    </a>
                                </div>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="#">Melbourne Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 426 254 486
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>sso@nortwest.edu.au
                                    </a>
                                </p>
                                  <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>englishsso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>Level 9, 108 Lonsdale st, Melbourne VIC
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="event-area flex-less">
        <div class="container">
            <div class="row">
                <div class="event-items">

                    <%-- <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item">
                            <div class="info">
                                <div class="info-box">
                                    <div class="date">
                                        <img src="assets/img/pdf.png" width="72px" />
                                    </div>
                                    <div class="content">
                                        <h4>
                                            <a href="#">International Student HandBook</a>
                                        </h4>
                                        <div class="bottom">
                                            <a href="#" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-download"></i>Click Here to Download
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>

                    <div class="col-md-12 col-sm-12 equal-height">
                        <div class="item">
                            <div class="info">
                                <div class="info-box">
                                    <div class="date">
                                        <img src="assets/img/registration-form.png" width="72px" />
                                    </div>
                                    <div class="content">
                                        <h4>
                                            <a href="#">Complete The Orientation Form</a>
                                        </h4>
                                        <div class="bottom">
                                            <a href="new_vet_orientation_form.aspx" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-chart-bar">&nbsp</i>VET COURSE STUDENT
                                            </a>&nbsp&nbsp
                                            <a href="new_elicos_orientation_form.aspx" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-chart-bar">&nbsp</i>ELICOS COURSE STUDENT
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

    <div class="newsletter-area" style="margin-bottom: 50px">
        <div class="container">
            <div class="subscribe-items shadow theme-hard default-padding bg-cover" style="background-image: url(assets/img/banner/11.jpg);">
                <div class="row">
                    <div class="col-md-7 left-info">
                        <div class="info-box">
                            <div class="icon">
                                <i class="fa fa-file-pdf"></i>
                            </div>
                            <div class="info">
                                <h3>International Student HandBook</h3>
                                <p>
                                    Your guide to studying abroad made easy—download the International Student Handbook today!
                               
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 right-info">
                        <div>
                            <%--<div class="input-group">
                                <button type="submit">
                                    Subscribe <i class="fa fa-paper-plane"></i>
                                </button>  
                            </div>--%>
                            <a href="assets/prefix_file/INTERNATIONAL-STUDENT-HANDBOOK.pdf" download="INTERNATIONAL-STUDENT-HANDBOOK.pdf" style="background-color: #002147; color: white; padding: 12px 30px; border-radius: 30px; min-height: 50px;">
                                <i class="fa fa-download">&nbsp</i>
                                Donwload Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

