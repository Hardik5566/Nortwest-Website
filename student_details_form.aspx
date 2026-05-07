<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="student_details_form.aspx.cs" Inherits="student_details_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Student Details Form
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
        #captchaCanvas {
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .refresh-captcha {
            cursor: pointer;
            color: #007bff;
            font-size: 18px;
            transition: transform 0.2s;
        }
        .refresh-captcha:hover {
            transform: rotate(90deg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Student Details Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Student Details Form</li>
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
                        <h2>Student Details Form</h2>
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
                            <p id="output"></p>
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

                <div class="row" style="margin-top: 15px;">
                    <div class="col-md-4">
                        <label class="lbl_title">Enter Captcha Code</label>
                        
                        <div class="captcha-box">
                            <canvas id="captchaCanvas" width="150" height="50"></canvas>
                            <i class="fas fa-sync-alt refresh-captcha" title="Refresh Captcha" onclick="refreshCaptcha()"></i>
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
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" Runat="Server">
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>

    <script>
        $(document).ready(function () {
            $('.select2').select2();

            // Load the captcha on first page load silently
            refreshCaptcha();
        });

        // Makes a silent AJAX call to C# without refreshing the page
        function refreshCaptcha() {
            PageMethods.GetNewCaptcha(function (response) {
                // response contains the math text from C# (e.g. "12 + 5 = ?")
                const canvas = document.getElementById('captchaCanvas');
                const ctx = canvas.getContext('2d');
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.font = "24px Arial";
                ctx.fillStyle = "#333";
                ctx.fillText(response, 20, 35);

                // Add noise lines
                for (let i = 0; i < 4; i++) {
                    ctx.strokeStyle = "#ccc";
                    ctx.beginPath();
                    ctx.moveTo(Math.random() * 150, Math.random() * 50);
                    ctx.lineTo(Math.random() * 150, Math.random() * 50);
                    ctx.stroke();
                }

                // Clear any input the user previously typed
                $("#<%= txt_captcha_input.ClientID %>").val('');
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");

            }, function (error) {
                console.error("Failed to load Captcha: ", error);
            });
        }

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

        $("#<%= btn_submit.ClientID %>").click(function (event) {
            if (!validateForm()) {
                event.preventDefault();
                return false;
            }

            // SUCCESS BLOCK: Visual feedback while server validates
            var btn = $(this);
            setTimeout(function () {
                btn.hide();
                btn.after('<span class="btn btn-success" style="cursor: not-allowed; opacity: 0.7;">Submitting...</span>');
            }, 10);
        });

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

            checkField("<%= txt_s_number.ClientID %>", "Student Number", $("#<%= txt_s_number.ClientID %>").val().trim() != "");
            checkField("<%= txt_s_given_name.ClientID %>", "Student Given Names", $("#<%= txt_s_given_name.ClientID %>").val().trim() != "");
            checkField("<%= txt_s_last_name.ClientID %>", "Student Last Name", $("#<%= txt_s_last_name.ClientID %>").val().trim() != "");
            checkField("<%= txt_s_full_name.ClientID %>", "Student Full Name", $("#<%= txt_s_full_name.ClientID %>").val().trim() != "");

            var emailVal = $("#<%= txt_email.ClientID %>").val();
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            checkField("<%= txt_email.ClientID %>", "Valid Email", emailRegex.test(emailVal));

            checkField("phone", "Contact Number", ($("#phone").val().trim() != "" && iti.isValidNumber()));

            checkField("<%= txt_add.ClientID %>", "Street Address", $("#<%= txt_add.ClientID %>").val().trim() != "");
            checkField("<%= txt_city.ClientID %>", "City", $("#<%= txt_city.ClientID %>").val().trim() != "");
            checkField("<%= txt_state.ClientID %>", "State", $("#<%= txt_state.ClientID %>").val().trim() != "");
            checkField("<%= txt_zip.ClientID %>", "ZIP Code", $("#<%= txt_zip.ClientID %>").val().trim() != "");

            if ($("#<%= ddl_country.ClientID %>").prop("selectedIndex") <= 0) {
                $("#<%= ddl_country.ClientID %>").next(".select2").find(".select2-selection").css("border-color", "red");
                errors.push("Country");
                isValid = false;
            } else {
                $("#<%= ddl_country.ClientID %>").next(".select2").find(".select2-selection").css("border-color", "");
            }

            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                errors.push("Security Captcha Code is required");
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (errors.length > 0) {
                alert("Please correct the following fields:\n- " + errors.join("\n- "));
            }

            return isValid;
        }

        $(document).on('ready page:load', function () {
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
        });
    </script>
</asp:Content>