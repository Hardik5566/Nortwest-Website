<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Application_for_Deferment.aspx.cs" Inherits="Application_for_Deferment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Application for Deferment
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Application for Deferment / Suspension Form International Students</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Application for Deferment</li>
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
                        <h2>Application for Deferment / Suspension Form International Students</h2>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Student Name</label>
                        <asp:TextBox ID="txt_f_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Student ID</label>
                        <asp:TextBox ID="txt_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">

                    <%--<div class="col-md-4">
                    <label class="lbl_title">Student ID</label>
                    <asp:TextBox ID="txt_student_id" CssClass="form-control" runat="server"></asp:TextBox>
                </div>--%>
                    <div class="col-md-6">
                        <label class="lbl_title">Date</label>
                        <asp:TextBox ID="txt_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title lbl_title" for="courseSelection">Course</label>
                        <div id="courseSelection">

                            <label class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-check-input" />
                                BSB50120 - Diploma of Business
                            </label>
                            <label class="checkbox-inline">
                                <asp:CheckBox ID="CheckBox2" runat="server" CssClass="form-check-input" />
                                BSB60120 - Advanced Diploma of Business
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">I wish to defer / suspend my studies for the following reason/s:</label>
                        <asp:TextBox ID="txt_reason" CssClass="form-control" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">I wish to defer / suspend my enrolment until (insert date):</label>
                        <asp:TextBox ID="txt_enrolment" CssClass="form-control" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Address while on leave:</label>
                        <asp:TextBox ID="txt_addrsess_leave" CssClass="form-control" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Email</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">

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
                        <label class="lbl_title">Mobile</label>
                        <div class="input-group mobile_no_no">
                            <input id="phone1" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone1" class="form-control" type="tel" />
                            <p id="output1"></p>
                            <asp:HiddenField ID="hd_mobile_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_mobile_no" Value="" runat="server" />
                        </div>
                    </div>
                </div>


            </div>



            <div class="form-container">
                <div>
                    <h4>STUDENT SIGNATURE</h4>
                </div>

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
        var input1 = document.querySelector("#phone1");
        var output1 = document.querySelector("#output1");

        var iti1 = window.intlTelInput(input1, {
            nationalMode: true,
            separateDialCode: true,
            //initialCountry: "auto",

            preferredCountries: ['au'],
            utilsScript: "assets/country_code/js/utils.js",
        });

        var handleChange = function () {

            var text = (iti1.isValidNumber()) ? "" : "Please enter a valid number";
            var textNode = document.createTextNode(text);
            output1.innerHTML = "";
            output1.appendChild(textNode);
            $("#<%= hd_mobile_no_code.ClientID%>").val(iti1.selectedCountryData.dialCode);
            $("#<%= hd_mobile_no.ClientID%>").val($("#phone1").val());
        };

        input1.addEventListener('countrychange', handleChange);
        input1.addEventListener('change', handleChange);
        input1.addEventListener('keyup', handleChange);

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

    <script src="assets/js/select2.min.js"></script>
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
            if ($("#<%= txt_f_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_f_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_f_name.ClientID %>").css("border-color", "");
            }

            // Validate Student ID Number
            if ($("#<%= txt_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_id.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_id.ClientID %>").css("border-color", "");
            }

            // Validate Photo
            if ($("#<%= txt_date.ClientID %>").val() == "") {
                $("#<%= txt_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_date.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_reason.ClientID %>").val().trim() == "") {
                $("#<%= txt_reason.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_reason.ClientID %>").css("border-color", "");
            }
            // Validate Email
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }



            if ($("#<%= txt_enrolment.ClientID %>").val().trim() == "") {
                $("#<%= txt_enrolment.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_enrolment.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_addrsess_leave.ClientID %>").val().trim() == "") {
                $("#<%= txt_addrsess_leave.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_addrsess_leave.ClientID %>").css("border-color", "");
            }

            

            if ($("#<%= txt_email.ClientID %>").val().trim() == "") {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
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
                $("#phone").css("border-color", "");
            }

            if ($("#<%= hd_mobile_no_code.ClientID%>").val() == "") {
                $("#phone1").css("border-color", "red");
                isValid = false;
            } else {
                $("#phone1").css("border-color", "");
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
    <%--  --%>
    <script>
        $(document).on('ready page:load', function () {
            // Reapply your jQuery code here
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
        });

    </script>
</asp:Content>

