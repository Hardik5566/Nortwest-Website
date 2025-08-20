<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EPT_Test.aspx.cs" Inherits="EPT_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    English Test
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
                    <h1>English Test</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
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
                <div class="form-container">
                    <h4>Student Instructions</h4>
                    <p class="instruction">This Placement Test has been designed to help us in identifying your language skills and to determine whether the level of language you possess, is appropriate to the intended VET qualification. This test will also determine if you meet the foundation skills required within each unit of competency contained with the intended qualification and the level of language complexity. The test will be timed to 45 minutes.</p>
                    <p class="instruction">Welcome to the Nortwest’s formal English test. Please fill out the below required information. Please contact admissions@nortwest.edu.au if you need help or have questions. Thank you and good luck!</p>
                </div>

                <div class="form-container">
                    <h4>Student Details</h4>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="lbl_title">First Name</label>
                            <asp:TextBox runat="server" ID="txt_f_name" CssClass="form-control" />
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
                            <label class="lbl_title">Nationality:</label>
                            <asp:DropDownList ID="ddl_nationality" runat="server" data-live-search="true" CssClass="form-control" aria-required="true" aria-invalid="false">
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
                        <div class="col-md-4">
                            <label class="lbl_title">Date of Birth</label>
                            <asp:TextBox runat="server" ID="txt_dob" TextMode="Date" CssClass="form-control" />
                        </div>
                        <div class="col-md-4">
                            <label class="lbl_title">Passport No</label>
                            <asp:TextBox runat="server" ID="txt_passport" CssClass="form-control" />
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6">
                            <label class="lbl_title">Student Signature</label>


                            <img id="clearBtn" style="width: 22px; float: right; margin-bottom: 8px;" src="assets/img/eraser.png" />

                            <asp:HiddenField ID="hdnSignature" runat="server" />

                            <canvas id="signatureCanvas" style="border: 1px solid rgb(223 223 223); width: 100%; height: 250px; touch-action: none; background-color: white;"></canvas>

                        </div>
                    </div>
                    <div class="btn_step">
                        <button type="button" class="btn btn-primary next-step">Next</button>
                    </div>
                </div>
            </div>

            <!-- Step 2 -->
            <div class="step step-2">


                <div class="form-container">
                    <h4>PART I GRAMMAR AND VOCABULARY</h4>

                    <p>Questions 1-40 carries 0.5 mark</p>

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
                <div class="form-container">
                    <h4>PART II READING AND WRITING</h4>
                    <h5 style="border-bottom: 1px solid lightgray; padding-bottom: 13px;">Read the text below and choose the correct answer. For each question, mark the correct letter A, B or C on your answer sheet</h5>

                    <h6 style="margin-top: 30px; margin-bottom: 10px">Questions 41-45 is worth 1 mark each.</h6>
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
                    <h5>Answer the questions below in your own words. Questions 46-48 is worth 2 mark each, Question 49 is worth 4 marks</h5>

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
                <div class="form-container">
                    <h4 style="border-bottom: 1px solid lightgray; padding-bottom: 13px;">PART III ORAL SKILLS</h4>

                    <h6 style="margin-top: 30px; margin-bottom: 10px">Listen to Gabi talking to Fiona. Then answer these questions</h6>
                    <audio controls="controls">
                        <source src="assets/image/Oral-test-audio-F2F-II_Interm_CD3-13-1.mp3" type="audio/mp3" />
                    </audio>
                    <h6 style="margin-top: 30px; margin-bottom: 10px">Questions 50-55 is worth 1 mark each, Question 56 is worth 4 marks</h6>
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
                                <div class="card-body" style="padding: 60px; text-align: center; border: 1px solid lightgray; margin-top: 20px">
                                    <section class="experiment" style="padding: 5px;">
                                        <img src="assets/img/mic.png" width="62px" alt="Microphone Image" />
                                        <br />
                                        <br />
                                        <p>Record Your Audio to Give Answer</p>
                                        <p>Press a button below to record your answer.</p>

                                        <button id="start-recording" class="btn btn-primary"><i class="fa fa-microphone" style="margin-right: 7px"></i>Start</button>
                                        <button id="stop-recording" disabled class="btn btn-danger"><i class="fa fa-stop" style="margin-right: 7px"></i>Stop</button>
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
                        <asp:Button Text="Submit" ID="btn_submit" OnClientClick="saveSignature()" OnClick="btn_submit_Click" CssClass="btn btn-success" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">


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
    </script>

    <script>
        var mediaRecorder;
        var audiosContainer = document.getElementById('audios-container');
        var messageContainer = document.getElementById('message-container');

        document.querySelector('#start-recording').onclick = function () {
            this.disabled = true;
            captureUserMedia({ audio: true }, onMediaSuccess, onMediaError);
        };

        document.querySelector('#stop-recording').onclick = function () {
            this.disabled = true;
            mediaRecorder.stop();
            mediaRecorder.stream.getTracks().forEach(track => track.stop());

            document.querySelector('#start-recording').disabled = false;
            document.querySelector('#retry-recording').disabled = false; // Enable retry button
        };

        document.querySelector('#retry-recording').onclick = function () {
            // Stop and clear the current recording
            mediaRecorder.stop();
            mediaRecorder.stream.getTracks().forEach(track => track.stop());

            // Reset UI
            audiosContainer.innerHTML = '';
            messageContainer.innerHTML = '';
            document.getElementById('<%= hdn_audio_file.ClientID %>').value = '';

            // Enable start recording again
            document.querySelector('#start-recording').disabled = false;
            document.querySelector('#stop-recording').disabled = true;
            this.disabled = true; // Disable Retry button until new recording
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

            // Adjust the bitrate and format for MP3
            mediaRecorder.mimeType = 'audio/mp3';
            mediaRecorder.audioBitsPerSecond = 128000; // Set the bitrate to 128 kbps for MP3

            mediaRecorder.ondataavailable = function (blob) {
                // Remove any existing audio elements
                audiosContainer.innerHTML = '';

                var audioElement = document.createElement('audio');
                audioElement.controls = true;
                audioElement.src = URL.createObjectURL(blob);
                audiosContainer.appendChild(audioElement);

                // Generate a unique filename
                var uniqueFileName = generateUniqueFileName() + '.mp3';

                // Update the hidden field value
                document.getElementById('<%= hdn_audio_file.ClientID %>').value = uniqueFileName;

                // Upload the recorded audio
                var formData = new FormData();
                formData.append('audio', blob, uniqueFileName);
                formData.append('hdn_audio_file', uniqueFileName);

                fetch('EPT_Test.aspx', { // Ensure this points to your upload handling page
                    method: 'POST',
                    body: formData
                })
                 .then(response => {
                     if (!response.ok) {
                         throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(result => {
            // Get the value of the hidden field
            var fileName = document.getElementById('<%= hdn_audio_file.ClientID %>').value;
        displayMessage(fileName + ' saved successfully!', 'green');
        console.log('Success:', result);
        })
                .catch(error => {
                    displayMessage('Error: issue storing recorded audio', 'red');
        console.error('Error:', error);
        });
        };

        var timeInterval = 6000 * 1000; // Default to 10 minutes
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
    </script>

    <script>
        window.useThisGithubPath = 'streamproc/MediaStreamRecorder';
    </script>
    <script src="https://cdn.webrtc-experiment.com/commits.js" async></script>


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

    </script>

    <script>
        $(document).ready(function () {
            // ---------------- Timer Setup ----------------
            var totalSeconds = 45 * 60; // 45 minutes in seconds
            var timerDisplay = document.getElementById("timer");
            var countdown; // will hold the interval ID once the timer starts

            // Update the timer display (e.g., "45:00")
            function updateTimerDisplay() {
                var minutes = Math.floor(totalSeconds / 60);
                var seconds = totalSeconds % 60;
                timerDisplay.textContent =
                    (minutes < 10 ? "0" : "") + minutes + ":" +
                    (seconds < 10 ? "0" : "") + seconds;
            }

            // Start the timer countdown
            function startTimer() {
                countdown = setInterval(function () {
                    if (totalSeconds > 0) {
                        totalSeconds--;
                        updateTimerDisplay();
                    } else {
                        clearInterval(countdown);
                        alert("Your time is up! The form is being submitted.");
                        document.getElementById("<%= btn_submit.ClientID %>").click();
                    }
                }, 1000);
            }

            // Initialize the timer display
            updateTimerDisplay();

            // ---------------- Validation Functions ----------------
            function validateField(selector, errorMessage, errors) {
                var field = $(selector);
                if (field.val().trim() === "") {
                    errors.push(errorMessage);
                    field.css("border", "1px solid #ff0000a6");
                } else {
                    field.css("border", "1px solid #ccc");
                }
            }
            function validateNationality(selector, errorMessage, errors) {
                var field = $(selector);
                var value = field.val();

                // Get the actual select2 visible element
                var select2Element = field.siblings('.select2').find('.select2-selection');

                if (value === "" || value === null) {
                    errors.push(errorMessage);
                    select2Element.css({
                        "border": "1px solid #ff0000a6",
                        "border-radius": "4px"
                    });
                } else {
                    select2Element.css({
                        "border": "1px solid #ccc",
                        "border-radius": "4px"
                    });
                }
            }
            $("#<%= ddl_nationality.ClientID %>").on("change", function () {
                var select2Element = $(this).siblings('.select2').find('.select2-selection');
                if ($(this).val() !== "") {
                    select2Element.css({
                        "border": "1px solid #ccc",
                        "border-radius": "4px"
                    });
                }
            });

            function validateEmail(selector, errorMessage, errors) {
                var field = $(selector);
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (field.val().trim() === "") {
                    errors.push("Email is required");
                    field.css("border", "1px solid #ff0000a6");
                } else if (!emailPattern.test(field.val().trim())) {
                    errors.push(errorMessage);
                    field.css("border", "1px solid #ff0000a6");
                } else {
                    field.css("border", "1px solid #ccc");
                }
            }
            function validateNationality(selector, errorMessage, errors) {
                var field = $(selector);
                var value = field.val();

                // Get the actual select2 visible element
                var select2Element = field.siblings('.select2').find('.select2-selection');

                if (value === "" || value === null) {
                    errors.push(errorMessage);
                    select2Element.css({
                        "border": "1px solid #ff0000a6",
                        "border-radius": "4px"
                    });
                } else {
                    select2Element.css({
                        "border": "1px solid #ccc",
                        "border-radius": "4px"
                    });
                }
            }
            $("#<%= ddl_nationality.ClientID %>").on("change", function () {
                var select2Element = $(this).siblings('.select2').find('.select2-selection');
                if ($(this).val() !== "") {
                    select2Element.css({
                        "border": "1px solid #ccc",
                        "border-radius": "4px"
                    });
                }
            });

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
                validateField("#<%= txt_f_name.ClientID %>", "First Name is required", errors);
                validateField("#<%= txt_l_name.ClientID %>", "Last Name is required", errors);
                validateEmail("#<%= txt_email.ClientID %>", "Enter a valid Email Address", errors);
                validateField("#<%= txt_sd_id.ClientID %>", "Student ID Number is required", errors);
                validateNationality("#<%= ddl_nationality.ClientID %>", "Please select a nationality.", errors);
                validateField("#<%= txt_dob.ClientID %>", "Date of Birth is required", errors);
                validateField("#<%= txt_passport.ClientID %>", "Passport Number is required", errors);

                var studentId = $("#<%= txt_sd_id.ClientID %>").val().trim();
                var idRegex = /^(13|14|NW)[A-Za-z0-9]{6}$/; // starts with 13, 14, or NW + 6 more chars = 8 total

                if (!idRegex.test(studentId)) {
                    $("#<%= txt_sd_id.ClientID %>").css("border-color", "red");
                    errors.push("Student ID must start with 13, 14, or NW and be 8 characters long.");
                } else {
                    $("#<%= txt_sd_id.ClientID %>").css("border-color", "");
                }

                if (signaturePad.isEmpty()) {
                    errors.push("Signature is required.");
                    $("#signatureCanvas").css("border", "1px solid red");
                } else {
                    $("#signatureCanvas").css("border", "1px solid #dfdfdf");
                    saveSignature(); // Save the drawn signature to hidden field
                }

                if (errors.length > 0) {
                    alert("Please fix the following errors:\n\n- " + errors.join("\n- "));
                    return; // Do not proceed if validation fails
                }

                // If validation passes, hide the current step and show the next one
                currentStep.hide();
                nextStep.show();

                $("html, body").animate({ scrollTop: 550 }, "fast");

                // If the next step is "step-2", show the timer container and start the timer
                if (nextStep.hasClass("step-2") && !countdown) {
                    $("#timer-container").show();
                    startTimer();
                }
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
    <script src="assets/js/select2.min.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize select2 on the dropdown by using ClientID
            $('#<%= ddl_nationality.ClientID %>').select2({
                 width: '100%' // Optional, adjust the width as needed
             });
         });

    </script>

</asp:Content>
