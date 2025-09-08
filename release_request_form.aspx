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
                <div>
                </div>
            </div>
            <%--  --%>
            <div class="form-container">
                <div>
                    <h4>Reason for Release</h4>
                </div>
                <div class="row">
                    
                    <div class="col-md-12">
                       <%-- <label class="lbl_title">Reason for Release</label>--%>
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
            <asp:Button ID="btn_submit" runat="server" OnClientClick="saveSignature()" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
    <script>
        const canvas = document.getElementById('signatureCanvas');
        const signaturePad = new SignaturePad(canvas);

        // Resize canvas for high-DPI displays
        function resizeCanvas() {
            const ratio = Math.max(window.devicePixelRatio || 1, 1);
            canvas.width = canvas.offsetWidth * ratio;
            canvas.height = canvas.offsetHeight * ratio;
            canvas.getContext("2d").scale(ratio, ratio);
            signaturePad.clear();
        }
        window.addEventListener("resize", resizeCanvas);
        resizeCanvas();

        // Clear button
        document.getElementById('clearBtn').addEventListener('click', () => {
            signaturePad.clear();
        });

        function saveSignature() {
            var canvas = document.getElementById("signatureCanvas");
            var signatureData = canvas.toDataURL("image/png"); // Get signature as Base64
            document.getElementById("<%= hdnSignature.ClientID %>").value = signatureData; // Set value in hidden field
        }


        // <%--Save button
        document.getElementById('saveBtn').addEventListener('click', () => {
            if (!signaturePad.isEmpty()) {
                const signatureData = signaturePad.toDataURL('image/png');
        document.getElementById('<%= hdnSignature.ClientID %>').value = signatureData;
        document.getElementById('<%= btnPostBack.ClientID %>').click(); // Trigger postback
        } else {
            alert("Please provide a signature.");
        }
        });--%>
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script src="assets/country_code/js/intlTelInput.js"></script>
    <script src="assets/js/select2.min.js"></script>

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


    <script>
        $("#<%= btn_submit.ClientID %>").click(function (event) {
            if (!validateForm()) {
                event.preventDefault(); // Prevent form submission if validation fails
                return false;
            }
        });

        // Form validation function
        function validateForm() {
            var isValid = true;

            // Validate Full Name
            if ($("#<%= txt_student_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_student_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_student_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_s_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_s_id.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_s_id.ClientID %>").css("border-color", "");
            }



            // Validate Photo
            if ($("#<%= txt_passport_no.ClientID %>").val() == "") {
                $("#<%= txt_passport_no.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_passport_no.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_dob.ClientID %>").val().trim() == "") {
                $("#<%= txt_dob.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_dob.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_course_enroll.ClientID %>").val().trim() == "") {
                $("#<%= txt_course_enroll.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_course_enroll.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_intake.ClientID %>").val().trim() == "") {
                $("#<%= txt_intake.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_intake.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_address.ClientID %>").css("border-color", "");
            }
            
            // Validate Email
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }
            
            if ($("#<%= txt_reason_release.ClientID %>").val().trim() == "") {
                $("#<%= txt_reason_release.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_reason_release.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_sign_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "");
            }
            if ($("#<%= hd_contact_no_code.ClientID%>").val() == "") {
                $("#phone").css("border-color", "red");
                isValid = false;
            } else {
                $("#phone").css("border-color", "");
            }
         


            var canvas = document.getElementById("signatureCanvas");
            var blank = document.createElement("canvas");
            blank.width = canvas.width;
            blank.height = canvas.height;
            if (canvas.toDataURL() === blank.toDataURL()) {
                alert("Please provide your signature.");
                isValid = false;
            }
            if ($(".ch_explanation input[type='checkbox']:not(:checked)").length > 0) {
                $(".lbl_explanation_error.txt_error").show(); // Use the proper selector
                isValid = false;
            } else {
                $(".lbl_explanation_error.txt_error").hide(); // Properly hide the error

            }


            return isValid;
        }

    </script>

    <script>
        $(document).ready(function () {
            // Initialize select2
            $('.select2').select2();

            // Hide second select2 dropdown inside .search_dropdown
            $('.search_dropdown .select2-container:eq(1)').hide();
        });

        // For handling AJAX-loaded content
        $(document).on('ajaxComplete', function () {
            $('.select2').select2();
        });
    </script>

</asp:Content>

