<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/qualification_issuance _form.aspx.cs" Inherits="qualification_issuance__form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Qualification Issuance Form
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .form-container {
            background-color: white;
            border: 1px solid #e7e7e7;
            padding: 35px;
            margin-bottom: 25px;
        }

            .form-container .lbl_title {
                color: #161616;
                font-size: 14px;
                font-weight: 500;
            }

        .section-title {
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Qualification Issuance Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Qualification Issuance Form</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-gray default-padding bg-cover">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Qualification Issuance Form</h2>
                        <p>Complete the following section and submit the form to Student Administration</p>
                    </div>
                </div>
            </div>

            <!-- Student Info -->
            <div class="form-container">
                <div>
                    <h4>Student Information</h4>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Student Name</label>
                        <asp:TextBox ID="txtStudentName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student ID</label>
                        <asp:TextBox ID="txtStudentID" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Course</label>
                        <asp:TextBox ID="txtCourse" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date Requested</label>
                        <asp:TextBox ID="txtDateRequested" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Documents Requested -->
            <div class="form-container">
                <div>
                    <h4>Documents Requested</h4>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_attainment" runat="server" />
                                Statement of Attainment</label>
                        </div>
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_completion" runat="server" />
                                Completion Letter</label>
                        </div>
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_relese" runat="server" />
                                Release Letter</label>
                        </div>
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_term" runat="server" />
                                Term Break Letter</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_certificate" runat="server" />
                                Certificate</label>
                        </div>
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_letter_enrol" runat="server" />
                                Letter of Enrolment</label>
                        </div>
                        <div>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="ch_record" runat="server" />
                                Academic Record</label>
                        </div>
                        <div>
                            <label>Other:</label>
                            <asp:TextBox ID="txt_other_document" CssClass="form-control input-sm" runat="server" Style="display: inline-block; width: 60%; margin-left: 10px;"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Admin Use Only -->
           
            <div>
                <asp:Button ID="btn_submit" runat="server" OnClientClick="saveSignature()" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script>
    $("#<%= btn_submit.ClientID %>").click(function (event) {
        if (!validateForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
            return false;
        }
    });

    // Form validation function
    function validateForm() {
        var isValid = true;

        // Student Name
        if ($("#<%= txtStudentName.ClientID %>").val().trim() == "") {
            $("#<%= txtStudentName.ClientID %>").css("border-color", "red");
            isValid = false;
        } else {
            $("#<%= txtStudentName.ClientID %>").css("border-color", "");
        }

        // Student ID
        if ($("#<%= txtStudentID.ClientID %>").val().trim() == "") {
            $("#<%= txtStudentID.ClientID %>").css("border-color", "red");
            isValid = false;
        } else {
            $("#<%= txtStudentID.ClientID %>").css("border-color", "");
        }

        // Course
        if ($("#<%= txtCourse.ClientID %>").val().trim() == "") {
            $("#<%= txtCourse.ClientID %>").css("border-color", "red");
            isValid = false;
        } else {
            $("#<%= txtCourse.ClientID %>").css("border-color", "");
        }

        // Date Requested
        if ($("#<%= txtDateRequested.ClientID %>").val().trim() == "") {
            $("#<%= txtDateRequested.ClientID %>").css("border-color", "red");
            isValid = false;
        } else {
            $("#<%= txtDateRequested.ClientID %>").css("border-color", "");
        }

        // Documents Requested – check at least one checkbox or "Other" filled
        var anyChecked = $("#<%= ch_attainment.ClientID %>").is(":checked") ||
                         $("#<%= ch_completion.ClientID %>").is(":checked") ||
                         $("#<%= ch_relese.ClientID %>").is(":checked") ||
                         $("#<%= ch_term.ClientID %>").is(":checked") ||
                         $("#<%= ch_certificate.ClientID %>").is(":checked") ||
                         $("#<%= ch_letter_enrol.ClientID %>").is(":checked") ||
                         $("#<%= ch_record.ClientID %>").is(":checked");

        var otherDoc = $("#<%= txt_other_document.ClientID %>").val().trim();

        if (!anyChecked && otherDoc == "") {
            alert("Please select at least one document or specify in 'Other'.");
            isValid = false;
        }

        return isValid;
    }
</script>

</asp:Content>
