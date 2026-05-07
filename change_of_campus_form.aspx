<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="change_of_campus_form.aspx.cs" Inherits="change_of_campus_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Change Of Campus Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <link href="assets/css/select2.min.css" rel="stylesheet" />
    <link href="assets/country_code/css/intlTelInput.min.css" rel="stylesheet" />
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

        .nice-select.qualification.open .list {
            max-height: 250px !important;
        }

        .select2 {
            width: 100% !important;
        }

        .ch_agree label {
            font-weight: bold;
        }

        /* Math Captcha Styling */
        .captcha-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .refresh-captcha {
            cursor: pointer;
            color: #007bff;
            font-size: 18px;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row"> 
                <div class="col-lg-12 col-md-12">
                    <h1>Change Of Campus Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Change Of Campus Form</li>
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
                        <h2>Change Of Campus Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">

                    <div class="col-md-6">
                        <label class="lbl_title">Student ID</label>
                        <asp:TextBox ID="txt_s_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Passport No</label>
                        <asp:TextBox ID="txt_s_passport_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student ‘s Name</label>
                        <asp:TextBox ID="txt_s_full_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Date of Birth</label>
                        <asp:TextBox ID="txt_birth_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Current Address</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Street Address</label>
                        <asp:TextBox ID="txt_add" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Contact Number</label>
                        <div class="input-group contact_no">
                            <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control" type="tel" />
                            <p id="output"></p>
                            <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Email Address</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Course Enrolled</label>
                        <asp:TextBox ID="txt_course_enrolled" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Intake Date</label>
                        <asp:TextBox ID="txt_intake" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Change Campus Details</h4>
                </div>
                <div class="row">
                    <div class="col-md-6" style="margin-bottom: 10px">
                        <div class="border rounded">
                            <div class="bg-secondary" style="font-weight: 800">
                                Current Campus
                            </div>
                            <div class="p-3">
                                <asp:RadioButtonList ID="rb_current" runat="server" CssClass="radio-inline">
                                    <asp:ListItem Text="GEORGE STREET CAMPUS" Value="George STREET CAMPUS" />
                                    <asp:ListItem Text="YORK STREET CAMPUS" Value="York STREET CAMPUS" />
                                    <asp:ListItem Text="ADELAIDE CAMPUS" Value="Adelaide CAMPUS" />
                                    <asp:ListItem Text="MELBOURNE CAMPUS" Value="Melbourne CAMPUS" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6" style="margin-bottom: 10px">
                        <div class="border rounded">
                            <div class="bg-secondary" style="font-weight: 800">
                                Change to Campus
                            </div>
                            <div class="p-3">
                                <asp:RadioButtonList ID="rb_change" runat="server" CssClass="radio-inline">
                                    <asp:ListItem Text="GEORGE STREET CAMPUS" Value="George STREET CAMPUS" />
                                    <asp:ListItem Text="YORK STREET CAMPUS" Value="York STREET CAMPUS" />
                                    <asp:ListItem Text="ADELAIDE CAMPUS" Value="Adelaide CAMPUS" />
                                    <asp:ListItem Text="MELBOURNE CAMPUS" Value="Melbourne CAMPUS" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <label class="lbl_title">Course Name</label>
                        <asp:TextBox ID="txt_cource_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Reason for changing campus</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">

                        <asp:TextBox ID="txt_reason_campus" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>STUDENT DECLARATION</h4>
                </div>
                I hereby declare that all the information and documents provided are true and genuine, and I understand that there may be relevant visa issues due to the change of campus.
                <div class="row">

                    <div class="col-md-6">

                        <div>
                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px; cursor:pointer;" src="assets/img/eraser.png" />
                        </div>

                        <asp:HiddenField ID="hdnSignature" runat="server" />

                        <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>

                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date</label>
                        <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">Enter Captcha Code</label>
                        <div class="captcha-box">
                            <asp:Image ID="imgCaptcha" runat="server" Width="150px" Height="50px" style="border: 1px solid #ddd; border-radius: 4px; background-color: #f9f9f9;" />
                            
                            <a href="javascript:void(0);" onclick="refreshCaptchaJs();" class="refresh-captcha">
                                <i class="fas fa-sync-alt"></i>
                            </a>
                        </div>
                        <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control" style="margin-top:10px;" placeholder="Captcha Code" onkeypress="return only_number(event)"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div>
                <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
    <script>
        const canvas = document.getElementById('signatureCanvas');
        const signaturePad = new SignaturePad(canvas);

        function resizeCanvas() {
            const ratio = Math.max(window.devicePixelRatio || 1, 1);
            canvas.width = canvas.offsetWidth * ratio;
            canvas.height = canvas.offsetHeight * ratio;
            canvas.getContext("2d").scale(ratio, ratio);
            signaturePad.clear();
        }
        window.addEventListener("resize", resizeCanvas);
        resizeCanvas();

        document.getElementById('clearBtn').addEventListener('click', () => {
            signaturePad.clear();
        });

        function saveSignature() {
            var canvas = document.getElementById("signatureCanvas");
            var signatureData = canvas.toDataURL("image/png");
            document.getElementById("<%= hdnSignature.ClientID %>").value = signatureData;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">

    <script src="assets/js/select2.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>

    <script>
        $(document).ready(function () {
            $('.select2').select2();
        });

        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        var input = document.querySelector("#phone");
        var output = document.querySelector("#output");
        var iti = window.intlTelInput(input, {
            nationalMode: true,
            separateDialCode: true,
            preferredCountries: ['au'],
            utilsScript: "assets/country_code/js/utils.js",
        });

        var handleChange = function () {
            var text = (iti.isValidNumber()) ? "" : "Please enter a valid number";
            output.innerHTML = text;
            $("#<%= hd_contact_no_code.ClientID%>").val(iti.selectedCountryData.dialCode);
            $("#<%= hd_contact_no.ClientID%>").val($("#phone").val());
        };

        input.addEventListener('countrychange', handleChange);
        input.addEventListener('change', handleChange);
        input.addEventListener('keyup', handleChange);

        $("#<%= btn_submit.ClientID %>").click(function (event) {
            if (!validateForm()) {
                event.preventDefault();
                return false;
            }

            // Save signature right before postback
            saveSignature();

            // SUCCESS: Validation Passed
            // Hide actual button and show placeholder span to prevent multiple clicks
            var btn = $(this);
            setTimeout(function () {
                btn.hide();
                btn.after('<span class="btn btn-success" style="cursor: not-allowed; opacity: 0.7;">Submitting...</span>');
            }, 10);
        });

        function validateForm() {
            var isValid = true;
            var errorMsg = "";

            function validateInput(id, fieldName) {
                var value = $("#" + id).val().trim();
                if (value === "") {
                    $("#" + id).css("border-color", "red");
                    errorMsg += fieldName + " is required.\n";
                    isValid = false;
                } else {
                    $("#" + id).css("border-color", "");
                }
            }

            validateInput("<%= txt_s_id.ClientID %>", "Student ID");
            validateInput("<%= txt_s_passport_no.ClientID %>", "Passport No");
            validateInput("<%= txt_s_full_name.ClientID %>", "Full Name");
            validateInput("<%= txt_birth_date.ClientID %>", "Date of Birth");
            validateInput("<%= txt_email.ClientID %>", "Email");

            var emailVal = $("#<%= txt_email.ClientID %>").val().trim();
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (emailVal !== "" && !emailRegex.test(emailVal)) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                errorMsg += "Please enter a valid Email.\n";
                isValid = false;
            }

            validateInput("<%= txt_add.ClientID %>", "Street Address");
            if ($("#phone").val().trim() === "" || !iti.isValidNumber()) {
                $("#phone").css("border-color", "red");
                errorMsg += "Valid Contact Number is required.\n";
                isValid = false;
            } else { $("#phone").css("border-color", ""); }

            validateInput("<%= txt_course_enrolled.ClientID %>", "Course Enrolled");
            validateInput("<%= txt_intake.ClientID %>", "Intake Date");
            validateInput("<%= txt_cource_name.ClientID %>", "Course Name");
            validateInput("<%= txt_reason_campus.ClientID %>", "Reason for Changing Campus");

            // Client side Captcha check (only checks if it's empty, backend checks the math)
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                errorMsg += "Please enter the security captcha code.\n";
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            var canvas = document.getElementById("signatureCanvas");
            var blank = document.createElement("canvas");
            blank.width = canvas.width; blank.height = canvas.height;
            if (canvas.toDataURL() === blank.toDataURL()) {
                errorMsg += "Please provide your signature.\n";
                isValid = false;
            }

            if (!isValid) { alert(errorMsg); }
            return isValid;
        }

        function refreshCaptchaJs() {
            $.ajax({
                type: "POST",
                url: "change_of_campus_form.aspx/GetNewCaptcha",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // response.d contains the Base64 image string returned from C#
                    $("#<%= imgCaptcha.ClientID %>").attr("src", response.d);
                    
                    // Clear the input field
                    $("#<%= txt_captcha_input.ClientID %>").val("");
                    $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
                },
                error: function (error) {
                    console.log("Error refreshing captcha");
                }
            });
        }

        $(document).on('ready page:load', function () {
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
        });
    </script>
</asp:Content>