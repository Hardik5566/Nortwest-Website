<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GTE_Form.aspx.cs" Inherits="GTE_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    GTE Form
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
                    <h1>GTE Form</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">GTE Form</li>
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
                        <h2>GTE Form</h2>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div>
                    <h4>Student details</h4>
                </div>

                <div class="row">

                    <div class="col-md-4">
                        <label class="lbl_title">Family Name</label>
                        <asp:TextBox ID="txt_family_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Given Name</label>
                        <asp:TextBox ID="txt_given_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Student ID</label>
                        <asp:TextBox ID="txt_stu_id" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label class="lbl_title">Date of Birth</label>
                        <asp:TextBox ID="txt_dob" TextMode="date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-4 search_dropdown">
                        <label class="lbl_title">Country of Birth</label>
                        <asp:DropDownList ID="ddl_country" data-live-search="true" DataTextField="name" DataValueField="name" CssClass="form-control qualification select2" runat="server" aria-required="true" aria-invalid="false">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Citizenship</label>
                        <asp:TextBox ID="txt_citizenship" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label class="lbl_title">Agent Name</label>
                        <asp:TextBox ID="txt_agent_name" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="lbl_title">Agent Code</label>
                        <asp:TextBox ID="txt_agent_code" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label class="lbl_title">Agent Email</label>
                        <asp:TextBox ID="txt_agent_email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-12">
                        <label class="lbl_title">Course(s) selected:</label>
                        <asp:TextBox ID="txt_course" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4>Current Address</h4>
                </div>

                <div class="row">

                    <div class="col-md-12">
                        <label class="lbl_title">1. Please provide current address.</label>
                        <asp:TextBox ID="txt_current_address" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">2. Please tell us about your marital status.</label><br />
                        <asp:RadioButtonList runat="server" ID="rad_marital_status" CssClass="radio-inline">
                            <asp:ListItem Text="Single" />
                            <asp:ListItem Text="Married" />
                            <asp:ListItem Text="Divorced" />
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>

            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">

                        <label class="lbl_title">
                            3. Are you bringing family to Australia? If YES, please provide details: (Spouse, children, etc.)
                        </label>

                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_3" ID="rb_bringing_family_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_3" ID="rb_bringing_family_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details about family" ID="txt_bringing_family_details" CssClass="form-control" />
                    </div>

                </div>
            </div>

            <div class="form-container">
                <div class="row">
                    <%-- 2 --%>
                    <div class="col-md-12">
                        <label class="lbl_title">
                            4. Do you have any medical or health condition that may prevent a visa from being issued?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_4" ID="rb_health_condition_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_4" ID="rb_health_condition_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" placeholder="Details" TextMode="MultiLine" Rows="2" ID="txt_health_condition" CssClass="form-control" />
                    </div>


                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            5. Have you or your spouse (if you have) ever been refused a visa to Australia?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_5" ID="rb_refused_visa_aus_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_5" ID="rb_refused_visa_aus_n" runat="server" Text="No" />
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">
                            Please attach documentation for evidence. (if any)</label>
                        <asp:FileUpload ID="upd_refused_visa_aus" CssClass="form-control" runat="server" />

                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">
                            Details
                        </label>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="1" placeholder="Details" ID="txt_refused_visa_aus_details" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            6. Have you or your spouse (if you have) ever been refused a student visa to other countries?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_6" ID="rb_student_visa_other_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_6" ID="rb_student_visa_other_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_student_visa_other_details" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            7. Have you or your spouse (if you have) ever visited Australia and breached any visa conditions?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_7" ID="rb_visited_aus_breached_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_7" ID="rb_visited_aus_breached_n" runat="server" Text="No" />
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="lbl_title">
                            Please attach documentation for evidence. (if any)</label>
                        <asp:FileUpload ID="upd_evidence_visited_aus_breached" CssClass="form-control" runat="server" />

                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">
                            Details
                        </label>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="1" placeholder="Details" ID="txt_visited_aus_breached_detail" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            8. Have you previously applied or currently are applying for admission at other Australian education providers?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_8" ID="rb_apply_admision_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_8" ID="rb_apply_admision_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_apply_admision_detail" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            9. Have you previously studied or lived in Australia, United States of America, Canada, United Kingdom or New Zealand?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_9" ID="rb_previous_studied_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_9" ID="rb_previous_studied_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_previous_studied_detail" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            10. Do you have any relatives in Australia? If so what is the relationship?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_10" ID="rb_relatives_aus_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_10" ID="rb_relatives_aus_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_relatives_aus_detai" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            11. Are you planning to stay with the relative? If No, then what is your accommodation plan while you study in Australia?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_11" ID="rb_accommodation_plan_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton ID="rb_accommodation_plan__n" GroupName="rad_11" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_accommodation_plan_detail" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            12. Do you have any criminal record / police record? If so, please specify
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_12" ID="rb_criminal_record_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_12" ID="rb_criminal_record_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_criminal_record_detail" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            13. Please tell us your academic history (Including Year 12)
                       
                        </label>
                        <div id="courseWrapper">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="lbl_title">Course</label>
                                    <input type="text" class="form-control course-input" />
                                </div>
                                <div class="col-md-4">
                                    <label class="lbl_title">Institution</label>
                                    <input type="text" class="form-control institution-input" />
                                </div>
                                <div class="col-md-2">
                                    <label class="lbl_title">Year</label>
                                    <input type="text" class="form-control year-input" />
                                </div>
                                <div class="col-md-2">
                                    <div>&nbsp;</div>
                                    <button type="button" class="ml-2 " style="border: none; background: none">
                                        <img src="assets/img/plus.png" class="addRowBtn" alt="Alternate Text" width="25px" /></button>
                                    <%--                                    <button type="button" class="ml-2 removeRowBtn" style="border-radius: 50%; max-width: 100%; width: 29px;">-</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            14. Are there any gaps in the education and work history since leaving school?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_14" ID="rb_gaps_education_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_14" ID="rb_gaps_education_n" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details" ID="txt_gaps_education_detail" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            15. Have you undertaken an IELTS or similar English test?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">

                                <asp:RadioButton GroupName="rad_15" ID="rb_undertaken_IELTS_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton GroupName="rad_15" ID="rb_undertaken_IELTS_n" runat="server" Text="No" />
                            </label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">
                            (Please attach the score sheet along with your application)</label>
                        <asp:FileUpload ID="upd_undertaken_IELTS" CssClass="form-control" runat="server" />

                    </div>

                    <div class="col-md-6">
                        <label class="lbl_title">Details</label>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="1" placeholder="Details" ID="txt_undertaken_IELTS_detail" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <%--  --%>
                    <div class="col-md-12">
                        <label class="lbl_title">
                            16. Have you been employed? Give a brief information of your job description.
                        </label>

                        <div id="JobWrapper">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="lbl_title">Position</label>
                                    <input type="text" class="form-control position-input" />
                                </div>
                                <div class="col-md-4">
                                    <label class="lbl_title">Company</label>
                                    <input type="text" class="form-control company-input" />
                                </div>
                                <div class="col-md-2">
                                    <label class="lbl_title">Year</label>
                                    <input type="text" class="form-control job_year-input" />
                                </div>
                                <div class="col-md-2">
                                    <div>&nbsp;</div>
                                    <button type="button" class="ml-2 " style="border: none; background: none">
                                        <img src="assets/img/plus.png" width="25px" class="addRowBtn1" alt="Alternate Text" /></button>
                                    <%--  <button type="button" class="ml-2 removeRowBtn1" style="border-radius: 50%; max-width: 100%; width: 29px;">-</button>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">17. Please specify your plans/intention after completing your studies in Australia.</label>
                        <asp:TextBox ID="txt_plans_intention_study_aus" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            18. What type of job you are planning to do after completion of the course?
                        </label>
                        <asp:TextBox ID="txt_type_of_job" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            19. Please specify your short term (6-18 months) and long term (5 years) goals (at least 2 each).
                        </label>
                        <asp:TextBox ID="txt_sort_long_term" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            20. What do you expect to learn from the courses?
                        </label>
                        <asp:TextBox ID="txt_expect_learn" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            21. Why have you decided to study in Australia instead of taking the course in your home country?
                        </label>
                        <asp:TextBox ID="txt_decide_study_aus" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            22. Have you considered other course options or schools apart from NORTWEST Institute?
                        </label>
                        <asp:TextBox ID="txt_other_course" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            23. Why have you chosen NORTWEST Institute instead of other providers?
                        </label>
                        <asp:TextBox ID="txt_nortwest_institute" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            24. Do you know the living expenses in Australia? How much? How will you pay for your tuition, living expenses and travel arrangements to Australia?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_24" ID="rb_livine_expence_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton ID="rb_livine_expence_n" GroupName="rad_24" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" placeholder="Details about family" ID="txt_livine_expence_detail" CssClass="form-control" />
                    </div>


                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            25. In your past learning experiences, have you encountered any barriers or difficulties to learning? If yes, Please list the ones you are aware of.
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_25" ID="rb_lerning_exp_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton ID="rb_lerning_exp_n" GroupName="rad_25" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" placeholder="Details" ID="txt_lerning_exp_detail" TextMode="MultiLine" Rows="2" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            26. How is your chosen course relevant to your future career and educational plans?
                        </label>
                        <asp:TextBox ID="txt_course_relavant" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            27. Are you changing your area of study from previous studies or work experience? If yes, please explain why you have chosen to change your career path.
                        </label>
                        <asp:TextBox ID="txt_change_area_study" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            28. Are you aware of the work restriction while studying in Australia?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_28" ID="rb_work_desc_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton ID="rb_work_desc_n" GroupName="rad_28" runat="server" Text="No" />
                            </label>
                        </div>
                        <asp:TextBox runat="server" placeholder=" Please explain" ID="txt_work_explain_explain" TextMode="MultiLine" Rows="2" CssClass="form-control" />
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            29. Are you planning to work while studying? What type of job?
                        </label>
                        <asp:TextBox ID="txt_planing_while_study" TextMode="MultiLine" Rows="4" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-container">
                <div class="row">
                    <div class="col-md-12">
                        <label class="lbl_title">
                            30. Have you read the terms and conditions of enrolment including refund and transfer between education provider policies?
                        </label>
                        <div>

                            <label class="radio-inline" style="margin-right: 25px;">
                                <asp:RadioButton GroupName="rad_30" ID="rb_term_condition_y" runat="server" Text="Yes" />
                            </label>
                            <label class="radio-inline">
                                <asp:RadioButton ID="rb_term_condition_n" GroupName="rad_30" runat="server" Text="No" />
                            </label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="form-container">
                <div>
                    <h4 class="">Applicant’s Declaration</h4>
                    <span class="lbl_explanation_error txt_error" style="display: none;">Please check all the checkboxes before submitting the form.</span>
                </div>

                <div class="row ch_explanation">

                    <div class="col-md-12">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="I declare that all information I have provided in this form is accurate and complete, and that NORTWEST Institute may refuse my application or cancel my enrolment if any information is found to be incorrect, false, or misleading." />
                        </label>
                    </div>
                    <div class="col-md-12">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="I understand that, by completing this form, I am giving Nortwest College written consent to verify the information I have supplied in this form and to request further supporting documentation." />
                        </label>
                    </div>
                    <div class="col-md-12">
                        <label class="checkbox-inline lbl_title">
                            <asp:CheckBox ID="CheckBox3" runat="server" Text=" I declare that I have a genuine intention to undertake the course(s) for which I have applied" />
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

    <asp:HiddenField ID="hdnCourse" runat="server" />
    <asp:HiddenField ID="hdnInstitution" runat="server" />
    <asp:HiddenField ID="hdnYear" runat="server" />

    <asp:HiddenField ID="hdnposition" runat="server" />
    <asp:HiddenField ID="hdncompany" runat="server" />
    <asp:HiddenField ID="hdnjob_year" runat="server" />
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

            // Validate Full Name
            if ($("#<%= txt_family_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_family_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_family_name.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_given_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_given_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_given_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_stu_id.ClientID %>").val().trim() == "") {
                $("#<%= txt_stu_id.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_stu_id.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_dob.ClientID %>").val().trim() == "") {
                $("#<%= txt_dob.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_dob.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_citizenship.ClientID %>").val().trim() == "") {
                $("#<%= txt_citizenship.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_citizenship.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_agent_name.ClientID %>").val().trim() == "") {
                $("#<%= txt_agent_name.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_agent_name.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_agent_code.ClientID %>").val().trim() == "") {
                $("#<%= txt_agent_code.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_agent_code.ClientID %>").css("border-color", "");
            }
            
            if ($("#<%= txt_course.ClientID %>").val().trim() == "") {
                $("#<%= txt_course.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_course.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_current_address.ClientID %>").val().trim() == "") {
                $("#<%= txt_current_address.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_current_address.ClientID %>").css("border-color", "");
            }

            if ($("#<%= txt_plans_intention_study_aus.ClientID %>").val().trim() == "") {
                $("#<%= txt_plans_intention_study_aus.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_plans_intention_study_aus.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_type_of_job.ClientID %>").val().trim() == "") {
                $("#<%= txt_type_of_job.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_type_of_job.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_sort_long_term.ClientID %>").val().trim() == "") {
                $("#<%= txt_sort_long_term.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_sort_long_term.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_expect_learn.ClientID %>").val().trim() == "") {
                $("#<%= txt_expect_learn.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_expect_learn.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_decide_study_aus.ClientID %>").val().trim() == "") {
                $("#<%= txt_decide_study_aus.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_decide_study_aus.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_other_course.ClientID %>").val().trim() == "") {
                $("#<%= txt_other_course.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_other_course.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_nortwest_institute.ClientID %>").val().trim() == "") {
                $("#<%= txt_nortwest_institute.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_nortwest_institute.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_course_relavant.ClientID %>").val().trim() == "") {
                $("#<%= txt_course_relavant.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_course_relavant.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_change_area_study.ClientID %>").val().trim() == "") {
                $("#<%= txt_change_area_study.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_change_area_study.ClientID %>").css("border-color", "");
            }
            if ($("#<%= txt_planing_while_study.ClientID %>").val().trim() == "") {
                $("#<%= txt_planing_while_study.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_planing_while_study.ClientID %>").css("border-color", "");
            }
            // Validate Campus
            if ($("#<%= ddl_country.ClientID %>").prop("selectedIndex") == 0) {
                $("#<%= ddl_country.ClientID %>").next(".nice-select").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= ddl_country.ClientID %>").next(".nice-select").css("border-color", "");
            }

            if ($("#<%= txt_sign_date.ClientID %>").val().trim() == "") {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_sign_date.ClientID %>").css("border-color", "");
            }

            // Validate Email
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test($("#<%= txt_agent_email.ClientID %>").val())) {
                $("#<%= txt_agent_email.ClientID %>").css("border-color", "red");
                isValid = false;
            } else {
                $("#<%= txt_agent_email.ClientID %>").css("border-color", "");
            }

            // Validate Student ID Number
       
<%--            if ($("#<%= txt_student_id.ClientID %>").val().trim() == "") {
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
            }--%>

            

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
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let courseWrapper = document.getElementById("courseWrapper");

            // Add a new row when the "+" button is clicked
            courseWrapper.addEventListener("click", function (event) {
                // Check if the clicked button is the + button
                if (event.target && event.target.classList.contains("addRowBtn")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row");

                    // Create the HTML for the new row
                    newRow.innerHTML = `
                        <div class="col-md-4">
                            <label class="lbl_title">Course</label>
                            <input type="text" class="form-control course-input" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Institution</label>
                            <input type="text" class="form-control institution-input" />
                        </div>
                        <div class="col-md-2">
                            <label class="lbl_title">Year</label>
                            <input type="text" class="form-control year-input" />
                        </div>
                        <div class="col-md-2">
                            <div>&nbsp;</div>
                    <button type="button" class="ml-2 " style="border:none;background:none">
                                        <img src="assets/img/plus.png" class="addRowBtn" alt="Alternate Text" width="25px" /></button>
                                            
                        <button type="button" class="ml-2 " style="border:none;background:none">
                                        <img src="assets/img/minus-button.png" class="removeRowBtn" alt="Alternate Text" width="22px" /></button
                                            </div>
                    `;

                    // Append the new row to the courseWrapper
                    courseWrapper.appendChild(newRow);
                }

                // Check if the clicked button is the - button
                if (event.target && event.target.classList.contains("removeRowBtn")) {
                    let row = event.target.closest(".row");
                    if (courseWrapper.children.length > 1) { // Ensure there's more than one row
                        row.remove(); // Remove the current row
                    }
                }
            });

            // Add event listener to the submit button
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                // Get all the input fields for courses, institutions, and years
                let courses = document.querySelectorAll(".course-input");
                let institutions = document.querySelectorAll(".institution-input");
                let years = document.querySelectorAll(".year-input");

                let courseList = [];
                let institutionList = [];
                let yearList = [];

                // Loop through all inputs and push the values into the respective lists
                for (let i = 0; i < courses.length; i++) {
                    let course = courses[i].value.trim();
                    let institution = institutions[i].value.trim();
                    let year = years[i].value.trim();

                    if (course && institution && year) { // Only include if all fields are filled
                        courseList.push(course);
                        institutionList.push(institution);
                        yearList.push(year);
                    }
                }

                // Set the hidden field values with | delimiter
                document.getElementById("<%= hdnCourse.ClientID %>").value = courseList.join("|");
                document.getElementById("<%= hdnInstitution.ClientID %>").value = institutionList.join("|");
                document.getElementById("<%= hdnYear.ClientID %>").value = yearList.join("|");
            });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let JobWrapper = document.getElementById("JobWrapper");

            // Add a new row when the "+" button is clicked
            JobWrapper.addEventListener("click", function (event) {
                // Check if the clicked button is the + button
                if (event.target && event.target.classList.contains("addRowBtn1")) {
                    let newRow = document.createElement("div");
                    newRow.classList.add("row");

                    // Create the HTML for the new row
                    newRow.innerHTML = `
                        <div class="col-md-4">
                            <label class="lbl_title">Course</label>
                            <input type="text" class="form-control position-input" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Institution</label>
                            <input type="text" class="form-control company-input" />
                        </div>
                        <div class="col-md-2">
                            <label class="lbl_title">Year</label>
                            <input type="text" class="form-control job_year-input" />
                        </div>
                        <div class="col-md-2">
                            <div>&nbsp;</div>
                                    <button type="button" class="ml-2 " style="border:none;background:none">
                                        <img src="assets/img/plus.png" width="25px" class="addRowBtn1" alt="Alternate Text" /></button>    
                                            

                                              <button type="button" class="ml-2 " style="border:none;background:none">
                                        <img src="assets/img/minus-button.png" width="22px" class="removeRowBtn1" alt="Alternate Text" /></button>    

                        </div>
                    `;

                    // Append the new row to the courseWrapper
                    JobWrapper.appendChild(newRow);
                }

                // Check if the clicked button is the - button
                if (event.target && event.target.classList.contains("removeRowBtn1")) {
                    let row = event.target.closest(".row");
                    if (JobWrapper.children.length > 1) { // Ensure there's more than one row
                        row.remove(); // Remove the current row
                    }
                }
            });

            // Add event listener to the submit button
            document.getElementById("<%= btn_submit.ClientID %>").addEventListener("click", function () {
                // Get all the input fields for courses, institutions, and years
                let positions = document.querySelectorAll(".position-input");
                let companies = document.querySelectorAll(".company-input");
                let jobyears = document.querySelectorAll(".job_year-input");

                let positionList = [];
                let companyList = [];
                let job_yearList = [];

                // Loop through all inputs and push the values into the respective lists
                for (let i = 0; i < positions.length; i++) {
                    let position = positions[i].value.trim();
                    let companie = companies[i].value.trim();
                    let jobyear = jobyears[i].value.trim();

                    if (position && companie && jobyear) { // Only include if all fields are filled
                        positionList.push(position);
                        companyList.push(companie);
                        job_yearList.push(jobyear);
                    }
                }

                // Set the hidden field values with | delimiter
                document.getElementById("<%= hdnposition.ClientID %>").value = positionList.join("|");
                document.getElementById("<%= hdncompany.ClientID %>").value = companyList.join("|");
                document.getElementById("<%= hdnjob_year.ClientID %>").value = job_yearList.join("|");
            });
        });
    </script>
</asp:Content>

