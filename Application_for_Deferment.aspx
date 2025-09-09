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

            <!-- Information Section -->
            <div class="form-container">
                <div>
                    <h4>INFORMATION TO NOTE</h4>
                </div>
                With reference to the Standard 9 of NCP, Registered providers can defer or suspend the enrolment of an overseas student if there are compassionate or compelling circumstances.
                    <ol>
                        <li>Deferment/Suspension will be approved only under compassionate and compelling circumstances.</li>
                        <li>Students must submit the evidence of compassionate and compelling circumstances together with this request form to support the claim.</li>
                        <li>If the student goes overseas or is returning to their home country during this time, confirmed air ticket should also be submitted with this request form.</li>
                        <li>Deferment/Suspension may affect the course end date and future course(s) commencement date(s). This may lead you to apply for an extension of student visa to complete the course(s).</li>
                        <li>The units that you will miss during deferment are subject to availability. Nortwest College may or may not be able to offer these units upon your return and you may need to make other arrangements to complete them.</li>
                        <li>Please contact the Course Coordinator upon return to make arrangements for any missed units during deferment period.</li>
                        <li>You must complete the Course Resumption Form upon return to resume classes.</li>
                    </ol>
            </div>
            <!-- Student Details Section -->
            <div class="form-container">
                <div>
                    <h4>STUDENT DETAILS</h4>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>Student Name</label>
                        <asp:TextBox ID="txt_student_name" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col-md-3">
                        <label>Student ID</label>
                        <asp:TextBox ID="txt_std_id" CssClass="form-control" runat="server" />
                    </div>
                    <div class="col-md-3">
                        <label>Date of Birth</label>
                        <asp:TextBox ID="txt_dob" CssClass="form-control" TextMode="Date" runat="server" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label>Reason for request</label>
                        <asp:TextBox ID="txt_reason" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label>Current Course Name</label>
                        <asp:TextBox ID="txt_course_name" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>Course Start Date</label>
                        <asp:TextBox ID="txt_course_start" CssClass="form-control" TextMode="Date" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label>Course End Date</label>
                        <asp:TextBox ID="txt_course_end" CssClass="form-control" TextMode="Date" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Deferment Start Date</label>
                        <asp:TextBox ID="txt_def_start" CssClass="form-control" TextMode="Date" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label>Deferment End Date</label>
                        <asp:TextBox ID="txt_def_end" CssClass="form-control" TextMode="Date" runat="server" />
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
            var messages = [];

            // Validate Full Name
            if ($("#<%= txt_student_name.ClientID %>").val().trim() == "") {
            $("#<%= txt_student_name.ClientID %>").css("border-color", "red");
            messages.push("Full Name is required.");
            isValid = false;
        } else {
            $("#<%= txt_student_name.ClientID %>").css("border-color", "");
        }

        // Validate Student ID Number
        if ($("#<%= txt_std_id.ClientID %>").val().trim() == "") {
            $("#<%= txt_std_id.ClientID %>").css("border-color", "red");
            messages.push("Student ID is required.");
            isValid = false;
        } else {
            $("#<%= txt_std_id.ClientID %>").css("border-color", "");
        }

        // Validate DOB
        if ($("#<%= txt_dob.ClientID %>").val() == "") {
            $("#<%= txt_dob.ClientID %>").css("border-color", "red");
            messages.push("Date of Birth is required.");
            isValid = false;
        } else {
            $("#<%= txt_dob.ClientID %>").css("border-color", "");
        }

        // Validate Reason
        if ($("#<%= txt_reason.ClientID %>").val().trim() == "") {
            $("#<%= txt_reason.ClientID %>").css("border-color", "red");
            messages.push("Reason is required.");
            isValid = false;
        } else {
            $("#<%= txt_reason.ClientID %>").css("border-color", "");
        }

        // Validate Course Name
        if ($("#<%= txt_course_name.ClientID %>").val().trim() == "") {
            $("#<%= txt_course_name.ClientID %>").css("border-color", "red");
            messages.push("Course Name is required.");
            isValid = false;
        } else {
            $("#<%= txt_course_name.ClientID %>").css("border-color", "");
        }

        // Validate Course Start
        if ($("#<%= txt_course_start.ClientID %>").val().trim() == "") {
            $("#<%= txt_course_start.ClientID %>").css("border-color", "red");
            messages.push("Course Start Date is required.");
            isValid = false;
        } else {
            $("#<%= txt_course_start.ClientID %>").css("border-color", "");
        }

        // Validate Course End
        if ($("#<%= txt_course_end.ClientID %>").val().trim() == "") {
            $("#<%= txt_course_end.ClientID %>").css("border-color", "red");
            messages.push("Course End Date is required.");
            isValid = false;
        } else {
            $("#<%= txt_course_end.ClientID %>").css("border-color", "");
        }

        // Validate Deferral Start
        if ($("#<%= txt_def_start.ClientID %>").val().trim() == "") {
            $("#<%= txt_def_start.ClientID %>").css("border-color", "red");
            messages.push("Deferral Start Date is required.");
            isValid = false;
        } else {
            $("#<%= txt_def_start.ClientID %>").css("border-color", "");
        }

        // Validate Deferral End
        if ($("#<%= txt_def_end.ClientID %>").val().trim() == "") {
            $("#<%= txt_def_end.ClientID %>").css("border-color", "red");
            messages.push("Deferral End Date is required.");
            isValid = false;
        } else {
            $("#<%= txt_def_end.ClientID %>").css("border-color", "");
        }

        // Validate Sign Date
        if ($("#<%= txt_sign_date.ClientID %>").val().trim() == "") {
            $("#<%= txt_sign_date.ClientID %>").css("border-color", "red");
            messages.push("Sign Date is required.");
            isValid = false;
        } else {
            $("#<%= txt_sign_date.ClientID %>").css("border-color", "");
        }

        // Validate Signature
        var canvas = document.getElementById("signatureCanvas");
        var blank = document.createElement("canvas");
        blank.width = canvas.width;
        blank.height = canvas.height;
        if (canvas.toDataURL() === blank.toDataURL()) {
            messages.push("Please provide your signature.");
            isValid = false;
        }

        // Show all messages together
        if (!isValid && messages.length > 0) {
            alert(messages.join("\n"));
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

