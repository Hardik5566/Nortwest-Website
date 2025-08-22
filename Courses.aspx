<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Course
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .features-area .features .item a {
            border: 1px solid #e7e7e7;
            box-shadow: none;
            padding: 30px !important;
        }

        .features .item {
            text-align: center;
        }

        .features-area .features .item a img {
            width: 65px !important;
            margin-bottom: 20px;
        }

        .features-area .features .item a h4 {
            text-transform: capitalize;
            font-weight: 500;
            font-size: 14px;
        }

        .features-area .features .item .info {
            min-height: 55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Courses</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Courses</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="features-area default-padding bg-gray bottom-less">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Courses</h2>
                        <p>
                            Explore Our Diverse Range of Courses Across Various Fields.
                            Find the Perfect Program to Enhance Your Skills and Career Path.
                       
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="features">
                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=Project Management">
                                <div class="icon">
                                    <img src="assets/img/project-management.png" />
                                </div>
                                <div class="info">
                                    <h4>Project Management</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=Business">
                                <div class="icon">
                                    <img src="assets/img/business.png" />
                                </div>
                                <div class="info">
                                    <h4>Business</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                         <a href="Project_Management.aspx?page_name=Leadership %26 Management">
                                <div class="icon">
                                    <img src="assets/img/team-leader.png" />
                                </div>
                                <div class="info">
                                    <h4>Leadership & Management</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=English">
                                <div class="icon">
                                    <img src="assets/img/translation.png" />
                                </div>
                                <div class="info">
                                    <h4>English</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=Information Technology">
                                <div class="icon">
                                    <img src="assets/img/technical-support.png" />
                                </div>
                                <div class="info">
                                    <h4>Information Technology
                                        <span style="font-size: 11px;">(Cyber Security & Telecommunications)</span></h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=Graduate Diploma of Management">
                                <div class="icon">
                                    <img src="assets/img/management.png" />
                                </div>
                                <div class="info">
                                    <h4>Graduate Diploma of Management  <span style="font-size: 11px;">(Learning)</span></h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=Cookery %26 Hospitality">
                                <div class="icon">
                                    <img src="assets/img/chef.png" />
                                </div>
                                <div class="info">
                                    <h4>Cookery & Hospitality</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-3 col-sm-6">
                        <div class="item mariner">
                            <a href="Project_Management.aspx?page_name=Building %26 Construction">
                                <div class="icon">
                                    <img src="assets/img/construction.png" />
                                </div>
                                <div class="info">
                                    <h4>Building & Construction</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="equal-height col-md-12 col-sm-12">
                        <div class="item mariner">
                            <a href="#">
                                <div class="info" style="min-height: auto">
                                    <h4 style="margin-bottom: 0px">Superseded courses under transition – current students only</h4>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <a href="https://appform.nortwest.edu.au/">
                        <img src="assets/img/click%20to%20enroll.png" style="width: 100%; border-radius: 10px" />
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="registration-area default-padding bg-dark text-light">
        <!-- Fixed BG-->
        <div class="fixed-bg bg-cover" style="background-image: url(assets/img/CreditRecognition.png);"></div>
        <!-- End Fixed BG-->
        <div class="container">
            <div class="row">
                <div class="col-md-7 countdown">
                    <h2>RECOGNITION OF PRIOR LEARNING (RPL)&
CREDIT TRANSFERS</h2>

                    <p>
                        RPL & Credit Transfers is an assessment process that allows for recognisation of competencies currently held, regardless of how, when or where the learning occurred. RPL assesses the individual’s prior learning to determine the extent to which that individual is currently competent against the required learning outcomes, competency outcomes, or standards for entry to, and/or partial or total completion of a qualification.
                   
                    </p>


                </div>
            </div>
        </div>
    </div>

    <div class="blog-area default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Policies & Procedures</h2>
                        <p>
                            Please check here for a full version of our policies and procedures.
                       
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="blog-items text-center">
                    <a href="#" style="text-transform: uppercase; font-weight: 600; display: inline-block; padding: 8px 40px; border: 2px solid #ffb606; color: #002147; margin-top: 5px; overflow: hidden; position: relative; z-index: 1; margin-bottom: -8px; border-radius: 30px;">Read All Policies
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

