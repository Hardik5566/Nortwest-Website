<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Project_Management.aspx.cs" Inherits="Project_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Project Managment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .event-area .event-items .item .info-box .content {
            padding-left: 0px;
            margin-left: 0px;
            position: relative;
            z-index: 1;
        }

            .event-area .event-items .item .info-box .content::after {
                width: 0px;
            }

        .fa-school {
            color: #ffb606 !important;
            margin-right: 5px !important;
            font-size: 12px !important;
            position: relative !important;
            top: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Project Managment</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Project Managment</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="event-area default-padding">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Project Management</h2>
                    </div>
                </div>
            </div>
             <div class="row" style="display: flex; flex-wrap: wrap;">
                <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
                    <div class="event-items">
                        <!-- Single Item -->
                        <div class="item">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="Dimploma_of_Project_Management.aspx">Diploma of Project Management</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB50820</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 104051B</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of individuals who apply project management skills and knowledge. They may manage projects in a variety of contexts, across a number of industry sectors. They have project leadership and management roles and are responsible for achieving project objectives. They possess a sound theoretical knowledge base and use a range of specialised, technical and managerial competencies to initiate, plan, execute and evaluate their own work and/or the work of others.
                                        </p>


                                        <table class="table tbl_course_duration">
                                            <tr>
                                                <td>Total weeks: 52</td>
                                                <td>Study weeks: 44</td>
                                                <td>Weeks of holidays: 8</td>
                                            </tr>
                                        </table>


                                        <%-- <ul>
                                            <li><i class="fas"></i>52 weeks</li>
                                            <li><i class="fas"></i>study weeks 44</li>
                                            <li><i class="fas"></i>weeks of holidays 8</li>
                                        </ul>--%>


                                        <div class="bottom">
                                            <a href="Dimploma_of_Project_Management.aspx" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-eye">&nbsp</i>View Detail
                                            </a>
                                            <a href="#">
                                                <i class="fas fa-download">&nbsp</i>Download Flyer
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <div class="col-md-6 d-flex align-items-stretch">
                    <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
                        <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="#">Advanced Diploma of Program Management</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB60720</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 104444G</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of individuals who apply specialised knowledge and skills, together with experience in program management across a range of enterprise and industry contexts.
                                        </p>
                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 52</td>
                                                <td>Study weeks: 44</td>
                                                <td>Weeks of holidays: 8</td>
                                            </tr>
                                        </table>
                                        
                                        <div class="bottom">
                                            <a href="#" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-eye">&nbsp</i>View Detail
                                            </a>
                                            <a href="#">
                                                <i class="fas fa-download">&nbsp</i>Download Flyer
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

