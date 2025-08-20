<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Student_Support_Service.aspx.cs" Inherits="Student_Support_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Student Support Service
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .default-padding.bottom-less {
            padding-top: 80px !important;
            padding-bottom: 80px !important;
        }

        .service_list li {
            margin: 15px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Student Support Service</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Student Support Service</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <div class="choseus-area bg-gray text-center default-padding-top default-padding-bottom ">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Student Support Services</h2>
                        <p>
                            Student support services are available at all Nortwest’s campuses. Student support services are accessible during normal business hours and help students to achieve satisfactory course progress. Student support services also help students to adjust to their studies and life in Australia and provide information about:                       
                        </p>
                    </div>
                </div>
                <%--<div class="course-details-area">
                    <div class="col-md-12">
                        <div class="course-meta">
                            <ul class="list text-left">
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Over 37 lectures and 55.5 hours of content!</li>
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Testing Training Included.</li>
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Best suitable for beginners to advanced level users and who learn faster when demonstrated.</li>
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Course content designed by considering current software testing technology and the job market.</li>
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Practical assignments at the end of every session.</li>
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Unlimited Resourses</li>
                                <li><i class="fas fa-angle-right"></i>&nbsp;&nbsp;Practical learning experience with live project work and examples.</li>
                            </ul>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>

        <div class="join-us-area default-padding bottom-less bg-dark shape-theme ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="item text-left">
                            <h2>Services</h2>
                            <div>
                                <ul class="service_list" style="list-style-type: disclosure-closed">
                                    <li>Legal Services</li>
                                    <li>Emergency and health services</li>
                                    <li>Facilities and resources</li>
                                    <li>Complaints and appeals processes</li>
                                    <li>Inquiries about course progress or attendance</li>
                                    <li>Overseeing views and rights of students</li>
                                    <li>Supporting students in hardship regarding studies, accommodation, work and safety</li>
                                    <li>Maintaining an up-to-date bank of information relating to financial, legal or health professional</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="margin-top: 80px">
            <div class="row">
                <div class="item-box">
                    <a href="#">
                        <div class="col-md-3 single-item">
                            <div class="item">
                                <h4>VET Students Handbook</h4>
                                <p>
                                </p>
                                <i class="fas fa-book-open"></i>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="col-md-3 single-item">
                            <div class="item">
                                <h4>ELICOS Students Handbook</h4>
                                <p>
                                </p>
                                <i class="fas fa-book-open"></i>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="col-md-3 single-item">
                            <div class="item">
                                <h4>Student Services Guide</h4>
                                <p>
                                </p>
                                <i class="fas fa-user-graduate"></i>
                            </div>
                        </div>
                    </a>
                    <a href="Student_Forms.aspx">
                        <div class="col-md-3 single-item">
                            <div class="item">
                                <h4>Student Online Forms</h4>
                                <p>
                                </p>
                                <i class="fas fa-bookmark"></i>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

