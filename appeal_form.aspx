<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="appeal_form.aspx.cs" Inherits="appeal_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Appeal Form
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
                    <h1>Appeal Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Appeal Form</li>
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
                        <h2>Appeal Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

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
                            <p id="output" style="margin-top:5px; font-size:12px;"></p>
                            <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                        </div>
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
                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control qualification select2" runat="server" aria-required="true" aria-invalid="false">
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">Enter Captcha Code</label>
                        <div class="captcha-box">
                            <img id="imgCaptcha" width="150" height="50" alt="Security Captcha" />
                            <i class="fas fa-sync-alt refresh-captcha" onclick="generateCaptcha()" title="Refresh Captcha"></i>
                        </div>
                        <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control" style="margin-top:10px;" placeholder="Enter Result" onkeypress="return only_number(event)"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div>
                <asp:Button ID="btn_submit" runat="server" OnClientClick="return handleSubmit();" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" Runat="Server">
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>

    <script>
        // --- Captcha Logic ---
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                url: "appeal_form.aspx/GetCaptchaImage",
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

        // --- IntlTelInput & Initialization Logic ---
        var iti;
        $(document).ready(function () {
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
            generateCaptcha();

            var input = document.querySelector("#phone");
            var output = document.querySelector("#output");

            iti = window.intlTelInput(input, {
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
        });

        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            } else {
                return true;
            }
        }

        // --- Submission & Validation Logic ---
        function handleSubmit() {
            if (validateForm()) {
                var btn = $("#<%= btn_submit.ClientID %>");
                setTimeout(function () {
                    btn.hide();
                    btn.after('<span class="btn btn-success" style="cursor: not-allowed; opacity: 0.7;">Submitting...</span>');
                }, 10);
                return true;
            }
            return false;
        }

        function validateForm() {
            var isValid = true;
            var errorMessage = "";

            if ($("#<%= txt_s_number.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_number.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Student Number.\n";
                isValid = false;
            } else {
                $("#<%= txt_s_number.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_s_last_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_last_name.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Last Name.\n";
                isValid = false;
            } else {
                $("#<%= txt_s_last_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_s_given_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_given_name.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Given Name.\n";
                isValid = false;
            } else {
                $("#<%= txt_s_given_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_s_full_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_full_name.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Full Name.\n";
                isValid = false;
            } else {
                $("#<%= txt_s_full_name.ClientID %>").css("border-color", "");
            }

            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter a valid Email Address.\n";
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_add.ClientID %>").val().trim() == "") {
                $("#<%= txt_add.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Address Line 1.\n";
                isValid = false;
            } else {
                $("#<%= txt_add.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_add_line_2.ClientID %>").val().trim() == "") {
                $("#<%= txt_add_line_2.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Address Line 2.\n";
                isValid = false;
            } else {
                $("#<%= txt_add_line_2.ClientID %>").css("border-color", "");
            }

            if ($("#<%= ddl_country.ClientID %>").prop("selectedIndex") == 0 || $("#<%= ddl_country.ClientID %>").val() == "") {
                $("#<%= ddl_country.ClientID %>").next(".select2-container").find('.select2-selection').css("border", "1px solid red");
                errorMessage += "- Please select a Country.\n";
                isValid = false;
            } else {
                $("#<%= ddl_country.ClientID %>").next(".select2-container").find('.select2-selection').css("border", "");
            }

            if ($("#<%= txt_city.ClientID %>").val().trim() == "") {
                $("#<%= txt_city.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter City.\n";
                isValid = false;
            } else {
                $("#<%= txt_city.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_state.ClientID %>").val().trim() == "") {
                $("#<%= txt_state.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter State.\n";
                isValid = false;
            } else {
                $("#<%= txt_state.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_zip.ClientID %>").val().trim() == "") {
                $("#<%= txt_zip.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter Zip Code.\n";
                isValid = false;
            } else {
                $("#<%= txt_zip.ClientID %>").css("border-color", "");
            }

            if ($("#<%= hd_contact_no_code.ClientID%>").val() == "" || !iti.isValidNumber()) {
                $("#phone").css("border-color", "red");
                errorMessage += "- Please enter a valid Contact Number.\n";
                isValid = false;
            } else {
                $("#phone").css("border-color", "");
            }

            // CAPTCHA validation (Client-side checks for empty)
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
                errorMessage += "- Please enter the security captcha code.\n";
                isValid = false;
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (!isValid) {
                alert("Please correct the following errors:\n\n" + errorMessage);
            }

            return isValid;
        }
    </script>
</asp:Content>