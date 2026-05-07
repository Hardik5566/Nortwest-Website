<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cancelation_form.aspx.cs" Inherits="cancelation_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Cancelation Form
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
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
        .select2 { width: 100% !important; }

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

<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Cancelation Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Cancelation Form</li>
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
                        <h2>Cancelation Form</h2>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <h4>Student Details</h4>
                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Student Number</label>
                        <asp:TextBox ID="txt_s_number" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Given Names</label>
                        <asp:TextBox ID="txt_s_given_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Last Name</label>
                        <asp:TextBox ID="txt_s_last_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Full Name</label>
                        <asp:TextBox ID="txt_s_full_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Email id</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Contact Number</label>
                        <div class="input-group contact_no">
                            <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control" type="tel" />
                            <p id="output" style="margin-top:5px;"></p>
                            <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <h4>Current Address</h4>
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Street Address</label>
                        <asp:TextBox ID="txt_add" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="lbl_title">Address Line 2</label>
                        <asp:TextBox ID="txt_add_line_2" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">City</label>
                        <asp:TextBox ID="txt_city" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">State / Province / Region</label>
                        <asp:TextBox ID="txt_state" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">ZIP / Postal Code</label>
                        <asp:TextBox ID="txt_zip" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 search_dropdown">
                        <label class="lbl_title">Country</label>
                        <asp:DropDownList ID="ddl_country" CssClass="form-control select2" DataTextField="name" DataValueField="name" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
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
                <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" 
                    OnClientClick="return validateForm();" />
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" Runat="Server">
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>

    <script>
        // Fetch Captcha from Server using AJAX
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                url: "cancelation_form.aspx/GetCaptchaImage",
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
            $('.select2').select2();
            generateCaptcha(); // Initial load
        });

        function only_number(key) {
            var charCode = key.which ? key.which : key.keyCode;
            return !(charCode > 31 && (charCode < 48 || charCode > 57));
        }

        var input = document.querySelector("#phone");
        var output = document.querySelector("#output");
        var iti = window.intlTelInput(input, {
            nationalMode: true,
            separateDialCode: true,
            preferredCountries: ['au'],
            utilsScript: "assets/country_code/js/utils.js"
        });

        function handleChange() {
            output.innerText = iti.isValidNumber() ? "" : "Please enter a valid number";
            $("#<%= hd_contact_no_code.ClientID %>").val(iti.selectedCountryData.dialCode);
            $("#<%= hd_contact_no.ClientID %>").val($("#phone").val());
        }

        input.addEventListener('countrychange', handleChange);
        input.addEventListener('change', handleChange);
        input.addEventListener('keyup', handleChange);

        function validateForm() {
            var isValid = true;
            var errorMsg = "";

            if ($("#<%= txt_s_number.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- Student Number is required.\n";
            }
            if ($("#<%= txt_s_last_name.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- Student Last Name is required.\n";
            }
            if ($("#<%= txt_s_given_name.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- Student Given Names are required.\n";
            }
            if ($("#<%= txt_s_full_name.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- Student Full Name is required.\n";
            }

            var email = $("#<%= txt_email.ClientID %>").val();
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                isValid = false; errorMsg += "- Valid Email is required.\n";
            }

            if ($("#<%= txt_add.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- Street Address is required.\n";
            }
            if ($("#<%= txt_add_line_2.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- Address Line 2 is required.\n";
            }
            if ($("#<%= txt_city.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- City is required.\n";
            }
            if ($("#<%= txt_state.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- State is required.\n";
            }
            if ($("#<%= txt_zip.ClientID %>").val().trim() == "") {
                isValid = false; errorMsg += "- ZIP Code is required.\n";
            }

            var ddlCountry = $("#<%= ddl_country.ClientID %>");
            if (ddlCountry.val() == null || ddlCountry.val() == "" || ddlCountry.prop("selectedIndex") == 0) {
                isValid = false; errorMsg += "- Country is required.\n";
            }

            if ($("#<%= hd_contact_no_code.ClientID %>").val() == "" || !iti.isValidNumber()) {
                isValid = false; errorMsg += "- Valid Contact Number is required.\n";
            }

            // Updated CAPTCHA VALIDATION (Client-side checks for empty only)
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                errorMsg += "- Please enter the security captcha code.\n";
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (!isValid) {
                alert("Please correct the following errors:\n" + errorMsg);
                return false;
            } else {
                // HIDE BUTTON AND SHOW SPAN TO PREVENT MULTIPLE CLICK
                var btn = $("#<%= btn_submit.ClientID %>");
                setTimeout(function () {
                    btn.hide();
                    btn.after('<span class="btn btn-success" style="cursor: not-allowed; opacity: 0.7;">Submitting...</span>');
                }, 10);
                return true;
            }
        }
    </script>
</asp:Content>