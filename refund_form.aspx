<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="refund_form.aspx.cs" Inherits="refund_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Refund Form
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

        input {
            min-height: 0px !important;
        }
        /*.selection{
            display:none !important;
        }*/

        /*.form-control .radio-inline input {
            min-height: 13px !important;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Refund Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Refund Form</li>
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
                        <h2>Refund Form</h2>
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
                        <asp:TextBox ID="txt_first_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Last Name:</label>
                        <asp:TextBox ID="txt_last_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Date of Birth:</label>
                        <asp:TextBox ID="txt_birth_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Nationality:</label>
                        <asp:DropDownList ID="ddl_nationality" runat="server" data-live-search="true" CssClass="select2 search_dropdown form-control" aria-required="true" aria-invalid="false">
                            <asp:ListItem Text="Nationality" Value="" />

                            <asp:ListItem Text="Afghan" Value="Afghan" />
                            <asp:ListItem Text="American" Value="American" />
                            <asp:ListItem Text="Albanian" Value="Albanian" />
                            <asp:ListItem Text="Algerian" Value="Algerian" />
                            <asp:ListItem Text="Argentine" Value="Argentine" />
                            <asp:ListItem Text="Argentinian" Value="Argentinian" />
                            <asp:ListItem Text="Australian" Value="Australian" />
                            <asp:ListItem Text="Austrian" Value="Austrian" />
                            <asp:ListItem Text="Bangladeshi" Value="Bangladeshi" />
                            <asp:ListItem Text="Belgian" Value="Belgian" />
                            <asp:ListItem Text="British" Value="British" />
                            <asp:ListItem Text="Bolivian" Value="Bolivian" />
                            <asp:ListItem Text="Batswana" Value="Batswana" />
                            <asp:ListItem Text="Brazilian" Value="Brazilian" />
                            <asp:ListItem Text="Bulgarian" Value="Bulgarian" />
                            <asp:ListItem Text="Bhutanese" Value="Bhutanese" />
                            <asp:ListItem Text="Cambodian" Value="Cambodian" />
                            <asp:ListItem Text="Cameroonian" Value="Cameroonian" />
                            <asp:ListItem Text="Canadian" Value="Canadian" />
                            <asp:ListItem Text="Chilean" Value="Chilean" />
                            <asp:ListItem Text="Chinese" Value="Chinese" />
                            <asp:ListItem Text="Colombian" Value="Colombian" />
                            <asp:ListItem Text="Costa Rican" Value="Costa Rican" />
                            <asp:ListItem Text="Croatian" Value="Croatian" />
                            <asp:ListItem Text="Cuban" Value="Cuban" />
                            <asp:ListItem Text="Czech" Value="Czech" />
                            <asp:ListItem Text="Danish" Value="Danish" />
                            <asp:ListItem Text="Dominican" Value="Dominican" />
                            <asp:ListItem Text="Ecuadorian" Value="Ecuadorian" />
                            <asp:ListItem Text="Emirati" Value="Emirati" />
                            <asp:ListItem Text="Egyptian" Value="Egyptian" />
                            <asp:ListItem Text="Salvadorian" Value="Salvadorian" />
                            <asp:ListItem Text="English" Value="English" />
                            <asp:ListItem Text="Estonian" Value="Estonian" />
                            <asp:ListItem Text="Ethiopian" Value="Ethiopian" />
                            <asp:ListItem Text="Fijian" Value="Fijian" />
                            <asp:ListItem Text="Finnish" Value="Finnish" />
                            <asp:ListItem Text="French" Value="French" />
                            <asp:ListItem Text="German" Value="German" />
                            <asp:ListItem Text="Ghanaian" Value="Ghanaian" />
                            <asp:ListItem Text="Greek" Value="Greek" />
                            <asp:ListItem Text="Guatemalan" Value="Guatemalan" />
                            <asp:ListItem Text="Haitian" Value="Haitian" />
                            <asp:ListItem Text="Honduran" Value="Honduran" />
                            <asp:ListItem Text="Hungarian" Value="Hungarian" />
                            <asp:ListItem Text="Icelandic" Value="Icelandic" />
                            <asp:ListItem Text="Indian" Value="Indian" />
                            <asp:ListItem Text="Indonesian" Value="Indonesian" />
                            <asp:ListItem Text="Iranian" Value="Iranian" />
                            <asp:ListItem Text="Iraqi" Value="Iraqi" />
                            <asp:ListItem Text="Irish" Value="Irish" />
                            <asp:ListItem Text="Israeli" Value="Israeli" />
                            <asp:ListItem Text="Italian" Value="Italian" />
                            <asp:ListItem Text="Jamaican" Value="Jamaican" />
                            <asp:ListItem Text="Japanese" Value="Japanese" />
                            <asp:ListItem Text="Jordanian" Value="Jordanian" />
                            <asp:ListItem Text="Kenyan" Value="Kenyan" />
                            <asp:ListItem Text="Kuwaiti" Value="Kuwaiti" />
                            <asp:ListItem Text="Lao" Value="Lao" />
                            <asp:ListItem Text="Latvian" Value="Latvian" />
                            <asp:ListItem Text="Lebanese" Value="Lebanese" />
                            <asp:ListItem Text="Liberian" Value="Liberian" />
                            <asp:ListItem Text="Libyan" Value="Libyan" />
                            <asp:ListItem Text="Lithuanian" Value="Lithuanian" />
                            <asp:ListItem Text="Malagasy" Value="Malagasy" />
                            <asp:ListItem Text="Malaysian" Value="Malaysian" />
                            <asp:ListItem Text="Malian" Value="Malian" />
                            <asp:ListItem Text="Maltese" Value="Maltese" />
                            <asp:ListItem Text="Mexican" Value="Mexican" />
                            <asp:ListItem Text="Mongolian" Value="Mongolian" />
                            <asp:ListItem Text="Moroccan" Value="Moroccan" />
                            <asp:ListItem Text="Mozambican" Value="Mozambican" />
                            <asp:ListItem Text="Namibian" Value="Namibian" />
                            <asp:ListItem Text="Nepalese" Value="Nepalese" />
                            <asp:ListItem Text="Dutch" Value="Dutch" />
                            <asp:ListItem Text="New Zealand" Value="New Zealand" />
                            <asp:ListItem Text="Nicaraguan" Value="Nicaraguan" />
                            <asp:ListItem Text="Nigerian" Value="Nigerian" />
                            <asp:ListItem Text="Norwegian" Value="Norwegian" />
                            <asp:ListItem Text="Pakistani" Value="Pakistani" />
                            <asp:ListItem Text="Panamanian" Value="Panamanian" />
                            <asp:ListItem Text="Paraguayan" Value="Paraguayan" />
                            <asp:ListItem Text="Peruvian" Value="Peruvian" />
                            <asp:ListItem Text="Philippine" Value="Philippine" />
                            <asp:ListItem Text="Polish" Value="Polish" />
                            <asp:ListItem Text="Portuguese" Value="Portuguese" />
                            <asp:ListItem Text="Romanian" Value="Romanian" />
                            <asp:ListItem Text="Russian" Value="Russian" />
                            <asp:ListItem Text="Saudi" Value="Saudi" />
                            <asp:ListItem Text="Scottish" Value="Scottish" />
                            <asp:ListItem Text="Senegalese" Value="Senegalese" />
                            <asp:ListItem Text="Serbian" Value="Serbian" />
                            <asp:ListItem Text="Singaporean" Value="Singaporean" />
                            <asp:ListItem Text="Slovak" Value="Slovak" />
                            <asp:ListItem Text="South African" Value="South African" />
                            <asp:ListItem Text="Korean" Value="Korean" />
                            <asp:ListItem Text="Spanish" Value="Spanish" />
                            <asp:ListItem Text="Sri Lankan" Value="Sri Lankan" />
                            <asp:ListItem Text="Sudanese" Value="Sudanese" />
                            <asp:ListItem Text="Swedish" Value="Swedish" />
                            <asp:ListItem Text="Swiss" Value="Swiss" />
                            <asp:ListItem Text="Syrian" Value="Syrian" />
                            <asp:ListItem Text="Taiwanese" Value="Taiwanese" />
                            <asp:ListItem Text="Tajikistani" Value="Tajikistani" />
                            <asp:ListItem Text="Thai" Value="Thai" />
                            <asp:ListItem Text="Tongan" Value="Tongan" />
                            <asp:ListItem Text="Tunisian" Value="Tunisian" />
                            <asp:ListItem Text="Turkish" Value="Turkish" />
                            <asp:ListItem Text="Ukrainian" Value="Ukrainian" />
                            <asp:ListItem Text="Uruguayan" Value="Uruguayan" />
                            <asp:ListItem Text="Venezuelan" Value="Venezuelan" />
                            <asp:ListItem Text="Vietnamese" Value="Vietnamese" />
                            <asp:ListItem Text="Welsh" Value="Welsh" />
                            <asp:ListItem Text="Zambian" Value="Zambian" />
                            <asp:ListItem Text="Zimbabwean" Value="Zimbabwean" />
                        </asp:DropDownList>


                    </div>
                    <div class="col-md-12"></div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Contact Number:</label>
                        <div class="input-group contact_no">
                            <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control" type="tel" />
                            <p id="output"></p>
                            <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Email:</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="lbl_title">Passport No:</label>
                        <asp:TextBox ID="txt_passport_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>

            </div>
            <div class="form-container">
                <div>
                    <h4>Current Address</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Address:</label>
                        <asp:TextBox ID="txt_address" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Course Details</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Course Code, Course Name and Start Date:</label>
                        <asp:TextBox ID="txt_course_name" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Reasons of Refunds: To be completed by Student or the delegate</h4>
                </div>

                <div style="margin-bottom: 13px">
                    <h6>Outline of Default Refund Arrangements (Please tick the appropriate reason of refund)</h6>
                    <span class="lbl_explanation_error txt_error" style="display: none;">Please select at least one checkbox before submitting the form.</span>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <asp:CheckBoxList ID="ch_reason" CssClass="checkbox-inline" runat="server">
                            <asp:ListItem Text="Initial Visa refused prior to course commencement (with Department of Home Affairs Refusal Letter)/Full refund less Administration Fee" />
                            <asp:ListItem Text="Northwest College is unable to provide the course for which the original enrolment and payment has been made/Full refund" />
                            <asp:ListItem Text="Withdrawal prior to agreed start date: Notify the Institute more than 60 days prior to the course commencement date or within cooling off period/Full refund less Administration Fee" />
                            <asp:ListItem Text="Withdrawal prior to agreed start date: Notify the Institute less than 60 days and greater than 28 days prior to the course commencement date/Only course material and/or equipment fee is refundable" />
                            <asp:ListItem Text="Withdrawal prior to agreed start date: Notify the Institute less than 28 days prior to the course commencement date/No refund" />
                            <asp:ListItem Text="Visa refused after course commencement (with Department of Home Affairs Refusal Letter)/Refund of unused Tuition Fees for future study period/s" />
                            <asp:ListItem Text="Withdrawal after course commencement (with confirmed extenuating circumstances)/Refund of unused Tuition Fees for future study period/s" />
                            <asp:ListItem Text="Nortwest College is unable to continuously provide the commenced course for which the payment has been made/Refund of unused Tuition Fees for future study period/s" />
                            <asp:ListItem Text="Withdrawal after course commencement without extenuating circumstances or cancellation of course due to student default./No Refund" />
                            <asp:ListItem Text="Abandonment of Course / Failure to return after scheduled break. Overseas Students withdrawing from a course of study will be reported to Department of Home Affairs, as required by law./No refund" />
                            <asp:ListItem Text="Student’s extension of Visa is not granted./No refund/If paid in full, refund of unused tuition fees less (fess for ongoing term and administration fee)" />
                            <asp:ListItem Text="Visa is cancelled due to any action of student/No refund" />
                            <asp:ListItem Text="RPL assessment/No refund" />
                        </asp:CheckBoxList>
                        <div>
                            <h6 style="color: black">*****Administration fee is calculated as 5% of the amount paid or $500 whichever is the lesser*****<br />
                                NB: Please provide all the supporting evidence if applicable.</h6>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student Declaration:</h4>
                </div>

                <div class="row">
                    <div class="col-md-12" style="padding-left: 40px">
                        <ol>
                            <li>I have read and understood Nortwest College's Refund Policy and Procedure.</li>
                            <li>I have received the details about how my Refund has been calculated.</li>
                            <li>I declare that I agree to the refund calculated and informed to me by Nortwest College.</li>
                            <li>I understand that I have the right to appeal the calculated amount in accordance with Nortwest College Complaints and Appeal Policy and Procedure.</li>
                            <li>I understand that Nortwest College will not transfer any funds to a third party unless I explicitly request it in writing, in which case Nortwest College shall be released of any responsibility in relation to the refund, once the funds have been transferred as requested.</li>
                            <li>I understand that any payment made via Credit Card initially will be refunded back onto the same Credit Card. In case the card is not valid at the time of refund, new card details shall be provided. I will bear all the associated charges for the refund in the credit card.</li>
                            <li>Account Details/Card Details are as under:</li>
                        </ol>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Account Holder Name:</label>
                        <asp:TextBox ID="txt_acc_hold_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">BSB/Bank Code:</label>
                        <asp:TextBox ID="txt_bank_code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Account/Card Number:</label>
                        <asp:TextBox ID="txt_card_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Bank Name:</label>
                        <asp:TextBox ID="txt_bank_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="lbl_title">Address where account is held:</label>
                        <asp:TextBox ID="txt_address_account" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">SWIFT Code:</label>
                        <asp:TextBox ID="txt_swift_code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Name:</label>
                        <asp:TextBox ID="txt_student_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="margin-top: 15px">

                        <div>
                            <label class="lbl_title">Signature:</label>
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
            if ($("#<%= ddl_nationality.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_nationality.ClientID %>").next(".nice-select").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= ddl_nationality.ClientID %>").next(".nice-select").css("border-color", "");
            }
            // Validate Full Name
            if ($("#<%= txt_first_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_first_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_first_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_last_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_last_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_last_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_birth_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_birth_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_birth_date.ClientID %>").css("border-color", "");
            }
            if ($("#<%= hd_contact_no.ClientID %>").val().trim() == "") {
                $("#<%= hd_contact_no.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= hd_contact_no.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_passport_no.ClientID %>").val().trim() == "") {
                $("#<%= txt_passport_no.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_passport_no.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_address.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_course_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_course_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_course_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_acc_hold_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_acc_hold_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_acc_hold_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_bank_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_bank_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_bank_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_bank_code.ClientID %>").val().trim() == "") {
                $("#<%= txt_bank_code.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_bank_code.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_card_no.ClientID %>").val().trim() == "") {
                $("#<%= txt_card_no.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_card_no.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_address_account.ClientID %>").val().trim() == "") {
                $("#<%= txt_address_account.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_address_account.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_swift_code.ClientID %>").val().trim() == "") {
                $("#<%= txt_swift_code.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_swift_code.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_student_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_student_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_student_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_sign_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "");
            }
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }
            if ($("#<%= ch_reason.ClientID %> input:checkbox:checked").length == 0) {
                // Show the error message
                $(".lbl_explanation_error").show();
                isValid = false;
            } else {
                // Hide the error message
                $(".lbl_explanation_error").hide();
            }
            return isValid;
        }

    </script>
    <script>
        $(document).ready(function() {
            // Initialize select2 on the dropdown by using ClientID
            $('#<%= ddl_nationality.ClientID %>').select2({
                width: '100%' // Optional, adjust the width as needed
            });
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

