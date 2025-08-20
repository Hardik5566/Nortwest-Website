<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Student_Forms.aspx.cs" Inherits="Student_Forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Application Request Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .top-course-items .item {
            border: 1px solid #e7e7e7;
            border-radius: 10px;
            box-shadow: none;
        }

        .blog-area .sidebar .sidebar-item.category li {
            padding: 10px 0;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Student Forms</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Student Forms</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="blog-area single full-blog bg-gray left-sidebar full-blog default-padding">
        <div class="container">
            <div class="row">
                <div class="blog-items">

                    <div class="sidebar col-md-12">
                        <aside>

                            <div class="sidebar-item category" style="background-color: white">
                                <div class="title">
                                    <h4>Student Forms</h4>
                                </div>
                                <div class="sidebar-info">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <ul>
                                                <li><a href="Student_Request_Forms.aspx">Student Request Form</a></li>
                                                <li><a href="Application_for_Deferment.aspx">Deferment or Suspension of Studies Form</a></li>
                                                <li><a href="Change_course_form.aspx">Change of a Course Form</a></li>
                                                <li><a href="cancelation_form.aspx">Cancelation Form</a></li>
                                                <li><a href="special_leave_request_form.aspx">Special Leave Request Form</a></li>
                                                <li><a href="Credit_Card_Authorisation_Form.aspx">Credit Card Authorisation Form</a></li>
                                                <li><a href="student_details_form.aspx">Student Details Form</a></li>

                                            </ul>
                                        </div>
                                        <div class="col-md-4">
                                            <ul>
                                                <li><a href="credit_transfer_application.aspx">Credit Transfer Application</a></li>
                                                <li><a href="#">Installment Payment Agreement</a></li>
                                                <li><a href="application_for_reassessment.aspx">Application for Reassessment</a></li>
                                                <li><a href="appeal_form.aspx">Appeal Form</a></li>
                                                <li><a href="complaint_and_feedback_form.aspx">Complaint and Feedback Form</a></li>
                                                <li><a href="change_of_campus_form.aspx">Change of Campus Form</a></li>
                                                <li><a href="cricos_student_withdrawal_form.aspx">CRICOS Student Withdrawal Form</a></li>

                                            </ul>
                                        </div>
                                        <div class="col-md-4">
                                            <ul>
                                                <li><a href="refund_form.aspx">Refund Form</a></li>
                                                <li><a href="GTE_Form.aspx">GTE Form</a></li>
                                                <li><a href="EPT_Test.aspx">English Test (EPT)</a></li>
                                                <li><a href="#">LLN Test</a></li>
                                                <li><a href="new_elicos_orientation_form.aspx">Student Orientation Form Elicos</a></li>
                                                <li><a href="new_vet_orientation_form.aspx">Student Orientation Form Vet</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </aside>
                    </div>
                    <!-- End Start Sidebar -->
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

