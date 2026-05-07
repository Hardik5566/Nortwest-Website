<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeFile="EPT_Success.aspx.cs" Inherits="EPT_Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
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

        tr {
            text-align: left;
        }

            tr th {
                background-color: #44887c;
                color: white;
            }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            border: 1px solid #4f877c !important;
        }

        .btn-success {
            padding: 5px 11px;
            background-color: #44887c;
            border-color: #44887c;
            text-align: left;
        }

        @media (max-width: 767px) {
            .card {
                width: 90% !important;
            }
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
    <div style="text-align: center">
        <div class="card" style="width: 45%; margin-top: 50px; margin-bottom: 50px">
            <div class="row">
                <div class="item">
                    <div class="content">
                        <h5 id="lbl_success_msg" runat="server"
                            style="font-weight: 600; margin-bottom: 20px; font-size: 15px; color: black"></h5>

                        <!-- Responsive table wrapper -->
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th>Subjects</th>
                                    <th>Score</th>
                                </tr>
                                <tr>
                                    <td>GRAMMAR, READING & VOCABULARY SCORE</td>
                                    <td>
                                        <asp:Label ID="lbl_score" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>WRITING</td>
                                    <td>To be Assessed</td>
                                </tr>
                                <tr>
                                    <td>ORAL SKILLS</td>
                                    <td>To be Assessed</td>
                                </tr>
                            </table>
                        </div>

                        <a href="Ept_test.aspx" class="btn btn-sm btn-success">Reappear Test</a>


                     <%--   <button type="button" style="padding: 5px 11px; min-height: auto" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#raiseRequestModal">
                            Raise a Request
                        </button>--%>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="raiseRequestModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Raise a Request</h4>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label>Student Id</label>
                        <asp:TextBox ID="txt_student_id" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>Contact No</label>
                        <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtStudentEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    </div>

                    <div class="form-group">
                        <label>Test Part</label>
                        <asp:DropDownList ID="ddlTestPart" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">Select Test Part</asp:ListItem>
                            <asp:ListItem Value="GRAMMAR, READING & VOCABULARY SCORE">GRAMMAR, READING & VOCABULARY SCORE</asp:ListItem>
                            <asp:ListItem Value="WRITING">WRITING</asp:ListItem>
                            <asp:ListItem Value="ORAL SKILLS">ORAL SKILLS</asp:ListItem>
                            <asp:ListItem Value="OTHER">OTHER</asp:ListItem>
                        </asp:DropDownList>
                    </div>


                    <div class="form-group">
                        <label>Issue Description</label>
                        <asp:TextBox ID="txtIssue" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                    </div>

                    <div class="form-group">
                        <label>Attachment</label>
                        <asp:FileUpload ID="fuAttachment" onchange="validateFileSize(this);" runat="server" CssClass="form-control" />
                        <small class="text-muted">You can upload screenshots, audio or document.</small>
                    </div>


                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSubmit" Style="padding: 5px 11px; min-height: auto" runat="server" Text="Submit"
                        CssClass="btn btn-sm btn-primary" OnClick="btnSubmit_Click" />
                    <button type="button" style="padding: 5px 11px; min-height: auto" class="btn btn-sm btn-default" data-dismiss="modal">Cancel</button>
                </div>

            </div>
        </div>
    </div>

    <div id="successModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <div class="modal-header" style="background: #2e7d32; color: #fff;">
                    <button type="button" class="close" data-dismiss="modal" style="color: #fff;">&times;</button>
                    <h4 class="modal-title">Success</h4>
                </div>

                <div class="modal-body text-center">
                    <span style="font-size: 40px; color: #2e7d32;">✔</span>
                    <p style="margin-top: 10px; font-size: 15px;">
                        Your request has been submitted successfully.
                    </p>
                </div>

                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">
                        OK
                    </button>
                </div>

            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">

    <script>
        function validateFileSize(input) {
    if (input.files && input.files[0]) {
        var sizeInMB = input.files[0].size / 1024 / 1024;
        if (sizeInMB > 1) {
            alert("File size must be less than or equal to 1 MB.");
            input.value = "";
        }
    }
}
</script>
</asp:Content>

