<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .form_list ul {
            list-style-type: none;
        }

        .form_list li {
            padding: 10px 0;
        }

            .form_list li a {
                display: inline-block;
                font-size: 12px;
                color: #088bbd;
                font-weight: 500;
            }

                .form_list li a span {
                    background-color: #088bbd;
                    border-radius: 5px;
                    font-size: 11px;
                    padding: 2px 5px;
                    color: white;
                }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">

    <div class="row">
        <div class="col-md-3">
            <div class="card overflow-hidden radius-0">
                <div class="card-body">
                    <a href="New_Vet_Orientation.aspx" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-70">
                                <p>New Vet Orientation</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_new_vet" runat="server" Text="0"></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="assets/images/exam.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card overflow-hidden radius-0">
                <div class="card-body">
                    <a href="New_Elicos_Orientation.aspx" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-70">
                                <p>New Elicos Orientation</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_new_elicos" runat="server" Text="0"></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="assets/images/exam.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card overflow-hidden radius-0">
                <div class="card-body">
                    <a href="English_Test.aspx" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-70">
                                <p>English Test</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_english_test" runat="server" Text="0"></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="assets/images/exam.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card overflow-hidden radius-0">
                <div class="card-body">
                    <a href="GTE.aspx" style="color: black">
                        <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                            <div class="w-50">
                                <p>GTE</p>
                                <h4 class="">
                                    <asp:Label ID="lbl_gte" runat="server" Text="0"></asp:Label>
                                </h4>
                            </div>
                            <div>
                                <img src="assets/images/exam.png" style="width: 50px" />
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-10">
            <div class="card overflow-hidden radius-0 form_list">
                <div class="row">
                    <div class="col-md-12">
                        <label style="color: #002147; font-weight: 500; font-size: 17px; margin-left: 2rem;">
                            STUDENT FORMS</label>
                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li><a href="Student_Request.aspx"><i class="bi bi-folder">&nbsp;</i> Student Request Form <span id="lbl_student_request" runat="server"></span></a></li>
                            <li><a href="Application_For_Deferment.aspx"><i class="bi bi-folder">&nbsp;</i> Deferment or Suspension of Studies Form <span id="lbl_total_deferemetn" runat="server"></span></a></li>
                            <li><a href="Change_Course.aspx"><i class="bi bi-folder">&nbsp;</i> Change of a Course Form <span id="lbl_total_change_course" runat="server"></span></a></li>
                            <li><a href="Cancellation_Form.aspx"><i class="bi bi-folder">&nbsp;</i> Cancelation Form <span id="lbl_total_cancel" runat="server"></span></a></li>
                            <li><a href="Special_Leave_Request.aspx"><i class="bi bi-folder">&nbsp;</i> Special Leave Request Form <span id="lbl_total_special_leave" runat="server"></span></a></li>
                            <li><a href="Credit_Card_auth.aspx"><i class="bi bi-folder">&nbsp;</i> Credit Card Authorisation Form <span id="lbl_total_credit_card_auth" runat="server"></span></a></li>
                            <li><a href="Student_Details_Form.aspx"><i class="bi bi-folder">&nbsp;</i> Student Details Form <span id="lbl_total_student_detail" runat="server"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li><a href="Credit_Transfer_Application.aspx"><i class="bi bi-folder">&nbsp;</i> Credit Transfer Application <span id="lbl_total_credit" runat="server"></span></a></li>
                            <li><a href="#"><i class="bi bi-folder">&nbsp;</i> Installment Payment Agreement <span>0</span></a></li>
                            <li><a href="Application_For_Reassesment.aspx"><i class="bi bi-folder">&nbsp;</i> Application for Reassessment <span id="lbl_total_reassesment_application" runat="server"></span></a></li>
                            <li><a href="Appeal_Form.aspx"><i class="bi bi-folder">&nbsp;</i> Appeal Form <span id="lbl_total_appeal" runat="server"></span></a></li>
                            <li><a href="Complaint_and_Feedback.aspx"><i class="bi bi-folder">&nbsp;</i> Complaint and Feedback Form <span id="lbl_total_complaint" runat="server"></span></a></li>
                            <li><a href="Change_of_Campus.aspx"><i class="bi bi-folder">&nbsp;</i> Change of Campus Form <span id="lbl_total_campus_change" runat="server"></span></a></li>
                            <li><a href="Cricos_student_Withdraw_Form.aspx"><i class="bi bi-folder">&nbsp;</i> CRICOS Student Withdrawal Form <span id="lbl_total_cricos_withdraw" runat="server"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li><a href="Refund.aspx"><i class="bi bi-folder">&nbsp;</i> Refund Form <span id="lbl_total_refund" runat="server"></span></a></li>
                            <li><a href="GTE.aspx"><i class="bi bi-folder">&nbsp;</i> GTE Form <span id="lbl_total_GTE" runat="server"></span></a></li>
                            <li><a href="English_Test.aspx"><i class="bi bi-folder">&nbsp;</i> English Test (EPT) <span id="lbl_total_ept" runat="server"></span></a></li>
                            <li><a href="#"><i class="bi bi-folder">&nbsp;</i> LLN Test <span>0</span></a></li>
                            <li><a href="New_Elicos_Orientation.aspx"><i class="bi bi-folder">&nbsp;</i> Student Orientation Form Elicos <span id="lbl_total_elicos" runat="server"></span></a></li>
                            <li><a href="New_Vet_Orientation.aspx"><i class="bi bi-folder">&nbsp;</i> Student Orientation Form Vet <span id="lbl_total_vet" runat="server"></span></a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

