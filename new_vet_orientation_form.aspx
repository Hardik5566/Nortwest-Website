<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeFile="new_vet_orientation_form.aspx.cs" Inherits="new_vet_orientation_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Orientation Form
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

        /* Math Captcha Styling */
        .captcha-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        #captchaImage {
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .refresh-captcha {
            cursor: pointer;
            color: #007bff;
            font-size: 18px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Orientation Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="https://nortwest.edu.au/"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Orientation Form</li>
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
                        <h2>Orientation Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">Your Full Name</label>
                        <asp:TextBox ID="txt_f_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Campus</label>
                        <asp:DropDownList ID="ddl_campus" CssClass="form-control" runat="server">
                            <asp:ListItem Value="">Campus</asp:ListItem>
                            <asp:ListItem Value="Adelaide">Adelaide</asp:ListItem>
                            <asp:ListItem Value="Sydney">Sydney</asp:ListItem>
                            <asp:ListItem Value="Melbourne">Melbourne</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Email id</label>
                        <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Qualification Enrolled</label>
                        <asp:DropDownList ID="ddl_qulification" CssClass="form-control" runat="server">
                            <asp:ListItem Value="">Qualification</asp:ListItem>
                            <asp:ListItem Value="ELICOS - General English">ELICOS - General English</asp:ListItem>
                            <asp:ListItem Value="ELICOS - English for Academic Purposes">ELICOS - English for Academic Purposes</asp:ListItem>
                            <asp:ListItem Value="Business - Certificate III in Business">Business - Certificate III in Business</asp:ListItem>
                            <asp:ListItem Value="Business - Certificate IV in Business">Business - Certificate IV in Business</asp:ListItem>
                            <asp:ListItem Value="Business - Diploma of Business">Business - Diploma of Business</asp:ListItem>
                            <asp:ListItem Value="Business - Advanced Diploma of Business">Business - Advanced Diploma of Business</asp:ListItem>
                            <asp:ListItem Value="Leadership &amp; Management - Diploma of Leadership and Management">Leadership &amp; Management - Diploma of Leadership and Management</asp:ListItem>
                            <asp:ListItem Value="Leadership &amp; Management - Advanced Diploma of Leadership and Management">Leadership &amp; Management - Advanced Diploma of Leadership and Management</asp:ListItem>
                            <asp:ListItem Value="Project and Program Management - Diploma of Project Management">Project and Program Management - Diploma of Project Management</asp:ListItem>
                            <asp:ListItem Value="Project and Program Management - Advanced Diploma of Program Management">Project and Program Management - Advanced Diploma of Program Management</asp:ListItem>
                            <asp:ListItem Value="ICT Information Technology &amp; Communication - Certificate III in Information Technology">ICT Information Technology &amp; Communication - Certificate III in Information Technology</asp:ListItem>
                            <asp:ListItem Value="ICT Information Technology &amp; Communication - Certificate IV in Information Technology">ICT Information Technology &amp; Communication - Certificate IV in Information Technology</asp:ListItem>
                            <asp:ListItem Value="ICT Information Technology &amp; Communication - Diploma of Information Technology">ICT Information Technology &amp; Communication - Diploma of Information Technology</asp:ListItem>
                            <asp:ListItem Value="Telecommunications - Advanced Diploma of Information Technology(Cyber Security)">Telecommunications - Advanced Diploma of Information Technology(Cyber Security)</asp:ListItem>
                            <asp:ListItem Value="Telecommunications - Advanced Diploma of Information Technology(Telecommunications Network Engineering)">Telecommunications - Advanced Diploma of Information Technology(Telecommunications Network Engineering)</asp:ListItem>
                            <asp:ListItem Value="Graduate Diploma - Graduate Diploma of Management (Learning)">Graduate Diploma - Graduate Diploma of Management (Learning)</asp:ListItem>
                            <asp:ListItem Value="Commercial Cookery - Certificate III in Commercial Cookery">Commercial Cookery - Certificate III in Commercial Cookery</asp:ListItem>
                            <asp:ListItem Value="Commercial Cookery - Certificate IV in Kitchen Management">Commercial Cookery - Certificate IV in Kitchen Management</asp:ListItem>
                            <asp:ListItem Value="Hospitality Management - Diploma of Hospitality Management">Hospitality Management - Diploma of Hospitality Management</asp:ListItem>
                            <asp:ListItem Value="Hospitality Management - Advanced Diploma of Hospitality Management">Hospitality Management - Advanced Diploma of Hospitality Management</asp:ListItem>
                            <asp:ListItem Value="Construction Courses - Certificate III in Carpentry">Construction Courses - Certificate III in Carpentry</asp:ListItem>
                            <asp:ListItem Value="Construction Courses - Certificate III in Painting and Decorating">Construction Courses - Certificate III in Painting and Decorating</asp:ListItem>
                            <asp:ListItem Value="Construction Courses - Certificate III in Wall and Floor Tiling">Construction Courses - Certificate III in Wall and Floor Tiling</asp:ListItem>
                            <asp:ListItem Value="Construction Courses - Diploma of Building and Construction (Building)">Construction Courses - Diploma of Building and Construction (Building)</asp:ListItem>
                        </asp:DropDownList>
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
                    <div class="col-md-6">
                        <label class="lbl_title">Student Id Number</label>
                        <asp:TextBox ID="txt_id_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Upload Photo (Picture with plain background)</label>
                        <asp:FileUpload ID="upd_photo" CssClass="form-control" runat="server" />
                    </div>

                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>AUSTRALIA ADDRESS</h4>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Line 1</label>
                        <asp:TextBox ID="txt_aus_line_1" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Line 2</label>
                        <asp:TextBox ID="txt_aus_line_2" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Suburb/City</label>
                        <asp:TextBox ID="txt_aus_city" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label class="lbl_title">State</label>
                        <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control" aria-required="true">
                            <asp:ListItem Value="">State</asp:ListItem>
                            <asp:ListItem Value="Australian Capital Territory">Australian Capital Territory</asp:ListItem>
                            <asp:ListItem Value="New South Wales">New South Wales</asp:ListItem>
                            <asp:ListItem Value="Northern Territory">Northern Territory</asp:ListItem>
                            <asp:ListItem Value="Queensland">Queensland</asp:ListItem>
                            <asp:ListItem Value="South Australia">South Australia</asp:ListItem>
                            <asp:ListItem Value="Tasmania">Tasmania</asp:ListItem>
                            <asp:ListItem Value="Victoria">Victoria</asp:ListItem>
                            <asp:ListItem Value="Western Australia">Western Australia</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Post Code</label>
                        <asp:TextBox ID="txt_aus_post_code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>OVERSEAS ADDRESS</h4>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label class="lbl_title">Line 1</label>
                        <asp:TextBox ID="txt_over_line1" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">Line 2</label>
                        <asp:TextBox ID="txt_over_line2" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Suburb/City</label>
                        <asp:TextBox ID="txt_over_city" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-4 search_dropdown">
                        <label class="lbl_title">Country</label>

                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control qualification select2" runat="server" aria-required="true" aria-invalid="false">
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-4">
                        <label class="lbl_title">Post Code</label>
                        <asp:TextBox ID="txt_over_post" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-12">
                        <label class="lbl_title">USI Number</label>
                        <asp:TextBox ID="txt_usi_no" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">All assessments must be submitted on time. What are the consequences of late-submitted assessments?</label>

                            <div class="row">
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton1" runat="server" CssClass="test1" Text="Nothing" GroupName="test1" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton2" runat="server" CssClass="test1" Text="Trainer will not mark your assessment" GroupName="test1" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton3" runat="server" CssClass="test1" Text="Trainer will mark your assessment as Did Not Submit" GroupName="test1" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton4" runat="server" CssClass="test1" Text=" You will have to pay a late submission fee of upto $250 per assessment" GroupName="test1" />
                                    </label>
                                </div>

                            </div>
                        </div>


                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">Who should you contact in case you have problems with your studies, attendance, or other student-related issues?</label>
                            <div class="row">

                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton5" runat="server" GroupName="test2" Text="Student Support Officer (SSO)" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton6" runat="server" GroupName="test2" Text=" Classmates" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton7" runat="server" GroupName="test2" Text="No one" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton8" runat="server" GroupName="test2" Text="My trainer" />
                                    </label>
                                </div>

                            </div>
                        </div>


                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">Deferral from your studies is possible under special and compelling circumstances such as illness, death in your family, serious injury, and similar. When is deferral possible?</label>
                            <div class="row">

                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton9" runat="server" GroupName="test3" Text="Only in exceptional circumstances." />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton10" runat="server" GroupName="test3" Text="Never" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton11" runat="server" GroupName="test3" Text="Maybe" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton12" runat="server" GroupName="test3" Text="False" />
                                    </label>
                                </div>

                            </div>
                        </div>


                    </div>


                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">Your student visa comes with a work permit. However, your weekly hours are limited to</label>

                            <div class="row">

                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton13" runat="server" GroupName="test4" Text=" 48 hours in 2 weeks" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton14" runat="server" GroupName="test4" Text="No more than 40 hours" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton15" runat="server" GroupName="test4" Text=" Fulltime - 40 hours and more" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton16" runat="server" GroupName="test4" Text="Unlimited hours" />
                                    </label>
                                </div>

                            </div>
                        </div>


                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">You must notify Nortwest in case of a change in your contact information within:</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton17" runat="server" GroupName="test5" Text="2 weeks" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton18" runat="server" GroupName="test5" Text="1 month" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton19" runat="server" GroupName="test5" Text="5 working days" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton20" runat="server" GroupName="test5" Text="A year" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">Special leave can be approved only if I:</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton21" runat="server" GroupName="test6" Text="Apply for 4 weeks, have a good reason and attach the flight tickets and supporting documents" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton22" runat="server" GroupName="test6" Text="Apply for 10 weeks and attach return flight tickets and supporting documents" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton23" runat="server" GroupName="test6" Text="Apply and don’t attach any evidence" />
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton24" runat="server" GroupName="test6" Text=" I don't need to apply" />
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">Academic misconduct is defined as cheating, plagiarism, or acting dishonestly. What is the consequence of academic misconduct?</label>

                            <div class="row">
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton25" runat="server" GroupName="test7" Text="You will have to re-do and resubmit your assessments by the due date" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton26" runat="server" GroupName="test7" Text="You could be reported to Immigration" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton27" runat="server" GroupName="test7" Text="Nortwest will cancel your enrolment" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton28" runat="server" GroupName="test7" Text="None of the Above" />
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="lbl_title">What is the college phone number you should call if you have an emergency?</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton29" runat="server" GroupName="test8" Text=" 0411 222 969" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton30" runat="server" GroupName="test8" Text="0426 254 486" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton31" runat="server" GroupName="test8" Text="0492 938 782" />
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="radio-inline">
                                        <asp:RadioButton ID="RadioButton32" runat="server" GroupName="test8" Text="0449 955 272" />
                                    </label>
                                </div>

                            </div>
                        </div>
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
                    <span class="lbl_explanation_error txt_error" style="display: none; color:red;">Please check all the checkboxes before submitting the form.</span>
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

                    <%--<div class="col-md-12">
                        <label class="checkbox-inline lbl_title ch_agree">
                            <asp:CheckBox ID="ch_i_agree" runat="server" Style="font-weight: bold" Text="I agree that my photo, video and achievements may be used for promotional or publicity purposes without written consent or notification." />
                        </label>
                    </div>--%>

                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>STUDENT SIGNATURE</h4>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div>
                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px; cursor:pointer;" src="assets/img/eraser.png" />
                        </div>
                        <asp:HiddenField ID="hdnSignature" runat="server" />
                        <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>
                    </div>
                </div>

                <div class="row" style="margin-top:15px;">
                    <div class="col-md-4">
                        <label class="lbl_title">Enter Captcha Code</label>
                        <div class="captcha-box">
                            <img id="captchaImage" width="150" height="50" alt="Security Captcha" />
                            <i class="fas fa-sync-alt refresh-captcha" onclick="generateCaptcha()"></i>
                        </div>
                        <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control" style="margin-top:10px;" placeholder="Captcha Code" onkeypress="return only_number(event)"></asp:TextBox>
                    </div>
                </div>
            </div>


            <div>
                <asp:Button ID="btn_submit" runat="server" OnClientClick="return onSubmitValidate(this);" OnClick="btn_submit_Click" Text="SUBMIT" CssClass="btn btn-success" />
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">

    <script src="assets/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>

    <script>
        // AJAX Call to generate captcha dynamically from the backend
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                url: "new_vet_orientation_form.aspx/GetCaptchaImage",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false, // Prevents browser caching
                success: function (response) {
                    $("#captchaImage").attr("src", response.d);
                    $("#<%= txt_captcha_input.ClientID %>").val("");
                },
                error: function (error) {
                    console.log("Error generating captcha");
                }
            });
        }

        const canvas = document.getElementById('signatureCanvas');
        const signaturePad = new SignaturePad(canvas);

        function resizeCanvas() {
            const ratio = Math.max(window.devicePixelRatio || 1, 1);
            canvas.width = canvas.offsetWidth * ratio;
            canvas.height = canvas.offsetHeight * ratio;
            canvas.getContext("2d").scale(ratio, ratio);
            signaturePad.clear();
        }

        $(document).ready(function () {
            $('.select2').select2();
            generateCaptcha();
            resizeCanvas();
            
            // Fix nice-select conflicts
            $(function () {
                $('.nice-select').remove();
                $('select').show().css({ display: 'block', visibility: 'visible', opacity: 1 });
                if(typeof $.fn.niceSelect === 'function') {
                    $.fn.niceSelect = function(){ return this; };
                }
            });
        });

        window.addEventListener("resize", resizeCanvas);

        document.getElementById('clearBtn').addEventListener('click', () => {
            signaturePad.clear();
        });

        function saveSignature() {
            var signatureData = canvas.toDataURL("image/png");
            document.getElementById("<%= hdnSignature.ClientID %>").value = signatureData;
        }

        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }

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
            output.innerHTML = text;
            $("#<%= hd_contact_no_code.ClientID%>").val(iti.selectedCountryData.dialCode);
            $("#<%= hd_contact_no.ClientID%>").val($("#phone").val());
        };

        input.addEventListener('countrychange', handleChange);
        input.addEventListener('change', handleChange);
        input.addEventListener('keyup', handleChange);

        // Unified Submit Handler: Safely checks forms before sending to server
        function onSubmitValidate(btn) {
            if (!validateForm()) {
                return false; // Blocks postback on failure
            }

            // Save Signature Data to Hidden Field before postback
            saveSignature();

            btn.value = "Submitting...";
            btn.style.opacity = "0.7";
            return true; 
        }

        function validateForm() {
            var isValid = true;
            var errorMessages = [];

            function checkEmpty(id, fieldName) {
                if ($("#" + id).val().trim() == "") {
                    $("#" + id).css("border-color", "red");
                    errorMessages.push(fieldName + " is required.");
                    isValid = false;
                } else { $("#" + id).css("border-color", ""); }
            }

            checkEmpty("<%= txt_f_name.ClientID %>", "Full Name");

            if ($("#<%= ddl_campus.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_campus.ClientID %>").css("border-color", "red");
                errorMessages.push("Campus is required.");
                isValid = false;
            } else { $("#<%= ddl_campus.ClientID %>").css("border-color", ""); }

            if ($("#<%= ddl_qulification.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_qulification.ClientID %>").css("border-color", "red");
                errorMessages.push("Qualification is required.");
                isValid = false;
            } else { $("#<%= ddl_qulification.ClientID %>").css("border-color", ""); }

            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_email.ClientID %>").val().trim())) {
                $("#<%= txt_email.ClientID %>").css("border-color", "red");
                errorMessages.push("Enter a valid Email.");
                isValid = false;
            } else { $("#<%= txt_email.ClientID %>").css("border-color", ""); }

            if ($("#<%= txt_id_no.ClientID %>").val().trim() == "") {
                $("#<%= txt_id_no.ClientID %>").css("border-color", "red");
                errorMessages.push("Student ID is required.");
                isValid = false;
            } else { $("#<%= txt_id_no.ClientID %>").css("border-color", ""); }

            if ($("#<%= txt_aus_line_1.ClientID %>").val().trim() == "") {
                $("#<%= txt_aus_line_1.ClientID %>").css("border-color", "red");
                errorMessages.push("Australian Address Line 1 is required.");
                isValid = false;
            } else { $("#<%= txt_aus_line_1.ClientID %>").css("border-color", ""); }

            if ($("#<%= ddl_country.ClientID %>").prop("selectedIndex") == 0) {
                errorMessages.push("Overseas Country is required.");
                isValid = false;
            }

            if ($("#phone").val().trim() == "" || !iti.isValidNumber()) {
                $("#phone").css("border-color", "red");
                errorMessages.push("Valid Contact Number is required.");
                isValid = false;
            } else { $("#phone").css("border-color", ""); }

            if ($(".ch_explanation input[type='checkbox']:not(:checked)").length > 0) {
                $(".lbl_explanation_error.txt_error").show();
                errorMessages.push("All explanation checkboxes must be checked.");
                isValid = false;
            } else { $(".lbl_explanation_error.txt_error").hide(); }

            if (signaturePad.isEmpty()) {
                errorMessages.push("Signature is required.");
                isValid = false;
            }

            // ONLY check if empty client-side. The true mathematical verification is strictly processed in C#.
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                errorMessages.push("Please enter the security captcha code.");
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (!isValid) {
                alert(errorMessages.join("\n"));
            }

            return isValid;
        }

    </script>

</asp:Content>