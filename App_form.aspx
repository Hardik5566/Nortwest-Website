<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="App_form.aspx.cs" Inherits="App_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
  Enrollment Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <%-- <style>
        ul li a {
            color: white !important;
        }

        .title h4 {
            color: white;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                     <h1>Enrollment Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Enrollment Form</li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

    <div class="container" style="margin-top: 40px; margin-bottom: 40px;">
        <div class="row">
            <div class="col-md-12">
                <div style="border: 1px solid #ddd; border-radius: 4px; padding: 20px;">

                    <p style="font-size: 14px; line-height: 1.6; color: #333;">
                        Thank you for your interest in Northwest College. To apply for our courses, kindly download the application pdf form by 
                        <a href="assets/image/Form/NW_App form_Mar25.pdf" download style="color: #007bff; text-decoration: none;">clicking here</a>
                        and attach the below documents and send us an email to 
                        <a href="mailto:applynow@northwest.edu.au" style="color: #007bff; text-decoration: none;">applynow@northwest.edu.au</a>
                    </p>

                    <p style="font-size: 14px; line-height: 1.6; color: #333;">
                        Subject of email: Student Name_DOB_Course_Intake_City
                    </p>

                    <ol style="font-size: 14px; line-height: 1.8; color: #333; padding-left: 20px;">
                        <li>Passport</li>
                        <li>Filled and signed application form 
                            <a href="assets/image/Form/NW_App form_Mar25.pdf" download style="color: #007bff; text-decoration: none;">(Click here to Download)</a>
                        </li>
                        <li>Offshore/Onshore Academic documents</li>
                        <li>Valid VISA/Vevo document if onshore</li>
                        <li>IELTS/PTE if available</li>
                        <li>All previous COEs of the student</li>
                    </ol>

                    <p style="font-size: 14px; color: #333;">
                        <strong>NOTE:</strong> Passport, Application form, Academic documents are mandatory to process an offer
                    </p>

                    <a href="assets/image/Form/NW_App form_Mar25.pdf" download class="btn" style="background-color: #3672ff; color: white; font-size: 14px; font-weight: 300; padding: 8px 16px; border-radius: 4px;">
                        <i class="fas fa-download"></i> &nbsp Application Form
                    </a>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

