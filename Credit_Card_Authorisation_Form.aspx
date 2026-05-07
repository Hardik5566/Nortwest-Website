<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Credit_Card_Authorisation_Form.aspx.cs" Inherits="Credit_Card_Authorisation_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Credit Card Authorisation Form
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

        .input-group {
            display: grid !important;
        }

        .nice-select.qualification.open .list {
            max-height: 250px !important;
        }

        .select2 {
            width: 100% !important;
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
                    <h1>Credit Card Authorisation Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Credit Card Authorisation Form</li>
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
                        <h2>Credit Card Authorisation Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">Student Number</label>
                        <asp:TextBox ID="txt_stu_num" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Student Last Name</label>
                        <asp:TextBox ID="txt_stu_l_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Student Given Names</label>
                        <asp:TextBox ID="txt_stu_given_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-12">
                        <label class="lbl_title">Student Full Name</label>
                        <asp:TextBox ID="txt_stu_full_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Email id</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Student Contact Number</label>
                        <div class="input-group contact_no">
                            <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control" type="tel" />
                            <p id="output" style="font-size:12px; margin-top:5px;"></p>
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
                    <div class="col-md-6">
                        <label class="lbl_title">Street Address</label>
                        <asp:TextBox ID="txt_street_address" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Address Line 2</label>
                        <asp:TextBox ID="txt_address_line2" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3 search_dropdown">
                        <label class="lbl_title">Country</label>
                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control qualification select2" runat="server" aria-required="true" aria-invalid="false">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label class="lbl_title">City</label>
                        <asp:TextBox ID="txt_city" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="lbl_title">State / Province / Region</label>
                        <asp:TextBox ID="txt_state" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="lbl_title">ZIP / Postal Code</label>
                        <asp:TextBox ID="txt_zip_code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

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
    <script src="assets/country_code/js/intlTelInput.js"></script>
    <script src="assets/js/select2.min.js"></script>

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
        var iti;

        // --- Fetch Captcha from Server using AJAX ---
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                url: "Credit_Card_Authorisation_Form.aspx/GetCaptchaImage",
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

        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }

        // --- Initialization ---
        $(document).ready(function () {
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
            
            generateCaptcha();

            // Initialize IntlTelInput
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

        // --- Master Submit Handler ---
        function handleFinalSubmit() {
            if (!validateForm()) {
                return false;
            }

            // Visual Processing State
            var btn = document.getElementById("<%= btn_submit.ClientID %>");
            setTimeout(function () {
                btn.style.display = 'none';
                if (!document.getElementById('submitting_placeholder')) {
                    btn.insertAdjacentHTML('afterend', '<span id="submitting_placeholder" class="btn btn-success" style="cursor: not-allowed; opacity: 0.7;">Submitting...</span>');
                }
            }, 10);

            return true;
        }

        // --- Form Validation ---
        function validateForm() {
            var isValid = true;
            var messages = [];

            function highlight(id, condition, errorMsg) {
                var $el = $("#" + id);
                if (!condition) {
                    $el.css("border-color", "red");
                    messages.push(errorMsg);
                    isValid = false;
                } else {
                    $el.css("border-color", "");
                }
            }

            // Required Field Checks
            highlight("<%= txt_stu_num.ClientID %>", $("#<%= txt_stu_num.ClientID %>").val().trim() !== "", "- Student Number is required.");
            highlight("<%= txt_stu_l_name.ClientID %>", $("#<%= txt_stu_l_name.ClientID %>").val().trim() !== "", "- Student Last Name is required.");
            highlight("<%= txt_stu_given_name.ClientID %>", $("#<%= txt_stu_given_name.ClientID %>").val().trim() !== "", "- Student Given Names are required.");
            highlight("<%= txt_stu_full_name.ClientID %>", $("#<%= txt_stu_full_name.ClientID %>").val().trim() !== "", "- Student Full Name is required.");

            // Validate Email
            var email = $("#<%= txt_email.ClientID %>").val().trim();
            highlight("<%= txt_email.ClientID %>", /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email), "- Valid Email is required.");

            // Address
            highlight("<%= txt_street_address.ClientID %>", $("#<%= txt_street_address.ClientID %>").val().trim() !== "", "- Street Address is required.");
            highlight("<%= txt_address_line2.ClientID %>", $("#<%= txt_address_line2.ClientID %>").val().trim() !== "", "- Address Line 2 is required.");
            
            // Validate Country Dropdown
            var countryEl = $("#<%= ddl_country.ClientID %>");
            if (countryEl.val() === null || countryEl.val() === "" || countryEl.prop("selectedIndex") === 0) {
                countryEl.next(".select2-container").find(".select2-selection").css("border-color", "red");
                messages.push("- Country is required.");
                isValid = false;
            } else {
                countryEl.next(".select2-container").find(".select2-selection").css("border-color", "");
            }

            highlight("<%= txt_city.ClientID %>", $("#<%= txt_city.ClientID %>").val().trim() !== "", "- City is required.");
            highlight("<%= txt_state.ClientID %>", $("#<%= txt_state.ClientID %>").val().trim() !== "", "- State is required.");
            highlight("<%= txt_zip_code.ClientID %>", $("#<%= txt_zip_code.ClientID %>").val().trim() !== "", "- ZIP Code is required.");

            // Contact Number
            if ($("#<%= hd_contact_no_code.ClientID%>").val() == "" || !iti.isValidNumber()) {
                $("#phone").css("border-color", "red");
                messages.push("- Valid Contact Number is required.");
                isValid = false;
            } else { $("#phone").css("border-color", ""); }

            // MATH CAPTCHA VALIDATION (Client-side checks for empty only)
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                messages.push("- Please enter the security captcha code.");
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (!isValid) {
                alert("Please correct the following errors:\n\n" + messages.join("\n"));
            }

            return isValid;
        }
    </script>
</asp:Content>