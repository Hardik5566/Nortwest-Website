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

        /* Math Captcha Styling */
        .captcha-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        #imgCaptcha {
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .refresh-captcha {
            cursor: pointer;
            color: #007bff;
            font-size: 18px;
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
                    </div>
                </div>
            </div>

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

                <hr />

                <div class="row mt-4">
                    <div class="col-md-4">
                        <label class="lbl_title">Enter Captcha Code</label>
                        <div class="captcha-box">
                            <img id="imgCaptcha" width="150" height="50" alt="Security Captcha" />
                            <i class="fas fa-sync-alt refresh-captcha" onclick="generateCaptcha()" title="Refresh Captcha"></i>
                        </div>
                        <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control" style="margin-top:10px;" placeholder="Captcha Code" onkeypress="return only_number(event)"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div>
                <asp:Button ID="btn_submit" runat="server" OnClientClick="return handleFinalSubmit();" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script>
        document.addEventListener('contextmenu', e => e.preventDefault());

        document.onkeydown = e =>
            e.keyCode == 123 || // F12
            (e.ctrlKey && e.shiftKey && (e.keyCode == 73 || e.keyCode == 74)) || // Ctrl+Shift+I/J
            (e.ctrlKey && (e.keyCode == 85 || e.keyCode == 83)) // Ctrl+U / Ctrl+S
            ? false : true;

        setInterval(() => {
            if (window.outerWidth - innerWidth > 160 || window.outerHeight - innerHeight > 160)
                document.body.innerHTML = "<h2 style='text-align:center;margin-top:20%'>Inspect is disabled</h2>";
        }, 1000);
    </script>

    <script>
        // --- Fetch Captcha from Server using AJAX ---
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                // Make sure this matches the actual file name/route
                url: "qualification_issuance _form.aspx/GetCaptchaImage", 
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false,
                success: function (response) {
                    $('#imgCaptcha').attr('src', response.d);
                    $("#<%= txt_captcha_input.ClientID %>").val("");
                },
                error: function (xhr, status, error) {
                    console.error("Failed to load captcha: " + error);
                }
            });
        }

        $(document).ready(function () {
            generateCaptcha();
        });

        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }

        // --- Master Submit Handler ---
        function handleFinalSubmit() {
            if (!validateForm()) {
                return false;
            }

            // Visual Processing State
            var btn = $("#<%= btn_submit.ClientID %>");
            setTimeout(function () {
                btn.hide();
                if ($('#submitting_placeholder').length === 0) {
                    btn.after('<span id="submitting_placeholder" class="btn btn-success" style="cursor: not-allowed; opacity: 0.7;">Submitting...</span>');
                }
            }, 10);

            return true;
        }

        // --- Sequential Form Validation ---
        function validateForm() {
            // Helper function for sequential validation 
            function validateFieldSeq(id, message) {
                var el = $("#" + id);
                if (el.val().trim() === "") {
                    el.css("border-color", "red");
                    alert(message);
                    el.focus();
                    return false;
                } else {
                    el.css("border-color", "");
                    return true;
                }
            }

            // Reset all text borders
            $("input[type='text'], input[type='date']").css("border-color", "");

            // 1. Student Name
            if (!validateFieldSeq("<%= txtStudentName.ClientID %>", "Student Name is required.")) return false;

            // 2. Student ID
            if (!validateFieldSeq("<%= txtStudentID.ClientID %>", "Student ID is required.")) return false;

            // 3. Course
            if (!validateFieldSeq("<%= txtCourse.ClientID %>", "Course is required.")) return false;

            // 4. Date Requested
            if (!validateFieldSeq("<%= txtDateRequested.ClientID %>", "Date Requested is required.")) return false;

            // 5. Documents Requested (Checkboxes / Other text)
            var anyChecked = $("#<%= ch_attainment.ClientID %>").is(":checked") ||
                             $("#<%= ch_completion.ClientID %>").is(":checked") ||
                             $("#<%= ch_relese.ClientID %>").is(":checked") ||
                             $("#<%= ch_term.ClientID %>").is(":checked") ||
                             $("#<%= ch_certificate.ClientID %>").is(":checked") ||
                             $("#<%= ch_letter_enrol.ClientID %>").is(":checked") ||
                             $("#<%= ch_record.ClientID %>").is(":checked");

            var otherDoc = $("#<%= txt_other_document.ClientID %>").val().trim();

            if (!anyChecked && otherDoc === "") {
                alert("Please select at least one document or specify what you need in the 'Other' field.");
                return false;
            }

            // 6. CAPTCHA Check (Client-side empty check only)
            if (!validateFieldSeq("<%= txt_captcha_input.ClientID %>", "Please enter the security captcha code.")) return false;

            return true; // All checks passed
        }
    </script>
</asp:Content>