<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Agent_app_form.aspx.cs" Inherits="Agent_app_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Agent Enquiry
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
            
        .input-group {
            display: grid !important;
        }

        .nice-select.qualification.open .list {
            max-height: 250px !important;
        }

        .select2 {
            width: 100% !important;
        }

        input {
            min-height: 0px !important;
        }

        .captcha-container {
            margin-top: 15px;
            max-width: 320px;
        }

        .captcha-image-wrapper {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 15px;
            margin-top: 8px;
        }

        #captchaCanvas {
            border: 1px solid #d3d3d3;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .refresh-captcha {
            cursor: pointer;
            color: #3b82f6;
            font-size: 20px;
            font-weight: bold;
        }
        
        .error-border {
            border: 1px solid red !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Agent Enquiry</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Agent Enquiry</li>
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
                        <h2>Agent Enquiry</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <%--<h4>Agency Details</h4>--%>
                <%--<span>(Please note all particulars must be completed. Print clearly and use BLOCK letters only)</span>--%>
                <%--<br />
                <br />--%>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Agency Name</label>
                        <asp:TextBox runat="server" ID="txt_agency_name" CssClass="form-control val-field" />
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Agency Location</label>
                        <asp:TextBox runat="server" ID="txt_agency_location" CssClass="form-control val-field" />
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Website</label>
                        <asp:TextBox runat="server" ID="txt_website" CssClass="form-control val-field" />
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Contact Name</label>
                        <asp:TextBox runat="server" ID="txt_contact_name" CssClass="form-control val-field" />
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Contact Email</label>
                        <asp:TextBox runat="server" ID="txt_contact_email" TextMode="Email" CssClass="form-control val-field" />
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Contact Number</label>
                        <div class="input-group contact_no">
                            <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control val-field" type="tel" />
                            <p id="output" style="color:red; font-size:12px; margin-top:5px;"></p>
                            <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="captcha-container">
                            <label class="lbl_title">Enter Captcha Code</label>
                            <div class="captcha-image-wrapper">
                                <canvas id="captchaCanvas" width="160" height="50"></canvas>
                                <i class="fas fa-sync-alt refresh-captcha" onclick="generateCaptcha()" title="Refresh Captcha"></i>
                            </div>
                            <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control val-field" placeholder="Captcha Code" onkeypress="return only_number(event)"></asp:TextBox>
                        </div>
                    </div>
                </div>

            </div>

            <div class="btn_step" style="margin-top: 20px; text-align: left;">
                <asp:Button Text="Submit" ID="btn_submit" OnClientClick="return validateFormAll();" OnClick="btn_submit_Click" CssClass="btn btn-success" runat="server" />
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script src="assets/country_code/js/intlTelInput.js"></script>

<script>
    var expectedCaptchaAnswer = 0;
    var windowIti;

    function only_number(evt) {
        var charCode = evt.which ? evt.which : evt.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            evt.preventDefault();
            return false;
        }
        return true;
    }

    function drawCaptcha(text) {
        var canvas = document.getElementById('captchaCanvas');
        var ctx = canvas.getContext('2d');

        ctx.fillStyle = '#f9f9f9';
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.strokeStyle = '#d3d3d3';
        ctx.lineWidth = 1;
        for (var i = 0; i < 15; i++) {
            ctx.beginPath();
            ctx.moveTo(Math.random() * canvas.width, Math.random() * canvas.height);
            ctx.lineTo(Math.random() * canvas.width, Math.random() * canvas.height);
            ctx.stroke();
        }

        ctx.font = 'bold 18px sans-serif';
        ctx.fillStyle = '#000000';
        ctx.fillText(text, 15, 32);
    }

    function generateCaptcha() {
        fetch("Agent_app_form.aspx/GetCaptchaText", {
            method: "POST",
            headers: {
                "Content-Type": "application/json; charset=utf-8"
            }
        })
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            drawCaptcha(data.d);
            document.getElementById('<%= txt_captcha_input.ClientID %>').value = "";

            var parts = data.d.replace(" = ?", "").split(" ");
            if (parts[1] === "+") {
                expectedCaptchaAnswer = parseInt(parts[0]) + parseInt(parts[2]);
            } else {
                expectedCaptchaAnswer = parseInt(parts[0]) - parseInt(parts[2]);
            }
        })
        .catch(function (error) {
            console.error(error);
        });
    }

    function validateFormAll() {
        var errors = [];
        var firstInvalidField = null;

        var allFields = document.querySelectorAll('.val-field');
        for (var i = 0; i < allFields.length; i++) {
            allFields[i].classList.remove('error-border');
        }

        function checkField(id, errorMsg, isEmail) {
            var el = document.getElementById(id);
            if (!el) return;

            var val = el.value.trim();
            var hasError = false;

            if (val === "") {
                hasError = true;
            } else if (isEmail) {
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailRegex.test(val)) {
                    hasError = true;
                    errorMsg = "Please enter a valid Contact Email.";
                }
            }

            if (hasError) {
                el.classList.add('error-border');
                errors.push(errorMsg);
                if (!firstInvalidField) firstInvalidField = el;
            }
        }

        checkField('<%= txt_agency_name.ClientID %>', "Agency Name is required.", false);
        checkField('<%= txt_agency_location.ClientID %>', "Agency Location is required.", false);
        checkField('<%= txt_website.ClientID %>', "Website is required.", false);
        checkField('<%= txt_contact_name.ClientID %>', "Contact Name is required.", false);
        checkField('<%= txt_contact_email.ClientID %>', "Contact Email is required.", true);

        var phoneEl = document.getElementById('phone');
        var outputEl = document.getElementById('output');
        if (phoneEl.value.trim() === "") {
            phoneEl.classList.add('error-border');
            errors.push("Contact Number is required.");
            if (!firstInvalidField) firstInvalidField = phoneEl;
        } else if (windowIti && !windowIti.isValidNumber()) {
            phoneEl.classList.add('error-border');
            errors.push("Please enter a valid Contact Number.");
            if (!firstInvalidField) firstInvalidField = phoneEl;
        }

        var captchaEl = document.getElementById('<%= txt_captcha_input.ClientID %>');
        var captchaVal = captchaEl.value.trim();
        if (captchaVal === "") {
            captchaEl.classList.add('error-border');
            errors.push("Captcha Code is required.");
            if (!firstInvalidField) firstInvalidField = captchaEl;
        } else if (parseInt(captchaVal) !== expectedCaptchaAnswer) {
            captchaEl.classList.add('error-border');
            errors.push("Invalid CAPTCHA! Please enter correct answer.");
            if (!firstInvalidField) firstInvalidField = captchaEl;
            generateCaptcha();
        }

        if (errors.length > 0) {
            alert("Please correct the following errors:\n\n- " + errors.join("\n- "));
            if (firstInvalidField) {
                firstInvalidField.focus();
            }
            return false;
        }

        return true;
    }

    document.addEventListener("DOMContentLoaded", function () {

        generateCaptcha();

        var input = document.querySelector("#phone");
        var output = document.querySelector("#output");
        var hdContactNoCode = document.getElementById("<%= hd_contact_no_code.ClientID %>");
        var hdContactNo = document.getElementById("<%= hd_contact_no.ClientID %>");

        if (input) {
            windowIti = window.intlTelInput(input, {
                nationalMode: true,
                separateDialCode: true,
                preferredCountries: ["au"],
                utilsScript: "assets/country_code/js/utils.js"
            });

            function updatePhoneData() {
                if (windowIti.isValidNumber()) {
                    output.innerHTML = "";
                    input.classList.remove('error-border');
                } else if (input.value.trim() !== "") {
                    output.innerHTML = "Invalid number format";
                } else {
                    output.innerHTML = "";
                }

                if (hdContactNoCode) {
                    hdContactNoCode.value = "+" + windowIti.getSelectedCountryData().dialCode;
                }
                if (hdContactNo) {
                    hdContactNo.value = input.value.trim();
                }
            }

            input.addEventListener("countrychange", updatePhoneData);
            input.addEventListener("keyup", updatePhoneData);
            input.addEventListener("change", updatePhoneData);
            input.addEventListener("keypress", only_number);

            updatePhoneData();
        }
    });
</script>
</asp:Content>