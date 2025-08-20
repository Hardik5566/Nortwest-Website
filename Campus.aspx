<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Campus.aspx.cs" Inherits="Campus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Campus
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
    <div class="popular-courses-area weekly-top-items bottom-less" style="padding-top: 75px; padding-bottom: 50px">
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
                                <img src="assets/img/sydney.jpg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb" />
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_sydney-campus.png" alt="Thumb" />
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="#">George Street Campus</a>
                                </h4>
                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;SYDNEY</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/sydney.jpg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb" />
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_sydney-campus.png" alt="Thumb" />
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="#">York Street Campus</a>
                                </h4>
                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;SYDNEY</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <img src="assets/img/Adelaide_campus.jpg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb" />
                                <div class="overlay">
                                    <a href="adelaide_campus.aspx">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_adelaide-campus.png" alt="Thumb" />
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
                                <img src="assets/img/Melbourn.jpeg" style="height: 210px; object-fit: cover; width: 100%;" alt="Thumb" />
                                <div class="overlay">
                                    <a href="#">
                                        <img src="assets/img/Nortwest-Logo__NW-logo_melbourne-campus.png" alt="Thumb" />
                                    </a>
                                </div>
                            </div>
                            <div class="info">
                                <h4 style="margin-bottom: 0" class="campus">
                                    <a href="#">Melbourne Campus</a>
                                </h4>
                                <span style="font-size: 12px; font-weight: 500; color: #092247;"><i class="fas fa-map-marked-alt" style="color: #368b7d"></i>&nbsp;&nbsp;MELBOURNE</span>
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

