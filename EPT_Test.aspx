<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeFile="EPT_Test.aspx.cs" Inherits="EPT_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    English Test
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/css/select2.min.css" rel="stylesheet" />
    <link href="assets/country_code/css/intlTelInput.min.css" rel="stylesheet" />
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">--%>

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

        #timer-container {
            position: fixed;
            top: 50%;
            right: 10px; /* Adjust distance from right */
            transform: translateY(-50%);
            font-size: 16px;
            font-weight: bold;
            color: #d9534f;
            background: rgb(211, 1, 1);
            padding: 10px 15px;
            border-radius: 10px;
            color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 10;
        }

        .signature-wrap {
            width: 100%;
            max-width: 500px;
            border: none;
            border-radius: 6px;
            /*padding: 0px;*/
            margin: 0px 0px 20px 0px;
            box-sizing: border-box;
            height: 250px; /* fixed height for mobile/desktop */
            position: relative;
        }

        #signatureCanvas {
            width: 100%; /* CSS width */
            height: 100%; /* take full parent height */
            touch-action: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            background: transparent;
            display: block;
        }

        #signaturePreview {
            display: none;
            max-width: 100%;
            border: 1px solid #ddd;
            margin-top: 10px;
        }

        .btn {
            margin-bottom: 10px;
        }



        .d-flex {
            display: flex;
        }

        .ins h4 {
            margin-bottom: 4px;
        }

        .ins_ul {
            list-style-type: disc;
            margin-bottom: 20px;
        }

            .ins_ul li {
                margin-left: 25px;
            }

        .error {
            border: 1px solid red;
        }
    </style>

    <script src="https://cdn.WebRTC-Experiment.com/MediaStreamRecorder.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <%--    <div class="page-container">
        <div class="scroll-content">--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>English Test</h1>
                    <ul class="breadcrumb">
                        <li><a href="https://nortwest.edu.au/"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">English Test</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="timer-container">
        <%--        <img src="image/sand-flow-unscreen.gif" width="35px" alt="Alternate Text" />--%>
        Time Remaining : <span id="timer">45:00</span>
    </div>
    <div class="bg-gray default-padding bg-cover">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>English Test</h2>
                    </div>
                </div>
            </div>

            <!-- Step 1 -->
            <div class="step step-1">
                <div class="form-container ins">
                    <h4>Student Instructions</h4>
                    <p class="instruction">This Placement Test has been designed to help us in identifying your language skills and to determine whether the level of language you possess, is appropriate to the intended VET qualification. This test will also determine if you meet the foundation skills required within each unit of competency contained with the intended qualification and the level of language complexity.</p>
                    <p class="instruction">Welcome to Nortwest College's English Placement Test. Please fill out the below required information. Please contact applynow@nortwest.edu.au if you need help or have questions. Thank you and good luck!</p>
                    <h4>Master Rules & Regulations </h4>
                    <ul class="ins_ul">
                        <li>Test must be completed in one sitting</li>
                        <li>Stable internet connection required</li>
                        <li>Tab switching may cause auto-submission</li>
                        <li>⏱ The total test duration is 45 minutes and is strictly timed</li>
                    </ul>

                    <h4>Student Identification</h4>
                    <ul class="ins_ul">
                        <li>Enter Student ID if available</li>
                        <li>If not available, enter: NW000001</li>
                    </ul>

                    <h4>System Rules</h4>
                    <ul class="ins_ul">
                        <li>Microphone permission mandatory</li>
                        <li>Updated browser required</li>
                    </ul>

                    <label class="consent">
                        <input type="checkbox" id="ch_step_1" />
                        I confirm that I have read and understood all rules and instructions
                    </label>
                </div>

                <div class="form-container">
                    <h4>Student Details</h4>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="lbl_title">First Name</label>
                            <asp:TextBox runat="server" ID="txt_first_name" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Last Name</label>
                            <asp:TextBox runat="server" ID="txt_l_name" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Student Email Id</label>
                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Student Id Number</label>
                            <asp:TextBox runat="server" ID="txt_sd_id" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Nationality</label>
                            <asp:DropDownList ID="ddl_nationality" runat="server" onchange="toggleNationality();" data-live-search="true" CssClass="form-control" aria-required="true" aria-invalid="false">
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
                                <asp:ListItem Text="Other" Value="Other" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Date of Birth</label>
                            <asp:TextBox runat="server" ID="txt_dob" TextMode="Date" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Passport No</label>
                            <asp:TextBox runat="server" ID="txt_passport" CssClass="form-control" />
                        </div>
                        <div class="col-md-4" id="divOtherNationality" style="display: none;">
                            <label class="lbl_title">Other Nationality</label>
                            <asp:TextBox runat="server" ID="txt_other_nationality" CssClass="form-control" />
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 signature-wrap">
                            <label class="lbl_title">Student Signature</label>
                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />
                            <asp:HiddenField ID="hdnSignature" runat="server" />
                            <canvas id="signatureCanvas"></canvas>
                        </div>
                        <div class="clearfix"></div>

                        <!-- CAPTCHA Section -->
                        <div class="col-md-4">
                            <div class="form-group" style="margin-top: 20px;">
                                <div style="display: flex; align-items: center; gap: 10px;">

                                    <!-- Captcha Input -->
                                    <asp:TextBox runat="server" ID="txtCaptcha"
                                        CssClass="form-control"
                                        placeholder="Enter code"
                                        Style="width: 150px;" />

                                    <!-- Hidden Captcha -->
                                    <asp:HiddenField ID="hdnCaptcha" runat="server" />

                                    <!-- Captcha Image -->
                                    <canvas id="captchaCanvas" width="90" height="35"
                                        style="border: 1px solid #ccc; background: #f9f9f9;"></canvas>

                                    <!-- Refresh -->
                                    <span onclick="refreshCaptcha()" style="cursor: pointer;">
                                        <i class="fas fa-redo-alt"></i>
                                    </span>

                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="btn_step">
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>

            <!-- Step 2 -->
            <div class="step step-2">

                <div class="form-container ins">
                    <h4>PART I GRAMMAR AND VOCABULARY</h4>
                    <ul class="ins_ul">
                        <li>Total questions: 40</li>
                        <li>Questions 1-40 carries 0.5 mark</li>
                        <li>Total marks: 20</li>
                    </ul>

                    <label class="consent">
                        <input type="checkbox" id="ch_step_2" />
                        I confirm that I have read and understood all rules and instructions
                    </label>
                </div>

                <div class="form-container">


                    <p></p>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">1. I ________________ from France.</label>
                                <asp:RadioButtonList ID="rb_1_france" runat="server">
                                    <asp:ListItem Text="is" />
                                    <asp:ListItem Text="are" />
                                    <asp:ListItem Text="am" />
                                    <asp:ListItem Text="be" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">2. ________________ old, are you?</label>
                                <asp:RadioButtonList runat="server" ID="rb_2_old">
                                    <asp:ListItem Text="how" />
                                    <asp:ListItem Text="who" />
                                    <asp:ListItem Text="what" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">3. Where ________________ ?</label>
                                <asp:RadioButtonList runat="server" ID="rb_3_where">
                                    <asp:ListItem Text="you from" />
                                    <asp:ListItem Text="you are from" />
                                    <asp:ListItem Text="are you from" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">4. There aren’t ......................... windows in this room.</label>
                                <asp:RadioButtonList runat="server" ID="rb_4_windows">
                                    <asp:ListItem Text="a" />
                                    <asp:ListItem Text="any" />
                                    <asp:ListItem Text="one" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">5. Who’s ......................... man, over there? Is he a policeman?</label>
                                <asp:RadioButtonList runat="server" ID="rb_5_man_over">
                                    <asp:ListItem Text="this" />
                                    <asp:ListItem Text="that" />
                                    <asp:ListItem Text="those" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">6. How many students ......................... in your class?</label>
                                <asp:RadioButtonList runat="server" ID="rb_6_how_many_student">
                                    <asp:ListItem Text="there is" />
                                    <asp:ListItem Text="there are" />
                                    <asp:ListItem Text="are there" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">7. This is my friend. _____________ name is Peter.</label>
                                <asp:RadioButtonList runat="server" ID="rb_7_name_peter">
                                    <asp:ListItem Text="her" />
                                    <asp:ListItem Text="our" />
                                    <asp:ListItem Text="yours" />
                                    <asp:ListItem Text="his" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">8. My brother is ______________ artist.</label>
                                <asp:RadioButtonList runat="server" ID="rb_8_artist">
                                    <asp:ListItem Text="the" />
                                    <asp:ListItem Text="an" />
                                    <asp:ListItem Text="a" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">9. _______________ 20 desks in the classroom.</label>
                                <asp:RadioButtonList runat="server" ID="rb_9_20_desks">
                                    <asp:ListItem Text="This is" />
                                    <asp:ListItem Text="There is" />
                                    <asp:ListItem Text="They are" />
                                    <asp:ListItem Text="There are" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">10. Paul ________________ romantic films.</label>
                                <asp:RadioButtonList runat="server" ID="rb_10_romantic_films">
                                    <asp:ListItem Text="likes" />
                                    <asp:ListItem Text="like" />
                                    <asp:ListItem Text="do not like" />
                                    <asp:ListItem Text="isn't likes" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">11. Sorry, I can’t talk. I _____________ right now.</label>
                                <asp:RadioButtonList runat="server" ID="rb_11_right_now">
                                    <asp:ListItem Text="driving" />
                                    <asp:ListItem Text="‘m driving" />
                                    <asp:ListItem Text="drives" />
                                    <asp:ListItem Text="drive" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">12. She _________________ at school last week.</label>
                                <asp:RadioButtonList runat="server" ID="rb_12_at_school">
                                    <asp:ListItem Text="didn't be" />
                                    <asp:ListItem Text="weren’t" />
                                    <asp:ListItem Text="wasn’t" />
                                    <asp:ListItem Text="isn’t" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">13. __________________ a piece of cake? No, thank you.</label>
                                <asp:RadioButtonList runat="server" ID="rb_13_piece_of_cake">
                                    <asp:ListItem Text="Do you like" />
                                    <asp:ListItem Text="Would you like" />
                                    <asp:ListItem Text="Want you" />
                                    <asp:ListItem Text="Are you like" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">14. The living room is ___________________ than the bedroom.</label>
                                <asp:RadioButtonList runat="server" ID="rb_14_living_room">
                                    <asp:ListItem Text="more big" />
                                    <asp:ListItem Text="more bigger" />
                                    <asp:ListItem Text="biggest" />
                                    <asp:ListItem Text="bigger" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">15. Jane is a vegetarian. She ____________________ meat.</label>
                                <asp:RadioButtonList runat="server" ID="rb_15_meat">
                                    <asp:ListItem Text="sometimes eats" />
                                    <asp:ListItem Text="never eats" />
                                    <asp:ListItem Text="often eats" />
                                    <asp:ListItem Text="usually eats" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">16. There aren’t ________________ buses late in the evening.</label>
                                <asp:RadioButtonList runat="server" ID="rb_16_buses_late">
                                    <asp:ListItem Text="some" />
                                    <asp:ListItem Text="any" />
                                    <asp:ListItem Text="no" />
                                    <asp:ListItem Text="a" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">17. The car park is _________________ to the restaurant.</label>
                                <asp:RadioButtonList runat="server" ID="rb_17_to_restaurant">
                                    <asp:ListItem Text="next" />
                                    <asp:ListItem Text="opposite" />
                                    <asp:ListItem Text="behind" />
                                    <asp:ListItem Text="in front" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">18. Sue ________________ shopping every day.</label>
                                <asp:RadioButtonList runat="server" ID="rb_18_shopping">
                                    <asp:ListItem Text="is going" />
                                    <asp:ListItem Text="go" />
                                    <asp:ListItem Text="going" />
                                    <asp:ListItem Text="goes" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">19. They _________________ in the park when it started to rain heavily.</label>
                                <asp:RadioButtonList runat="server" ID="rb_19_in_the_park">
                                    <asp:ListItem Text="walked" />
                                    <asp:ListItem Text="were walking" />
                                    <asp:ListItem Text="were walk" />
                                    <asp:ListItem Text="are walking" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">20. ________________ seen fireworks before?</label>
                                <asp:RadioButtonList runat="server" ID="rb_20_seen_fireworks">
                                    <asp:ListItem Text="Did you ever" />
                                    <asp:ListItem Text="Are you ever" />
                                    <asp:ListItem Text="Have you ever" />
                                    <asp:ListItem Text="Do you ever" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">21. We’ve been friends ____________________ many years.</label>
                                <asp:RadioButtonList runat="server" ID="rb_21_many_years">
                                    <asp:ListItem Text="since" />
                                    <asp:ListItem Text="from" />
                                    <asp:ListItem Text="during" />
                                    <asp:ListItem Text="for" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">22. I promise I __________________ you as soon as I’ve finished this cleaning.</label>
                                <asp:RadioButtonList runat="server" ID="rb_22_as_soon_as">
                                    <asp:ListItem Text="will help" />
                                    <asp:ListItem Text="am helping" />
                                    <asp:ListItem Text="going to help" />
                                    <asp:ListItem Text="have helped" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">23. This town ___________________ by lots of tourists during the summer.</label>
                                <asp:RadioButtonList runat="server" ID="rb_23_lots_of_tourists">
                                    <asp:ListItem Text="visits" />
                                    <asp:ListItem Text="visited" />
                                    <asp:ListItem Text="is visiting" />
                                    <asp:ListItem Text="is visited" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">24. He said that his friends ____________ to speak to him after they lost the football match.</label>
                                <asp:RadioButtonList runat="server" ID="rb_24_to_speak">
                                    <asp:ListItem Text="not want" />
                                    <asp:ListItem Text="weren’t" />
                                    <asp:ListItem Text="didn’t want" />
                                    <asp:ListItem Text="aren’t wanting" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">25. How about _________________ to the cinema tonight?</label>
                                <asp:RadioButtonList runat="server" ID="rb_25_to_cinema">
                                    <asp:ListItem Text="going" />
                                    <asp:ListItem Text="go" />
                                    <asp:ListItem Text="to go" />
                                    <asp:ListItem Text="for going" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">26. wasn’t interested in the performance very much. ________________.</label>
                                <asp:RadioButtonList runat="server" ID="rb_26_wasnt_interested">
                                    <asp:ListItem Text="I didn’t, too." />
                                    <asp:ListItem Text="Neither was I." />
                                    <asp:ListItem Text="Nor I did." />
                                    <asp:ListItem Text="So I wasn’t." />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">27. You may not like the cold weather here, but you’ll have to __________, I’m afraid.</label>
                                <asp:RadioButtonList runat="server" ID="rb_27_iam_afraid">
                                    <asp:ListItem Text="tell it off" />
                                    <asp:ListItem Text="sort itself out" />
                                    <asp:ListItem Text="put up with it" />
                                    <asp:ListItem Text="put it off" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">28. He got his driver’s license a month ago. He drives very ____________</label>
                                <asp:RadioButtonList runat="server" ID="rb_28_got_driver_licence">
                                    <asp:ListItem Text="care" />
                                    <asp:ListItem Text="careful" />
                                    <asp:ListItem Text="carefully" />
                                    <asp:ListItem Text="caringly" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">29. If the TV isn't loud enough, turn it _______ a little.</label>
                                <asp:RadioButtonList runat="server" ID="rb_29_a_little">
                                    <asp:ListItem Text="on" />
                                    <asp:ListItem Text="up" />
                                    <asp:ListItem Text="off" />
                                    <asp:ListItem Text="down" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">30. Please keep an ___ on the baby. It might fall down from the bed.</label>
                                <asp:RadioButtonList runat="server" ID="rb_30_on_the_baby">
                                    <asp:ListItem Text="ear" />
                                    <asp:ListItem Text="hand" />
                                    <asp:ListItem Text="ankle" />
                                    <asp:ListItem Text="eye" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">31. You don’t need to get upset _______ these little things.</label>
                                <asp:RadioButtonList runat="server" ID="rb_31_these_little_things">
                                    <asp:ListItem Text="about" />
                                    <asp:ListItem Text="for" />
                                    <asp:ListItem Text="of" />
                                    <asp:ListItem Text="off" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">32. This is the same car_______ ran into a coffee shop yesterday.</label>
                                <asp:RadioButtonList runat="server" ID="rb_32_ran_into_cofee">
                                    <asp:ListItem Text="what" />
                                    <asp:ListItem Text="who" />
                                    <asp:ListItem Text="that" />
                                    <asp:ListItem Text="whose" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">33. _____ he won a million dollars’ lottery; he gave up his job.</label>
                                <asp:RadioButtonList runat="server" ID="rb_33_he_won">
                                    <asp:ListItem Text="Though" />
                                    <asp:ListItem Text="However" />
                                    <asp:ListItem Text="Despite" />
                                    <asp:ListItem Text="As soon as" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">34. Hello, this is Simon. Could I ___________________ to Jane, please?</label>
                                <asp:RadioButtonList runat="server" ID="rb_34_to_jane">
                                    <asp:ListItem Text="say" />
                                    <asp:ListItem Text="tell" />
                                    <asp:ListItem Text="call" />
                                    <asp:ListItem Text="speak" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">35. My favorite ___________________ is dinner.</label>
                                <asp:RadioButtonList runat="server" ID="rb_35_is_dinner">
                                    <asp:ListItem Text="lunch" />
                                    <asp:ListItem Text="drink" />
                                    <asp:ListItem Text="food" />
                                    <asp:ListItem Text="meal" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">36. I'm afraid we have had to __________ the flight because of bad weather conditions.</label>
                                <asp:RadioButtonList runat="server" ID="rb_36_the_flight">
                                    <asp:ListItem Text="stop" />
                                    <asp:ListItem Text="cancel" />
                                    <asp:ListItem Text="take off" />
                                    <asp:ListItem Text="confirm" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">37. There was a terrible __________ on the A2 motorway this morning. Five vehicles were involved.</label>
                                <asp:RadioButtonList runat="server" ID="rb_37_on_the_A2">
                                    <asp:ListItem Text="scratch" />
                                    <asp:ListItem Text="incident" />
                                    <asp:ListItem Text="crash" />
                                    <asp:ListItem Text="damage" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">38. The religious wedding __________ takes place in a church.</label>
                                <asp:RadioButtonList runat="server" ID="rb_38_takes_place">
                                    <asp:ListItem Text="performance" />
                                    <asp:ListItem Text="marriage" />
                                    <asp:ListItem Text="ceremony" />
                                    <asp:ListItem Text="engagement" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">39. Researchers claim the new discovery is a major __________ in the fight against malaria.</label>
                                <asp:RadioButtonList runat="server" ID="rb_39_in_the_fight">
                                    <asp:ListItem Text="breakthrough" />
                                    <asp:ListItem Text="investigation" />
                                    <asp:ListItem Text="process" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">40. This used to be __________ part of the city, but since the old buildings were renovated it’s become a very fashionable area.</label>
                                <asp:RadioButtonList runat="server" ID="rb_40_part_of_city">
                                    <asp:ListItem Text="affluent" />
                                    <asp:ListItem Text="run down" />
                                    <asp:ListItem Text="trendy" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>

            <!-- Step 3 -->
            <div class="step step-3">
                <div class="form-container ins">
                    <h4>PART II READING AND WRITING</h4>
                    <ul class="ins_ul">
                        <li>Number of tasks: 2 </li>
                        <li>Questions 41-45 is worth 1 mark each. </li>
                        <li>Questions 46-48 is worth 2 mark each.</li>
                        <li>Question 49 is worth 4 marks</li>
                    </ul>

                    <label class="consent">
                        <input type="checkbox" id="ch_step_3" />
                        I confirm that I have read and understood all rules and instructions
                    </label>
                </div>
                <div class="form-container">

                    <h5 style="border-bottom: 1px solid lightgray; padding-bottom: 13px;">Read the text below and choose the correct answer. For each question, mark the correct letter A, B or C on your answer sheet</h5>

                    <h4>Learning English</h4>
                    <p>Today, millions of people want to learn or improve their English, but it is difficult to find the best method. Is it better to study in Australia, Britain or America or to study in your own country? The advantages of going to English speaking countries seem obvious. Firstly, you will be able to listen to the language the entire time you are in those countries. You will be surrounded by English wherever you go. Another advantage is that you have to speak in English if you are with other people who speak English. In Italy, it is always possible, in the class, to speak Italian if you want to but learning is slower</p>
                    <p>On the other hand, there are some advantages to staying at home to study. You don’t have to make big changes to your life. Additionally, it is also a lot cheaper than actually going to Britain but it is never possible to achieve the results derived from living in the UK. If you have a good teacher in your homeland, I think you can learn in a more concentrated way, rather than living in Britain without going to a school.</p>
                    <p>So, in conclusion, I think that if you have enough time and money, the best choice is to spend some time in an English-speaking country like Australia. This is not possible for most people, so being in their hometown could be a viable option for many. The most important thing to do in this situation is to maximise your opportunities: to speak only English in class and to try to use English whenever possible outside the class.</p>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">41. What is the article about?</label>
                                <asp:RadioButtonList ID="rb_about_article" runat="server" CssClass="radio-list">
                                    <asp:ListItem Text="How many people learn English"></asp:ListItem>
                                    <asp:ListItem Text="The best way to learn English"></asp:ListItem>
                                    <asp:ListItem Text="English speaking countries"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">42. What is one of the advantages of going to an English-speaking country to learn English?</label>
                                <asp:RadioButtonList ID="rb_advantage_eng_learning" runat="server" CssClass="radio-list">
                                    <asp:ListItem Text="You will have to speak English and not your language."></asp:ListItem>
                                    <asp:ListItem Text="There are no Italians in Australia"></asp:ListItem>
                                    <asp:ListItem Text="It is great to see places"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">43. What is one of the advantages of staying in your country to learn English?</label>
                                <asp:RadioButtonList ID="rb_advantage_stay_country" runat="server" CssClass="radio-list">
                                    <asp:ListItem Text="The teachers aren’t very good in the UK"></asp:ListItem>
                                    <asp:ListItem Text="Your life can continue more or less as it was before."></asp:ListItem>
                                    <asp:ListItem Text="You have to work too hard in Australia"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="radio_btn">

                                <label class="lbl_title">44. People who don’t have a lot of time and money resources?</label>
                                <asp:RadioButtonList ID="rb_time_money_resourse" runat="server" CssClass="radio-list">
                                    <asp:ListItem Text="Try to speak English in class more often"></asp:ListItem>
                                    <asp:ListItem Text="Go to Italy to learn English"></asp:ListItem>
                                    <asp:ListItem Text="Learn English in the UK"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="radio_btn">
                                <label class="lbl_title">45. What are the best methods to maximise opportunities for learning English in your hometown?</label>
                                <asp:RadioButtonList ID="rb_max_opportunity_for_english" runat="server" CssClass="radio-list">
                                    <asp:ListItem Text="To speak only English in class"></asp:ListItem>
                                    <asp:ListItem Text="To try to use English whenever possible outside the class."></asp:ListItem>
                                    <asp:ListItem Text="Both A and B"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <%-- <button type="button" class="btn btn-secondary prev-step">Previous</button>
                    <button type="button" class="btn btn-success">Submit</button>--%>
                </div>

                <div class="form-container">
                    <h5>Think about learning English in your country.</h5>
                    <h5>Answer the questions below in your own words.</h5>

                    <div class="row">
                        <div class="col-md-12">
                            <label class="lbl_title">46.What are the advantages and disadvantages of learning English in your country?</label>
                            <asp:TextBox runat="server" ID="txt_advantage" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">47. How did you learn English in your country? Outline different methods of learning</label>
                            <asp:TextBox runat="server" ID="txt_learn_english" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">48.Why did you choose to study English in Australia?</label>
                            <asp:TextBox runat="server" ID="txt_choose_to_study" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>
                        <div class="col-md-12">
                            <label class="lbl_title">49.Write a summary of the passage “Learning English” (80 words maximum – you will lose marks if you go over the word limit).</label>
                            <asp:TextBox runat="server" ID="txt_write_summary" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>
                    </div>
                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>

            </div>

            <div class="step step-4">
                <div class="form-container ins">
                    <h4>ORAL SKILLS & SPEAKING TASK</h4>
                    <ul class="ins_ul">
                        <li>Total tasks: 2 </li>
                        <li>Questions 50-55 is worth 1 mark each</li>
                        <li>Question 56 is worth 4 marks
                        </li>
                    </ul>

                    <h4>Speaking-Specific Rules:</h4>
                    <ul class="ins_ul">
                        <li>Microphone access mandatory  </li>
                        <li>Quiet environment recommended </li>
                        <li>Fixed recording time per response </li>
                    </ul>



                    <label class="consent">
                        <input type="checkbox" id="ch_step_4" />
                        I confirm that I have read and understood all rules and instructions
                    </label>
                </div>
                <div class="form-container">
                    <h4 style="border-bottom: 1px solid lightgray; padding-bottom: 13px;">PART III ORAL SKILLS</h4>

                    <h6 style="margin-top: 30px; margin-bottom: 10px">Listen to Gabi talking to Fiona. Then answer these questions</h6>
                    <audio controls="controls">
                        <source src="assets/image/Oral-test-audio-F2F-II_Interm_CD3-13-1.mp3" type="audio/mp3" />
                    </audio>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="lbl_title">50. Who is Gabi?</label>
                            <asp:TextBox runat="server" ID="txt_gabi" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">51. "Fiona is an actress for the TV drama 'Undercover'"</label>
                            <asp:RadioButtonList runat="server" ID="rb_fiona_actress">
                                <asp:ListItem Text="true" />
                                <asp:ListItem Text="false" />
                            </asp:RadioButtonList>
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">52. Where is Gabi’s boss, Max?</label>
                            <asp:TextBox runat="server" ID="txt_gabi_boss" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">53. Where is Fiona now?</label>
                            <asp:TextBox runat="server" ID="txt_fiona" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">54. When is Fiona’s second operation?</label>
                            <asp:TextBox runat="server" ID="txt_fiona_second" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">55.“Fiona’s mobile number is 07700800347”</label>
                            <asp:RadioButtonList ID="rb_fiona_mobile" runat="server" CssClass="radio-list">
                                <asp:ListItem Text="true"></asp:ListItem>
                                <asp:ListItem Text="false"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div class="col-md-12">
                            <label class="lbl_title">56. What has happened to Fiona and what is Gabi going to ask Max to do? (A detailed response is required</label>
                            <asp:TextBox runat="server" ID="txt_happened_to_fiona" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>

                    </div>
                    <%-- <button type="button" class="btn btn-secondary prev-step">Previous</button>
                    <button type="button" class="btn btn-success">Submit</button>--%>
                </div>

                <div class="form-container">
                    <h4 style="border-bottom: 1px solid lightgray; padding-bottom: 13px;">PART IV - SPEAKING TASK</h4>
                    <h5>Think about your reason/s to study English in Australia. Discuss your points with the assessor.</h5>

                    <ul>
                        <li>Start your talk with an introduction about yourself giving your name, the city you are from and your arrival in Melbourne.</li>
                        <li>Outline your past English learning experience up to your current level and learning English in Australia. Also talk about your Education background.</li>
                        <li>Try to give an extended response to give a better idea about your language skills.The trainer will be asking more questions for further understanding about your speaking skills.</li>
                        <li>Compare the education system in Australia with your country, referring to different levels of your education systems (primary school/ secondary school/ tertiary).</li>
                    </ul>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="card">
                                <div class="card-body" style="padding: 33px; text-align: center; border: 1px solid lightgray; margin-top: 20px">
                                    <section class="experiment" style="padding: 5px;">
                                        <img src="assets/img/mic.png" width="62px" alt="Microphone Image" />
                                        <br />
                                        <br />
                                        <p>Record Your Audio to Give Answer</p>
                                        <p>Press a button below to record your answer.</p>

                                        <button id="start-recording" class="btn btn-primary"><i class="fa fa-microphone" style="margin-right: 7px"></i>Start</button>
                                        <button id="stop-recording" disabled class="btn btn-danger"><i class="fa fa-stop" style="margin-right: 7px"></i>Stop & Save</button>
                                        <button id="retry-recording" disabled class="btn btn-warning">
                                            <i class="fa fa-retweet" style="margin-right: 7px"></i>Retry
                                        </button>
                                    </section>

                                    <section class="experiment">
                                        <div id="audios-container"></div>
                                        <div id="message-container"></div>
                                    </section>
                                </div>
                                <asp:HiddenField ID="hdn_audio_file" runat="server" />

                            </div>
                        </div>
                    </div>

                    <div class="btn_step">
                        <button type="button" class="btn btn-secondary prev-step">Previous</button>
                        <asp:Button Text="Submit" ID="btn_submit" OnClientClick="return validateStep4();" OnClick="btn_submit_Click" CssClass="btn btn-success" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="tabWarning" style="display: none; position: fixed; top: 0; left: 0; width: 100%; background: #ffdddd; color: #900; padding: 10px; text-align: center; font-weight: bold; z-index: 9999;">
        ⚠ Do not switch tabs. This action is monitored.
    </div>

    <%--    </div>
    </div>--%>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">

    <script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <!-- Add FontAwesome for refresh icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script>
        function toggleNationality() {
            var ddl = document.getElementById('<%= ddl_nationality.ClientID %>');
             var divOther = document.getElementById('divOtherNationality');

             if (ddl.value === "Other") {
                 divOther.style.display = "block";
             } else {
                 divOther.style.display = "none";
             }
         }

         // Run on page load (for edit mode / postback)
         document.addEventListener("DOMContentLoaded", function () {
             toggleNationality();
         });
    </script>
    <script>
        let signaturePad = null;
        let lastNonEmptyDataUrl = "";
        let isResizing = false;
        let userCleared = false;
        let pendingSave = false;
        let countdown = null;
        let captchaText = '';

        function debounce(fn, wait) {
            let t;
            return function(...args) {
                clearTimeout(t);
                t = setTimeout(() => fn.apply(this, args), wait);
            };
        }

        function safeSetHidden(val) {
            $('#<%= hdnSignature.ClientID %>').val(val || "");
        }

        /* Create signature pad */
        function createSignaturePadInstance(canvas, savedData) {
            if (signaturePad) signaturePad.off();

            signaturePad = new SignaturePad(canvas, {
                minWidth: 1,
                maxWidth: 3,
                penColor: "#000",
                backgroundColor: "rgba(0,0,0,0)"
            });

            const ctx = signaturePad._ctx;
            if (ctx) {
                ctx.lineCap = "round";
                ctx.lineJoin = "round";
            }

            if (savedData && savedData.length) {
                try { signaturePad.fromData(savedData); } catch(e) {}
            }

            signaturePad.onEnd = function() {
                userCleared = false;
                saveToHidden().catch(()=>{});
            };
        }

        /* Initialize pad */
        function initPad() {
            const canvas = document.getElementById("signatureCanvas");
            if (!canvas) return;

            let savedData = signaturePad && !signaturePad.isEmpty() ? signaturePad.toData() : null;
            resizeCanvas(savedData);

            // clear button
            $("#clearBtn").off("click").on("click", function() {
                if (!signaturePad) return;
                signaturePad.clear();
                userCleared = true;
                lastNonEmptyDataUrl = "";
                safeSetHidden("");
                $("#signaturePreview").hide();
            });

            // Prevent scrolling while drawing
            ["touchstart","touchmove","touchend"].forEach(evt => {
                canvas.addEventListener(evt, function(e) { e.preventDefault(); }, { passive: false });
        });

        // sync periodically
        if (!window.signatureSyncInterval) {
            window.signatureSyncInterval = setInterval(()=> saveToHidden().catch(()=>{}), 1500);
        }

        window.addEventListener("resize", debounce(()=> resizeCanvas(), 200));
        window.addEventListener("orientationchange", ()=> resizeCanvas());
        }

        /* Robust resize */
        function resizeCanvas(savedData = null) {
            const canvas = document.getElementById("signatureCanvas");
            if (!canvas) return;

            isResizing = true;
            let data = savedData || (signaturePad && !signaturePad.isEmpty() ? signaturePad.toData() : null);

            // Responsive width/height
            const parent = canvas.parentElement;
            const cssWidth = parent.clientWidth || 300;
            const cssHeight = parent.clientHeight || 250;

            const ratio = Math.max(window.devicePixelRatio || 1, 1);

            // Internal resolution = CSS size * DPR
            canvas.width = cssWidth * ratio;
            canvas.height = cssHeight * ratio;

            canvas.style.width = cssWidth + "px";
            canvas.style.height = cssHeight + "px";

            const ctx = canvas.getContext("2d");
            ctx.setTransform(1, 0, 0, 1, 0, 0); 
            ctx.scale(ratio, ratio); 

            createSignaturePadInstance(canvas, data);

            setTimeout(() => {
                isResizing = false;
            pendingSave = false;
            saveToHidden().catch(() => {});
        }, 50);
        }

        /* Export with white background */
        function exportSignatureAsPngWithWhiteBg() {
            return new Promise((resolve) => {
                if (!signaturePad || signaturePad.isEmpty()) return resolve("");

            const origCanvas = document.getElementById("signatureCanvas");
            const ratio = Math.max(window.devicePixelRatio || 1, 1);

            const tmp = document.createElement("canvas");
            tmp.width = origCanvas.width;
            tmp.height = origCanvas.height;

            const ctx = tmp.getContext("2d");

            // White background
            ctx.fillStyle = "#fff";
            ctx.fillRect(0, 0, tmp.width, tmp.height);

            // Fix DPR scaling
            ctx.drawImage(origCanvas, 0, 0, tmp.width, tmp.height);

            resolve(tmp.toDataURL("image/png"));
        });
        }

        /* Save to hidden field */
        function saveToHidden(forceBlank = false) {
            return new Promise(async (resolve) => {
                if (!signaturePad) return resolve();
            if (isResizing) { pendingSave = true; return resolve(); }
            if (pendingSave) pendingSave = false;

            if (!signaturePad.isEmpty()) {
                const dataUrl = await exportSignatureAsPngWithWhiteBg();
                lastNonEmptyDataUrl = dataUrl;
                safeSetHidden(dataUrl);
                $("#signaturePreview").attr("src", dataUrl).show();
                return resolve();
            } else {
                if (userCleared || forceBlank) {
                    lastNonEmptyDataUrl = "";
                    safeSetHidden("");
                    $("#signaturePreview").hide();
                } else {
                    if (lastNonEmptyDataUrl) {
                        safeSetHidden(lastNonEmptyDataUrl);
                        $("#signaturePreview").attr("src", lastNonEmptyDataUrl).show();
                    } else {
                        safeSetHidden("");
                        $("#signaturePreview").hide();
                    }
                }
                return resolve();
            }
        });
        }

        /* CAPTCHA Functions */
      

        /* CAPTCHA Functions (IMAGE BASED) */
        /* MATH CAPTCHA (ADD / SUBTRACT) */
        function generateCaptcha() {
            let num1 = Math.floor(Math.random() * 9) + 1;   // 1–9
            let num2 = Math.floor(Math.random() * 9) + 1;   // 1–9
            let operator = Math.random() > 0.5 ? '+' : '-';

            // avoid negative result
            if (operator === '-' && num2 > num1) {
                let tmp = num1;
                num1 = num2;
                num2 = tmp;
            }

            let question = num1 + ' ' + operator + ' ' + num2;
            let answer = operator === '+' ? (num1 + num2) : (num1 - num2);

            // store answer
            $('#<%= hdnCaptcha.ClientID %>').val(answer.toString());

            drawCaptchaImage(question);
        }

        function drawCaptchaImage(text) {
            const canvas = document.getElementById('captchaCanvas');
            if (!canvas) return;

            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            // background
            ctx.fillStyle = '#f9f9f9';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // text
            ctx.font = '20px Arial';
            ctx.fillStyle = '#333';
            ctx.setTransform(1, -0.1, 0.1, 1, 0, 0);
            ctx.fillText(text + ' = ?', 10, 25);
            ctx.setTransform(1, 0, 0, 1, 0, 0);

            // noise
            for (let i = 0; i < 3; i++) {
                ctx.strokeStyle = '#aaa';
                ctx.beginPath();
                ctx.moveTo(Math.random() * canvas.width, Math.random() * canvas.height);
                ctx.lineTo(Math.random() * canvas.width, Math.random() * canvas.height);
                ctx.stroke();
            }
        }

        function refreshCaptcha() {
            generateCaptcha();
            $('#<%= txtCaptcha.ClientID %>').val('');
            $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid #ccc');
        }

        function validateCaptcha() {
            const userInput = $('#<%= txtCaptcha.ClientID %>').val().trim();
            const correctAnswer = $('#<%= hdnCaptcha.ClientID %>').val();

            if (userInput === '') {
                $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid red');
                return { isValid: false, message: 'CAPTCHA answer is required' };
            }

            if (userInput !== correctAnswer) {
                $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid red');
                refreshCaptcha();
                return { isValid: false, message: 'Incorrect CAPTCHA answer' };
            }

            $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid #ccc');
            return { isValid: true, message: '' };
        }


        function validateCaptcha() {
            const userInput = $('#<%= txtCaptcha.ClientID %>').val().trim();
            const correctCaptcha = $('#<%= hdnCaptcha.ClientID %>').val();

            if (userInput === '') {
                $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid red');
                return { isValid: false, message: 'CAPTCHA code is required' };
            }

            if (userInput !== correctCaptcha) {
                $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid red');
                refreshCaptcha();
                return { isValid: false, message: 'Invalid CAPTCHA code. Please try again.' };
            }

            $('#<%= txtCaptcha.ClientID %>').css('border', '1px solid #ccc');
            return { isValid: true, message: '' };
        }
        function validateStep2() {
            let errors = [];

            if (!$("#ch_step_2").is(":checked")) {
                errors.push("You must confirm that you have read and understood Step-2 rules");
            } else {
                $("#err_step_2").text("");
            }

            if (errors.length > 0) {
                alert("Please fix the following errors:\n\n- " + errors.join("\n- "));
                return false;
            }

            return true;
        }
        function validateStep3() {
            let errors = [];

            if (!$("#ch_step_3").is(":checked")) {
                errors.push("You must confirm that you have read and understood Step-3 rules")
            } else {
                $("#err_step_3").text("");
            }

            if (errors.length > 0) {
                alert("Please fix the following errors:\n\n- " + errors.join("\n- "));
                return false;
            }

            return true;
        }
        function validateStep4() {
            let errors = [];

            if (!$("#ch_step_4").is(":checked")) {
                errors.push("You must confirm that you have read and understood Step-4 rules")
            } else {
                $("#err_step_4").text("");
            }

            if (errors.length > 0) {
                alert("Please fix the following errors:\n\n- " + errors.join("\n- "));
                return false;
            }

            return true;
        }


        /* Validation */
        function validateStep1() {
            let errors = [];

            function markError(selector, message) {
                let el = $(selector);
                if (!el.val() || el.val().trim() === "") {
                    el.css("border", "1px solid red");
                    errors.push(message);
                } else {
                    el.css("border", "1px solid #ccc");
                }
            }
            if (!$("#ch_step_1").is(":checked")) {
                errors.push("You must confirm that you have read and understood Step-1 rules");
              
            } else {
                $("#err_step_1").text("");
            }

            markError("#<%= txt_first_name.ClientID %>", "First Name is required");
            markError("#<%= txt_l_name.ClientID %>", "Last Name is required");
            markError("#<%= txt_sd_id.ClientID %>", "Student ID is required");
            markError("#<%= txt_dob.ClientID %>", "Date of Birth is required");
            markError("#<%= txt_passport.ClientID %>", "Passport Number is required");

            let email = $("#<%= txt_email.ClientID %>").val()?.trim() || "";

            if (email === "") {
                errors.push("Email is required");
                $("#<%= txt_email.ClientID %>").css("border", "1px solid red");
            } else {
                $("#<%= txt_email.ClientID %>").css("border", "1px solid #ccc");
            }

            let nationality = $("#<%= ddl_nationality.ClientID %>").val();
            let otherNationality = $("#<%= txt_other_nationality.ClientID %>").val()?.trim() || "";

            if (nationality === "") {
                errors.push("Nationality is required");
                $("#<%= ddl_nationality.ClientID %>").css("border", "1px solid red");
            }
            else if (nationality === "Other") {

                if (otherNationality === "") {
                    errors.push("Please enter nationality");
                    $("#<%= txt_other_nationality.ClientID %>").css("border", "1px solid red");
                } else {
                    $("#<%= txt_other_nationality.ClientID %>").css("border", "1px solid #ccc");
                    nationality = otherNationality;
                }

                $("#<%= ddl_nationality.ClientID %>").css("border", "1px solid #ccc");
            }
            else {
                $("#<%= ddl_nationality.ClientID %>").css("border", "1px solid #ccc");
            }

        let studentId = $("#<%= txt_sd_id.ClientID %>").val()?.trim() || "";
            let idRegex = /^(13|14|NW)[A-Za-z0-9]{6}$/;
            if (studentId && !idRegex.test(studentId)) {
                errors.push("Student ID must start with 13, 14, or NW and be 8 characters long.");
                $("#<%= txt_sd_id.ClientID %>").css("border", "1px solid red");
            }

            if (!signaturePad || signaturePad.isEmpty()) {
                if (!lastNonEmptyDataUrl) {
                    errors.push("Signature is required");
                    $("#signatureCanvas").css("border", "1px solid red");
                } else {
                    $("#signatureCanvas").css("border", "1px solid #ccc");
                    safeSetHidden(lastNonEmptyDataUrl);
                }
            } else {
                $("#signatureCanvas").css("border", "1px solid #ccc");
                saveToHidden().catch(()=>{});
            }

            // CAPTCHA Validation - ADD THIS
            const captchaValidation = validateCaptcha();
            if (!captchaValidation.isValid) {
                errors.push(captchaValidation.message);
            }

             

            if (errors.length > 0) {
                alert("Please fix the following errors:\n\n- " + errors.join("\n- "));
                return false;
            }
            return true;
        }

        /* Step navigation + Timer */
        function stepNav(cur, dir) {
            const next = dir === 'next' ? cur.next(".step") : cur.prev(".step");
            cur.hide();
            next.show();
            $("html,body").scrollTop(0);

            if (next.hasClass("step-2") && !countdown) {
                $("#timer-container").show();
                startTimer();
            }

            if (next.hasClass("step-2")) {
                const signatureData = $('#<%= hdnSignature.ClientID %>').val();
                if (signatureData) $("#signaturePreview").attr("src", signatureData).show();
                else $("#signaturePreview").hide();
            }

            if (next.hasClass("step-1")) {
                setTimeout(() => {
                    initPad();
                const current = $('#<%= hdnSignature.ClientID %>').val();
                if (current) lastNonEmptyDataUrl = current;
                saveToHidden().catch(()=>{});
            }, 100);
        }
        }

        function startTimer() {
            let duration = 45 * 60;
            const display = document.getElementById("timer");

            countdown = setInterval(() => {
                let minutes = Math.floor(duration / 60);
            let seconds = duration % 60;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            if (display) display.textContent = `${minutes}:${seconds}`;

            if (duration <= 0) {
                clearInterval(countdown);
                alert("Time is up! Your data will be submitted automatically.");
                autoSubmitForm();
            }
            duration--;
        }, 1000);
        }

        function autoSubmitForm() {
            saveToHidden(userCleared).then(() => {
                __doPostBack('<%= btn_submit.ClientID %>', '');
        });
        }

        /* Init on page ready */
        $(function() {
            // Initialize CAPTCHA
            $(function () {

                /* ---------------- CAPTCHA ---------------- */
                generateCaptcha();

                $('#refreshCaptcha').off('click').on('click', function (e) {
                    e.preventDefault();
                    refreshCaptcha();
                });

                $('#<%= txtCaptcha.ClientID %>').on('input', function () {
                    $(this).css('border', '1px solid #ccc');
                });

                /* ---------------- DROPDOWN ---------------- */
                try {
                    $('#<%= ddl_nationality.ClientID %>').select2({
                        width: '100%',
                        placeholder: "Select Nationality"
                    });
                } catch (e) { }

                /* ---------------- SIGNATURE ---------------- */
                initPad();

                /* ---------------- NEXT STEP HANDLER ---------------- */
                $(".next-step").off("click").on("click", function (e) {
                    e.preventDefault();

                    let $currentStep = $(this).closest(".step");

                    /* -------- STEP 1 -------- */
                    if ($currentStep.hasClass("step-1")) {

                        if (validateStep1()) {
                            saveToHidden().then(function () {
                                stepNav($currentStep, "next");
                            });
                        }
                    }

                        /* -------- STEP 2 -------- */
                    else if ($currentStep.hasClass("step-2")) {

                        if (validateStep2()) {
                            stepNav($currentStep, "next");
                        }
                    }

                        /* -------- STEP 3 -------- */
                    else if ($currentStep.hasClass("step-3")) {

                        if (validateStep3()) {
                            stepNav($currentStep, "next");
                        }
                    }
                });

            });


            // Previous step button handler
            $(".prev-step").off("click").on("click", function(e) {
                e.preventDefault();
                saveToHidden().then(() => stepNav($(this).closest(".step"), "prev"));
            });
        });
    </script>

    <script>
        // Audio recording code (unchanged)
        var mediaRecorder;
        var audiosContainer = document.getElementById('audios-container');
        var messageContainer = document.getElementById('message-container');
        var isRecording = false;

        document.querySelector('#start-recording').onclick = function () {
            this.disabled = true;
            isRecording = true;
            captureUserMedia({ audio: true }, onMediaSuccess, onMediaError);
        };

        document.querySelector('#stop-recording').onclick = function () {
            this.disabled = true;
            mediaRecorder.stop();
            mediaRecorder.stream.getTracks().forEach(track => track.stop());
            isRecording = false;

            document.querySelector('#start-recording').disabled = false;
            document.querySelector('#retry-recording').disabled = false;
        };

        document.querySelector('#retry-recording').onclick = function () {
            if (mediaRecorder) {
                mediaRecorder.stop();
                mediaRecorder.stream.getTracks().forEach(track => track.stop());
            }
            isRecording = false;

            audiosContainer.innerHTML = '';
            messageContainer.innerHTML = '';
            document.getElementById('<%= hdn_audio_file.ClientID %>').value = '';

            document.querySelector('#start-recording').disabled = false;
            document.querySelector('#stop-recording').disabled = true;
            this.disabled = true;
        };

        function captureUserMedia(mediaConstraints, successCallback, errorCallback) {
            navigator.mediaDevices.getUserMedia(mediaConstraints).then(successCallback).catch(errorCallback);
        }

        function onMediaSuccess(stream) {
            var audio = document.createElement('audio');
            audio.controls = true;
            audio.muted = true;
            audio.srcObject = stream;
            audio.play();

            audiosContainer.appendChild(audio);
            audiosContainer.appendChild(document.createElement('hr'));

            mediaRecorder = new MediaStreamRecorder(stream);
            mediaRecorder.stream = stream;

            mediaRecorder.mimeType = 'audio/mp3';
            mediaRecorder.audioBitsPerSecond = 128000;

            mediaRecorder.ondataavailable = function (blob) {
                audiosContainer.innerHTML = '';

                var audioElement = document.createElement('audio');
                audioElement.controls = true;
                audioElement.src = URL.createObjectURL(blob);
                audiosContainer.appendChild(audioElement);

                var uniqueFileName = generateUniqueFileName() + '.mp3';
                document.getElementById('<%= hdn_audio_file.ClientID %>').value = uniqueFileName;

                var formData = new FormData();
                formData.append('audio', blob, uniqueFileName);
                formData.append('hdn_audio_file', uniqueFileName);

                fetch('EPT_Test.aspx', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (!response.ok) throw new Error('Network response was not ok');
                return response.text();
            })
                .then(result => {
                    var fileName = document.getElementById('<%= hdn_audio_file.ClientID %>').value;
                displayMessage(fileName + ' saved successfully!', 'green');
                console.log('Success:', result);
            })
            .catch(error => {
                displayMessage('Error: issue storing recorded audio', 'red');
            console.error('Error:', error);
            });
            };

            var timeInterval = 6000 * 1000; // 10 minutes
            mediaRecorder.start(timeInterval);

            document.querySelector('#stop-recording').disabled = false;
            }

            function onMediaError(e) {
                console.error('Media error:', e);
            }

            function generateUniqueFileName() {
                return 'audio_' + ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, c =>
                    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
                );
            }

            function displayMessage(message, color) {
                messageContainer.innerHTML = `<p style="color: ${color};">${message}</p>`;
            }

            window.onbeforeunload = function () {
                document.querySelector('#start-recording').disabled = false;
            };

            // ASP.NET Button Check
            document.getElementById('<%= btn_submit.ClientID %>').addEventListener('click', function (e) {
                if (isRecording) {
                    e.preventDefault();
                    alert("Recording is still running. Please stop the recording first.");
                    return false;
                }

                console.log("Audio ready, proceeding with submit...");
            });
    </script>
    <script>
        // Disable right click
        document.addEventListener('contextmenu', function (e) {
            e.preventDefault();
        });

        // Disable key combinations
        document.addEventListener('keydown', function (e) {

            // F12
            if (e.keyCode === 123) {
                e.preventDefault();
                return false;
            }

            // Ctrl + Shift + I / J / C
            if (e.ctrlKey && e.shiftKey && 
                (e.keyCode === 73 || e.keyCode === 74 || e.keyCode === 67)) {
                e.preventDefault();
                return false;
            }

            // Ctrl + U (view source)
            if (e.ctrlKey && e.keyCode === 85) {
                e.preventDefault();
                return false;
            }
        });
    </script>


    <script type="text/javascript">
        document.addEventListener("visibilitychange", function () {
            // 1. Check if the tab is hidden
            if (document.visibilityState === 'hidden') {
            
                // 2. Check if the user is NOT in Step 1
                // We check if the element with class 'step-1' is currently hidden (display: none)
                var isStep1Visible = $('.step-1').is(':visible');

                if (!isStep1Visible) {
                    console.log("Tab switch detected during exam. Submitting...");
                
                    var btn = document.getElementById('<%= btn_submit.ClientID %>');
                  if (btn) {
                      // Only trigger if we aren't in the info-gathering stage
                      btn.click();
                  }
              } else {
                  console.log("Tab switch ignored because user is still in Step 1.");
              }
          }
      });
    </script>





    <script>
        window.useThisGithubPath = 'streamproc/MediaStreamRecorder';
    </script>
    <script src="https://cdn.webrtc-experiment.com/commits.js" async></script>

</asp:Content>
