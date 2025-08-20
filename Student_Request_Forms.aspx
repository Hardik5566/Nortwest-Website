<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Student_Request_Forms.aspx.cs" Inherits="Student_Request_Forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Student Request Forms
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
                    <h1>Student Request Forms</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Student Request Forms</li>
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
                        <h2>Student Request Forms</h2>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>PERSONAL DETAILS</h4>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">Title</label>
                        <asp:DropDownList ID="ddl_title" CssClass="form-control" runat="server">
                            <asp:ListItem Value="">Title</asp:ListItem>

                            <asp:ListItem Value="Mr">Mr</asp:ListItem>
                            <asp:ListItem Value="Mrs">Mrs</asp:ListItem>
                            <asp:ListItem Value="Ms">Ms</asp:ListItem>
                            <asp:ListItem Value="Miss">Miss</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">First Name</label>
                        <asp:TextBox ID="txt_f_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Last Name</label>
                        <asp:TextBox ID="txt_l_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">Gender</label>
                        <asp:DropDownList ID="ddl_gender" CssClass="form-control" runat="server">
                            <asp:ListItem Value="">Gender</asp:ListItem>

                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Student ID</label>
                        <asp:TextBox ID="txt_student_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Date</label>
                        <asp:TextBox ID="txt_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

            </div>
            <div class="form-container">
                <div>
                    <h4>CONTACT DETAILS</h4>
                    <p>What is your current Residential Address?</p>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Address</label>
                        <asp:TextBox ID="txt_address" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Suburb</label>
                        <asp:TextBox ID="txt_suburb" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Postcode</label>
                        <asp:TextBox ID="txt_postcode" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div>
                    <p>What is your Mailing Address?</p>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Address</label>
                        <asp:TextBox ID="txt_m_address" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Suburb</label>
                        <asp:TextBox ID="txt_m_suburb" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Postcode</label>
                        <asp:TextBox ID="txt_m_postcode" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Email</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Contact Number</label>
                        <div class="input-group contact_no">
                            <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control" type="tel" />
                            <p id="output"></p>
                            <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                            <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>REQUEST</h4>
                    <div id="radioError" style="margin-top: 5px;"></div>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Tick one of the following</label><br />
                    </div>

                    <div class="col-md-4">
                        <ul>
                            <li>
                                <asp:RadioButton ID="RadioButton1" Text="Change in course duration" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>
                            <li>
                                <asp:RadioButton ID="RadioButton2" Text="Credit transfer" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>
                            <li>
                                <asp:RadioButton ID="RadioButton3" Text="Testamur replacement" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>

                        </ul>

                    </div>

                    <div class="col-md-4">
                        <ul>
                            <li>
                                <asp:RadioButton ID="RadioButton4" Text="Enrolment Status Letter" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>
                            <li>
                                <asp:RadioButton ID="RadioButton5" Text="ID card replacement" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>
                            <li>
                                <asp:RadioButton ID="RadioButton6" Text="Statement of Attainment" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>

                        </ul>

                    </div>
                    <div class="col-md-4">
                        <ul>
                            <li>
                                <asp:RadioButton ID="RadioButton7" Text="Change of campus" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>
                            <li>
                                <asp:RadioButton ID="RadioButton8" Text="Change in Timetable" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>
                            <li>
                                <asp:RadioButton ID="RadioButton9" Text="Other (Please specify)" CssClass="radio-inline" GroupName="tick_one" runat="server" />
                            </li>

                        </ul>

                    </div>
                </div>

            </div>

            <div class="form-container">
                <div>
                    <h4>DETAILS OF REQUESTS</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Detail</label>
                        <asp:TextBox ID="txt_detail" CssClass="form-control" Rows="5" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>DOCUMENTS</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Upload Supporting Documents</label>
                        <asp:FileUpload ID="upd_doc" CssClass="form-control" runat="server" />
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

            if ($("#<%= ddl_title.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_title.ClientID %>").next(".nice-select").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= ddl_title.ClientID %>").next(".nice-select").css("border-color", "");
            }
            // Validate Full Name
            if ($("#<%= txt_f_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_f_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_f_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_l_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_l_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_l_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= ddl_gender.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_gender.ClientID %>").next(".nice-select").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= ddl_gender.ClientID %>").next(".nice-select").css("border-color", "");
            }
            // Validate Full Name
            if ($("#<%= txt_student_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_student_id.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_student_id.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_date.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_address.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_suburb.ClientID %>").val().trim() == "") {
                $("#<%= txt_suburb.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_suburb.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_postcode.ClientID %>").val().trim() == "") {
                $("#<%= txt_postcode.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_postcode.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_m_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_m_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_m_address.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_m_suburb.ClientID %>").val().trim() == "") {
                $("#<%= txt_m_suburb.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_m_suburb.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_m_postcode.ClientID %>").val().trim() == "") {
                $("#<%= txt_m_postcode.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_m_postcode.ClientID %>").css("border-color", "");
            }

            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }



            if ($("#<%= txt_detail.ClientID %>").val().trim() == "") {
                $("#<%= txt_detail.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_detail.ClientID %>").css("border-color", "");
            }
            if ($("#<%= upd_doc.ClientID %>").val() == "") {
                $("#<%= upd_doc.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= upd_doc.ClientID %>").css("border-color", "");
            }



            if ($("#<%= hd_contact_no_code.ClientID%>").val() == "") {
                $("#phone").css("border-color", "red");
                isValid = false;
            } else {
                $("#phone").css("border-color", "");
            }
            if ($("#<%= txt_sign_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "");
            }
            
            if ($("input[type='radio'][name$='tick_one']:checked").length == 0) {
                $("#radioError").text("Please select at least one option.").css("color", "red");
                isValid = false; 
            } else {
                $("#radioError").text(""); // Clear error if valid
            }


            
            if ($("#<%= hd_contact_no_code.ClientID%>").val() == "") {
                $("#phone").css("border-color", "red");
                isValid = false;
            } else {
                $("#phone").css("border-color", "");
            }

            

            if ($(".ch_explanation input[type='checkbox']:not(:checked)").length > 0) {
                $(".lbl_explanation_error.txt_error").show(); // Use the proper selector
                isValid = false;
            } else {
                $(".lbl_explanation_error.txt_error").hide(); // Properly hide the error

            }


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

</asp:Content>

