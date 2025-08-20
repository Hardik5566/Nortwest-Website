<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cricos_student_withdrawal_form.aspx.cs" Inherits="cricos_student_withdrawal_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    CRICOS Student Withdrawal Form
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
                    <h1>CRICOS Student Withdrawal Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">CRICOS Student Withdrawal Form</li>
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
                        <h2>CRICOS Student Withdrawal Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">


                <div class="row" style="font-size:12px">

                    <div class="col-md-12">
                        <label>Students who wish to withdraw their course should fill this form and submit to the student services. Please Note:</label>
                    </div>
                    <div class="col-md-12" style="padding-left:50px">
                        <ul>
                            <li style="list-style:disc">Withdrawing from your course will result in cancellation of your COE and this may affect your student visa.</li>
                            <li style="list-style:disc">You should attach all the necessary supporting documents to validate your reason.</li>
                            <li style="list-style:disc">If you are withdrawing course due to change of provider, you should attach an offer letter from your new provider.</li>
                            <li style="list-style:disc">If you wish to seek release from your enrolment at MILCOM, please fill the release request form. Letter of release will be issued only under certain circumstances as per the transfer between registered provider policy.</li>
                            <li style="list-style:disc">If you are withdrawing from the course due to refusal of Student Visa, please submit the letter of Visa Refusal along with this form. Any refund applicable will only be processed on submission of evidence of VISA refusal.</li>
                            <li style="list-style:disc">If there is any refund request, Refund application form should be submitted along with this form.</li>
                        </ul>
                    </div>
                </div>
            </div>
          <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">

                    <div class="col-md-6">
                        <label class="lbl_title">First Name:</label>
                        <asp:TextBox ID="txt_f_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-md-6">
                        <label class="lbl_title">Last Name:</label>
                        <asp:TextBox ID="txt_l_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date:</label>
                        <asp:TextBox ID="txt_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student ID:</label>
                        <asp:TextBox ID="txt_student_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    </div>
              </div>
             <div class="form-container">
                <div>
                    <h4>Course withdrawal details</h4>
                    <label><b>Course(s) currently enrolled and want to withdraw:</b>(If the student wants to withdraw from all the subsequent courses enrolled with the Institute, he/she should list the courses below.)</label>
                </div>

                <div class="row">

                    <div class="col-md-6">
                        <label class="lbl_title">Current Course:</label>
                        <asp:TextBox ID="txt_course" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                     <div class="col-md-6">
                        <label class="lbl_title">Subsequent Course(s):</label>
                        <asp:TextBox ID="txt_subsequent" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                       <div class="col-md-12">
                        <label class="lbl_title">Reason for withdrawal</label>
                        <asp:TextBox ID="txt_reason" CssClass="form-control" runat="server"></asp:TextBox>
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

                      <div class="col-md-6" style="margin-top: 15px">
                        <label class="lbl_title">Date:</label>
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

            // Validate Campus
           

            // Validate Student ID Number
            if ($("#<%= txt_l_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_l_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_l_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_date.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_student_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_student_id.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_student_id.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_course.ClientID %>").val().trim() == "") {
                $("#<%= txt_course.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_course.ClientID %>").css("border-color", "");
            }


            if ($("#<%= txt_subsequent.ClientID %>").val().trim() == "") {
                $("#<%= txt_subsequent.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_subsequent.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_reason.ClientID %>").val().trim() == "") {
                $("#<%= txt_reason.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_reason.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_sign_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "");
            }

            
            

            if ($(".ch_explanation input[type='checkbox']:not(:checked)").length > 0) {
                $(".lbl_explanation_error.txt_error").show(); // Use the proper selector
                isValid = false;
            } else {
                $(".lbl_explanation_error.txt_error").hide(); // Properly hide the error

            }

            

            //// Validate Overseas Address
            //if ($("#txt_over_line1").val().trim() == "" ||
            //  $("#txt_over_line2").val().trim() == "" ||
            //  $("#txt_over_city").val().trim() == "" ||
            //  $("#ddl_country").val() == "" ||
            //  $("#txt_over_post").val().trim() == "") {
            //    $("#txt_over_line1, #txt_over_line2, #txt_over_city, #ddl_country, #txt_over_post").css("border-color", "red");
            //    isValid = false;
            //} else {
            //    $("#txt_over_line1, #txt_over_line2, #txt_over_city, #ddl_country, #txt_over_post").css("border-color", "");
            //}

            //// Validate USI Number
            //if ($("#txt_usi_no").val().trim() == "") {
            //    $("#txt_usi_no").css("border-color", "red");
            //    isValid = false;
            //} else {
            //    $("#txt_usi_no").css("border-color", "");
            //}

            //// Validate Student Declaration
            //if (!$("#CheckBox1").is(":checked")) {
            //    $("#CheckBox1").css("border-color", "red");
            //    isValid = false;
            //} else {
            //    $("#CheckBox1").css("border-color", "");
            //}

            //// Validate Signature
            //if ($("#signatureCanvas").val() == "") {
            //    $("#signatureCanvas").css("border-color", "red");
            //    isValid = false;
            //} else {
            //    $("#signatureCanvas").css("border-color", "");
            //}

            return isValid;
        }

    </script>
    <script>
        $(document).on('ready page:load', function () {
            // Reapply your jQuery code here
            $('.select2').select2();
            $('.search_dropdown .select2-container:eq(1)').hide();
        });

    </script>

    <script src="assets/country_code/js/intlTelInput.js"></script>



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

