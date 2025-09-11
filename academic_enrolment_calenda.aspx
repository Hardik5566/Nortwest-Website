<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="academic_enrolment_calenda.aspx.cs" Inherits="academic_enrolment_calenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Academic Calendar
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .blog-area .sidebar-item.category ul li a::after {
            display: none;
        }

        .blog-area .sidebar .sidebar-item.category li a {
            padding-left: 0px;
        }

        .top-author .author-items .item .info {
            width: 100%;
        }

            .top-author .author-items .item .info a {
                font-weight: 400;
            }

        .sidebar .blog-area.left-sidebar .sidebar {
            padding-right: 0;
        }

        .holidays .info h5 {
            list-style-type: disc;
            margin-left: 20px;
            display: list-item;
        }

        .blog-area .sidebar .sidebar-item:last-child {
            margin-bottom: 20px !important;
        }

        .newsletter-area .subscribe-items::after {
            border-radius: 12px;
        }

        .shadow.theme-hard::after {
            background: #44887c none repeat scroll 0 0;
            content: "";
            height: 100%;
            left: 0;
            opacity: 0.6;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: -1;
        }

        .text-white {
            color: white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Academic Calendar</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Academic Calendar</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="blog-area single full-blog left-sidebar full-blog default-padding" style="background-color: #eaf1f0">
        <div class="container">
            <div class="row">
            </div>
            <div class="row">
                <div class="blog-items">
                    <div class="sidebar col-md-12">
                        <div class="row">
                            <div class="row">
                                <div class="site-heading text-center" style="margin-bottom: 15px !important;">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h2>Intake Dates</h2>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="top-author">
                                <h4 style="border: 0; background-color: transparent">Intake Dates</h4>
                            </div>--%>
                            <asp:ListView ID="list_cal" runat="server" OnItemDataBound="list_cal_ItemDataBound">
                                <ItemTemplate>
                                    <div class="sidebar col-md-3 mb-3">
                                        <aside>
                                            <div class="sidebar-item category" style="background-color: white; padding: 25px !important">
                                                <div class="title">
                                                    <h4 style="margin-bottom: 15px !important; padding-bottom: 15px !important"><%# Eval("Year") %></h4>
                                                </div>
                                                <div class="sidebar-info">
                                                    <ul>
                                                        <asp:ListView ID="list_date" runat="server">
                                                            <ItemTemplate>
                                                                <li style="padding: 4px 0 !important;">
                                                                    <a href="javascript:void(0)" style="cursor: default"><i class="fas fa-calendar-alt"></i>&nbsp <%# Container.DataItem %></a>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                    </ul>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <div class="blog-content col-md-12">
                        <div class="content-items">
                            <div class="text-center my-4">
                                <div class="row">
                                    <div class="site-heading text-center" style="margin-bottom: 15px !important;">
                                        <div class="col-md-8 col-md-offset-2">
                                            <h2>Public Holidays</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="newsletter-area py-4">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-6 col-12 p20">
                                                <a href="https://business.vic.gov.au/business-information/public-holidays/victorian-public-holidays-2025" target="_blank">
                                                    <div class="subscribe-items shadow theme-hard default-padding bg-cover text-center"
                                                        style="background-image: url('assets/img/victoria.jpg'); background-size: cover; background-position: center; border-radius: 12px !important; padding: 20px;">
                                                        <div class="icon mb-3">
                                                            <img src="assets/img/holiday.png" alt="Holiday Icon" style="width: 60px; opacity: 0.9; height: auto;" />
                                                        </div>
                                                        <div class="info">
                                                            <h3 class="text-white mb-2">Victoria</h3>
                                                        </div>

                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-md-4 col-sm-6 col-12 p20">
                                                <a href="https://www.nsw.gov.au/about-nsw/public-holidays" target="_blank">
                                                    <div class="subscribe-items shadow theme-hard default-padding bg-cover text-center"
                                                        style="background-image: url('assets/img/NSW.jpg'); background-size: cover; background-position: center; border-radius: 12px !important; padding: 20px;">
                                                        <div class="icon mb-3">
                                                            <img src="assets/img/holiday.png" alt="Holiday Icon" style="width: 60px; opacity: 0.9; height: auto;" />
                                                        </div>
                                                        <div class="info">
                                                            <h3 class="text-white mb-2">NSW</h3>
                                                        </div>

                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-md-4 col-sm-6 col-12 p20">
                                                <a href="Admin/assets/Holidays/Public-Holidays-2024-2027.pdf" target="_blank">
                                                    <div class="subscribe-items shadow theme-hard default-padding bg-cover text-center"
                                                        style="background-image: url('assets/img/SA.jpg'); background-size: cover; background-position: center; border-radius: 12px !important; padding: 20px;">
                                                        <div class="icon mb-3">
                                                            <img src="assets/img/holiday.png" alt="Holiday Icon" style="width: 60px; opacity: 0.9; height: auto;" />
                                                        </div>
                                                        <div class="info">
                                                            <h3 class="text-white mb-2">SA</h3>
                                                        </div>
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
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

