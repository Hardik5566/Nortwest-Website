<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="downloads.aspx.cs" Inherits="downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .h4, h4 {
            font-size: 16px !important;
        }

        .blog-area .info .content > a {
            padding: 5px 40px !important;
            margin-top: 20px;
            text-align: center;
        }

        /* Tablet: 2 per row */
        @media (max-width: 991px) {
            .single-item {
                flex: 0 0 50% !important;
                max-width: 50% !important;
            }
        }

        /* Mobile: 1 per row */
        @media (max-width: 767px) {
            .single-item {
                flex: 0 0 100% !important;
                max-width: 100% !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Downloads</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Downloads</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="blog-area default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Marketing Materials, Handbooks & Guides</h2>
                        <p>
                            We have gathered all the forms and downloads you will need during your studies with us in one place. In the forms section, we have an electronic form that you can use for any situation. In the downloads section you will find the Student Handbook, Australian government legislation, our Academic Calendar, City of Sydney Guide and other useful information for International students. We hope you find the information useful.
                        </p>
                    </div>
                </div>
            </div>

            <div class="row" style="display: flex; flex-wrap: wrap; margin: 0 -10px;">
                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">GUIDE FOR INTERNATIONAL STUDENTS</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">ELICOS STUDENTS HANDBOOK</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">ESOS FRAMEWORK</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">LIST OF EXTERNAL COUNSELLING AND ADVICE SERVICES</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Second Row -->
            <div class="row" style="display: flex; flex-wrap: wrap; margin: 0 -10px; margin-top: 20px;">
                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">NSW FAIR TRADING CONSUMER GUIDE</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">STUDENT SERVICES GUIDE</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">STUDENTS ORIENTATION</a>
                                </h4>
                                <a href="#">Download</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 single-item" style="padding: 10px; display: flex; flex: 0 0 25%; max-width: 25%;">
                    <div class="item" style="border: 1px solid #ddd; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; width: 100%; border-radius: 6px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
                        <div class="info" style="flex: 1;">
                            <div class="content" style="display: flex; flex-direction: column; height: 100%;">
                                <h4 style="margin-bottom: auto;">
                                    <a href="#">ACADEMIC CALENDAR</a>
                                </h4>
                                <a href="#">Download</a>
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
