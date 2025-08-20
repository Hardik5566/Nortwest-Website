<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change_course_form.aspx.cs" Inherits="Change_course_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Change of a course form
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
                    <h1>Change of a course form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Change of a course form</li>
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
                        <h2>Change of a course form</h2>

                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Student Details</h4>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label class="lbl_title">Student Number</label>
                        <asp:TextBox ID="txt_student_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Student Last Name</label>
                        <asp:TextBox ID="txt_l_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">
                            Student Given Names</label>
                        <asp:TextBox ID="txt_given_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">Student Full Name</label>
                        <asp:TextBox ID="txt_full_name" CssClass="form-control" runat="server"></asp:TextBox>
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
            </div>
            <div class="form-container">
                <div>
                    <h4>Current Address</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Street Address</label>
                        <asp:TextBox ID="txt_street_address" CssClass="form-control" Rows="4" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Address Line 2</label>
                        <asp:TextBox ID="txt_address_2" CssClass="form-control" Rows="4" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">City</label>
                        <asp:TextBox ID="txt_city" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">State / Province / Region</label>
                        <asp:TextBox ID="txt_state" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">ZIP / Postal Code</label>
                        <asp:TextBox ID="txt_zip" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Country</label>

                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control  select2" runat="server" aria-required="true" aria-invalid="false"></asp:DropDownList>


                    </div>

                </div>
                <div>
                </div>


            </div>
            <asp:Button ID="btn_submit" runat="server" OnClientClick="saveSignature()" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
        </div>
    </div>
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
            if ($("#<%= txt_student_no.ClientID %>").val().trim() == "") {
                $("#<%= txt_student_no.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_student_no.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_l_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_l_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_l_name.ClientID %>").css("border-color", "");
            }


            if ($("#<%= txt_given_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_given_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_given_name.ClientID %>").css("border-color", "");
            }

            // Validate Photo
            if ($("#<%= txt_full_name.ClientID %>").val() == "") {
                $("#<%= txt_full_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_full_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_street_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_street_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_street_address.ClientID %>").css("border-color", "");
            }
            // Validate Email
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_email.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_address_2.ClientID %>").val().trim() == "") {
                $("#<%= txt_address_2.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_address_2.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_city.ClientID %>").val().trim() == "") {
                $("#<%= txt_city.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_city.ClientID %>").css("border-color", "");
            }

            if ($("#<%= ddl_country.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_country.ClientID %>").next(".nice-select").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= ddl_country.ClientID %>").next(".nice-select").css("border-color", "");
            }

            if ($("#<%= txt_state.ClientID %>").val().trim() == "") {
                $("#<%= txt_state.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_state.ClientID %>").css("border-color", "");
            }


            if ($("#<%= txt_zip.ClientID %>").val().trim() == "") {
                $("#<%= txt_zip.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_zip.ClientID %>").css("border-color", "");
            }


            if ($("#<%= hd_contact_no_code.ClientID%>").val() == "") {
                $("#phone").css("border-color", "red");
                isValid = false;
            } else {
                $("#phone").css("border-color", "");
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

