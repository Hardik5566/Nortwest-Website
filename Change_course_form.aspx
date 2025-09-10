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
             <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Change Of a Course Form</h2>
                    </div>
                </div>
            </div>
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
        // Initialize phone input with intlTelInput
        var input = document.querySelector("#phone");
        var iti = window.intlTelInput(input, {
            separateDialCode: true,
            nationalMode: true,
            preferredCountries: ['au'], // default country
            utilsScript: "assets/country_code/js/utils.js"
        });

        // Update hidden fields
        function updatePhoneFields() {
            var country = iti.getSelectedCountryData().dialCode || '';
            var number = iti.getNumber() || '';
            $("#<%= hd_contact_no_code.ClientID %>").val(country);
        $("#<%= hd_contact_no.ClientID %>").val(number);
    }

    input.addEventListener('change', updatePhoneFields);
    input.addEventListener('keyup', updatePhoneFields);
    input.addEventListener('countrychange', updatePhoneFields);

    // Validation function for phone number
    function validatePhone() {
        updatePhoneFields();
        if (!iti.isValidNumber()) {
            $("#phone").css('border-color', 'red');
            alert('Valid Phone number is required');
            return false;
        } else {
            $("#phone").css('border-color', '');
            return true;
        }
    }
</script>
    <script>
        $(document).ready(function () {
            $('.select2').select2();
        });

        // Only numbers
        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
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

        function handleChange() {
            var text = (iti.isValidNumber()) ? "" : "Please enter a valid number";
            output.innerHTML = text;
            $("#<%= hd_contact_no_code.ClientID %>").val(iti.selectedCountryData.dialCode);
            $("#<%= hd_contact_no.ClientID %>").val($("#phone").val());
        }

        input.addEventListener('countrychange', handleChange);
        input.addEventListener('change', handleChange);
        input.addEventListener('keyup', handleChange);

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

        document.getElementById('clearBtn').addEventListener('click', function () {
            signaturePad.clear();
            $("#<%= hdnSignature.ClientID %>").val("");
        });

        function saveSignature() {
            if (!signaturePad.isEmpty()) {
                $("#<%= hdnSignature.ClientID %>").val(signaturePad.toDataURL());
            } else {
                $("#<%= hdnSignature.ClientID %>").val("");
            }
        }

        // Form Validation
        function validateForm() {
            saveSignature();
            updatePhoneFields();
            var isValid = true;
            var msg = '';

            function highlight(id, condition, errorMsg) {
                var $el = $("#" + id);
                if (!condition) {
                    $el.css("border-color", "red");
                    msg += errorMsg + '\n';
                    isValid = false;
                } else $el.css("border-color", "");
            }

            highlight("<%= txt_student_name.ClientID %>", $("#<%= txt_student_name.ClientID %>").val().trim() !== "", "Student Name is required");
            highlight("<%= txt_s_id.ClientID %>", $("#<%= txt_s_id.ClientID %>").val().trim() !== "", "Student ID is required");
            highlight("<%= txt_passport_no.ClientID %>", $("#<%= txt_passport_no.ClientID %>").val().trim() !== "", "Passport No is required");
            highlight("<%= txt_dob.ClientID %>", $("#<%= txt_dob.ClientID %>").val().trim() !== "", "Date of Birth is required");
            highlight("<%= txt_course_enroll.ClientID %>", $("#<%= txt_course_enroll.ClientID %>").val().trim() !== "", "Course Enrolled is required");
            highlight("<%= txt_intake.ClientID %>", $("#<%= txt_intake.ClientID %>").val().trim() !== "", "Intake Date is required");
            highlight("<%= txt_address.ClientID %>", $("#<%= txt_address.ClientID %>").val().trim() !== "", "Address is required");

            var email = $("#<%= txt_email.ClientID %>").val().trim();
            highlight("<%= txt_email.ClientID %>", /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email), "Valid Email is required");

            highlight("<%= txt_course_change.ClientID %>", $("#<%= txt_course_change.ClientID %>").val().trim() !== "", "New Course is required");
            highlight("<%= txt_reason_campus.ClientID %>", $("#<%= txt_reason_campus.ClientID %>").val().trim() !== "", "Reason is required");
            highlight("<%= txt_sign_date.ClientID %>", $("#<%= txt_sign_date.ClientID %>").val().trim() !== "", "Signature Date is required");

            // Country
            var countryVal = $("#<%= ddl_country.ClientID %>").prop("selectedIndex");

            if (countryVal === 0) {
                // First item selected → invalid
                $("#<%= ddl_country.ClientID %>").next('.select2-container').css('border', '1px solid red');
                msg += 'Country is required\n';
                isValid = false;
            } else {
                $("#<%= ddl_country.ClientID %>").next('.select2-container').css('border', '');
            }

            // Phone
            if (!iti.isValidNumber()) {
                $("#phone").css('border-color', 'red');
                msg += 'Valid Phone number is required\n';
                isValid = false;
            } else $("#phone").css('border-color', '');

            // Signature
            if (signaturePad.isEmpty()) {
                msg += 'Signature is required\n';
                isValid = false;
            }

            if (!isValid) alert(msg);
            return isValid;
        }
    </script>
</asp:Content>
