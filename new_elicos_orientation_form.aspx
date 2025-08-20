<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="new_elicos_orientation_form.aspx.cs" Inherits="new_elicos_orientation_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Elicos Orientation Form
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

        .ch_agree {
            font-weight: bold !important;
        }
    </style>
    <link href="assets/country_code/css/intlTelInput.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Elicos Student Orientation Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Student Orientation Form</li>
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
                        <h2>Elicos Student Orientation Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">YOUR FULL NAME</label>
                        <asp:TextBox ID="txt_f_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Campus</label>
                        <asp:DropDownList ID="ddl_campus" CssClass="form-control" runat="server">
                            <asp:ListItem Value="Adelaide">Adelaide</asp:ListItem>
                            <asp:ListItem Value="Sydney">Sydney</asp:ListItem>
                            <asp:ListItem Value="Melbourne">Melbourne</asp:ListItem>
                        </asp:DropDownList>
                    </div>



                    <div class="col-md-6">
                        <label class="lbl_title">Photo To Issue Student ID Card</label>
                        <asp:FileUpload ID="upd_id_card" CssClass="form-control" runat="server" />

                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Email id</label>
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
                    <div class="col-md-12">
                        <label class="lbl_title">YOUR STUDENT ID NUMBER</label>
                        <asp:TextBox ID="txt_student_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">AUSTRALIA ADDRESS</label>
                        <asp:TextBox ID="txt_aus_address" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">OVERSEAS ADDRESS</label>
                        <asp:TextBox ID="txt_over_address" CssClass="form-control" Rows="3" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>


                    <div class="col-md-12">
                        <label class="lbl_title">WHAT NUMBER SHOULD I CALL IN CASE OF AN EMERGENCY (POLICE, FIRE, AMBULANCE)?</label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton1" runat="server" Text="911" GroupName="test1" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton2" runat="server" Text="112" GroupName="test1" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton3" runat="server" Text="069" GroupName="test1" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton4" runat="server" Text="000" GroupName="test1" />
                        </label>
                    </div>




                    <div class="col-md-12">
                        <label class="lbl_title">WHO SHOULD YOU CONTACT IN CASE YOU HAVE PROBLEMS WITH YOUR STUDIES, ATTENDANCE OR OTHER STUDENT-RELATED ISSUES?</label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="test2" Text="Reception" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton6" runat="server" GroupName="test2" Text="Classmates" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton7" runat="server" GroupName="test2" Text="No one" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton8" runat="server" GroupName="test2" Text="My teacher" />
                        </label>
                    </div>


                    <div class="col-md-12">
                        <label class="lbl_title">YOUR STUDENT VISA REQUIRES YOU TO ACHIEVE A MINIMUM ATTENDANCE IN CLASS PER WEEK:</label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton9" runat="server" GroupName="test3" Text="100%" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton10" runat="server" GroupName="test3" Text="90%" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton11" runat="server" GroupName="test3" Text="80%" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton12" runat="server" GroupName="test3" Text="70%" />
                        </label>
                    </div>


                    <div class="col-md-12">
                        <label class="lbl_title">THE COLLEGE PHONE NUMBER YOU SHOULD CALL IF YOU HAVE AN EMERGENCY IS</label>
                        <div>
                            <label class="radio-inline">
                                <asp:RadioButton ID="RadioButton13" runat="server" GroupName="test4" Text="0451 915 609" />
                            </label>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <label class="lbl_title">What do you do if you have a problem?</label>
                    </div>

                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton14" runat="server" GroupName="test5" Text="Nothing" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton15" runat="server" GroupName="test5" Text="Speak to my teacher" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton16" runat="server" GroupName="test5" Text="Speak to Reception" />
                        </label>
                    </div>



                    <div class="col-md-12">
                        <label class="lbl_title">WHEN DO YOU COMPLETE A TEST TO SEE YOUR PROGRESS?</label>
                    </div>

                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton17" runat="server" GroupName="test6" Text="Monday" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton18" runat="server" GroupName="test6" Text="Tuesday" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="radio-inline">
                            <asp:RadioButton ID="RadioButton19" runat="server" GroupName="test6" Text="Thursday" />
                        </label>
                    </div>

                </div>

            </div>

            <div class="form-container">
                <div>
                    <h4>Student Declaration</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">
                            I understand that the information provided by me to Nortwest Pty Ltd t/a City Institute, Sydney & Adelaide College
                        Campus may be made available to the Commonwealth and State Agencies and the Fund Manager of the ESOS Tuition Protection Service.</label>
                    </div>

                    <div class="col-md-12">
                        <label class="lbl_title">Nortwest Pty Ltd trading as City Institute, Sydney & Adelaide College Campus is required under the ESOS Act to inform the Department of Home Affairs(DOHA) about certain changes to student enrolment and any breaches of a student’s visa conditions relating to attendance and academic performance.</label>
                    </div>

                    <div class="col-md-12">
                        <label class="lbl_title">I have read, understood and agree to comply with the information outlined in this Student Handbook and that policies and procedures are available to me online and from administration.</label>
                    </div>

                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4 class="">Explanation of</h4>
                    <span class="lbl_explanation_error txt_error" style="display: none;">Please check all the checkboxes before submitting the form.</span>

                </div>

                <div class="row ch_explanation">
                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Student contact details/ photo for students cards" />
                        </label>
                    </div>
                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="Orientation on the campus/online - Introduction of the staff" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="Student Support Services" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox4" runat="server" Text="Emergency evacuation and WHS obligations" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox5" runat="server" Text="Facilities and Resources" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox6" runat="server" Text="Complaints and Appeals Processes" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox7" runat="server" Text="Students Policies & Procedures" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox8" runat="server" Text="Students’ visa obligations (related to course progress and attendance)" />
                        </label>
                    </div>


                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox9" runat="server" Text="Fee schedule and payments" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox10" runat="server" Text="I have been provided with a Student Handbook" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox13" runat="server" Text="I am aware of the Terms and Conditions of my enrolment" />
                        </label>
                    </div>

                    <div class="col-md-6">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox12" runat="server" Text="I am aware of course progress and attendance requirements" />
                        </label>
                    </div>

                    <div class="col-md-12">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox11" runat="server" Text="I know my username, password, and how to log into the online learning platform" />
                        </label>
                    </div>

                    <div class="col-md-12">
                        <label class="lbl_title checkbox-inline ch_agree">

                            <asp:CheckBox ID="ch_i_agree" runat="server" Style="font-weight: bold" Text="I agree that my photo, video and achievements may be used for promotional or publicity purposes without written consent or notification." />

                        </label>

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
                        <label class="lbl_title">Name</label>
                        <asp:TextBox ID="txt_name" CssClass="form-control" runat="server"></asp:TextBox>

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

            // Validate Full Name
            if ($("#<%= txt_f_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_f_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_f_name.ClientID %>").css("border-color", "");
            }

            // Validate Campus
            if ($("#<%= ddl_campus.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_campus.ClientID %>").next(".nice-select").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= ddl_campus.ClientID %>").next(".nice-select").css("border-color", "");
            }



            // Validate Email
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }

            // Validate Student ID Number
            if ($("#<%= txt_student_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_student_id.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_student_id.ClientID %>").css("border-color", "");
            }

            // Validate Photo
            if ($("#<%= upd_id_card.ClientID %>").val() == "") {
                $("#<%= upd_id_card.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= upd_id_card.ClientID %>").css("border-color", "");
            }

            if ($("#<%=txt_aus_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_aus_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_aus_address.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_over_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_over_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_over_address.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_name.ClientID %>").css("border-color", "");
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

