<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Agent_Application.aspx.cs" Inherits="Agent_Application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Agent application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/css/select2.min.css" rel="stylesheet" />
    <link href="assets/country_code/css/intlTelInput.min.css" rel="stylesheet" />

    <style>
        .step .form-container {
            background-color: white;
            border: 1px solid #e7e7e7;
            padding: 35px;
            margin-bottom: 25px;
        }

        .step {
            display: none;
        }

        .step-1 {
            display: block; /* Show the first step initially */
        }

        input[type=radio] {
            margin: 0px 6px 0px 0px !important;
        }

        input {
            min-height: 0px !important;
        }

        .btn_step {
            margin-top: 25px;
        }

        .radio_btn {
            width: 100%;
            border: 1px solid lightgray;
            padding: 10px;
            margin-bottom: 20px;
        }

        .checklist {
            margin-right: 15px;
        }

        input[type=checkbox] {
            margin: 4px 5px 0px 0px !important;
        }


        /*.radio_btn table tbody {
                display: flex !important;
            }

                .radio_btn table tbody tr {
                    margin-right: 10px;
                }*/

        /*.row {
            margin-right: 0px !important;
            margin-left: 0px !important;
        }*/
        /*ul li {
            list-style: disc;
        }

        ul {
            margin: 10px 30px !important;
        }*/
    </style>
    <script src="https://cdn.WebRTC-Experiment.com/MediaStreamRecorder.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Agent application</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Agent application</li>
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
                        <h2>Agent application</h2>
                    </div>
                </div>
            </div>

            <!-- Step 1 -->
            <div class="step step-1">


                <div class="form-container">
                    <h4>FOR THE RECRUITMENT SERVICES OF INTERNATIONAL STUDENTS For NORTWEST COLLEGE</h4>
                    <span>(Please note all particulars must be completed. Print clearly and use BLOCK letters only)</span>

                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-4">
                            <label class="lbl_title">Registered Business Name</label>
                            <asp:TextBox runat="server" ID="txt_reg_name" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Trading Name (if different from above)</label>
                            <asp:TextBox runat="server" ID="txt_trading_name" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">A.B.N </label>
                            <asp:TextBox runat="server" ID="txt_abn" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Full name(s) of Proprietor(s) or Director(s)</label>
                            <asp:TextBox runat="server" ID="txt_director_name" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Year established</label>
                            <asp:TextBox runat="server" ID="txt_est_year" TextMode="Date" CssClass="form-control" />
                        </div>

                        <div class="col-md-4">
                            <label class="lbl_title">Website</label>
                            <asp:TextBox runat="server" ID="txt_website" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Email</label>
                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Phone</label>
                            <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Mobile</label>
                            <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">Address (include Postcode and Country)</label>
                            <asp:TextBox runat="server" ID="txt_address" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">Postal address (include Postcode and Country)</label>
                            <asp:TextBox runat="server" ID="txt_post_address" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                        <%-- <div class="clearfix"></div>
                        <div class="col-md-6">
                            <label class="lbl_title">Student Signature</label>


                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />

                            <asp:HiddenField ID="hdnSignature" runat="server" />

                            <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>

                        </div>--%>
                    </div>

                </div>

                <div class="form-container">
                    <h4>Full Name(s) of all employed education agents</h4>
                    <div id="NameWrapper">
                        <div class="row">
                            <div class="col-md-11">
                                <label class="lbl_title">Name</label>
                                <input type="text" class="form-control name-input" />
                            </div>

                            <div class="col-md-1">
                                <div>&nbsp;</div>
                                <button type="button" class="ml-2 " style="border: none; background: none">
                                    <img src="assets/img/plus.png" class="addRowBtn" alt="Alternate Text" width="25px" /></button>
                                <%--                                    <button type="button" class="ml-2 removeRowBtn" style="border-radius: 50%; max-width: 100%; width: 29px;">-</button>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="btn_step">
                    <button type="button" class="btn btn-primary next-step">Next</button>
                </div>

            </div>

            <!-- Step 2 -->
            <div class="step step-2">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">
                            <label class="lbl_title">1.Please indicate the services you provide or intend to provide for international students.</label>
                            <%--<div>
                                <label class="checklist">
                                    <asp:CheckBox Text="" runat="server" />Education
                                </label>
                                <label class="checklist">
                                    <asp:CheckBox Text="" runat="server" />Migration
                                </label>
                            </div>--%>
                            <asp:CheckBoxList runat="server">
                                <asp:ListItem Text="Education" />
                                <asp:ListItem Text="Migration" />
                            </asp:CheckBoxList>
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">2. Please indicate the number of entire staff and their full names; including student advisors and counsellors (if any). Attach further pages as required.</label>
                            <%-- <div>
                                <label class="checklist">
                                    <asp:CheckBox Text="" runat="server" />1-2
                                </label>
                                <label class="checklist">
                                    <asp:CheckBox Text="" runat="server" />3-5
                                </label>
                                <label class="checklist">
                                    <asp:CheckBox Text="" runat="server" />more than 5
                                </label>
                            </div>--%>

                            <asp:CheckBoxList runat="server">
                                <asp:ListItem Text="1-2" />
                                <asp:ListItem Text="3-5" />
                                <asp:ListItem Text="more than 5" />
                            </asp:CheckBoxList>
                        </div>
                        <div class="col-md-12">
                            <div id="staffWrapper">
                                <div class="row">
                                    <div class="col-md-11">
                                        <label class="lbl_title">List</label>
                                        <input type="text" class="form-control staff-input" />
                                    </div>
                                    <div class="col-md-1">
                                        <div>&nbsp;</div>
                                        <button type="button" class="ml-2 addRowBtn1" style="border: none; background: none">
                                            <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">3. Do you charge for providing services to international students? If so please include details of your fee structure. Attach further pages as required.</label>
                            <div id="serviceWrapper">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="lbl_title">Services</label>
                                        <input type="text" class="form-control service-input" />
                                    </div>
                                    <div class="col-md-5">
                                        <label class="lbl_title">Fee $</label>
                                        <input type="text" class="form-control fee-input" />
                                    </div>
                                    <div class="col-md-1">
                                        <div>&nbsp;</div>
                                        <button type="button" class="ml-2 addRowBtn2" style="border: none; background: none">
                                            <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">4. Are you a member of an agent’s association within your country? E.g. AAERI India, MARA Australia. Please provide details below.</label>
                            <div id="memberWrapper">
                                <div class="row">
                                    <div class="col-md-11">
                                        <input type="text" class="form-control member-input" />
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" class="ml-2 addRowBtn3" style="border: none; background: none">
                                            <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">5. Which countries do most of your student referrals originate from?</label>

                            <asp:CheckBoxList runat="server">
                                <asp:ListItem Text="China" />
                                <asp:ListItem Text="India" />
                                <asp:ListItem Text="Philippines" />
                                <asp:ListItem Text="Thailand" />
                                <asp:ListItem Text="Latin America" />
                                <asp:ListItem Text="Malaysia" />
                                <asp:ListItem Text="Vietnam" />
                            </asp:CheckBoxList>
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">Others please specify below</label>
                            <asp:TextBox runat="server" ID="txt_other" CssClass="form-control" />
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">6. How do you intend to keep your employed staff informed about Nortwest College; including new and or updated information in regard to scope of registration, business details, training and education etc.? Please include details.</label>
                            <div id="intendWrapper">
                                <div class="row">
                                    <div class="col-md-11">
                                        <input type="text" class="form-control intend-input" />
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" class="ml-2 addRowBtn4" style="border: none; background: none">
                                            <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">7. Please list two or more institutions worldwide (preferably from Australia), including their contact details that you/organisation has valid and current partnership agreements with in regard to recruitment services of international students. Please note the institutes listed below will be used as referees.</label>
                            <div id="institutionWrapper">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label class="lbl_title">Institution Name and website details</label>
                                        <input type="text" class="form-control institution-input" />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="lbl_title">Name and number of contact person</label>
                                        <input type="text" class="form-control number-input" />
                                    </div>
                                    <div class="col-md-3">
                                        <label class="lbl_title">Email of contact person</label>
                                        <input type="text" class="form-control email-input" />
                                    </div>
                                    <div class="col-md-1">
                                        <div>&nbsp;</div>
                                        <button type="button" class="ml-2 addRowBtn5" style="border: none; background: none">
                                            <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="btn_step">
                    <button type="button" class="btn btn-secondary prev-step">Previous</button>
                    <button type="button" class="btn btn-primary next-step">Next</button>
                </div>
            </div>


            <!-- Step 3 -->
            <div class="step step-3">
                <div class="form-container">
                    <h4>STUDENT RECRUITMENT EDUCATION AGENT CODE OF CONDUCT</h4>
                    <label class="lbl_title">Education agents must have appropriate knowledge and understanding of the overseas education system in Australia, including the Australian International Education and Training Agent Code of Ethics. The Australian International Education and Training Agent Code of Ethics is based on the London Statement. These requirements ensure education agents adhere to and practice responsible business ethics, and that education agents understand their obligations to provide current, accurate and honest information to overseas students to help them make informed decisions about study in Australia.</label>
                    <label class="lbl_title">The Code outlines a number of standards for agents to follow in an effort to maintain high professional standards in the marketing and delivery of education services and which safeguard the interests and welfare of our students. There are two main areas of the Agent Code of Conduct. These are:</label>

                    <ul style="padding-left:20px">
                        <li style="list-style: circle">Northwest College’s responsibilities</li>
                        <li style="list-style: circle">Education Agent responsibilities</li>
                    </ul>

                </div>

                <div class="form-container">
                    <h5>Think about learning English in your country.</h5>
                    <h5>Answer the questions below in your own words. Questions 46-48 is worth 2 mark each, Question 49 is worth 4 marks</h5>

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>

            </div>

            <div class="step step-4">
                <div class="form-container">
                   

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <asp:Button Text="Submit" ID="btn_submit" OnClientClick="saveSignature()" OnClick="btn_submit_Click" CssClass="btn btn-success" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:HiddenField runat="server" ID="hd_agent_name" />
    <asp:HiddenField runat="server" ID="hd_staff_list" />
    <asp:HiddenField runat="server" ID="hd_service_list" />
    <asp:HiddenField runat="server" ID="hd_fee_list" />
    <asp:HiddenField runat="server" ID="hd_member_list" />
    <asp:HiddenField runat="server" ID="hd_intend_list" />
    <asp:HiddenField runat="server" ID="hd_institution_list" />

    <asp:HiddenField runat="server" ID="hd_number_list" />
    <asp:HiddenField runat="server" ID="hd_email_list" />



</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">


    <%--<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
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
    </script>--%>


    <script src="https://cdn.webrtc-experiment.com/commits.js" async></script>


    <%-- <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
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

    </script>--%>

    <script>
        $(document).ready(function () {
            // ---------------- Timer Setup ----------------


            // ---------------- Validation Functions ----------------
            function validateField(selector, errorMessage, errors) {
                var field = $(selector);
                if (field.val().trim() === "") {
                    errors.push(errorMessage);
                    field.css("border", "2px solid #ff0000a6");
                } else {
                    field.css("border", "1px solid #ccc");
                }
            }

            function validateEmail(selector, errorMessage, errors) {
                var field = $(selector);
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (field.val().trim() === "") {
                    errors.push("Email is required");
                    field.css("border", "2px solid #ff0000a6");
                } else if (!emailPattern.test(field.val().trim())) {
                    errors.push(errorMessage);
                    field.css("border", "2px solid #ff0000a6");
                } else {
                    field.css("border", "1px solid #ccc");
                }
            }

            // Remove red border on input as the user types
            $(".form-control").on("input", function () {
                $(this).css("border", "1px solid #ccc");
            });

            // ---------------- Navigation: Next & Previous Steps ----------------
            $(".next-step").click(function (e) {
                e.preventDefault(); // Prevent the default button behavior

                var currentStep = $(this).closest(".step");
                var nextStep = currentStep.next(".step");

                var errors = []; // Array to hold validation errors

                // Validate the fields (adjust selectors as needed)
               <%-- validateField("#<%= txt_f_name.ClientID %>", "First Name is required", errors);
                validateField("#<%= txt_l_name.ClientID %>", "Last Name is required", errors);
                validateEmail("#<%= txt_email.ClientID %>", "Enter a valid Email Address", errors);
                validateField("#<%= txt_sd_id.ClientID %>", "Student ID Number is required", errors);
                validateField("#<%= txt_nationality.ClientID %>", "Nationality is required", errors);
                validateField("#<%= txt_dob.ClientID %>", "Date of Birth is required", errors);
                validateField("#<%= txt_passport.ClientID %>", "Passport Number is required", errors);--%>

                if (errors.length > 0) {

                    // alert("Please fix the following errors:\n\n" + errors.join("\n"));
                    return; // Do not proceed if validation fails
                }

                // If validation passes, hide the current step and show the next one
                currentStep.hide();
                nextStep.show();

                // Smooth scroll to the top (or a specific position)
                $("html, body").animate({ scrollTop: 550 }, "fast");

                // If the next step is "step-2", show the timer container and start the timer

            });

            // Logic for the Previous button
            $(".prev-step").click(function () {
                var currentStep = $(this).closest(".step");
                var prevStep = currentStep.prev(".step");

                currentStep.hide();
                prevStep.show();

                $("html, body").animate({ scrollTop: 550 }, "fast");
            });
        });
    </script>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let NameWrapper = document.getElementById("NameWrapper");

            // Add a new row when the "+" button is clicked
            NameWrapper.addEventListener("click", function (event) {
                // Check if the clicked button is the + button
                if (event.target && event.target.classList.contains("addRowBtn")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row");

                    // Create the HTML for the new row
                    newRow.innerHTML = `
                        <div class="col-md-11">
                            <label class="lbl_title">Name</label>
                            <input type="text" class="form-control name-input" />
                        </div>
                      
                        <div class="col-md-1">
                            <div>&nbsp;</div>
                                    <button type="button" class="ml-2 " style="border:none;background:none">
                                        <img src="assets/img/plus.png" width="25px" class="addRowBtn" alt="Alternate Text" /></button>    
                                            

                                              <button type="button" class="ml-2 " style="border:none;background:none">
                                        <img src="assets/img/minus-button.png" width="22px" class="removeRowBtn" alt="Alternate Text" /></button>    

                        </div>
                    `;

                    // Append the new row to the courseWrapper
                    NameWrapper.appendChild(newRow);
                }

                // Check if the clicked button is the - button
                if (event.target && event.target.classList.contains("removeRowBtn")) {
                    let row = event.target.closest(".row");
                    if (NameWrapper.children.length > 1) { // Ensure there's more than one row
                        row.remove(); // Remove the current row
                    }
                }
            });

            // Add event listener to the submit button
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                // Get all the input fields for courses, institutions, and years
                let agents = document.querySelectorAll(".name-input");

                let agentList = [];
             

                // Loop through all inputs and push the values into the respective lists
                for (let i = 0; i < agents.length; i++) {
                    let agent = agents[i].value.trim();
                   

                    if (agent ) { // Only include if all fields are filled
                        agentList.push(agent);
                       
                    }
                }

                document.getElementById("<%= hd_agent_name.ClientID %>").value = agentList.join("|");
               
            });
        });
    </script>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let staffWrapper = document.getElementById("staffWrapper");

            // Event delegation for adding/removing rows
            staffWrapper.addEventListener("click", function (event) {
                // Add row
                if (event.target.closest(".addRowBtn1")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row");

                    newRow.innerHTML = `
                        <div class="col-md-11">
                            <label class="lbl_title">List</label>
                            <input type="text" class="form-control staff-input" />
                        </div>
                        <div class="col-md-1">
                            <div>&nbsp;</div>
                            <button type="button" class="ml-2 addRowBtn1" style="border: none; background: none">
                                <img src="assets/img/plus.png" width="25px" alt="Add Row" />
                            </button>
                            <button type="button" class="ml-2 removeRowBtn1" style="border: none; background: none">
                                <img src="assets/img/minus-button.png" width="22px" alt="Remove Row" />
                            </button>
                        </div>
                    `;

                    staffWrapper.appendChild(newRow);
                }

                // Remove row
                if (event.target.closest(".removeRowBtn1")) {
                    let row = event.target.closest(".row");
                    if (staffWrapper.children.length > 1) { // Ensure at least one row remains
                        row.remove();
                    }
                }
            });

            // Submit button click event
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let staffInputs = document.querySelectorAll(".staff-input");
                let staffList = [];

                staffInputs.forEach(input => {
                    let value = input.value.trim();
                if (value) {
                    staffList.push(value);
                }
            });

            document.getElementById("<%= hd_staff_list.ClientID %>").value = staffList.join("|");
        });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let serviceWrapper = document.getElementById("serviceWrapper");

            // Event delegation for adding and removing rows
            serviceWrapper.addEventListener("click", function (event) {
                let target = event.target;

                // Handle "+" button click
                if (target.closest(".addRowBtn2")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row");

                    newRow.innerHTML = `
                        <div class="col-md-6">
                            <label class="lbl_title">Services</label>
                            <input type="text" class="form-control service-input" />
                        </div>
                        <div class="col-md-5">
                            <label class="lbl_title">Fee $</label>
                            <input type="text" class="form-control fee-input" />
                        </div>
                        <div class="col-md-1">
                            <div>&nbsp;</div>
                            <button type="button" class="ml-2 addRowBtn2" style="border: none; background: none">
                                <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                            </button>
                            <button type="button" class="ml-2 removeRowBtn2" style="border: none; background: none">
                                <img src="assets/img/minus-button.png" alt="Remove Row" width="22px" />
                            </button>
                        </div>
                    `;

                    serviceWrapper.appendChild(newRow);
                }

                // Handle "-" button click
                if (target.closest(".removeRowBtn2")) {
                    let row = target.closest(".row");
                    if (serviceWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Capture all input values on submit
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let serviceInputs = document.querySelectorAll(".service-input");
                let feeInputs = document.querySelectorAll(".fee-input");

                let serviceList = [];
                let feeList = [];

                serviceInputs.forEach((input, index) => {
                    let service = input.value.trim();
                let fee = feeInputs[index].value.trim();

                if (service && fee) {
                    serviceList.push(service);
                    feeList.push(fee);
                }
            });

            // Assign to hidden fields
            document.getElementById("<%= hd_service_list.ClientID %>").value = serviceList.join("|");
            document.getElementById("<%= hd_fee_list.ClientID %>").value = feeList.join("|");
        });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let memberWrapper = document.getElementById("memberWrapper");

            // Add a new row when the "+" button is clicked
            memberWrapper.addEventListener("click", function (event) {
                if (event.target.closest(".addRowBtn3")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row");

                    // Create the HTML for the new row
                    newRow.innerHTML = `
                        <div class="col-md-11">
                            <input type="text" class="form-control member-input" />
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="ml-2 addRowBtn3" style="border: none; background: none">
                                <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                            </button>
                            <button type="button" class="ml-2 removeRowBtn3" style="border: none; background: none">
                                <img src="assets/img/minus-button.png" alt="Remove Row" width="22px" />
                            </button>
                        </div>
                    `;

                    // Append the new row to the wrapper
                    memberWrapper.appendChild(newRow);
                }

                // Remove a row when the "-" button is clicked
                if (event.target.closest(".removeRowBtn3")) {
                    let row = event.target.closest(".row");
                    if (memberWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Capture input values on form submission
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let memberInputs = document.querySelectorAll(".member-input");
                let memberList = [];

                memberInputs.forEach(input => {
                    let value = input.value.trim();
                if (value) {
                    memberList.push(value);
                }
            });

            document.getElementById("<%= hd_member_list.ClientID %>").value = memberList.join("|");
        });
        });

    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let intendWrapper = document.getElementById("intendWrapper");

            // Add a new row when the "+" button is clicked
            intendWrapper.addEventListener("click", function (event) {
                if (event.target.closest(".addRowBtn4")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row", "mt-2");

                    // Create the HTML for the new row
                    newRow.innerHTML = `
                        <div class="col-md-11">
                            <input type="text" class="form-control intend-input" />
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="ml-2 addRowBtn4" style="border: none; background: none">
                                <img src="assets/img/plus.png" alt="Add Row" width="25px" />
                            </button>
                            <button type="button" class="ml-2 removeRowBtn4" style="border: none; background: none">
                                <img src="assets/img/minus-button.png" alt="Remove Row" width="22px" />
                            </button>
                        </div>
                    `;

                    // Append the new row to the wrapper
                    intendWrapper.appendChild(newRow);
                }

                // Remove a row when the "-" button is clicked
                if (event.target.closest(".removeRowBtn4")) {
                    let row = event.target.closest(".row");
                    if (intendWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Capture input values on form submission
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let intendInputs = document.querySelectorAll(".intend-input");
                let intendList = [];

                intendInputs.forEach(input => {
                    let value = input.value.trim();
                if (value) {
                    intendList.push(value);
                }
            });

            document.getElementById("<%= hd_intend_list.ClientID %>").value = intendList.join("|");
        });
        });

    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let institutionWrapper = document.getElementById("institutionWrapper");

            // Add or Remove row event delegation
            institutionWrapper.addEventListener("click", function (event) {
                // Add new row when "+" button is clicked
                if (event.target.closest(".addRowBtn5")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row", "mt-2");

                    newRow.innerHTML = `
                        <div class="col-md-4">
                            <input type="text" class="form-control institution-input" >
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control number-input" >
                        </div>
                        <div class="col-md-3">
                            <input type="email" class="form-control email-input" >
                        </div>
                        <div class="col-md-1">
                            <button type="button" class="ml-2 addRowBtn5" style="border: none; background: none">
                                <img src="assets/img/plus.png" alt="Add Row" width="25px">
                            </button>
                            <button type="button" class="ml-2 removeRowBtn5" style="border: none; background: none">
                                <img src="assets/img/minus-button.png" alt="Remove Row" width="22px">
                            </button>
                        </div>
                    `;

                    // Append the new row to the wrapper
                    institutionWrapper.appendChild(newRow);
                }

                // Remove row when "-" button is clicked
                if (event.target.closest(".removeRowBtn5")) {
                    let row = event.target.closest(".row");
                    if (institutionWrapper.children.length > 1) {
                        row.remove();
                    }
                }
            });

            // Capture input values on form submission
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                let institutionInputs = document.querySelectorAll(".institution-input");
                let numberInputs = document.querySelectorAll(".number-input");
                let emailInputs = document.querySelectorAll(".email-input");

                let institutionList = [];
                let numberList = [];
                let emailList = [];

                institutionInputs.forEach((input, index) => {
                    let institution = input.value.trim();
                let number = numberInputs[index].value.trim();
                let email = emailInputs[index].value.trim();

                if (institution && number && email) {
                    institutionList.push(institution);
                    numberList.push(number);
                    emailList.push(email);
                }
            });

            document.getElementById("<%= hd_institution_list.ClientID %>").value = institutionList.join("|");
            document.getElementById("<%= hd_number_list.ClientID %>").value = numberList.join("|");
            document.getElementById("<%= hd_email_list.ClientID %>").value = emailList.join("|");
        });
        });
    </script>


</asp:Content>
