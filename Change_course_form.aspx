<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change_course_form.aspx.cs" Inherits="Change_course_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Change of a Course Form
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
        input { min-height: 0% !important; }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Change of a Course Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Change of a Course Form</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-gray default-padding bg-cover">
        <div class="container">
            <!-- Student Details -->
            <div class="form-container">
                <h4>Student Details</h4>
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
                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control qualification select2" runat="server"></asp:DropDownList>
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

            <!-- Contact Details -->
            <div class="form-container">
                <h4>Contact Details in Australia</h4>
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
                            <input id="phone" onkeypress="return only_number(event)" style="width:100%; padding:6px 47px;" type="tel" />
                            <p id="output"></p>
                            <asp:HiddenField ID="hd_contact_no_code" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" runat="server" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Change of Course -->
            <div class="form-container">
                <h4>Change of Course Details</h4>
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Change To Course</label>
                        <asp:TextBox ID="txt_course_change" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="lbl_title">Reason for changing Course</label>
                        <asp:TextBox ID="txt_reason_campus" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Student Declaration & Signature -->
            <div class="form-container">
                <h4>STUDENT DECLARATION</h4>
                <p>I hereby declare that all the information and documents provided are true and genuine. I understand there may be visa implications due to course changes.</p>
                <div class="row">
                    <div class="col-md-6">
                        <div>
                            <img id="clearBtn" style="width:22px; float:right; margin-bottom:8px;" src="assets/img/eraser.png" />
                        </div>
                        <asp:HiddenField ID="hdnSignature" runat="server" />
                        <canvas id="signatureCanvas" style="border:1px solid #dfdfdf; width:100%; height:250px; background:white;"></canvas>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date</label>
                        <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <asp:Button ID="btn_submit" runat="server" OnClientClick="return validateForm();" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>

    <script>
        // Initialize Select2
        $(document).ready(function () {
            $('.select2').select2();
        });

        // Only numbers for phone
        function only_number(key) {
            var charCode = key.which ? key.which : key.keyCode;
            return !(charCode > 31 && (charCode < 48 || charCode > 57));
        }

        // intlTelInput
        var input = document.querySelector("#phone");
        var output = document.querySelector("#output");
        var iti = window.intlTelInput(input, {
            nationalMode: true,
            separateDialCode: true,
            preferredCountries: ['au'],
            utilsScript: "assets/country_code/js/utils.js",
        });

        function handleChange() {
            output.textContent = iti.isValidNumber() ? "" : "Please enter a valid number";
            $("#<%= hd_contact_no_code.ClientID %>").val(iti.selectedCountryData.dialCode);
            $("#<%= hd_contact_no.ClientID %>").val($("#phone").val());
        }

        input.addEventListener('change', handleChange);
        input.addEventListener('keyup', handleChange);
        input.addEventListener('countrychange', handleChange);

        // Signature Pad
        const canvas = document.getElementById('signatureCanvas');
        const signaturePad = new SignaturePad(canvas);
        function resizeCanvas() {
            const ratio = Math.max(window.devicePixelRatio || 1, 1);
            canvas.width = canvas.offsetWidth * ratio;
            canvas.height = canvas.offsetHeight * ratio;
            canvas.getContext('2d').scale(ratio, ratio);
            signaturePad.clear();
        }
        window.addEventListener('resize', resizeCanvas);
        resizeCanvas();

        document.getElementById('clearBtn').addEventListener('click', () => signaturePad.clear());

        function saveSignature() {
            $("#<%= hdnSignature.ClientID %>").val(signaturePad.toDataURL());
        }

        // Form validation
        function validateForm() {
            saveSignature();
            var isValid = true;
            var msg = "";

            // Helper function
            function highlight(id, condition, errorMsg) {
                if (!condition) {
                    $("#" + id).css("border-color", "red");
                    msg += errorMsg + "\n";
                    isValid = false;
                } else $("#" + id).css("border-color", "");
            }

            highlight("<%= txt_student_name.ClientID %>", $("#<%= txt_student_name.ClientID %>").val().trim() != "", "Student Name is required");
            highlight("<%= txt_s_id.ClientID %>", $("#<%= txt_s_id.ClientID %>").val().trim() != "", "Student ID is required");
            highlight("<%= txt_passport_no.ClientID %>", $("#<%= txt_passport_no.ClientID %>").val().trim() != "", "Passport No is required");
            highlight("<%= txt_dob.ClientID %>", $("#<%= txt_dob.ClientID %>").val().trim() != "", "Date of Birth is required");
            highlight("<%= txt_course_enroll.ClientID %>", $("#<%= txt_course_enroll.ClientID %>").val().trim() != "", "Course Enrolled is required");
            highlight("<%= txt_intake.ClientID %>", $("#<%= txt_intake.ClientID %>").val().trim() != "", "Intake Date is required");
            highlight("<%= txt_address.ClientID %>", $("#<%= txt_address.ClientID %>").val().trim() != "", "Address is required");

            var emailValid = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test($("#<%= txt_email.ClientID %>").val());
            highlight("<%= txt_email.ClientID %>", emailValid, "Valid Email is required");

            highlight("<%= txt_course_change.ClientID %>", $("#<%= txt_course_change.ClientID %>").val().trim() != "", "New Course is required");
            highlight("<%= txt_reason_campus.ClientID %>", $("#<%= txt_reason_campus.ClientID %>").val().trim() != "", "Reason is required");
            highlight("<%= txt_sign_date.ClientID %>", $("#<%= txt_sign_date.ClientID %>").val().trim() != "", "Signature Date is required");

            // Validate country dropdown
            var ddlCountry = document.getElementById("<%= ddl_country.ClientID %>");
            var niceCountry = ddlCountry.nextElementSibling;
            if (ddlCountry.selectedIndex === 0) { isValid = false; msg += "Country is required\n"; niceCountry.style.border = "1px solid red"; } else { niceCountry.style.border = "1px solid #ccc"; }

            // Validate phone
            if ($("#<%= hd_contact_no_code.ClientID %>").val() == "") { $("#phone").css("border-color", "red"); msg += "Phone is required\n"; isValid = false; } else $("#phone").css("border-color", "");

            // Validate signature
            var blank = document.createElement("canvas");
            blank.width = canvas.width;
            blank.height = canvas.height;
            if (canvas.toDataURL() === blank.toDataURL()) { msg += "Signature is required\n"; isValid = false; }

            if (!isValid) alert(msg);
            return isValid;
        }
    </script>
</asp:Content>
