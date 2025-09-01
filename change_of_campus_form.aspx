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
                    <%--<div class="col-md-6">
                        <label class="lbl_title">Student ‘s Name</label>
                        <asp:TextBox ID="txt_s_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>--%>
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

                    <!-- Change to Campus -->
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
                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />
                        </div>

                        <asp:HiddenField ID="hdnSignature" runat="server" />

                        <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>


                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date</label>
                        <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>

                    </div>

                </div>
            </div>
            <div>
                <asp:Button ID="btn_submit" runat="server" OnClientClick="saveSignature()" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">

    <script src="assets/js/select2.min.js"></script>
    <script>
        $("#<%= btn_submit.ClientID %>").click(function (event) {
            if (!validateForm()) {
                event.preventDefault(); // Prevent form submission if validation fails
                return false;
            }
        });

        function validateForm() {
            var isValid = true;
            var firstInvalid = null;

            // Validate Student ID
            if ($("#<%= txt_s_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_id.ClientID %>").css("border-color", "red");
                isValid = false;
                if (!firstInvalid) firstInvalid = $("#<%= txt_s_id.ClientID %>");
           } else {
               $("#<%= txt_s_id.ClientID %>").css("border-color", "");
            }

            // Validate Passport No
            if ($("#<%= txt_s_passport_no.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_passport_no.ClientID %>").css("border-color", "red");
               isValid = false;
               if (!firstInvalid) firstInvalid = $("#<%= txt_s_passport_no.ClientID %>");
        } else {
            $("#<%= txt_s_passport_no.ClientID %>").css("border-color", "");
           }

            // Validate Full Name
           if ($("#<%= txt_s_full_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_full_name.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_s_full_name.ClientID %>");
        } else {
            $("#<%= txt_s_full_name.ClientID %>").css("border-color", "");
        }

            // Validate Date of Birth
        if ($("#<%= txt_birth_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_birth_date.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_birth_date.ClientID %>");
        } else {
            $("#<%= txt_birth_date.ClientID %>").css("border-color", "");
        }

            // Validate Email
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test($("#<%= txt_email.ClientID %>").val().trim())) {
            $("#<%= txt_email.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_email.ClientID %>");
        } else {
            $("#<%= txt_email.ClientID %>").css("border-color", "");
        }

            // Validate Street Address
        if ($("#<%= txt_add.ClientID %>").val().trim() == "") {
                $("#<%= txt_add.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_add.ClientID %>");
        } else {
            $("#<%= txt_add.ClientID %>").css("border-color", "");
        }

            // Validate Contact Number
        if ($("#<%= hd_contact_no_code.ClientID %>").val().trim() == "") {
                $("#phone").css("border-color", "red");
                isValid = false;
                if (!firstInvalid) firstInvalid = $("#phone");
            } else {
                $("#phone").css("border-color", "");
            }

            // Validate Course Enrolled
            if ($("#<%= txt_course_enrolled.ClientID %>").val().trim() == "") {
                $("#<%= txt_course_enrolled.ClientID %>").css("border-color", "red");
               isValid = false;
               if (!firstInvalid) firstInvalid = $("#<%= txt_course_enrolled.ClientID %>");
        } else {
            $("#<%= txt_course_enrolled.ClientID %>").css("border-color", "");
           }

            // Validate Intake Date
           if ($("#<%= txt_intake.ClientID %>").val().trim() == "") {
                $("#<%= txt_intake.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_intake.ClientID %>");
        } else {
            $("#<%= txt_intake.ClientID %>").css("border-color", "");
        }

            // Validate Course Name (Change Campus Section)
        if ($("#<%= txt_cource_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_cource_name.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_cource_name.ClientID %>");
        } else {
            $("#<%= txt_cource_name.ClientID %>").css("border-color", "");
        }

            // Validate Reason for Changing Campus
        if ($("#<%= txt_reason_campus.ClientID %>").val().trim() == "") {
                $("#<%= txt_reason_campus.ClientID %>").css("border-color", "red");
            isValid = false;
            if (!firstInvalid) firstInvalid = $("#<%= txt_reason_campus.ClientID %>");
        } else {
            $("#<%= txt_reason_campus.ClientID %>").css("border-color", "");
        }

            // Validate Signature
        if ($("#<%= hdnSignature.ClientID %>").val().trim() == "") {
                $("#signatureCanvas").css("border-color", "red");
                isValid = false;
                if (!firstInvalid) firstInvalid = $("#signatureCanvas");
            } else {
                $("#signatureCanvas").css("border-color", "");
            }

            // Scroll to first invalid field
            if (!isValid && firstInvalid) {
                $('html, body').animate({
                    scrollTop: firstInvalid.offset().top - 200
                }, 500);
                firstInvalid.focus();
            }

            return isValid;
        }
    </script>

    <%--  --%>
    <script>
        $(document).on('ready page:load', function () {
            // Reapply your jQuery code here
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
        });

    </script>

    <script src="assets/country_code/js/intlTelInput.js"></script>



    <script>
        var input = document.querySelector("#phone");
        var output = document.querySelector("#output");

        var iti = window.intlTelInput(input, {
            nationalMode: true,
            separateDialCode: true,
            //initialCountry: "auto",

            preferredCountries: ['au'],
            utilsScript: "assets/country_code/js/utils.js",
        });

        var handleChange = function () {

            var text = (iti.isValidNumber()) ? "" : "Please enter a valid number";
            var textNode = document.createTextNode(text);
            output.innerHTML = "";
            output.appendChild(textNode);
            $("#<%= hd_contact_no_code.ClientID%>").val(iti.selectedCountryData.dialCode);
            $("#<%= hd_contact_no.ClientID%>").val($("#phone").val());
        };

        input.addEventListener('countrychange', handleChange);
        input.addEventListener('change', handleChange);
        input.addEventListener('keyup', handleChange);

    </script>

    <script>
        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            else {
                return true;
            }

        }

    </script>
</asp:Content>

