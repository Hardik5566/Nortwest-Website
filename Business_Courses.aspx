<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Business_Courses.aspx.cs" Inherits="Business_Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Business Courses
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
        /* Apply Flexbox to the parent container to make items stretch equally */
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
                    <h1>Business Courses</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Business Courses</li>
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
                        <h2>Business Courses</h2>
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
                                            <a href="Dimploma_of_Project_Management.aspx">Certificate III in Business</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB30120</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 105250J</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of individuals in a variety of Business Services job roles. It is likely that these individuals are establishing their own work performance.
                                            Individuals in these roles carry out a range of routine procedural, clerical, administrative or operational tasks that require technology and business skills. They apply a broad range of competencies using some discretion, judgment and relevant theoretical knowledge. They may provide technical advice and support to a team.
                                        </p>


                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 26</td>
                                                <td>Study weeks: 22</td>
                                                <td>Weeks of holidays: 4</td>
                                            </tr>
                                        </table>




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
                                            <a href="#">Certificate IV in Business</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB40120</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 105251H</li>
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
            <%--  --%>
            <div class="row default-padding" style="display: flex; flex-wrap: wrap;">
                <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
                    <div class="event-items">
                        <!-- Single Item -->
                        <div class="item">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="Dimploma_of_Project_Management.aspx">Diploma of Business</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB50120</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 105252G</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            Students will participate in practical and authentic business situations. This may involve using innovation and creativity to develop feasibility studies or undertake business ventures. The focus on marketing and online communications ensure that graduates have the necessary skills to grow a business in contemporary settings in order to access thousands or millions of local, national or international customers who are searching, interacting, sharing and shopping online.
                                        </p>


                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 52</td>
                                                <td>Study weeks: 44</td>
                                                <td>Weeks of holidays: 8</td>
                                            </tr>
                                        </table>
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
                                            <a href="#">Advanced Diploma of Business</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB60120</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 105253F</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of individuals in a variety of Business Services job roles. These individuals may have general management accountabilities.
                                        Individuals in these roles carry out complex tasks in a specialist field of expertise. They may undertake technical research and analysis, and will often contribute to setting the strategic direction for a work area.
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
    <%--  --%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

