<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="course_entry_form.aspx.cs" Inherits="course_entry_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Course Entry
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

        .addRowBtn, .removeRowBtn {
            background: none;
            border: none;
        }

        #ch_check_course input[type="radio"], input[type="checkbox"] {
            margin-right: 6px;
        }

        .radio-inline {
            position: relative;
            display: inline-block;
            padding-left: 20px;
            margin-bottom: 0;
            vertical-align: middle;
            font-weight: normal;
            cursor: pointer;
        }

        .radio_button_inline label {
            margin: 0px 6px 0px 6px;
            font-weight: 100;
        }

        .lbl_style {
            font-weight: 100 !important;
        }

        .ch_style label {
            font-weight: 100 !important;
            display: inline;
        }

        .radio-list input[type="radio"] {
            margin-right: 6px;
        }

        .radio-list label {
            display: block;
            padding-left: 20px;
            position: relative;
            cursor: pointer;
            margin-bottom: 8px;
        }

            .radio-list label::before {
                content: "";
                position: absolute;
                left: 0;
                top: 3px;
                width: 14px;
                height: 14px;
                border: 2px solid #ccc;
                border-radius: 50%;
                background: #fff;
            }

        .radio-list input[type="radio"]:checked + label::before {
            background: #337ab7;
            border-color: #337ab7;
        }

        .form-control {
            height: auto;
        }

        @media screen and (-webkit-min-device-pixel-ratio: 0) {
            input[type=date].form-control, input[type=time].form-control, input[type=datetime-local].form-control, input[type=month].form-control {
                line-height: normal;
            }
        }

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

    <asp:ScriptManager ID="sm1" runat="server" EnablePartialRendering="true" EnableCdn="true"></asp:ScriptManager>
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Course Entry Interview Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Course Entry Interview Form</li>
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
                        <h2>Course Entry Interview Form</h2>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>SECTION A – Student/Applicant Details</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="username">Name:<span class="required">*</span></label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txt_name" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="username">Date Of Birth:</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txt_dob" TextMode="Date" CssClass="form-control" />
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

                            <div class="col-md-6">
                                <label for="username">Email:</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="username">Student Id:</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txt_std_id" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>SECTION B – Questions to be asked of the student</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">1. What course/s are you interested in enrolling in?  <small>(Please list course code and title)</small></label>
                                    <asp:CheckBoxList runat="server" ID="ch_check_course" CssClass="ch_style">
                                        <asp:ListItem Text="ELICOS - General English" />
                                        <asp:ListItem Text="ELICOS - English for Academic Purposes" />
                                        <asp:ListItem Text="Business - Certificate IV in Business" />
                                        <asp:ListItem Text="Business - Diploma of Business" />
                                        <asp:ListItem Text="Business - Advanced Diploma of Business" />
                                        <asp:ListItem Text="Leadership & Management - Diploma of Leadership and Management" />
                                        <asp:ListItem Text="Leadership & Management - Advanced Diploma of Leadership and Management" />
                                        <asp:ListItem Text="Project and Program Management - Diploma of Project Management" />
                                        <asp:ListItem Text="Project and Program Management - Advanced Diploma of Program Management" />
                                        <asp:ListItem Text="ICT Information Technology & Communication - Diploma of Information Technology" />
                                        <asp:ListItem Text="Telecommunications - Advanced Diploma of Information Technology" />
                                        <asp:ListItem Text="Graduate Diploma - Graduate Diploma of Management (Learning)" />
                                        <asp:ListItem Text="Commercial Cookery - Certificate III in Commercial Cookery" />
                                        <asp:ListItem Text="Commercial Cookery - Certificate IV in Kitchen Management" />
                                        <asp:ListItem Text="Hospitality Management - Diploma of Hospitality Management" />
                                        <asp:ListItem Text="Hospitality Management - Advanced Diploma of Hospitality Management" />
                                        <asp:ListItem Text="Construction Courses - Certificate III in Carpentry" />
                                        <asp:ListItem Text="Construction Courses - Certificate III in Painting and Decorating" />
                                        <asp:ListItem Text="Construction Courses - Certificate III in Wall and Floor Tiling" />
                                        <asp:ListItem Text="Construction Courses - Diploma of Building and Construction (Building)" />
                                        <asp:ListItem Text="Advanced Diploma of Civil Construction Design" />
                                        <asp:ListItem Text="Certificate III in Cabinet Making and Timber Technology" />
                                        <asp:ListItem Text="Certificate III in Light Vehicle Mechanical Technology" />
                                        <asp:ListItem Text="Certificate IV in Automotive Mechanical Diagnosis" />
                                        <asp:ListItem Text="Certificate IV in Project Management Practice" />
                                    </asp:CheckBoxList>
                                    <span id="courseError" style="display: none; color: red"></span>
                                </div>
                            </div>


                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">2. What do you hope to gain from enrolling in this course/s? (Relevant to interests, capabilities, aspirations and job outcomes)</label>
                                    <asp:TextBox runat="server" ID="txt_hope" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">3. Please describe your career goals including short term and long term goals and any jobs you would like to have in the future.</label>
                                    <asp:TextBox runat="server" ID="txt_career_goal" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">4. What courses have you participated in in the past and what did you enjoy most about these courses?</label>
                                    <asp:TextBox runat="server" ID="txt_participated_course" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">5. Have you had any experience in any area related to the course/s you would like to enrol in?</label>
                                    <asp:TextBox runat="server" ID="txt_course_related_exep" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">6. What is your learning style and how do you like to learn? NOTE: You may also learn best through a combination of methods or through options not listed above. Those listed have been provided as examples.</label>
                                    <span>NOTE: You may also learn best through a combination of methods or through options not listed above. Those listed have been provided as examples.</span>
                                    <asp:TextBox runat="server" ID="txt_learning_style" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                    <br />
                                    <label>Select</label><br />
                                    <asp:CheckBox CssClass="ch_style" Text="Visual – Learn best through pictures, diagrams, watching etc." ID="ch_check_visual_learning" runat="server" /><br />
                                    <asp:CheckBox CssClass="ch_style" Text=" Hands on – Learn best through practicing, role plays, simulations etc." ID="ch_check_hands_on" runat="server" /><br />
                                    <asp:CheckBox CssClass="ch_style" Text=" HandsReading – Learn best through research, reviewing textbooks, reading notes etc." ID="ch_check_handsreading" runat="server" />
                                </div>
                            </div>

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>7. What learning materials and strategies will assist you to learn best? Tick as many as apply.</label>

                                            <asp:CheckBoxList runat="server" ID="ch_check_learning_material" CssClass="ch_style">
                                                <asp:ListItem Text=" Textbooks that I can read and refer to in my own time" />
                                                <asp:ListItem Text=" PowerPoints and handouts explained to me during classes" />
                                                <asp:ListItem Text=" Pictures and diagrams" />
                                                <asp:ListItem Text=" Group discussions with others" />
                                                <asp:ListItem Text=" Online materials that I can access and complete when I need to" />
                                                <asp:ListItem Text=" Conducting my own research" />
                                                <asp:ListItem Text=" Practical application of skills and knowledge in a workplace or similar" />
                                                <asp:ListItem Text=" Working through real examples such as a case study or scenario" />
                                            </asp:CheckBoxList>
                                            <asp:CheckBox Text="Other" CssClass="ch_style" OnCheckedChanged="ch_check_learning_other_CheckedChanged" ID="ch_check_learning_other" AutoPostBack="true" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-md-12" id="div_learning_other" runat="server" visible="false">
                                        <div class="form-group">
                                            <label>please explain</label>
                                            <asp:TextBox runat="server" ID="txt_explain" CssClass="form-control" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>8. What support do you think you might need in order to complete this course successfully (anything known to you prior to your application)?</label>

                                            <asp:CheckBoxList runat="server" ID="ch_check_support" CssClass="ch_style">
                                                <asp:ListItem Text="English language support" />
                                                <asp:ListItem Text="Reading support" />
                                                <asp:ListItem Text="Writing support" />
                                                <asp:ListItem Text="Study support" />
                                                <asp:ListItem Text="One-on-one guidance with a trainer/assessor" />
                                                <asp:ListItem Text="Additional resources" />
                                            </asp:CheckBoxList>
                                            <asp:CheckBox Text="Other" CssClass="ch_style" OnCheckedChanged="ch_check_other_support_CheckedChanged" ID="ch_check_other_support" AutoPostBack="true" runat="server" />
                                        </div>
                                    </div>

                                    <div class="col-md-12" id="div_support_other" runat="server" visible="false">
                                        <div class="form-group">
                                            <label>please explain</label>
                                            <asp:TextBox runat="server" ID="txt_explain_support" CssClass="form-control" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>9. Are you currently working in the industry for which you are seeking training for?</label>
                                    <div class="form-control">
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rb_working_yes" Checked="false" GroupName="rb_working_yes" runat="server" />Yes
                                        </label>
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rb_working_no" GroupName="rb_working_yes" runat="server" />No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-6" id="div_work_place" runat="server" visible="true">
                                <div class="form-group">
                                    <label>a) What is the name of your workplace?</label>
                                    <asp:TextBox runat="server" ID="txt_workplace" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6" id="div_work_resume" runat="server" visible="true">
                                <div class="form-group">
                                    <label>b) Please provide your updated CV to support your answer</label>
                                    <asp:FileUpload ID="flu_updated_cv" runat="server" CssClass="form-control" />
                                </div>
                            </div>

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>10. Have you ever worked in the industry in which you are seeking training in? This will help us determine if RPL or is a suitable option for you.</label>
                                            <div class="form-control">
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_worked_industry_yes" Checked="false" GroupName="rb_worked_industry_yes" AutoPostBack="true" OnCheckedChanged="rb_worked_industry_yes_CheckedChanged" runat="server" />Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_worked_industry_no" GroupName="rb_worked_industry_yes" AutoPostBack="true" OnCheckedChanged="rb_worked_industry_yes_CheckedChanged" runat="server" />No
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div id="div_worked_industry" runat="server" visible="false">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Please outline what role you had, when you worked in the industry and how long for.</label>
                                                <asp:TextBox runat="server" ID="txt_outline_role" CssClass="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Will the student be applying for RPL?</label>
                                                <label>
                                                    <br>
                                                    &nbsp</label>
                                                <div class="form-control">
                                                    <label class="radio-inline">
                                                        <asp:RadioButton ID="rb_applied_rpl_yes" Checked="false" GroupName="rb_applied_rpl_yes" runat="server" />Yes
                                                    </label>
                                                    <label class="radio-inline">
                                                        <asp:RadioButton ID="rb_applied_rpl_no" GroupName="rb_applied_rpl_yes" runat="server" />No
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>11. What other information do you think would be important for us to know to ensure we can meet your needs or that may support your application for enrolment into this course?</label>
                                    <asp:TextBox runat="server" ID="txt_other_information" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>12. Have you completed any course that is likely to give you Credit for this course – i.e. would you like to make an application for Credit Transfer?</label>
                                    <div class="form-control">
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rb_complete_any_course_yes" Checked="false" GroupName="rb_complete_any_course_yes" runat="server" />Yes
                                        </label>
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rb_complete_any_course_no" GroupName="rb_complete_any_course_yes" runat="server" />No
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div id="div_completed_course" runat="server" visible="true">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>If yes, the applicant must supply certified copies of their transcripts.</label>
                                        <asp:FileUpload runat="server" ID="flu_applicant_transcripts" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>SECTION C – Information on online or digital component</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>13. Do you have regular access to a computer and internet?</label>
                                            <div class="form-control">
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_regular_access_yes" Checked="false" GroupName="rb_regular_access_yes" AutoPostBack="true" OnCheckedChanged="rb_regular_access_no_CheckedChanged" runat="server" />Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_regular_access_no" GroupName="rb_regular_access_yes" AutoPostBack="true" OnCheckedChanged="rb_regular_access_no_CheckedChanged" runat="server" />No
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="div_regular_access" runat="server" visible="false">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Discuss solutions and strategies for accessing online content when needed and document here.</label>
                                                <asp:TextBox runat="server" ID="txt_discuss_solution" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="col-md-12">
                                <label>14. Approximately, how often do you use a computer and/or the internet?</label>
                                <div class="form-group">
                                    <asp:RadioButtonList runat="server" ID="rb_approx_computer_use" CssClass="form-control radio_button_inline">
                                        <asp:ListItem Text=" 3 hours or more a day" />
                                        <asp:ListItem Text=" Less than an hour each day" />
                                        <asp:ListItem Text=" Once a week" />
                                        <asp:ListItem Text=" A couple of times a month" />
                                        <asp:ListItem Text=" Never/ rarely" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>

                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>15. How good is your digital literacy? Rate between 1 to 5 (1 being very poor and 5 being excellent) Do you require any support with digital literacy?</label>
                                            <div class="form-control">
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_digital_literacy_yes" Checked="false" GroupName="rb_digital_literacy_yes" AutoPostBack="true" OnCheckedChanged="rb_digital_literacy_no_CheckedChanged" runat="server" />Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_digital_literacy_no" GroupName="rb_digital_literacy_yes" AutoPostBack="true" OnCheckedChanged="rb_digital_literacy_no_CheckedChanged" runat="server" />No
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="div_digital_literacy" runat="server" visible="false">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Discuss solutions and strategies for accessing online content when needed and document here.</label>
                                                <asp:TextBox runat="server" ID="txt_solution_strtegy" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Score</label>
                                            <asp:TextBox runat="server" ID="txt_digital_test_score" CssClass="form-control" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="col-md-12">
                                <h4 class="wz-title mb-20 text-uppercase">Please tick in the relevant column based on your ability</h4>
                            </div>

                            <div class="col-md-12">
                                <label>I can turn on and login to a personal computer</label>
                                <asp:RadioButtonList runat="server" ID="rb_login_pc" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-12">
                                <label>I can send an email</label>
                                <asp:RadioButtonList runat="server" ID="rb_send_email" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-12">
                                <label>I can navigate to a website to locate required information</label>
                                <asp:RadioButtonList runat="server" ID="rb_navigate_website" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-12">
                                <label>I can create folders and subfolders and rename them as required</label>
                                <asp:RadioButtonList runat="server" ID="rb_create_folder" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>

                            <div class="col-md-12">
                                <label>I can find information using an internet search engine</label>
                                <asp:RadioButtonList runat="server" ID="rb_find_information" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-12">
                                <label>I can attach documents to an email</label>
                                <asp:RadioButtonList runat="server" ID="rb_attach_document" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>

                            <div class="col-md-12">
                                <label>I can save emails in different folders</label>
                                <asp:RadioButtonList runat="server" ID="rb_save_email" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>

                            <div class="col-md-12">
                                <label>I can login to an online system and follow prompts</label>
                                <asp:RadioButtonList runat="server" ID="rb_login_online_system" CssClass="form-control radio_button_inline">
                                    <asp:ListItem Text="I can’t do this" />
                                    <asp:ListItem Text="I can do this with support" />
                                    <asp:ListItem Text="I can do this on my own" />
                                    <asp:ListItem Text="I can teach others" />
                                </asp:RadioButtonList>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label d-block mb-2">16. How often do you use social media?</label>
                                <div class=" p-3 radio-box">
                                    <asp:RadioButtonList runat="server" ID="rb_use_social_media"
                                        CssClass="form-control radio_button_inline">
                                        <asp:ListItem Text="Every day" />
                                        <asp:ListItem Text="A couple of times a week" />
                                        <asp:ListItem Text="Once a week" />
                                        <asp:ListItem Text="A couple of times a month" />
                                        <asp:ListItem Text="Never/ rarely" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-container">
                <div>
                    <h4>SECTION D – OUTCOME OF ENTRY INTERVIEW</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>17. Is the candidate suitable for the intended course?</label>
                                            <div class="form-control">
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_candidate_suitale_yes" Checked="false" GroupName="rb_candidate_suitale_yes" AutoPostBack="true" OnCheckedChanged="rb_additonal_info_CheckedChanged" runat="server" />Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_candidate_suitale_no" GroupName="rb_candidate_suitale_yes" AutoPostBack="true" OnCheckedChanged="rb_additonal_info_CheckedChanged" runat="server" />No
                                                </label>
                                                <label class="radio-inline">
                                                    <asp:RadioButton ID="rb_additonal_info" GroupName="rb_candidate_suitale_yes" AutoPostBack="true" OnCheckedChanged="rb_additonal_info_CheckedChanged" runat="server" />Additional information required
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="div_candidate_suitable" runat="server" visible="false">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Please give details</label>
                                                <asp:TextBox runat="server" ID="txt_candidate_details" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="col-md-12">
                                <label for="username">18. What additional support will be provided to the student in order to ensure they are able to complete their program successfully? (if relevant)</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txt_additional_support" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>19. For courses that contain an online or digital component, do the responses provided to Questions 13 – 16, demonstrate that the student has the skills and resources to appropriately participate in the course?</label>
                                    <div class="form-control">
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rb_appropriate_participate_yes" Checked="false" GroupName="rb_appropriate_participate_yes" runat="server" />Yes
                                        </label>
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="rb_appropriate_participate_no" GroupName="rb_appropriate_participate_yes" runat="server" />No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="username">Other Comments:</label>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txt_other_comments" CssClass="form-control" TextMode="MultiLine" Rows="3" Columns="3" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Staff Member Declaration</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">

                                <label style="font-weight: bold;">
                                    For students who are suitable for enrolment, I confirm that I have explained and the student has received:
                                </label>
                            </div>

                            <div class="col-md-12">
                                <label class="lbl_style">
                                    <asp:CheckBox Text="" ID="ch_check_course_outline" runat="server" />&nbsp; Course outline including detailed information about the course and arrangements for delivery
                                </label>
                                <br />
                                <label class="lbl_style">
                                    <asp:CheckBox Text="" ID="ch_check_process_for_rpl" runat="server" />&nbsp; Process for applying for RPL and Credit Transfers (where applicable)
                                </label>
                                <br />
                                <label class="lbl_style">
                                    <asp:CheckBox Text="" ID="ch_check_hand_book" runat="server" />&nbsp; Student Handbook
                                </label>
                                <br />
                                <br />
                                <label>Eligible students will need to sign the Student Agreement and pay the enrolment deposit to acceept their offer at which point a Confirmation of Enrolment letter will be sent with commencement information.</label>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Staff member Name:</label>
                                    <asp:TextBox runat="server" ID="txt_staff_member" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Position:</label>
                                    <asp:TextBox runat="server" ID="txt_position" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="clearfix">
                            </div>
                            <div class="col-md-6">

                                <div>
                                    <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px; cursor: pointer;" src="assets/img/eraser.png" />
                                </div>

                                <asp:HiddenField ID="hdnSignature" runat="server" />

                                <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>

                            </div>
                            <div class="col-md-6">
                                <label class="lbl_title">Date</label>
                                <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-4" style="margin-top: 15px;">
                                <label class="lbl_title">Enter Captcha Code</label>
                                <div class="captcha-box">
                                    <img id="captchaImage" width="150" height="50" alt="Security Captcha" />
                                    <i class="fas fa-sync-alt refresh-captcha" onclick="generateCaptcha()"></i>
                                </div>
                                <asp:TextBox ID="txt_captcha_input" runat="server" CssClass="form-control" Style="margin-top: 10px;" placeholder="Captcha Code" onkeypress="return only_number(event)"></asp:TextBox>
                            </div>
                          
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="row">
                              <div class="col-md-12">
                                <asp:Button ID="btn_save" ValidationGroup="save" OnClientClick="return validateAndSaveSignature(this);" OnClick="btn_save_Click" CssClass="btn btn-success" runat="server" Text="Submit" />
                            </div>
                        </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
    <script src="assets/country_code/js/intlTelInput.js"></script>
    <script>
        // --- 1. Captcha Generation Logic ---
        function generateCaptcha() {
            $.ajax({
                type: "POST",
                url: "course_entry_form.aspx/GetCaptchaImage",
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

        // ==========================
        // 2. Phone Input Setup
        // ==========================
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


        function only_number(key) {
            var charCode = (key.which) ? key.which : key.keyCode
            return !(charCode > 31 && (charCode < 48 || charCode > 57));
        }

        // ==========================
        // 3. Signature & Doc Ready
        // ==========================
        const canvas = document.getElementById('signatureCanvas');
        const signaturePad = new SignaturePad(canvas);

        function resizeCanvas() {
            const ratio = Math.max(window.devicePixelRatio || 1, 1);
            canvas.width = canvas.offsetWidth * ratio;
            canvas.height = canvas.offsetHeight * ratio;
            canvas.getContext("2d").scale(ratio, ratio);
            signaturePad.clear();
        }

        window.addEventListener("resize", resizeCanvas);

        $(document).ready(function () {
            generateCaptcha();
            resizeCanvas();
            $('#clearBtn').click(() => signaturePad.clear());
        });

        // ==========================
        // 4. Unified Form Validation
        // ==========================
        function validateAndSaveSignature(btn) {
            let errorMessages = [];
            let isValid = true;

            function checkEmpty(id, fieldName) {
                if ($("#" + id).val().trim() == "") {
                    $("#" + id).css("border-color", "red");
                    errorMessages.push(fieldName + " is required.");
                    isValid = false;
                } else { $("#" + id).css("border-color", ""); }
            }

            // Standard Fields
            checkEmpty("<%= txt_name.ClientID %>", "Name");
            checkEmpty("<%= txt_dob.ClientID %>", "Date of Birth");
            checkEmpty("<%= txt_std_id.ClientID %>", "Student Id");

            // Course Checkbox validation
            if ($("#<%= ch_check_course.ClientID %> input[type='checkbox']:checked").length === 0) {
                errorMessages.push("Please select at least one course.");
                $("#courseError").text("Please select at least one course.").show();
                isValid = false;
            } else {
                $("#courseError").hide();
            }

            // Phone Validation
            const phone = document.getElementById("phone");
            if ($("#phone").val().trim() == "") {
                $(phone).css("border-color", "red");
                errorMessages.push("Contact Number is required.");
                isValid = false;
            } else if (!iti.isValidNumber()) {
                $(phone).css("border-color", "red");
                errorMessages.push("Please enter a valid international contact number.");
                isValid = false;
            } else { $(phone).css("border-color", ""); }

            // Email Validation
            const email = document.getElementById("<%= txt_email.ClientID %>");
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (email.value.trim() == "") {
                $(email).css("border-color", "red");
                errorMessages.push("Email is required.");
                isValid = false;
            } else if (!emailPattern.test(email.value.trim())) {
                $(email).css("border-color", "red");
                errorMessages.push("Please enter a valid email address.");
                isValid = false;
            } else { $(email).css("border-color", ""); }

            // Signature Validation
            if (signaturePad.isEmpty()) {
                errorMessages.push("Signature is required.");
                isValid = false;
            }

            // Captcha Validation (Only checks if it's empty, true math is checked on server)
            var userCaptchaInput = $("#<%= txt_captcha_input.ClientID %>").val().trim();
            if (userCaptchaInput === "") {
                isValid = false;
                errorMessages.push("Please enter the security captcha code.");
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "red");
            } else {
                $("#<%= txt_captcha_input.ClientID %>").css("border-color", "");
            }

            if (!isValid) {
                alert("Please fix the following errors:\n" + errorMessages.join("\n"));
                return false; // Blocks postback
            }

            // Save signature to hidden field
            document.getElementById("<%= hdnSignature.ClientID %>").value = signaturePad.toDataURL("image/png");

            // UI state change for Submit button
            if (btn) {
                btn.value = "Submitting...";
                btn.style.opacity = "0.7";
            }
            return true; // Allows postback to hit C# code
        }
    </script>
</asp:Content>
