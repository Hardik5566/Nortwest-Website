<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="release_request_form.aspx.cs" Inherits="release_request_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Release Request Form
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
                font-size: 13px;
                font-weight: 500;
            }

        .nice-select.qualification.open .list {
            max-height: 250px !important;
        }

        #signboard {
            width: 100%;
            height: 100px;
            background-color: black;
            color: white;
            font-size: 24px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        input {
            min-height: 0% !important;
        }

        /* Math Captcha Styling */
        .captcha-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        #captchaImage {
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
                    <h1>Release Request Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Release Request Form</li>
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
                        <h2>Release Request Form</h2>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Student Details</h4>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Student Name</label>
                        <asp:TextBox ID="txt_student_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student ID</label>
                        <asp:TextBox ID="txt_s_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                         <label class="lbl_title">Country</label>
                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control qualification select2" runat="server" aria-required="true" aria-invalid="false">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <label class="lbl_title">Passport No</label>
                        <asp:TextBox ID="txt_passport_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date of Birth</label>
                        <asp:TextBox ID="txt_dob" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Course Enrolled</label>
                        <asp:TextBox ID="txt_course_enroll" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Intake Date</label>
                        <asp:TextBox ID="txt_intake" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Contact Details in Australia</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Address</label>
                        <asp:TextBox ID="txt_address" CssClass="form-control" Rows="4" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Email Address</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
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
                </div>
            </div>
            
            <div class="form-container">
                <div>
                    <h4>Reason for Release</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:TextBox ID="txt_reason_release" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>STUDENT DECLARATION</h4>
                </div>
             I hereby declare that all the information and documents provided are true and genuine, and I understand that there may be
relevant visa issues due to the change of course. I understand there will be no more timetable change in the future.
Documents attached (list all the documents you attach, ie copy of passport):
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

                <div class="row" style="margin-top: 15px;">
                    <div class="col-md-4">
                        <label class="lbl_title">Enter Captcha Code</label>
                        <div class="captcha-box">
                            <img id="captchaImage" width="150" height="50" alt="Security Captcha" />
                            <i class="fas fa-sync-alt refresh-captcha" onclick="generateCaptcha()"></i>
                        </div>
                        <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control" style="margin-top:10px;" placeholder="Captcha Result" onkeypress="return only_number(event)"></asp:TextBox>
                    </div>
                </div>
            </div>
            <asp:Button ID="btn_submit" runat="server" OnClientClick="return onSubmitValidate(this);" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
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
    <script src="assets/country_code/js/intlTelInput.js"></script>
    <script src="assets/js/select2.min.js"></script>

    <script>
        // Calls backend to generate captcha dynamically via AJAX without full page postback
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                url: "release_request_form.aspx/GetCaptchaImage",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false, // Ensure it doesn't load a cached image
                success: function (response) {
                    $("#captchaImage").attr("src", response.d);
                    $("#<%= txt_captcha_input.ClientID %>").val("");
                },
                error: function (error) {
                    console.log("Error generating captcha");
                }
            });
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

        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }

        $(document).ready(function () {
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
            generateCaptcha(); // Generate automatically on load
        });

        // Unified Submit Handler: Replaces the jQuery .click() event to prevent conflicts with WebForms Postback
        function onSubmitValidate(btn) {
            if (!validateForm()) {
                return false; // Blocks postback
            }

            // Save Signature Data to Hidden Field
            saveSignature();

            // Provide visual feedback but ALLOW postback to continue normally
            btn.value = "Submitting...";
            btn.style.opacity = "0.7";
            return true; 
        }

        function validateForm() {
            var errors = []; 
            var isValid = true;

            function checkField(id, fieldName, condition) {
                if (!condition) {
                    $("#" + id).css("border-color", "red");
                    errors.push(fieldName);
                    isValid = false;
                } else {
                    $("#" + id).css("border-color", "");
                }
            }

            checkField("<%= txt_student_name.ClientID %>", "Student Name", $("#<%= txt_student_name.ClientID %>").val().trim() != "");
            checkField("<%= txt_s_id.ClientID %>", "Student ID", $("#<%= txt_s_id.ClientID %>").val().trim() != "");
            checkField("<%= txt_passport_no.ClientID %>", "Passport No", $("#<%= txt_passport_no.ClientID %>").val().trim() != "");
            checkField("<%= txt_dob.ClientID %>", "Date of Birth", $("#<%= txt_dob.ClientID %>").val().trim() != "");
            checkField("<%= txt_course_enroll.ClientID %>", "Course Enrolled", $("#<%= txt_course_enroll.ClientID %>").val().trim() != "");
            checkField("<%= txt_intake.ClientID %>", "Intake Date", $("#<%= txt_intake.ClientID %>").val().trim() != "");
            checkField("<%= txt_address.ClientID %>", "Address", $("#<%= txt_address.ClientID %>").val().trim() != "");
            checkField("<%= txt_reason_release.ClientID %>", "Reason for Release", $("#<%= txt_reason_release.ClientID %>").val().trim() != "");
            checkField("<%= txt_sign_date.ClientID %>", "Declaration Date", $("#<%= txt_sign_date.ClientID %>").val().trim() != "");

            var emailVal = $("#<%= txt_email.ClientID %>").val();
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            checkField("<%= txt_email.ClientID %>", "Valid Email", emailRegex.test(emailVal));

            checkField("phone", "Contact Number", ($("#phone").val().trim() != "" && iti.isValidNumber()));

            var canvas = document.getElementById("signatureCanvas");
            var blank = document.createElement("canvas");
            blank.width = canvas.width; blank.height = canvas.height;
            if (canvas.toDataURL() === blank.toDataURL()) {
                errors.push("Signature");
                isValid = false;
            }

            // ONLY check if empty client-side. Real math verification is strictly in C# code.
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                errors.push("Security Captcha Code");
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (!isValid) {
                alert("Please fill/validate the following fields:\n- " + errors.join("\n- "));
            }

            return isValid;
        }
    </script>
</asp:Content>