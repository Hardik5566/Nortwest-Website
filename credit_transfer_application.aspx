<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="credit_transfer_application.aspx.cs" Inherits="credit_transfer_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Credit Transfer Application
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

        /* ---------- Layout for academic rows: keep labels above inputs, but vertically center actions ---------- */
        /* Make the course-row a flex container so the actions column can align center to inputs */
        .course-row {
            display: flex;
            align-items: center; /* vertically center children (including actions column) */
            flex-wrap: wrap; /* allow wrap on smaller screens */
            margin-bottom: 6px;
        }

            /* ensure our column blocks keep label above input */
            .course-row > .col-md-2,
            .course-row > .col-md-4 {
                display: flex;
                flex-direction: column; /* label above input */
                justify-content: flex-start;
            }

        /* Actions column: place buttons horizontally and vertically centered; minus right next to plus */
        .actions-col {
            display: flex;
            align-items: center; /* vertical center */
            justify-content: flex-end;
            gap: 2px; /* very small gap so minus sits right next to plus */
            padding-top: 0;
        }

        /* Icon button appearance (reduced padding so icons are close) */
        .btn-icon {
            border: none;
            background: none;
            padding: 1px; /* minimal padding so icons sit close */
            cursor: pointer;
            line-height: 1;
        }

            .btn-icon img {
                display: block;
                pointer-events: none; /* so click triggers button */
            }

        /* Small spacing between consecutive rows on desktop */
        .course-row + .course-row {
            margin-top: 8px;
        }

        /* responsive: ensure columns stack nicely on small screens */
        @media (max-width: 767px) {
            .course-row {
                display: block;
            }

                .course-row > .col-md-2,
                .course-row > .col-md-4,
                .course-row > .col-md-6,
                .course-row > .col-md-12,
                .course-row > .actions-col {
                    width: 100% !important;
                }

            .actions-col {
                margin-top: 6px;
                justify-content: flex-start;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Credit Transfer Application</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Credit Transfer Application</li>
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
                        <h2>Credit Transfer Application</h2>
                    </div>
                </div>
            </div>

            <!-- Student details -->
            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">
                     <div class="col-md-6">
                        <div class="form-group">
                            <label>Title (Mr., Mrs., Ms.)</label>
                            <asp:DropDownList ID="ddlTitle" CssClass="form-control" runat="server">
                                <asp:ListItem Text="-- Select Title --" Value="" />
                                <asp:ListItem Text="Mr." Value="Mr." />
                                <asp:ListItem Text="Mrs." Value="Mrs." />
                                <asp:ListItem Text="Ms." Value="Ms." />
                            </asp:DropDownList>
                        </div>
                    </div>
                       <div class="col-md-6">
                        <div class="form-group">
                            <label>Given Name</label>
                            <asp:TextBox ID="txtGivenName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                   

                </div>

                <div class="row">
                 
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Date of Birth</label>
                            <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Postcode</label>
                            <asp:TextBox ID="txtPostcode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>State</label>
                            <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
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

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Student ID No <span style="font-size: 11px;">(if applicable)</span></label>
                            <asp:TextBox ID="txtStudentID" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Course Code</label>
                            <asp:TextBox ID="txtCourseCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Course Title</label>
                            <asp:TextBox ID="txtCourseTitle" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Date of Application</label>
                            <asp:TextBox ID="txtApplicationDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Academic history (dynamic rows) -->
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <h4>Credit Transfer Request
                            </h4>
                        </div>
                        <div id="courseWrapper">
                            <div class="row course-row">
                                <div class="col-md-2">
                                    <label class="lbl_title">Unit Code</label>
                                    <input type="text" class="form-control course-input" />
                                </div>
                                <div class="col-md-4">
                                    <label class="lbl_title">Unit Title</label>
                                    <input type="text" class="form-control institution-input" />
                                </div>
                                <div class="col-md-2">
                                    <label class="lbl_title">Evidence Supplied</label>
                                    <input type="text" class="form-control year-input" />
                                </div>
                                <div class="col-md-2">
                                    <label class="lbl_title">CT Granted: YES / NO</label>
                                    <input type="text" class="form-control ct-input" />
                                </div>
                                <div class="col-md-2 actions-col">
                                    <button type="button" class="btn-icon addRowBtn" title="Add row">
                                        <img src="assets/img/plus.png" alt="Add" width="25" />
                                    </button>

                                    <!-- hidden on first row, visible on clones -->
                                    <button type="button" class="btn-icon removeRowBtn" title="Remove row" style="display: none;">
                                        <img src="assets/img/minus-button.png" alt="Remove" width="22" />
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Hidden fields to capture values before submit -->
                        <asp:HiddenField ID="hdnUnitCode" runat="server" />
                        <asp:HiddenField ID="hdnUnitTitle" runat="server" />
                        <asp:HiddenField ID="hdnEvidence" runat="server" />
                        <asp:HiddenField ID="hdnCT" runat="server" />

                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>STUDENT SIGNATURE</h4>
                </div>

                <div class="row">
                    <ul style="margin: 0; padding-left: 18px; line-height: 1.5;">
                        <li>The information I have provided in this form is correct and complete. I understand that
      withholding relevant information relating to my application, including academic transcript/s may
      result in this application being rejected.
                        </li>
                        <li>I have attached to this application supporting Original/ Certified copies of Qualification(s),
      Transcript(s) or Statement(s) of Attainment. I understand that the School will verify these
      certificates with the issuing RTO.
                        </li>
                        <li>I authorize Nortwest College to obtain further information with respect to my application
      and, if necessary, seek academic information or transcripts from Australian educational
      institutions.
                        </li>
                        <li>I understand that the School is not responsible if an educational body or institution does not
      verify these records.
                        </li>
                        <li>I agree to abide by the regulations and policies of Nortwest College.
                        </li>
                    </ul>
                    <div class="col-md-6">

                        <div>
                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />
                        </div>

                        <asp:HiddenField ID="hdnSignature" runat="server" />

                        <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>


                    </div>
                    <div class="col-md-6">
                        <div class="col-md-12">
                            <label class="lbl_title">Student Name</label>
                            <asp:TextBox ID="txt_s_name" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">Date</label>
                            <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        </div>

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
  <script>
      // Trigger validation on submit button click
      $("#<%= btn_submit.ClientID %>").click(function (event) {
          if (!validateForm()) {
              event.preventDefault(); // Prevent submission if validation fails
              return false;
          }
      });

      function validateForm() {
          var isValid = true;
          var errorMsg = "";

          // Helper function to validate input
          function validateInput(id, fieldName) {
              if ($("#" + id).val().trim() === "") {
                  $("#" + id).css("border-color", "red");
                  errorMsg += fieldName + " is required.\n";
                  isValid = false;
              } else {
                  $("#" + id).css("border-color", "");
              }
          }

          // Validate Student Details
          validateInput("<%= txtLastName.ClientID %>", "Last Name");
        validateInput("<%= txtGivenName.ClientID %>", "Given Name");
        validateInput("<%= txtDOB.ClientID %>", "Date of Birth");
        validateInput("<%= txtAddress.ClientID %>", "Address");
        validateInput("<%= txtPostcode.ClientID %>", "Postcode");
        validateInput("<%= txtState.ClientID %>", "State");
        validateInput("<%= txtEmail.ClientID %>", "Email");
        validateInput("phone", "Contact Number"); // Contact number input
        validateInput("<%= txtStudentID.ClientID %>", "Student ID");
        validateInput("<%= txtCourseCode.ClientID %>", "Course Code");
        validateInput("<%= txtCourseTitle.ClientID %>", "Course Title");
        validateInput("<%= txtApplicationDate.ClientID %>", "Application Date");
        validateInput("<%= txt_s_name.ClientID %>", "Student Name");
        validateInput("<%= txt_sign_date.ClientID %>", "Sign Date");

        // Validate Title Dropdown
        if ($("#<%= ddlTitle.ClientID %>").prop("selectedIndex") === 0) {
            $("#<%= ddlTitle.ClientID %>").css("border-color", "red");
            errorMsg += "Please select a Title.\n";
            isValid = false;
        } else {
            $("#<%= ddlTitle.ClientID %>").css("border-color", "");
        }

        // Validate Email format
        var emailVal = $("#<%= txtEmail.ClientID %>").val();
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(emailVal)) {
            $("#<%= txtEmail.ClientID %>").css("border-color", "red");
            errorMsg += "Please enter a valid Email.\n";
            isValid = false;
        } else {
            $("#<%= txtEmail.ClientID %>").css("border-color", "");
        }

        // Validate dynamic Credit Transfer rows
        $("#courseWrapper .course-row").each(function (index) {
            var unitCode = $(this).find(".course-input").val().trim();
            var unitTitle = $(this).find(".institution-input").val().trim();
            var evidence = $(this).find(".year-input").val().trim();
            var ctGranted = $(this).find(".ct-input").val().trim();

            if (unitCode === "" || unitTitle === "" || evidence === "" || ctGranted === "") {
                $(this).find("input").css("border-color", "red");
                errorMsg += "Please fill all fields in Credit Transfer row " + (index + 1) + ".\n";
                isValid = false;
            } else {
                $(this).find("input").css("border-color", "");
            }
        });

        // Validate signature canvas
        var canvas = document.getElementById("signatureCanvas");
        var blank = document.createElement("canvas");
        blank.width = canvas.width;
        blank.height = canvas.height;
        if (canvas.toDataURL() === blank.toDataURL()) {
            errorMsg += "Please provide your signature.\n";
            isValid = false;
        }

        // Show all errors in a single alert
        if (!isValid) {
            alert(errorMsg);
        }

        return isValid;
    }
</script>


    <!-- dynamic rows script (pure JS) -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            var courseWrapper = document.getElementById("courseWrapper");

            // Delegate clicks inside the wrapper
            courseWrapper.addEventListener("click", function (event) {
                // Add row when + clicked (button or image)
                var add = event.target.closest && event.target.closest(".addRowBtn");
                if (add) {
                    var template = courseWrapper.querySelector(".course-row");
                    var newRow = template.cloneNode(true);

                    // clear inputs
                    newRow.querySelectorAll("input").forEach(function (inp) { inp.value = ""; });

                    // show remove button in clone
                    var removeBtn = newRow.querySelector(".removeRowBtn");
                    if (removeBtn) removeBtn.style.display = "inline-block";

                    courseWrapper.appendChild(newRow);
                    return;
                }

                // Remove row when - clicked
                var rem = event.target.closest && event.target.closest(".removeRowBtn");
                if (rem) {
                    var row = rem.closest(".course-row");
                    var rows = courseWrapper.querySelectorAll(".course-row");
                    if (rows.length > 1 && row) {
                        row.parentNode.removeChild(row);
                    }
                    return;
                }
            });

            // On submit, collect values into hidden fields (| delimited)
            var submitBtn = document.getElementById("<%= btn_submit.ClientID %>");
            if (submitBtn) {
                submitBtn.addEventListener("click", function () {
                    var rows = courseWrapper.querySelectorAll(".course-row");
                    var unitCodeList = [], unitTitleList = [], evidenceList = [], ctList = [];

                    for (var i = 0; i < rows.length; i++) {
                        var code = (rows[i].querySelector(".course-input") || { value: "" }).value.trim();
                        var title = (rows[i].querySelector(".institution-input") || { value: "" }).value.trim();
                        var evidence = (rows[i].querySelector(".year-input") || { value: "" }).value.trim();
                        var ct = (rows[i].querySelector(".ct-input") || { value: "" }).value.trim();

                        // include the row only if any field has value
                        if (code || title || evidence || ct) {
                            unitCodeList.push(code);
                            unitTitleList.push(title);
                            evidenceList.push(evidence);
                            ctList.push(ct);
                        }
                    }

                    var hUnit = document.getElementById("<%= hdnUnitCode.ClientID %>");
                    var hTitle = document.getElementById("<%= hdnUnitTitle.ClientID %>");
                    var hEvidence = document.getElementById("<%= hdnEvidence.ClientID %>");
                    var hCT = document.getElementById("<%= hdnCT.ClientID %>");

                    if (hUnit) hUnit.value = unitCodeList.join("|");
                    if (hTitle) hTitle.value = unitTitleList.join("|");
                    if (hEvidence) hEvidence.value = evidenceList.join("|");
                    if (hCT) hCT.value = ctList.join("|");
                });
            }
        });
    </script>

    <script src="assets/js/select2.min.js"></script>

    <script>
        $(document).on('ready page:load', function () {
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
            var charCode = (key.which) ? key.which : key.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            } else {
                return true;
            }
        }
    </script>
</asp:Content>
