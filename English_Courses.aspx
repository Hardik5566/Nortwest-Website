<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="English_Courses.aspx.cs" Inherits="English_Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    English Courses
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
                    <h1>English Courses</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">English Courses</li>
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
                        <h2>English Courses</h2>
                    </div>
                </div>
            </div>
          <div class="row" style="display: flex; flex-wrap: wrap;">
    <!-- First Item -->
    <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
        <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
            <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                <div class="col-md-12 info">
                    <div class="info-box">
                        <div class="content">
                            <h4>
                                <a href="Dimploma_of_Project_Management.aspx">English for Academic Purposes</a>
                            </h4>
                            <ul>
                                <li><i class="fas fa-map-marked-alt"></i>CRICOS 098088K</li>
                            </ul>
                            <ul>
                                <li><i class="fas fa-school"></i>Sydney CBD</li>
                                <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                <li><i class="fas fa-school"></i>Melbourne CBD</li>
                            </ul>
                            <p>
                                This course helps students reach an English language level commensurate with beginning a vocational course. To enter this course, students need a reasonable level of English – Intermediate.
                            </p>
                            <hr />
                            <p>
                                This course comprises 4, 8, 12, 16, or 24 weeks of study with 20 face-to-face hours per week.
                            </p>

                            <div class="bottom">
                                <a href="Dimploma_of_Project_Management.aspx" class="btn circle btn-dark border btn-sm">
                                    <i class="fas fa-eye">&nbsp;</i>View Detail
                                </a>
                                <a href="#">
                                    <i class="fas fa-download">&nbsp;</i>Download Flyer
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Second Item -->
    <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
        <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
            <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                <div class="col-md-12 info">
                    <div class="info-box">
                        <div class="content">
                            <h4>
                                <a href="#">General English</a>
                            </h4>
                            <ul>
                                <li><i class="fas fa-map-marked-alt"></i>CRICOS 110415F</li>
                            </ul>
                            <ul>
                                <li><i class="fas fa-school"></i>Sydney CBD</li>
                                <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                <li><i class="fas fa-school"></i>Melbourne CBD</li>
                            </ul>
                            <p>
                                This course helps students reach an English language level commensurate with beginning a vocational course. To enter this course, students need a reasonable level of English – Intermediate.
                            </p>
                            <hr />
                            <p>General English is recommended as the first step in language learning for those just starting out with English. General English courses focus on teaching language skills required in everyday life. The classes integrate reading, writing, listening, and speaking activities to develop your skills rapidly.</p>

                            <div class="bottom">
                                <a href="#" class="btn circle btn-dark border btn-sm">
                                    <i class="fas fa-eye">&nbsp;</i>View Detail
                                </a>
                                <a href="#">
                                    <i class="fas fa-download">&nbsp;</i>Download Flyer
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
    <div class="course-details-area" style="padding-right:0px">
        <div class="container">
            <div class="row">
                <!-- Start Course Info -->
                <div class="col-md-12">
                    <div class="courses-info" style="padding-right:0px">


                        <!-- Star Tab Info -->
                        <div class="tab-info">
                            <!-- Tab Nav -->
                            <ul class="nav nav-pills" style="margin-bottom:0px">
                                <li class="active">
                                    <a data-toggle="tab" href="#tab1" aria-expanded="true">ELICOS COURSE PROGRESS POLICY
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab2" aria-expanded="false">ELICOS ATTENDANCE POLICY
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab3" aria-expanded="false">ELICOS STUDENT HANDBOOK
                                    </a>
                                </li>

                            </ul>
                            <!-- End Tab Nav -->
                            <!-- Start Tab Content -->
                            <div class="tab-content tab-content-info">
                                <!-- Single Tab -->
                                <div id="tab1" class="tab-pane fade active in">
                                    <div class="info title">
                                        <p>To see the ELICOS Course Progress Policy <a href="assets/img/Policy/Assessments-Policy-and-Procedure_ELICOS_V1.0.pdf">click here</a></p>
                                    </div>
                                </div>
                                <!-- End Single Tab -->

                                <!-- Single Tab -->
                                <div id="tab2" class="tab-pane fade">
                                    <div class="info title">
                                        <p>To check the ELICOS Attendance Policy <a href="assets/img/Policy/Attendance-monitoring-and-reporting-policy-and-procedure-ELICOS_V1.0.pdf">click here</a></p>
                                    </div>
                                </div>
                                <!-- End Single Tab -->

                                <!-- Single Tab -->
                                <div id="tab3" class="tab-pane fade">
                                    <div class="info title">
                                        To see the ELICOS Student Handbook.
                                    </div>
                                </div>
                                <!-- End Single Tab -->

                                <!-- Single Tab -->

                                <!-- End Single Tab -->
                            </div>
                            <!-- End Tab Content -->
                        </div>
                        <!-- End Tab Info -->
                    </div>
                </div>
                <!-- End Course Info -->


            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

