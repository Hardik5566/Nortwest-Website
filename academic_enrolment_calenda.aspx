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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    
                        Academic Calendar</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Academic Calendar</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="blog-area single full-blog left-sidebar full-blog default-padding" style="background-color: #eaf1f0">
        <div class="container-fluid">
            <div class="row">
            </div>
            <div class="row">

                <div class="blog-items">
                    <div class="sidebar col-md-8">
                        <div class="row">
                            <%--<div class="site-heading text-center">
                                <div class="col-md-8 col-md-offset-2">
                                    <h2>Intake Dates</h2>
                                </div>
                            </div>--%>
                            <div class="top-author">
                                <h4 style="border: 0; background-color: transparent">Intake Dates</h4>
                            </div>
                            <asp:ListView ID="list_cal" runat="server" OnItemDataBound="list_cal_ItemDataBound">
                                <ItemTemplate>
                                    <div class="sidebar col-md-4 mb-3">
                                        <aside>
                                            <div class="sidebar-item category" style="background-color: white;">
                                                <div class="title">
                                                    <h4><%# Eval("Year") %></h4>
                                                </div>
                                                <div class="sidebar-info">
                                                    <ul>
                                                        <asp:ListView ID="list_date" runat="server">
                                                            <ItemTemplate>
                                                                <li>
                                                                    <a href="#"><i class="fas fa-calendar-alt"></i>&nbsp <%# Container.DataItem %></a>
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

                    <div class="blog-content col-md-4">
                        <div class="content-items">

                            <%-- <div class="top-author" style="background-color: white; margin-bottom: 20px">
                                <h4>Holidays 2023</h4>
                                <div class="author-items holidays">
                                    <!-- Single Item -->
                                    <div class="item">

                                        <div class="info">
                                            <h5><a href="#">Summer Break: 01.01.2023 – 15.01.2023</a></h5>
                                            <h5><a href="#">Autumn Break: 18.03.2023 – 16.04.2023</a></h5>
                                            <h5><a href="#">Winter Break: 17.06.2023 – 16.07.2023</a></h5>
                                            <h5><a href="#">Spring Break: 16.09.2023 – 15.10.2023</a></h5>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="top-author" style="background-color: white; margin-bottom: 20px">
                                <h4>Holidays 2024</h4>
                                <div class="author-items holidays">
                                    <!-- Single Item -->
                                    <div class="item">

                                        <div class="info">
                                            <h5><a href="#">Summer Break: 01.01.2023 – 15.01.2023</a></h5>
                                            <h5><a href="#">Autumn Break: 18.03.2023 – 16.04.2023</a></h5>
                                            <h5><a href="#">Winter Break: 17.06.2023 – 16.07.2023</a></h5>
                                            <h5><a href="#">Spring Break: 16.09.2023 – 15.10.2023</a></h5>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="top-author" style="background-color: white; margin-bottom: 20px">
                                <h4>Public (SA)</h4>
                                <div class="author-items holidays">
                                    <!-- Single Item -->
                                    <div class="item">
                                        <div class="info">
                                            <h5><a href="#">New Year’s Day: 1st of January</a></h5>
                                            <h5><a href="#">Additional New Year’s Day: 2nd of January</a></h5>
                                            <h5><a href="#">Australia Day: 26th of January</a></h5>
                                            <h5><a href="#">Adelaide Cup Day: 13th of March</a></h5>
                                            <h5><a href="#">Good Friday: 7th of April</a></h5>
                                            <h5><a href="#">Easter Saturday: 8th of April</a></h5>
                                            <h5><a href="#">Easter Monday: 10th of April</a></h5>
                                            <h5><a href="#">Anzac Day: 25th of April</a></h5>
                                            <h5><a href="#">King’s Birthday: 12th of June</a></h5>
                                            <h5><a href="#">Labour Day: 2nd of October</a></h5>
                                            <h5><a href="#">Christmas Eve: 24th of December</a></h5>
                                            <h5><a href="#">Christmas Day: 25th of December</a></h5>
                                            <h5><a href="#">Boxing Day: 26th of December</a></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>

                            <div class="top-author" style="background-color: white">
                                <h4>Public Holidays (NSW)</h4>
                                <div class="author-items holidays">
                                    <!-- Single Item -->
                                    <div class="item">
                                        <div class="info">
                                            <asp:ListView ID="list_holiday" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <a href="#"><i class="fas fa-circle fa-xs" style="color:black"></i>&nbsp <%#Eval("holiday_name") %> : <%#Eval("holiday_date") %></a>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:ListView>
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

