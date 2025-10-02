<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    LLN Test
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
    </style>
    <script src="https://cdn.WebRTC-Experiment.com/MediaStreamRecorder.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>LLN Test</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">LLN Test</li>
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
                        <h2>LLN Test</h2>
                    </div>
                </div>
            </div>

            <!-- Step 1 -->
            <div class="step step-1">


                <div class="form-container">
                     <div class="row">
                        <div class="col-md-12">


                            <div style="border-bottom: 1px solid #ccc;">
                                <h4>Student Details</h4>

                            </div>

                        </div>

                    </div>
                    <%-- <h4>FOR THE RECRUITMENT SERVICES OF INTERNATIONAL STUDENTS For NORTWEST COLLEGE</h4>--%>
                    <span>All students are required to complete this language, literacy and numeracy assessment prior to the commencement of a course. The purpose of this test is to determine whether you may require additional support in order to complete the course successfully. This way, we can tell you prior to your commencement if we are able to provide the level of support you require or if support from external agencies may be required. You may use a calculator and a dictionary, but these are not required. You may use additional paper and you can draft your responses if you like. Completion of the test will be supervised. Some questions are harder than others. Please answer all questions to the best of your ability. If you can’t answer a question, don’t worry – just move to the next one.</span>

                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-6">
                            <label class="lbl_title">Student Full Name</label>
                            <asp:TextBox runat="server" ID="txt_name" CssClass="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="lbl_title">YOUR STUDENT ID NUMBER</label>
                            <asp:TextBox runat="server" ID="txt_std_id" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Student Contact Number</label>
                            <div class="input-group contact_no">
                                <input id="phone" onkeypress="return only_number(event)" style="width: 100%; padding: 6px 47px !important" name="phone" class="form-control" type="tel" />
                                <p id="output"></p>
                                <asp:HiddenField ID="hd_contact_no_code" Value="" runat="server" />
                                <asp:HiddenField ID="hd_contact_no" Value="" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Date Of Birth</label>
                            <asp:TextBox runat="server" ID="txt_dob" TextMode="Date" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Email</label>
                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" />
                        </div>
                        <div class="col-md-12"></div>
                        <div class="col-md-6 " style="margin-bottom: 10px">
                            <label class="lbl_title">Place of Test</label>
                            <asp:DropDownList ID="ddl_test_place" CssClass="form-control " runat="server">
                                <asp:ListItem Text="Place of Test" Value=""></asp:ListItem>
                                <asp:ListItem Text="Sydney" Value="Sydney"></asp:ListItem>
                                <asp:ListItem Text="Melbourne" Value="Melbourne"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="lbl_title">Qualification Enrolled</label>
                            <asp:DropDownList ID="ddl_course" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Qualification Enrolled" Value=""></asp:ListItem>
                                <asp:ListItem Text="ELICOS - General English" Value="ELICOS - General English"></asp:ListItem>
                                <asp:ListItem Text="ELICOS - English for Academic Purposes" Value="ELICOS - English for Academic Purposes"></asp:ListItem>
                                <asp:ListItem Text="Business - Certificate III in Business" Value="Business - Certificate III in Business"></asp:ListItem>
                                <asp:ListItem Text="Business - Certificate IV in Business" Value="Business - Certificate IV in Business"></asp:ListItem>
                                <asp:ListItem Text="Business - Diploma of Business" Value="Business - Diploma of Business"></asp:ListItem>
                                <asp:ListItem Text="Business - Advanced Diploma of Business" Value="Business - Advanced Diploma of Business"></asp:ListItem>
                                <asp:ListItem Text="Leadership &amp; Management - Diploma of Leadership and Management"
                                    Value="Leadership &amp; Management - Diploma of Leadership and Management"></asp:ListItem>
                                <asp:ListItem Text="Leadership &amp; Management - Advanced Diploma of Leadership and Management"
                                    Value="Leadership &amp; Management - Advanced Diploma of Leadership and Management"></asp:ListItem>
                                <asp:ListItem Text="Project and Program Management - Diploma of Project Management"
                                    Value="Project and Program Management - Diploma of Project Management"></asp:ListItem>
                                <asp:ListItem Text="Project and Program Management - Advanced Diploma of Program Management"
                                    Value="Project and Program Management - Advanced Diploma of Program Management"></asp:ListItem>
                                <asp:ListItem Text="ICT Information Technology &amp; Communication - Certificate III in Information Technology"
                                    Value="ICT Information Technology &amp; Communication - Certificate III in Information Technology"></asp:ListItem>
                                <asp:ListItem Text="ICT Information Technology &amp; Communication - Certificate IV in Information Technology"
                                    Value="ICT Information Technology &amp; Communication - Certificate IV in Information Technology"></asp:ListItem>
                                <asp:ListItem Text="ICT Information Technology &amp; Communication - Diploma of Information Technology"
                                    Value="ICT Information Technology &amp; Communication - Diploma of Information Technology"></asp:ListItem>
                                <asp:ListItem Text="Telecommunications - Advanced Diploma of Information Technology (Cyber Security)"
                                    Value="Telecommunications - Advanced Diploma of Information Technology (Cyber Security)"></asp:ListItem>
                                <asp:ListItem Text="Telecommunications - Advanced Diploma of Information Technology (Telecommunications Network Engineering)"
                                    Value="Telecommunications - Advanced Diploma of Information Technology (Telecommunications Network Engineering)"></asp:ListItem>
                                <asp:ListItem Text="Graduate Diploma - Graduate Diploma of Management (Learning)"
                                    Value="Graduate Diploma - Graduate Diploma of Management (Learning)"></asp:ListItem>
                                <asp:ListItem Text="Commercial Cookery - Certificate III in Commercial Cookery"
                                    Value="Commercial Cookery - Certificate III in Commercial Cookery"></asp:ListItem>
                                <asp:ListItem Text="Commercial Cookery - Certificate IV in Kitchen Management"
                                    Value="Commercial Cookery - Certificate IV in Kitchen Management"></asp:ListItem>
                                <asp:ListItem Text="Hospitality Management - Diploma of Hospitality Management"
                                    Value="Hospitality Management - Diploma of Hospitality Management"></asp:ListItem>
                                <asp:ListItem Text="Hospitality Management - Advanced Diploma of Hospitality Management"
                                    Value="Hospitality Management - Advanced Diploma of Hospitality Management"></asp:ListItem>
                                <asp:ListItem Text="Construction Courses - Certificate III in Carpentry"
                                    Value="Construction Courses - Certificate III in Carpentry"></asp:ListItem>
                                <asp:ListItem Text="Construction Courses - Certificate III in Painting and Decorating"
                                    Value="Construction Courses - Certificate III in Painting and Decorating"></asp:ListItem>
                                <asp:ListItem Text="Construction Courses - Certificate III in Wall and Floor Tiling"
                                    Value="Construction Courses - Certificate III in Wall and Floor Tiling"></asp:ListItem>
                                <asp:ListItem Text="Construction Courses - Diploma of Building and Construction (Building)"
                                    Value="Construction Courses - Diploma of Building and Construction (Building)"></asp:ListItem>
                                <asp:ListItem Text="Advanced Diploma of Civil Construction Design"
                                    Value="Advanced Diploma of Civil Construction Design"></asp:ListItem>
                                <asp:ListItem Text="Certificate III in Cabinet Making and Timber Technology"
                                    Value="Certificate III in Cabinet Making and Timber Technology"></asp:ListItem>
                                <asp:ListItem Text="Certificate III in Commercial Cookery"
                                    Value="Certificate III in Commercial Cookery"></asp:ListItem>
                                <asp:ListItem Text="Certificate III in Light Vehicle Mechanical Technology"
                                    Value="Certificate III in Light Vehicle Mechanical Technology"></asp:ListItem>
                                <asp:ListItem Text="Certificate IV in Automotive Mechanical Diagnosis"
                                    Value="Certificate IV in Automotive Mechanical Diagnosis"></asp:ListItem>
                                <asp:ListItem Text="Certificate IV in Project Management Practice"
                                    Value="Certificate IV in Project Management Practice"></asp:ListItem>
                            </asp:DropDownList>

                        </div>

                        <div class="clearfix"></div>


                        <div class="col-md-4">
                            <label class="lbl_title">Nationality</label>
                            <asp:DropDownList ID="ddl_nationality" runat="server" data-live-search="true" CssClass="form-control search_dropdown" aria-required="true" aria-invalid="false">
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
                        <div class="col-md-4 clearfix">
                            <label class="lbl_title">Passport Number</label>
                            <asp:TextBox runat="server" ID="txt_pass_no" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Upload Passport Copy</label>
                            <asp:FileUpload ID="upd_pass" CssClass="form-control" runat="server" />
                        </div>
<div class="col-md-6">
    <div>
        <img id="clearBtn1" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />
    </div>
    <asp:HiddenField ID="hdnSignature1" runat="server" />
    <canvas id="signatureCanvas1" style="border: 1px solid #dfdfdf; width: 100%; height: 250px; background: white;"></canvas>
</div>
                        <div class="col-md-6">
                            <label class="lbl_title">Date Of Test</label>
                            <asp:TextBox ID="txt_date_of_test" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        </div>


                    </div>
                </div>



                <div class="btn_step">
                    <button type="button" class="btn btn-primary next-step">Next</button>
                </div>

            </div>

            <div class="step step-2" data-step="1">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">
                            <div style="border-bottom: 1px solid #ccc;">
                                <h4>ORAL COMMUNICATION (Questions 1-4)
                                </h4>
                                <label>
                                    Record your answers about your reasons for enrolling and your career objectives to determine your oral communication skills.
                                </label>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h4 style="padding: 10px">Question 1: Why did you enrol in this course?
                                    </h4>
                                </div>
                                <div class="col-md-6">
                                    <div style="max-width: 360px; margin: 40px auto; font-family: Arial, sans-serif; text-align: center; color: #444; background: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.08);">

                                        <!-- Microphone Icon -->
                                        <div style="font-size: 40px; color: #999; margin-bottom: 20px;">
                                            <svg fill="#999999" height="93px" width="93px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve" stroke="#999999" stroke-width="0.0005">
                                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                                    <path d="M15,18.405c-0.553,0-1,0.447-1,1c0,0.046,0,5.124,0.001,5.16c0.076,6.14,4.928,11.185,11.007,11.687 C25.007,36.266,25,36.278,25,36.292v2.71h-4.546c-0.553,0-1,0.447-1,1s0.447,1,1,1h11.092c0.553,0,1-0.447,1-1s-0.447-1-1-1H27 v-2.71c0-0.014-0.007-0.026-0.008-0.04c6.055-0.501,10.905-5.524,11.006-11.636C37.999,24.555,38,19.467,38,19.405 c0-0.553-0.447-1-1-1s-1,0.447-1,1c0,0.061-0.001,5.039-0.002,5.178c-0.088,5.359-4.573,9.719-9.998,9.719 c-5.447,0-9.933-4.379-9.999-9.759C16,24.397,16,19.45,16,19.405C16,18.853,15.553,18.405,15,18.405z"></path>
                                                    <path d="M32.9,24.482v-8.642c0-3.771-3.096-6.839-6.9-6.839s-6.9,3.068-6.9,6.839v8.642c0,3.771,3.096,6.839,6.9,6.839 S32.9,28.253,32.9,24.482z M21.1,24.482v-8.642c0-2.668,2.198-4.839,4.9-4.839s4.9,2.171,4.9,4.839v8.642 c0,2.668-2.198,4.839-4.9,4.839S21.1,27.15,21.1,24.482z"></path>
                                                </g></svg>
                                        </div>
                                        <!-- Instruction -->
                                        <div style="font-size: 16px; margin-bottom: 12px;">Press a button below to record your answer.</div>

                                        <!-- Info Box -->
                                        <div style="background: #f3f3f3; color: #bbb; padding: 8px 18px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; user-select: none;">
                                            Press a button below to record your answer.
                                        </div>


                                        <!-- Buttons -->
                                        <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
                                            <button type="button" onclick="startRecording(1)"
                                                style="border: none; background-color: #1976d2; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                                <span style="width: 12px; height: 12px; background: white; border-radius: 50%;"></span>
                                                Start
                                            </button>

                                            <button type="button" onclick="stopRecording(1)"
                                                style="border: none; background-color: #c25353; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                                ■ Stop
                                            </button>
                                        </div>

                                        <!-- Audio Preview -->
                                        <audio id="audio1" controls style="width: 100%; border-radius: 8px; outline: none; margin-top: 20px;"></audio>

                                        <!-- Message -->
                                        <div id="msg1" style="font-size: 13px; color: #555; text-align: center; margin-top: 12px;"></div>

                                    </div>
                                </div>
                            </div>



                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">Answer 1</label>
                            <asp:TextBox runat="server" ID="txt_ans_1" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>

            <div class="step step-3" data-step="2">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">


                            <div class="row">
                                <div class="col-md-12">
                                    <h4 style="padding: 10px">Question 2: What are your career objectives?
                                    </h4>
                                </div>
                                <div class="col-md-6">
                                    <div style="max-width: 360px; margin: 40px auto; font-family: Arial, sans-serif; text-align: center; color: #444; background: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.08);">

                                        <!-- Microphone Icon -->
                                        <div style="font-size: 40px; color: #999; margin-bottom: 20px;">
                                            <svg fill="#999999" height="93px" width="93px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve" stroke="#999999" stroke-width="0.0005">
                                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                                    <path d="M15,18.405c-0.553,0-1,0.447-1,1c0,0.046,0,5.124,0.001,5.16c0.076,6.14,4.928,11.185,11.007,11.687 C25.007,36.266,25,36.278,25,36.292v2.71h-4.546c-0.553,0-1,0.447-1,1s0.447,1,1,1h11.092c0.553,0,1-0.447,1-1s-0.447-1-1-1H27 v-2.71c0-0.014-0.007-0.026-0.008-0.04c6.055-0.501,10.905-5.524,11.006-11.636C37.999,24.555,38,19.467,38,19.405 c0-0.553-0.447-1-1-1s-1,0.447-1,1c0,0.061-0.001,5.039-0.002,5.178c-0.088,5.359-4.573,9.719-9.998,9.719 c-5.447,0-9.933-4.379-9.999-9.759C16,24.397,16,19.45,16,19.405C16,18.853,15.553,18.405,15,18.405z"></path>
                                                    <path d="M32.9,24.482v-8.642c0-3.771-3.096-6.839-6.9-6.839s-6.9,3.068-6.9,6.839v8.642c0,3.771,3.096,6.839,6.9,6.839 S32.9,28.253,32.9,24.482z M21.1,24.482v-8.642c0-2.668,2.198-4.839,4.9-4.839s4.9,2.171,4.9,4.839v8.642 c0,2.668-2.198,4.839-4.9,4.839S21.1,27.15,21.1,24.482z"></path>
                                                </g></svg>
                                        </div>
                                        <!-- Instruction -->
                                        <div style="font-size: 16px; margin-bottom: 12px;">Press a button below to record your answer.</div>

                                        <!-- Info Box -->
                                        <div style="background: #f3f3f3; color: #bbb; padding: 8px 18px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; user-select: none;">
                                            Press a button below to record your answer.
                                        </div>

                                        <!-- Timer -->


                                        <!-- Buttons -->
                                        <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
                                            <button type="button" onclick="startRecording(2)"
                                                style="border: none; background-color: #1976d2; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                                <span style="width: 12px; height: 12px; background: white; border-radius: 50%;"></span>
                                                Start
                                            </button>

                                            <button type="button" onclick="stopRecording(2)"
                                                style="border: none; background-color: #c25353; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                                ■ Stop
                                            </button>
                                        </div>

                                        <!-- Audio Preview -->
                                        <audio id="audio2" controls style="width: 100%; border-radius: 8px; outline: none; margin-top: 20px;"></audio>

                                        <!-- Message -->
                                        <div id="msg2" style="font-size: 13px; color: #555; text-align: center; margin-top: 12px;"></div>

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
            </div>
            <div class="step step-4" data-step="3">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">


                            <div class="row">
                                <div class="col-md-12">
                                    <h4 style="padding: 10px">Question 3: How do you think this course will contribute towards you obtaining your objectives?

                                    </h4>
                                </div>
                                <div class="col-md-6">
                                    <div style="max-width: 360px; margin: 40px auto; font-family: Arial, sans-serif; text-align: center; color: #444; background: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.08);">

                                        <!-- Microphone Icon -->
                                        <div style="font-size: 40px; color: #999; margin-bottom: 20px;">
                                            <svg fill="#999999" height="93px" width="93px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve" stroke="#999999" stroke-width="0.0005">
                                                <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                                    <path d="M15,18.405c-0.553,0-1,0.447-1,1c0,0.046,0,5.124,0.001,5.16c0.076,6.14,4.928,11.185,11.007,11.687 C25.007,36.266,25,36.278,25,36.292v2.71h-4.546c-0.553,0-1,0.447-1,1s0.447,1,1,1h11.092c0.553,0,1-0.447,1-1s-0.447-1-1-1H27 v-2.71c0-0.014-0.007-0.026-0.008-0.04c6.055-0.501,10.905-5.524,11.006-11.636C37.999,24.555,38,19.467,38,19.405 c0-0.553-0.447-1-1-1s-1,0.447-1,1c0,0.061-0.001,5.039-0.002,5.178c-0.088,5.359-4.573,9.719-9.998,9.719 c-5.447,0-9.933-4.379-9.999-9.759C16,24.397,16,19.45,16,19.405C16,18.853,15.553,18.405,15,18.405z"></path>
                                                    <path d="M32.9,24.482v-8.642c0-3.771-3.096-6.839-6.9-6.839s-6.9,3.068-6.9,6.839v8.642c0,3.771,3.096,6.839,6.9,6.839 S32.9,28.253,32.9,24.482z M21.1,24.482v-8.642c0-2.668,2.198-4.839,4.9-4.839s4.9,2.171,4.9,4.839v8.642 c0,2.668-2.198,4.839-4.9,4.839S21.1,27.15,21.1,24.482z"></path>
                                                </g></svg>
                                        </div>
                                        <!-- Instruction -->
                                        <div style="font-size: 16px; margin-bottom: 12px;">Press a button below to record your answer.</div>

                                        <!-- Info Box -->
                                        <div style="background: #f3f3f3; color: #bbb; padding: 8px 18px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; user-select: none;">
                                            Press a button below to record your answer.
                                        </div>

                                        <!-- Timer -->


                                        <!-- Buttons -->
                                        <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
                                            <button type="button" onclick="startRecording(3)"
                                                style="border: none; background-color: #1976d2; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                                <span style="width: 12px; height: 12px; background: white; border-radius: 50%;"></span>
                                                Start
                                            </button>

                                            <button type="button" onclick="stopRecording(3)"
                                                style="border: none; background-color: #c25353; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                                ■ Stop
                                            </button>
                                        </div>

                                        <!-- Audio Preview -->
                                        <audio id="audio3" controls style="width: 100%; border-radius: 8px; outline: none; margin-top: 20px;"></audio>

                                        <!-- Message -->
                                        <div id="msg3" style="font-size: 13px; color: #555; text-align: center; margin-top: 12px;"></div>

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
            </div>
            <div class="step step-5" data-step="4">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">


                            <div style="margin-top: 20px;">
                                <h4>Question 4 : How do you think we can best support you to achieve your objectives (including any learning support)?</h4>

                            </div>

                        </div>
                        <div class="col-md-6">
                            <div style="max-width: 360px; margin: 40px auto; font-family: Arial, sans-serif; text-align: center; color: #444; background: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.08);">

                                <!-- Microphone Icon -->
                                <div style="font-size: 40px; color: #999; margin-bottom: 20px;">
                                    <svg fill="#999999" height="93px" width="93px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve" stroke="#999999" stroke-width="0.0005">
                                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                            <path d="M15,18.405c-0.553,0-1,0.447-1,1c0,0.046,0,5.124,0.001,5.16c0.076,6.14,4.928,11.185,11.007,11.687 C25.007,36.266,25,36.278,25,36.292v2.71h-4.546c-0.553,0-1,0.447-1,1s0.447,1,1,1h11.092c0.553,0,1-0.447,1-1s-0.447-1-1-1H27 v-2.71c0-0.014-0.007-0.026-0.008-0.04c6.055-0.501,10.905-5.524,11.006-11.636C37.999,24.555,38,19.467,38,19.405 c0-0.553-0.447-1-1-1s-1,0.447-1,1c0,0.061-0.001,5.039-0.002,5.178c-0.088,5.359-4.573,9.719-9.998,9.719 c-5.447,0-9.933-4.379-9.999-9.759C16,24.397,16,19.45,16,19.405C16,18.853,15.553,18.405,15,18.405z"></path>
                                            <path d="M32.9,24.482v-8.642c0-3.771-3.096-6.839-6.9-6.839s-6.9,3.068-6.9,6.839v8.642c0,3.771,3.096,6.839,6.9,6.839 S32.9,28.253,32.9,24.482z M21.1,24.482v-8.642c0-2.668,2.198-4.839,4.9-4.839s4.9,2.171,4.9,4.839v8.642 c0,2.668-2.198,4.839-4.9,4.839S21.1,27.15,21.1,24.482z"></path>
                                        </g></svg>
                                </div>
                                <!-- Instruction -->
                                <div style="font-size: 16px; margin-bottom: 12px;">Press a button below to record your answer.</div>

                                <!-- Info Box -->
                                <div style="background: #f3f3f3; color: #bbb; padding: 8px 18px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; user-select: none;">
                                    Press a button below to record your answer.
                                </div>

                                <!-- Timer -->


                                <!-- Buttons -->
                                <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
                                    <button type="button" onclick="startRecording(4)"
                                        style="border: none; background-color: #1976d2; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                        <span style="width: 12px; height: 12px; background: white; border-radius: 50%;"></span>
                                        Start
                                    </button>

                                    <button type="button" onclick="stopRecording(4)"
                                        style="border: none; background-color: #c25353; color: white; font-size: 16px; font-weight: 600; border-radius: 40px; padding: 12px 30px; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                                        ■ Stop
                                    </button>
                                </div>

                                <!-- Audio Preview -->
                                <audio id="audio4" controls style="width: 100%; border-radius: 8px; outline: none; margin-top: 20px;"></audio>

                                <!-- Message -->
                                <div id="msg4" style="font-size: 13px; color: #555; text-align: center; margin-top: 12px;"></div>

                            </div>
                        </div>
                    </div>

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>
            <div class="step step-6">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">


                            <div style="border-bottom: 1px solid #ccc;">
                                <h4>LEARNING AND WRITING</h4>

                            </div>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="lbl_title">5. How do you learn best? Give examples and why you think this helps you learn.</label>
                            <asp:TextBox runat="server" ID="txt_ex_lern_test" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">6. What do you like most about learning?</label>
                            <asp:TextBox runat="server" ID="txt_most_like_lern" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">
                                7. What do you like least about learning?
                            </label>
                            <asp:TextBox runat="server" ID="txt_least_like_lern" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">
                                8. How do you go about learning new skills and acquiring knowledge? Do you have any preferences about the way you learn? What things do you do to increase your learning experiences and get the most out of them?

                            </label>
                            <asp:TextBox runat="server" ID="txt_learning_new_skill" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">
                                9. How do you think your current skills can be increased by doing this course?
                            </label>
                            <asp:TextBox runat="server" ID="txt_current_skill" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">
                                10. You have just been promoted to the position of team leader of the most selling product (assume your favourite product) of the company (any company of your choice). You have eight people working in your team. What would you do to ensure that they have the full knowledge of the product to develop the product strategy?
                            </label>
                            <asp:TextBox runat="server" ID="txt_product_strategy" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>
            <div class="step step-7">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">


                            <div style="border-bottom: 1px solid #ccc;">
                                <h4>READING AND WRITING</h4>

                            </div>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="lbl_title">11. Please tell us about your reading habits. Do you enjoy reading? Explain why or why not. Write about the reading you have done during the past 6 months.</label>
                            <asp:TextBox runat="server" ID="txt_read_past" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            <span>You may wish to write about whether you:</span>
                            <ul style="list-style-type: disc; padding-left: 20px; font-size: 13px">
                                <li>read the newspaper regularly – paper based or online</li>
                                <li>check your emails regularly or read online blogs</li>
                                <li>read novels, magazines, textbooks, online articles etc</li>

                            </ul>
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">12. Please read the following excerpt from a Business Review Weekly article and answer the questions that follow.</label>

                            <ul style="list-style-type: disc; padding-left: 20px; margin-top: 10px; font-size: 13px">
                                <li>This year is the year Facebook transitioned to a pay-to-play model but marketers who think they can jam the news feed with ads will pay dearly.</li>
                                <li>It’s a new chapter in the social marketing playbook and while Facebook leads the charge, other networks will follow with their version of pay to play.</li>
                                <li>From January 2015, Facebook will control the volume of promotional posts that users see from brands. Organic posts that solely push people to buy a product or install an app, enter a promotion or reuse the same content from ads will be penalised.</li>
                                <li>Essentially, Facebook is saying that brands need to pay if they want to publish ads. This is being seen as the final nail in the coffin of organic (ie unpaid) distribution.</li>
                                <li>Facebook has said that between 1500 and 15,000 potential stories could appear each time someone logs on. News feed filters and controls are in place therefore to show people the content ‘that is most relevant to them’.</li>
                                <li>Many commentators are critical of Facebook’s tactics. They argue that the company has lured marketers in with a quick hit, got them hooked and then turned off the supply. Others are claiming that Facebook is set to become nothing more than a repository for display ads.</li>
                                <li>These perspectives generate compelling headlines but they’re not particularly instructive for marketers who are invested in the platform.</li>
                                <li>The truth is that Facebook has been very clear about its motives. It’s not only about revenue, as many assert, it’s about the end user experience. They need people to keep coming back, and so do the Australian brands that are so heavily reliant on Facebook as their social marketing channel.</li>
                                <li>Facebook’s mission is to “show people the things they want to see”. People aren’t using Facebook for the ads; they’re there for the stories. Paying for reach on any platform has never been a substitute for good content.</li>
                                <li>So while marketing budgets may be ruffled, marketers should remember it’s the experience and content that end users seek. The end of organic reach doesn’t impact that…
                                                                <div>
                                                                    (Source: Excerpt from http://www.brw.com.au/p/marketing/still_relies_play_marketing_social_BcsrL4vMQvEVQ7g19gJB9L, 11 December 2014)
                                                                </div>
                                </li>
                            </ul>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    12. a) Who do you think is the audience the article and what is its purpose? Explain your answer.

                                </label>
                                <asp:TextBox runat="server" ID="txt_article_purpose" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    12. b) The writer states that other networks will follow in Facebook’s footsteps. What types of networks do you think might take on board the pay-to-play model? Why do you think this?
                                </label>
                                <asp:TextBox runat="server" ID="txt_type_of_network" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    12. c) What do you personally think of Facebook’s use of ad content?
                                </label>
                                <asp:TextBox runat="server" ID="txt_facebook_content" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    12. d) What opinion do you think the writer of this article has? Explain your answer.
                                </label>
                                <asp:TextBox runat="server" ID="txt_writer_article" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>

                        </div>

                    </div>

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>
            <div class="step step-8">


                <div class="form-container">

                    <div class="row">
                        <div class="col-md-12">


                            <div style="border-bottom: 1px solid #ccc;">
                                <h4>NUMERACY</h4>

                            </div>

                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <div>Complete the following questions. You can use a calculator or write down your workings in this booklet.</div>
                            <label class="lbl_title">13. Louise is setting up her own marketing business. She has done some research about the start-up and ongoing costs. Use the following information to answer the questions below. Based on the information below, answer the following questions. Use the space below to work out your answers and provide an answer to each.</label>

                            <ul style="list-style-type: disc; padding-left: 20px; margin-top: 10px; font-size: 13px">
                                <li>Leasing costs of the premises – approximately $2,500 per month ($5,000 on signing of the lease).</li>
                                <li>Purchase of stock/raw materials – about $20,000 prior to start up and $20,000 per month thereafter. It is also expected that the stock will sit on the shelf for an average of 2 months and will be sold on terms of 30 days’ credit.</li>
                                <li>Wages – approximately $173,000 per annum. Superannuation costs – approximately $15,570 per annum.</li>
                                <li>Accounting and taxation costs – likely to be $3,795 to set up the business structure. Ongoing annual costs – $2,500 (paid quarterly) for the business’s compliance and taxation matters.</li>
                                <li>Initial legal costs – $700.</li>
                                <li>Promotion and advertising – $1,200 prior to start up, and $2,000 paid two months after start up.</li>
                                <li>Installation of telephone, fax and Internet lines – total of $450.</li>
                                <li>Running costs of telephone, fax and Internet – total $550 per month.</li>
                                <li>Motor vehicles costs – calculated at $20,000 per annum. This includes leasing costs.</li>
                                <li>Electricity and gas installations – approximately $275. Running costs – expected to be about $650 per month.
                                </li>
                                <li>Licenses and permits – $395 per annum, paid prior to start up and then annually.
                                </li>
                                <li>Bank charges – expected to be around $300 per annum, paid monthly.
                                </li>
                                <li>Insurances – $3,750 per annum (including WorkCover), to be paid prior to starting operations and then annually.
                                </li>
                                <li>It is expected that $100,000 will be borrowed. Monthly repayments will amount to approximately $2,166, made up of $1,328 capital repayment and $838 interest expense.
                                </li>
                                <li>A contingency sum for sundry expenses has been set at $210 per month.
                                </li>
                            </ul>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    13. a) What are the ‘start-up costs’ of this business, according only to the information presented above? ‘Start-up’ costs are those costs that are required in order to open the business/start operating.

                                </label>
                                <asp:TextBox runat="server" ID="txt_start_up_cost" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    13. b) What are the monthly expenses, considering only expenses that are paid monthly?

                                </label>
                                <asp:TextBox runat="server" ID="txt_monthly_expense" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    13. c) What are the annual expenses, considering only expenses that are paid annually?

                                </label>
                                <asp:TextBox runat="server" ID="txt_anual_expense" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>

                        </div>

                    </div>
                </div>
                <div class="form-container">
                    <div class="row">
                        <div class="col-md-12">

                            <label class="lbl_title">14. Your clients have asked you to prepare the budget for a charity dinner event. They would like it to be a private function in a hired hall with catering, music and guest speakers for their 40 invited staff members.</label>
                            <div>They would like to come in under $1,600. Based on these provided options, write the most affordable budget for the client. Clearly state which catering and venue hire option you have gone with, and a summary of how you worked out the best option.</div>
                            <ul style="list-style-type: disc; padding-left: 20px; margin-top: 10px; font-size: 13px">
                                <li>Hire of hall: – Option A: Town hall – $400 seats 100, includes microphone, lectern and speaker system
                                    <br />
                                    Option B: Hire cost of scout hall – $300 seats 45</li>
                                <li>Catering: – Option A: $25 per head – includes main meal, desert and 1 drink – Option B: $20 per head – includes tapas, main meal and 1 drink</li>
                                <li>Hire of microphone and speaker system – $50</li>
                                <li>Lectern hire – $30</li>
                                <li>Hire of crockery and glasses – $2 per head</li>
                                <li>Band – $200</li>
                                <li>Front of house staff – $100</li>
                            </ul>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    14. Clearly state which catering and venue hire option you have gone with, and a summary of how you worked out the best option.

                                </label>
                                <asp:TextBox runat="server" ID="txt_catering_venue" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                            </div>


                        </div>
                    </div>
                </div>
                <div class="form-container">
                    <div class="row">
                        <div class="col-md-12">

                            <label class="lbl_title">15. Answer the following questions.</label>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    15. a) Find the total of 23.7, 43.1 and 89
                                </label>
                                <asp:TextBox runat="server" ID="txt_total" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    15. b) Multiply 56.8 by 8
                                </label>
                                <asp:TextBox runat="server" ID="txt_multiply" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    15. c) Divide 56.2 by 0.2
                                </label>
                                <asp:TextBox runat="server" ID="txt_devide" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    15. d) Find the perimeter of a rectangle: Width = 23m Length = 8m
                                </label>
                                <asp:TextBox runat="server" ID="txt_perimeter" CssClass="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label class="lbl_title">
                                    15. e) Find the area of a rectangle: Width = 23m Length = 8m
                                </label>
                                <asp:TextBox runat="server" ID="txt_area" CssClass="form-control" />
                            </div>

                        </div>
                    </div>

                </div>
                <div class="form-container">

                    <h4>STUDENT DECLARATION</h4>
                    <asp:CheckBox ID="ch_consent" CssClass="checkbox-inline" Text=" I agree that I have completed this test to the best of my ability and am aware that the test results will be used to determine my current level of language, literacy and numeracy skills. This information will be used to determine any additional support I may require in order to complete the course successfully." runat="server" />

                    <div class="row">
                      <div class="col-md-6">
    <div>
        <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />
    </div>
    <asp:HiddenField ID="hdnSignature" runat="server" />
    <canvas id="signatureCanvas" style="border: 1px solid #dfdfdf; width: 100%; height: 250px; background: white;"></canvas>
</div>
                        <div class="col-md-6">
                            <label class="lbl_title">Date</label>
                            <asp:TextBox ID="txt_sign_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="btn_step" style="margin-top: 25px;">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <asp:Button Text="Submit" ID="btn_submit" OnClientClick="return saveBothSignatures();" OnClick="btn_submit_Click" CssClass="btn btn-success" runat="server" />
                    </div>
                </div>

                <asp:HiddenField runat="server" ID="hdn_audio1" />
                <asp:HiddenField runat="server" ID="hdn_audio2" />
                <asp:HiddenField runat="server" ID="hdn_audio3" />
                <asp:HiddenField runat="server" ID="hdn_audio4" />
            </div>
            <%--  --%>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script src="assets/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize select2 on the dropdown by using ClientID
            $('#<%= ddl_nationality.ClientID %>').select2({
                width: '100%' // Optional, adjust the width as needed
            });
        });

    </script>
    <script>
        $(document).ready(function() {
            // Initialize select2 on the dropdown by using ClientID
            $('#<%= ddl_course.ClientID %>').select2({
                width: '100%' // Optional, adjust the width as needed
            });
        });

    </script>
    <script>
        $(document).ready(function() {
            // Initialize select2 on the dropdown without search box
            $('#<%= ddl_test_place.ClientID %>').select2({
                width: '100%',             // keep full width
                minimumResultsForSearch: -1 // disables the search box
            });
        });
    </script>


<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
<script>
    // ==== Signature Pad 1 ====
    const canvas = document.getElementById('signatureCanvas');
    const signaturePad = new SignaturePad(canvas);

    function resizeCanvasMain() {
        const ratio = Math.max(window.devicePixelRatio || 1, 1);
        canvas.width = canvas.offsetWidth * ratio;
        canvas.height = canvas.offsetHeight * ratio;
        canvas.getContext("2d").scale(ratio, ratio);
        signaturePad.clear();
    }
    window.addEventListener("resize", resizeCanvasMain);
    resizeCanvasMain();

    document.getElementById('clearBtn').addEventListener('click', () => {
        signaturePad.clear();
    });

    // ==== Signature Pad 2 ====
    const canvas1 = document.getElementById('signatureCanvas1');
    const signaturePad1 = new SignaturePad(canvas1);

    function resizeCanvasSecond() {
        const ratio = Math.max(window.devicePixelRatio || 1, 1);
        canvas1.width = canvas1.offsetWidth * ratio;
        canvas1.height = canvas1.offsetHeight * ratio;
        canvas1.getContext("2d").scale(ratio, ratio);
        signaturePad1.clear();
    }
    window.addEventListener("resize", resizeCanvasSecond);
    resizeCanvasSecond();

    document.getElementById('clearBtn1').addEventListener('click', () => {
        signaturePad1.clear();
    });

    // ==== Save Both Signatures Before Postback ====
    function saveBothSignatures() {
        // First signature
        if (!signaturePad.isEmpty()) {
            const signatureData = canvas.toDataURL("image/png");
            document.getElementById("<%= hdnSignature.ClientID %>").value = signatureData;
        } else {
            alert("Please provide the first signature.");
            return false;
        }

        // Second signature
        if (!signaturePad1.isEmpty()) {
            const signatureData1 = canvas1.toDataURL("image/png");
            document.getElementById("<%= hdnSignature1.ClientID %>").value = signatureData1;
        } else {
            alert("Please provide the second signature.");
            return false;
        }

        return true; // allow postback if both signatures are valid
    }
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
    <script>
        $(document).ready(function () {
            // ---------------- Hide all steps initially ----------------
            $(".step").hide();          // hide all steps
            $(".step.step-1").show();   // show only first step

            // ---------------- Next Step Button ----------------
            $(".next-step").click(function (e) {
                e.preventDefault();

                var currentStep = $(this).closest(".step");
                var nextStep = currentStep.next(".step");
                var errors = [];

                // ✅ If all valid → move to next step
                currentStep.hide();
                nextStep.show();
                $("html, body").animate({ scrollTop: 550 }, "fast");
            });

            // ---------------- Previous Button ----------------
            $(".prev-step").click(function () {
                var currentStep = $(this).closest(".step");
                var prevStep = currentStep.prev(".step");

                currentStep.hide();
                prevStep.show();

                $("html, body").animate({ scrollTop: 550 }, "fast");
            });
        });
    </script>

    <!-- STEP-WISE VALIDATION: copy this below your other scripts -->
    <%--<script>
        $(document).ready(function () {
            // ---------------- Hide all steps initially ----------------
            $(".step").hide();          // hide all steps
            $(".step.step-1").show();   // show only first step

            // ----------------- shared validation helpers & function -----------------
            function setError($el) {
                $el.css("border", "2px solid #ff0000a6");
            }
            function clearError($el) {
                $el.css("border", "1px solid #ccc");
            }
            function required(selector, message, errors) {
                var $f = $(selector);
                if ($f.length === 0) return;
                var val = $f.val();
                if (val == null || val.toString().trim() === "") {
                    errors.push(message);
                    setError($f);
                } else {
                    clearError($f);
                }
            }
            function validateEmail(selector, message, errors) {
                var $f = $(selector);
                if ($f.length === 0) return;
                var val = $f.val() ? $f.val().toString().trim() : "";
                var re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (val === "") {
                    errors.push("Email is required");
                    setError($f);
                } else if (!re.test(val)) {
                    errors.push(message);
                    setError($f);
                } else {
                    clearError($f);
                }
            }

            // clear red border when user types/selects
            $(document).on("input change", ".form-control, input[type='file'], select, textarea", function () {
                $(this).css("border", "1px solid #ccc");
            });

            // ----------------- main step validation -----------------
            function validateStep($currentStep) {
                var errors = [];

                // ----------------- STEP 1 -----------------
                if ($currentStep.hasClass("step-1")) {
                    required("#<%= txt_name.ClientID %>", "Student Full Name is required", errors);
                    required("#<%= txt_std_id.ClientID %>", "Student ID Number is required", errors);

                    // phone validation
                    if (typeof iti !== "undefined" && iti && typeof iti.isValidNumber === "function") {
                        if (!iti.isValidNumber()) {
                            errors.push("Please enter a valid phone number");
                            $("#phone").css("border", "2px solid #ff0000a6");
                        } else {
                            $("#phone").css("border", "1px solid #ccc");
                            try {
                                $("#<%= hd_contact_no_code.ClientID %>").val(iti.selectedCountryData.dialCode);
                            $("#<%= hd_contact_no.ClientID %>").val($("#phone").val());
                        } catch (ex) { }
                    }
                } else {
                    var p = $("#phone").val() ? $("#phone").val().replace(/\D/g, "") : "";
                    if (p.length < 6) {
                        errors.push("Please enter a valid phone number");
                        $("#phone").css("border", "2px solid #ff0000a6");
                    } else {
                        $("#phone").css("border", "1px solid #ccc");
                    }
                }

                validateEmail("#<%= txt_email.ClientID %>", "Enter a valid Email", errors);
                    required("#<%= ddl_course.ClientID %>", "Please select Qualification Enrolled", errors);
                    required("#<%= ddl_test_place.ClientID %>", "Please select Place of Test", errors);
                    required("#<%= txt_dob.ClientID %>", "Date Of Birth is required", errors);
                    required("#<%= ddl_nationality.ClientID %>", "Please select Nationality", errors);
                    required("#<%= txt_pass_no.ClientID %>", "Passport Number is required", errors);

                    // passport file upload required
                    var $file = $("#<%= upd_pass.ClientID %>");
                    if ($file.length && $file.get(0).files.length === 0) {
                        errors.push("Please upload Passport Copy");
                        setError($file);
                    } else if ($file.length) {
                        clearError($file);
                    }
                }

                // ----------------- AUDIO VALIDATION STEP 2,3,4,5 -----------------
                if ($currentStep.hasClass("step-2")) {
                    if (!$("#<%= hdn_audio1.ClientID %>").val()) {
                    errors.push("Please record Audio 1");
                    $("#msg1").css("color", "red");
                } else {
                    $("#msg1").css("color", "#555");
                }
            }
            if ($currentStep.hasClass("step-3")) {
                if (!$("#<%= hdn_audio2.ClientID %>").val()) {
                errors.push("Please record Audio 2");
                $("#msg2").css("color", "red");
            } else {
                $("#msg2").css("color", "#555");
            }
        }
        if ($currentStep.hasClass("step-4")) {
            if (!$("#<%= hdn_audio3.ClientID %>").val()) {
                errors.push("Please record Audio 3");
                $("#msg3").css("color", "red");
            } else {
                $("#msg3").css("color", "#555");
            }
        }
        if ($currentStep.hasClass("step-5")) {
            if (!$("#<%= hdn_audio4.ClientID %>").val()) {
                errors.push("Please record Audio 4");
                $("#msg4").css("color", "red");
            } else {
                $("#msg4").css("color", "#555");
            }
        }

                // ----------------- STEP 6 -----------------
        if ($currentStep.hasClass("step-6")) {
            required("#<%= txt_ex_lern_test.ClientID %>", "Please describe how you learn best", errors);
            required("#<%= txt_most_like_lern.ClientID %>", "Please enter what you like most about learning", errors);
            required("#<%= txt_least_like_lern.ClientID %>", "Please enter what you like least about learning", errors);
            required("#<%= txt_learning_new_skill.ClientID %>", "Please explain how you learn new skills", errors);
            required("#<%= txt_current_skill.ClientID %>", "Please describe how this course will increase your skills", errors);
            required("#<%= txt_product_strategy.ClientID %>", "Please outline product strategy steps", errors);
        }

                // ----------------- STEP 7 -----------------
        if ($currentStep.hasClass("step-7")) {
            required("#<%= txt_read_past.ClientID %>", "Please tell us about your reading habits", errors);
            required("#<%= txt_article_purpose.ClientID %>", "Please answer part 12.a", errors);
            required("#<%= txt_type_of_network.ClientID %>", "Please answer part 12.b", errors);
            required("#<%= txt_writer_article.ClientID %>", "Please answer part 12.d", errors);
        }

                // ----------------- STEP 8 -----------------
        if ($currentStep.hasClass("step-8")) {
            required("#<%= txt_start_up_cost.ClientID %>", "Please list start-up costs", errors);
            required("#<%= txt_monthly_expense.ClientID %>", "Please list monthly expenses", errors);
            required("#<%= txt_anual_expense.ClientID %>", "Please list annual expenses", errors);
            required("#<%= txt_catering_venue.ClientID %>", "Please provide budget/venue/catering selection", errors);
            required("#<%= txt_total.ClientID %>", "Please provide answer to 15.a", errors);
            required("#<%= txt_multiply.ClientID %>", "Please provide answer to 15.b", errors);
            required("#<%= txt_devide.ClientID %>", "Please provide answer to 15.c", errors);
            required("#<%= txt_perimeter.ClientID %>", "Please provide answer to 15.d", errors);
            required("#<%= txt_area.ClientID %>", "Please provide answer to 15.e", errors);
        }

                // ----------------- DECLARATION & SIGNATURE -----------------
        if ($currentStep.find("#<%= ch_consent.ClientID %>").length || $currentStep.find("#signatureCanvas").length) {
                    var $consent = $("#<%= ch_consent.ClientID %>");
            if ($consent.length && !$consent.is(":checked")) {
                errors.push("You must agree to the student declaration to proceed.");
                $consent.closest("label, div").find("input").css("outline", "2px solid #ff0000a6");
            } else if ($consent.length) {
                $consent.closest("label, div").find("input").css("outline", "none");
            }

            var signatureMissing = false;
            if (typeof signaturePad !== "undefined" && typeof signaturePad.isEmpty === "function") {
                if (signaturePad.isEmpty()) {
                    signatureMissing = true;
                }
            } else {
                var sigVal = $("#<%= hdnSignature.ClientID %>").val();
                if (!sigVal || sigVal.trim() === "") signatureMissing = true;
            }
            if (signatureMissing) {
                errors.push("Please provide your signature.");
                $("#signatureCanvas").css("border", "2px solid #ff0000a6");
            } else {
                $("#signatureCanvas").css("border", "1px solid #dfdfdf");
            }
        }

        return errors;
    }

            // ----------------- NEXT STEP -----------------
            $(".next-step").off("click").on("click", function (e) {
                e.preventDefault();
                var $btn = $(this);
                var $currentStep = $btn.closest(".step");
                var $nextStep = $currentStep.next(".step");

                var errors = validateStep($currentStep);
                if (errors.length > 0) {
                    var unique = Array.from(new Set(errors));
                    alert(unique.join("\n"));

                    // focus first invalid input
                    var $first = $(".form-control, input, textarea, select").filter(function () {
                        var b = $(this).css("border");
                        return b && b.indexOf("ff0000") !== -1;
                    }).first();

                    if ($first.length) {
                        $('html, body').animate({ scrollTop: Math.max($first.offset().top - 120, 0) }, 400);
                        $first.focus();
                    }
                    return;
                }

                if ($nextStep.length) {
                    $currentStep.hide();
                    $nextStep.show();
                    $("html, body").animate({ scrollTop: 550 }, "fast");
                }
            });

            // ----------------- PREV STEP -----------------
            $(".prev-step").off("click").on("click", function () {
                var currentStep = $(this).closest(".step");
                var prevStep = currentStep.prev(".step");
                currentStep.hide();
                prevStep.show();
                $("html, body").animate({ scrollTop: 550 }, "fast");
            });

            // ----------------- SUBMIT -----------------
            $("#<%= btn_submit.ClientID %>").off("click.customValidate").on("click.customValidate", function (e) {
            try { saveSignature(); } catch (ex) { }

            var $btn = $(this);
            var $currentStep = $btn.closest(".step");
            var errors = validateStep($currentStep);

            if (errors.length > 0) {
                e.preventDefault();
                var unique = Array.from(new Set(errors));
                alert(unique.join("\n"));

                var $first = $(".form-control, input, textarea, select").filter(function () {
                    var b = $(this).css("border");
                    return b && b.indexOf("ff0000") !== -1;
                }).first();

                if ($first.length) {
                    $('html, body').animate({ scrollTop: Math.max($first.offset().top - 120, 0) }, 400);
                    $first.focus();
                }
                return false;
            }

            return true; // allow submit
        });
        });
    </script>--%>

    <script>
        let mediaRecorder;
        let recordedChunks = [];
        let audioFiles = [null, null, null, null]; // Store references
        let stepSaved = [false, false, false, false]; // Track save status

        function showMessage(step, message, isError) {
            const msgDiv = document.getElementById('msg' + step);
            msgDiv.innerText = message;
            msgDiv.style.color = isError ? 'red' : 'green';
        }

        async function startRecording(step) {
            try {
                const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
                mediaRecorder = new MediaRecorder(stream);
                recordedChunks = [];

                mediaRecorder.ondataavailable = e => {
                    if (e.data.size > 0) recordedChunks.push(e.data);
            };

            mediaRecorder.onstop = () => {
                if (recordedChunks.length === 0) {
                        showMessage(step, "Audio not recorded", true);
            return;
        }

        const blob = new Blob(recordedChunks, { type: 'audio/webm' });

        // Unique filename
        const now = new Date();
        const filename = `audio_${step}_${now.getFullYear()}${String(now.getMonth()+1).padStart(2,'0')}${String(now.getDate()).padStart(2,'0')}_${String(now.getHours()).padStart(2,'0')}${String(now.getMinutes()).padStart(2,'0')}${String(now.getSeconds()).padStart(2,'0')}.webm`;

        const file = new File([blob], filename, { type: 'audio/webm' });
        audioFiles[step - 1] = file;

        // Show locally
        document.getElementById('audio' + step).src = URL.createObjectURL(blob);

        // Upload immediately
        const formData = new FormData();
        formData.append("audioFile", file, file.name);

        fetch("test.aspx", {
            method: "POST",
            body: formData
        })
        .then(res => res.text())
        .then(msg => {
            stepSaved[step - 1] = true; // mark saved
        showMessage(step, "Uploaded: " + filename, false);

        // Store filename in hiddenfield dynamically
        const hdn = document.getElementById('<%= hdn_audio1.ClientID %>'.replace("hdn_audio1", "hdn_audio" + step));
        if(hdn) hdn.value = filename;
        })
                .catch(err => {
                    stepSaved[step - 1] = false;
        showMessage(step, "Upload failed: " + err, true);
        });
        };

        mediaRecorder.start();
        stepSaved[step - 1] = false; // reset when new recording
        showMessage(step, "Recording...", false);

        } catch (err) {
            showMessage(step, "Microphone access denied!", true);
        }
        }

        function stopRecording(step) {
            if (mediaRecorder && mediaRecorder.state !== 'inactive') {
                mediaRecorder.stop();
            }
        }

        // Step navigation
        let currentStep = 1;
        function nextStep() {
            //if (!stepSaved[currentStep - 1]) {
            //    alert("Please stop and upload recording before going to the next step.");
            //    return;
            //}
            document.querySelector(`.step[data-step="${currentStep}"]`).classList.remove('active-step');
            currentStep++;
            document.querySelector(`.step[data-step="${currentStep}"]`).classList.add('active-step');
        }

        function prevStep() {
            document.querySelector(`.step[data-step="${currentStep}"]`).classList.remove('active-step');
            currentStep--;
            document.querySelector(`.step[data-step="${currentStep}"]`).classList.add('active-step');
        }

        // Attach navigation buttons
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelectorAll('.next-step').forEach(btn => btn.addEventListener('click', nextStep));
        document.querySelectorAll('.prev-step').forEach(btn => btn.addEventListener('click', prevStep));
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>

