<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GST_form.aspx.cs" Inherits="GST_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    GST FORM
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
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
        .addRowBtn, .removeRowBtn {
            background: none;
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>GST FORM</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">GST FORM</li>
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
                        <h2>GST FORM</h2>
                    </div>
                </div>
            </div>

            <%--            <div class="form-container">
                <div>
                    <h4>Immigration History & Student Profile </h4>
                </div>
            </div>--%>
            <div class="form-container">
                <div>
                    <h4>Visa Detail</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <label class="lbl_title">List of your visas</label>
                                <div id="visaWrapper">
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <label>Visa Type</label>
                                            <input type="text" class="form-control visa-type" />
                                        </div>
                                        <div class="col-md-4">
                                            <label>Valid From</label>
                                            <input type="date" class="form-control visa-from" />
                                        </div>
                                        <div class="col-md-2">
                                            <label>Expiry Date</label>
                                            <input type="date" class="form-control visa-expiry" />
                                        </div>
                                        <div class="col-md-2 mt-2">
                                            <br />
                                            <button type="button" class="addVisaBtn" style="border: none; background: none;">
                                                <img src="assets/img/plus.png" width="25px" />
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hidden fields to collect Visa data -->


            <div class="form-container">
                <div>
                    <h4>Job Detail</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">List of your current and previous employment history</label>
                        <div id="jobWrapper">
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label>Title</label>
                                    <input type="text" class="form-control job-title" />
                                </div>
                                <div class="col-md-3">
                                    <label>Salary</label>
                                    <input type="text" class="form-control job-salary" />
                                </div>
                                <div class="col-md-2">
                                    <label>Start Date</label>
                                    <input type="date" class="form-control job-start" />
                                </div>
                                <div class="col-md-2">
                                    <label>End Date</label>
                                    <input type="date" class="form-control job-end" />
                                </div>
                                <div class="col-md-1 checkbox-inline">
                                    <br />
                                    <input type="checkbox" class="job-current" />
                                    Current
                                </div>
                                <div class="col-md-1">
                                    <br />
                                    <button type="button" style="border: none; background: none">
                                        <img src="assets/img/plus.png" class="addJobBtn" width="25px" />
                                    </button>

                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label class="lbl_title">Are you currently employed?</label>
                            </div>

                            <!-- Yes / No checkboxes in one line -->
                            <div class="col-md-12">
                                <asp:RadioButtonList ID="rblEmployed" runat="server" RepeatDirection="Horizontal" CssClass="form-inline">
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                            <!-- Textbox shown if "No" -->
                            <div class="col-md-12 mt-2">
                                <asp:TextBox ID="txt_employed_reason" CssClass="form-control"
                                    Placeholder="If no, please explain..." runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



            <div class="form-container">
                <div>
                    <h4>Education Detail</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">What is your highest education qualification?</label>
                    </div>

                    <!-- Highschool -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <strong>Highschool</strong>
                                </div>
                                <div class="col-md-10">
                                    <asp:RadioButtonList ID="rbl_highschool" CssClass="form-inline" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Value="incomplete">Did not complete</asp:ListItem>
                                        <asp:ListItem Value="complete">Complete and year of completion:</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox ID="txt_highschool_year" CssClass="form-control" placeholder="Completion Year" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <strong>University</strong>
                                </div>
                                <div class="col-md-10">
                                    <asp:RadioButtonList ID="rbl_university" CssClass="form-inline" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Value="incomplete">Did not complete</asp:ListItem>
                                        <asp:ListItem Value="complete">Complete and year of completion:</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:TextBox ID="txt_university_year" CssClass="form-control" placeholder="Completion Year" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="courseWrapper">
                            <div class="row course-row mb-3">
                                <!-- Education Qualification -->
                                <div class="col-md-4">
                                    <label class="lbl_title">Education Qualification</label>
                                    <input type="text" class="form-control course-input" />
                                </div>

                                <!-- Level of Study -->
                                <div class="col-md-4">
                                    <label class="lbl_title">Level of Study</label>
                                    <input type="text" class="form-control year-input" />
                                </div>

                                <!-- Year of Completion -->
                                <div class="col-md-2">
                                    <label class="lbl_title">Year</label>
                                    <input type="text" class="form-control institution-input" />
                                </div>

                                <!-- Actions -->
                                <div class="col-md-2" style="display: flex; align-items: center; gap: 6px; margin-top: 22px;">
                                    <button type="button" class="btn-icon addRowBtn" style="background: none; border: none;">
                                        <img src="assets/img/plus.png" alt="Add" width="25" />
                                    </button>

                                    <button type="button" class="btn-icon removeRowBtn" style="background: none; border: none; display: none;">
                                        <img src="assets/img/minus-button.png" alt="Remove" width="22" />
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Hidden fields -->
                        <asp:HiddenField ID="hdnCompletion" runat="server" />
                        <asp:HiddenField ID="hdnQualification" runat="server" />
                        <asp:HiddenField ID="hdnStudy" runat="server" />
                    </div>

                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Detail</h4>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">How do you plan to fund your education and stay in Australia?</label>
                    </div>
                    <div class="col-md-8">
                        <asp:CheckBoxList ID="chkFunding" CssClass="form-inline" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Value="Savings">Own Savings</asp:ListItem>
                            <asp:ListItem Value="Parents">Parents</asp:ListItem>
                            <asp:ListItem Value="Partner">Partner</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">What is your total access to funds?</label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtFunds" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>
                <div class="form-group">
                    <label class="lbl_title">Evidence of financial capacity?</label>
                    <div>
                        <asp:CheckBoxList ID="chkEvidence" CssClass="form-inline" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Value="Bank">Bank deposit</asp:ListItem>
                            <asp:ListItem Value="Salary">Salary or other income source</asp:ListItem>
                            <asp:ListItem Value="Property">Property Ownership</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <span class="form-text text-muted">Please check student visa financial requirements at 
        <a href="https://immi.homeaffairs.gov.au/visas/getting-a-visa/visa-listing/student-500" target="_blank">Subclass 500 Student visa (homeaffairs.gov.au)
        </a>
                        <br />
                        You will be able to check the evidence options and the amounts required under each option.
                    </span>
                </div>


                <!-- Experience related to courses -->
                <div class="form-group mt-3">
                    <label class="lbl_title">
                        Do you have any experience in any area related to the courses you would like to enroll in?
                    </label>
                    <asp:RadioButtonList ID="rblExperience" runat="server" RepeatDirection="Horizontal" CssClass="form-inline mb-2">
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        <asp:ListItem Text="Yes, please explain below:" Value="Yes"></asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:TextBox ID="txtExperience" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                </div>


                <!-- Gaps in study -->
                <div class="form-group mt-3">
                    <label class="lbl_title">
                        Do you have any gaps in your study? If yes, how long is the gap between your previous study and your intended study and explain the reason for the gap?
                    </label>
                    <asp:RadioButtonList ID="rblGap" runat="server" RepeatDirection="Horizontal" CssClass="form-inline mb-2">
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                        <asp:ListItem Text="Yes, please explain below:" Value="Yes"></asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:TextBox ID="txtGap" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                </div>

            </div>

            <%--  --%>
            <div class="form-container">
                <div>
                    <h4>Career Plan & Ties to Home Country</h4>
                </div>
                <div class="row">
                    <!-- Question 1 -->
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Can you explain why you have chosen to study in Australia instead of pursuing similar courses available in your home country?</label>
                            <asp:TextBox ID="txtReasonAustralia" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Question 2 -->
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>What are your long-term career and personal goals, and how does studying in Australia help you achieve them?</label>
                            <asp:TextBox ID="txtCareerGoals" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Question 3 -->
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Could you describe your family, social, and community ties in your home country?</label>
                            <asp:TextBox ID="txtHomeCountryTies" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Question 4 -->
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Do you have any family ties in Australia?</label>
                            <asp:TextBox ID="txtAustraliaFamilyTies" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Question 5 -->
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>After completing your studies, do you plan to stay in Australia, return to your home country, or move to another country?</label>
                            <asp:TextBox ID="txtFuturePlans" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Question 6 -->
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Would you like to convey any other relevant information that you believe is important for your enrollment?</label>
                            <asp:TextBox ID="txtOtherInfo" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


            </div>
            <div class="form-container">
                <div>
                    <h4>STUDENT SIGNATURE</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <p><strong>I declare that:</strong></p>
                    </div>
                    <ul style="margin: 0; padding-left: 18px; line-height: 1.6;">
                        <li>All the information I have provided in this application is accurate and complete and is not false or misleading and I understand giving false information is a serious offence under state and/or federal law in Australia.</li>
                        <li>The signature on this form is my signature and this form has not been signed on my behalf by another person, including my agent or sponsor.</li>
                        <li>I have access to the funds required to study at Nortwest Pty. Ltd. for the length of my courses, including tuition fees and living expenses for myself and (if applicable) my dependents.</li>
                        <li>I agree to immediately advise Nortwest Pty. Ltd. if there is any change to the information I have provided in this application.</li>
                        <li>I understand that Nortwest Pty. Ltd. has the right to vary or reverse any assessment made based on incorrect, incomplete, false or misleading information which I have provided.</li>
                        <li>I understand that by completing this application I am giving written consent to Nortwest Pty. Ltd. to independently verify the information supplied by me in this application.</li>
                        <li>By completing and signing this application, I am giving written consent to Nortwest Pty. Ltd. to share this information with authorized third parties to independently verify the information supplied by me in this application or wherever as required by law.</li>
                        <li>I understand that I and/or my parents and/or financial sponsor/institution may be contacted as part of the risk assessment.</li>
                    </ul>
                    <div class="col-md-6">
                        <label class="lbl_title">Student Name</label>
                        <asp:TextBox ID="txt_s_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Date</label>
                        <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                    </div>


                    <div class="col-md-6">

                        <div>
                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />
                        </div>

                        <asp:HiddenField ID="hdnSignature" runat="server" />

                        <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>


                    </div>


                </div>
            </div>

            <div>
                <asp:Button ID="btn_submit" runat="server" OnClientClick="saveSignature()" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hdnVisaType" runat="server" />
    <asp:HiddenField ID="hdnVisaFrom" runat="server" />
    <asp:HiddenField ID="hdnVisaExpiry" runat="server" />
    <asp:HiddenField ID="hdnJobTitle" runat="server" />
    <asp:HiddenField ID="hdnJobSalary" runat="server" />
    <asp:HiddenField ID="hdnJobStart" runat="server" />
    <asp:HiddenField ID="hdnJobEnd" runat="server" />
    <asp:HiddenField ID="hdnJobCurrent" runat="server" />
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

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let jobWrapper = document.getElementById("jobWrapper");

            jobWrapper.addEventListener("click", function (event) {
                if (event.target && event.target.classList.contains("addJobBtn")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row", "mb-3");

                    newRow.innerHTML = `
                        <div class="col-md-3">
                            <label>Title</label>
                            <input type="text" class="form-control job-title" />
                        </div>
                        <div class="col-md-3">
                            <label>Salary</label>
                            <input type="text" class="form-control job-salary" />
                        </div>
                        <div class="col-md-2">
                            <label>Start Date</label>
                            <input type="date" class="form-control job-start" />
                        </div>
                        <div class="col-md-2">
                            <label>End Date</label>
                            <input type="date" class="form-control job-end" />
                        </div>
                        <div class="col-md-1 checkbox-inline">
                            <br />
                            <input type="checkbox" class="job-current" /> Current
                        </div>
                        <div class="col-md-1">
                            <br />
                            <button type="button" style="border:none;background:none">
                                <img src="assets/img/plus.png" class="addJobBtn" width="25px" />
                            </button>
                            <button type="button" style="border:none;background:none">
                                <img src="assets/img/minus-button.png" class="removeJobBtn" width="22px" />
                            </button>
                        </div>
                    `;
                    jobWrapper.appendChild(newRow);
                }

                if (event.target && event.target.classList.contains("removeJobBtn")) {
                    let row = event.target.closest(".row");
                    if (jobWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Example: Collect all job data on submit
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let titles = [], salaries = [], starts = [], ends = [], currents = [];
                document.querySelectorAll(".job-title").forEach(el => titles.push(el.value.trim()));
                document.querySelectorAll(".job-salary").forEach(el => salaries.push(el.value.trim()));
                document.querySelectorAll(".job-start").forEach(el => starts.push(el.value));
                document.querySelectorAll(".job-end").forEach(el => ends.push(el.value));
                document.querySelectorAll(".job-current").forEach(el => currents.push(el.checked ? "Yes" : "No"));

                document.getElementById("<%= hdnJobTitle.ClientID %>").value = titles.join("|");
                document.getElementById("<%= hdnJobSalary.ClientID %>").value = salaries.join("|");
                document.getElementById("<%= hdnJobStart.ClientID %>").value = starts.join("|");
                document.getElementById("<%= hdnJobEnd.ClientID %>").value = ends.join("|");
                document.getElementById("<%= hdnJobCurrent.ClientID %>").value = currents.join("|");
            });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const visaWrapper = document.getElementById("visaWrapper");

            // Add or remove visa rows
            visaWrapper.addEventListener("click", function(event) {
                if(event.target.closest(".addVisaBtn")) {
                    const newRow = document.createElement("div");
                    newRow.classList.add("row", "mb-3");
                    newRow.innerHTML = `
                        <div class="col-md-4">
                            <label>Visa Type</label>
                            <input type="text" class="form-control visa-type" />
                        </div>
                        <div class="col-md-4">
                            <label>Valid From</label>
                            <input type="date" class="form-control visa-from" />
                        </div>
                        <div class="col-md-2">
                            <label>Expiry Date</label>
                            <input type="date" class="form-control visa-expiry" />
                        </div>
                        <div class="col-md-2 mt-2">
                        <br />
                            <button type="button" class="addVisaBtn" style="border:none;background:none;">
                                <img src="assets/img/plus.png" width="25px" />
                            </button>
                            <button type="button" class="removeVisaBtn" style="border:none;background:none;">
                                <img src="assets/img/minus-button.png" width="22px" />
                            </button>
                        </div>
                    `;
                    visaWrapper.appendChild(newRow);
                }

                if(event.target.closest(".removeVisaBtn")) {
                    const row = event.target.closest(".row");
                    if(visaWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Collect visa data on submit
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function() {
                let types = [], froms = [], expirys = [];
                document.querySelectorAll(".visa-type").forEach(el => types.push(el.value.trim()));
                document.querySelectorAll(".visa-from").forEach(el => froms.push(el.value));
                document.querySelectorAll(".visa-expiry").forEach(el => expirys.push(el.value));

                document.getElementById("<%= hdnVisaType.ClientID %>").value = types.join("|");
                document.getElementById("<%= hdnVisaFrom.ClientID %>").value = froms.join("|");
                document.getElementById("<%= hdnVisaExpiry.ClientID %>").value = expirys.join("|");
            });
        });
    </script>

    <%--<script>
        // Trigger validation on submit button click
        $("#<%= btn_submit.ClientID %>").click(function (event) {
            if (!validateForm()) {
                event.preventDefault(); // Stop form submission
                return false;
            }
        });

        function validateForm() {
            var isValid = true;

            // Helper to validate empty fields
            function validateInput(id) {
                if ($("#" + id).val().trim() === "") {
                    $("#" + id).css("border-color", "red");
                    isValid = false;
                } else {
                    $("#" + id).css("border-color", "");
                }
            }

            /* =============== VISA SECTION ================== */
            validateInput("<%= txt_visa1_type.ClientID %>");
            validateInput("<%= txt_visa1_from.ClientID %>");
            validateInput("<%= txt_visa1_expiry.ClientID %>");


            /* =============== EMPLOYMENT SECTION ================== */
            // If "No" is checked, reason must be filled
          
            // Validate Job 1
            validateInput("<%= txt_job1_title.ClientID %>");
            validateInput("<%= txt_job1_salary.ClientID %>");
            validateInput("<%= txt_job1_start.ClientID %>");
            // End date not required if "Current Job" is checked
            if (!$("#<%= chk_job1_current.ClientID %>").is(":checked")) {
                validateInput("<%= txt_job1_end.ClientID %>");
            }

            // Validate Job 2
            validateInput("<%= txt_job2_title.ClientID %>");
            validateInput("<%= txt_job2_salary.ClientID %>");
            validateInput("<%= txt_job2_start.ClientID %>");
            if (!$("#<%= chk_job2_current.ClientID %>").is(":checked")) {
                validateInput("<%= txt_job2_end.ClientID %>");
            }

            // Validate Job 3
            validateInput("<%= txt_job3_title.ClientID %>");
            validateInput("<%= txt_job3_salary.ClientID %>");
            validateInput("<%= txt_job3_start.ClientID %>");
            if (!$("#<%= chk_job3_current.ClientID %>").is(":checked")) {
                validateInput("<%= txt_job3_end.ClientID %>");
            }

            /* =============== EDUCATION SECTION ================== */
            $("#courseWrapper .course-row").each(function () {
                var qualification = $(this).find(".course-input").val().trim();
                var study = $(this).find(".year-input").val().trim();
                var year = $(this).find(".institution-input").val().trim();

                if (qualification === "" || study === "" || year === "") {
                    $(this).find("input").css("border-color", "red");
                    isValid = false;
                } else {
                    $(this).find("input").css("border-color", "");
                }
            });

            /* =============== CAREER PLAN QUESTIONS ================== */
            validateInput("<%= txtReasonAustralia.ClientID %>");
            validateInput("<%= txtCareerGoals.ClientID %>");
            validateInput("<%= txtHomeCountryTies.ClientID %>");
            validateInput("<%= txtAustraliaFamilyTies.ClientID %>");
            validateInput("<%= txtFuturePlans.ClientID %>");
            validateInput("<%= txtOtherInfo.ClientID %>");

            /* =============== STUDENT SIGNATURE ================== */
            validateInput("<%= txt_s_name.ClientID %>");
            validateInput("<%= txt_sign_date.ClientID %>");

            // Signature canvas check
            var canvas = document.getElementById("signatureCanvas");
            var blank = document.createElement("canvas");
            blank.width = canvas.width;
            blank.height = canvas.height;

            if (canvas.toDataURL() === blank.toDataURL()) {
                alert("Please provide your signature before submitting.");
                isValid = false;
            }

            return isValid;
        }
    </script>--%>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let courseWrapper = document.getElementById("courseWrapper");

            courseWrapper.addEventListener("click", function (event) {
                // Add row
                if (event.target.closest(".addRowBtn")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row", "course-row", "mb-3");

                    newRow.innerHTML = `
                        <div class="col-md-4">
                            <label class="lbl_title">Education Qualification</label>
                            <input type="text" class="form-control course-input" />
                        </div>

                        <div class="col-md-4">
                            <label class="lbl_title">Level of Study</label>
                            <input type="text" class="form-control year-input" />
                        </div>

                        <div class="col-md-2">
                            <label class="lbl_title">Year</label>
                            <input type="text" class="form-control institution-input" />
                        </div>

                        <div class="col-md-2" style="display: flex; align-items: center; gap: 6px; margin-top: 22px;">
                            <button type="button" class="btn-icon addRowBtn" style="background: none; border: none;">
                                <img src="assets/img/plus.png" alt="Add" width="25" />
                            </button>

                            <button type="button" class="btn-icon removeRowBtn" style="background: none; border: none;">
                                <img src="assets/img/minus-button.png" alt="Remove" width="22" />
                            </button>
                        </div>
                    `;

                    courseWrapper.appendChild(newRow);

                    // Show remove button for all except first
                    let removeBtns = courseWrapper.querySelectorAll(".removeRowBtn");
                    removeBtns.forEach(btn => btn.style.display = "inline-block");
                    removeBtns[0].style.display = "none"; // first row cannot be removed
                }

                // Remove row
                if (event.target.closest(".removeRowBtn")) {
                    let row = event.target.closest(".course-row");
                    if (courseWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Collect all data on submit
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let completions = [], qualifications = [], studies = [];
                document.querySelectorAll(".course-input").forEach(el => qualifications.push(el.value.trim()));
                document.querySelectorAll(".year-input").forEach(el => studies.push(el.value.trim()));
                document.querySelectorAll(".institution-input").forEach(el => completions.push(el.value.trim()));

                document.getElementById("<%= hdnQualification.ClientID %>").value = qualifications.join("|");
        document.getElementById("<%= hdnStudy.ClientID %>").value = studies.join("|");
                document.getElementById("<%= hdnCompletion.ClientID %>").value = completions.join("|");
            });
        });
    </script>



</asp:Content>

