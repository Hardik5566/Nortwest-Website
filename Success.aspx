<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            text-align: center;
            padding: 0 0;
            background: #EBF0F5;
        }

        .form-container {
            background-color: white;
            border: 1px solid #e7e7e7;
            padding: 35px;
            margin-bottom: 25px;
        }

            .form-container .lbl_title {
                color: #161616;
                font-size: 13px;
                font-weight: 500;
            }

        h1 {
            color: #88B04B;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-weight: 900;
            font-size: 40px;
            margin-bottom: 10px;
        }

        .i1 {
            color: #9ABC66;
            font-size: 100px;
            line-height: 200px;
            margin-left: -15px;
        }

        .card {
            background: white;
            padding: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;
            display: inline-block;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <%--<div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1></h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Success</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>--%>
    <div>
        <div class="card" style="width: 45%; margin-top: 50px; margin-bottom: 50px">

            <div class="row">


                <div class="item">

                    <div class="content">
                        <img src="assets/img/success.jpg" style="width: 150px" alt="Thumb" />
                        <h2 style="margin-top: 15px; color: #54c92b; font-weight: 600;">Form Submitted Successfully!</h2>
                        <p style="font-size: 16px; margin-top: 12px; color: black;">
                            Thank you for your submission. We have received your details, and our team will review them shortly. If further information is required, we will reach out to you.
                        </p>


                    </div>
                    <%--<div class="author">
                        <h4>Jonat Harik</h4>
                        <span>Student of DIU</span>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

