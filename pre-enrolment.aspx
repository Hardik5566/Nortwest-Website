<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pre-enrolment.aspx.cs" Inherits="pre_enrolment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Pre Enrolment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media (min-width: 1200px) {
            .container {
                width: 1170px;
            }
        }

        .sidebar-item {
            background-color: white;
            padding: 15px;
        }

        .panel-visa ul li {
            font-size: 15px;
            font-weight: 500;
            line-height: 45px;
        }

        .panel-heading {
            background-color: steelblue;
        }

        .panel-title {
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        .general_info h2 {
            color: #2c3e50;
            margin-top: 20px;
        }

        .general_info p {
            margin: 10px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Pre Enrolment</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Pre Enrolment</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="category-area bg-gray default-padding">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Enrolment Process</h2>
                        <p>
                            Pre-Enrol now to show your expression of interest.
                        </p>
                    </div>
                </div>
            </div>
            <div class="category-items">
                <div class="row">
                    <!-- Single Item -->
                    <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item mariner">
                            <a href="#">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-pulse"></i>
                                    </div>
                                    <div class="info">
                                        <h5>1. CHOOSE YOUR COURSE</h5>
                                        <p>Check out our course offer and choose your preferred course.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item java">
                            <a href="#">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-desktop"></i>
                                    </div>
                                    <div class="info">
                                        <h5>2. ENROL ONLINE</h5>
                                        <p>
                                            Enroling online has never been easier.
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item malachite">
                            <a href="#">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-server"></i>
                                    </div>
                                    <div class="info">
                                        <h5>3. APPLY FOR YOUR VISA</h5>
                                        <p>Apply for your Student Visa, we are here to help.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Item -->
                    <!-- Single Item -->
                    <div class="col-md-6 col-sm-6 equal-height">
                        <div class="item brilliantrose">
                            <a href="#">
                                <div class="item-box">
                                    <div class="icon">
                                        <i class="ti-panel"></i>
                                    </div>
                                    <div class="info">
                                        <h5>4. STUDY IN AUSTRALIA</h5>
                                        <p>Get your flight tickets and come to Australia!</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="popular-courses-area bg-dark active-dots carousel-shadow weekly-top-items default-padding">
        <!-- Fidex BG -->
        <div class="fixed-bg" style="background-image: url(assets/img/bg.png);"></div>
        <!-- End Fidex BG -->
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-visa">
                        <div class="panel-heading">
                            <div class="panel-title">
                                Student Visa Requirements
                            </div>
                        </div>
                        <div class="panel-body" style="padding: 20px 40px; min-height: 409px">
                            <div>
                                <ul style="list-style-type: disclosure-closed">
                                    <li>
                                        <a>Genuine Intention to Study in Australia</a>
                                    </li>
                                    <li>
                                        <a>Over 18 year old</a>
                                    </li>
                                    <li>
                                        <a>English Proficiency Requirements</a>
                                    </li>
                                    <li>
                                        <a>Health Requirements</a>
                                    </li>
                                    <li>
                                        <a>Character Requirements</a>
                                    </li>
                                    <li>
                                        <a>Overseas Student Health Cover</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-visa">
                        <div class="panel-heading">
                            <div class="panel-title">
                                What you need
                            </div>
                        </div>
                        <div class="panel-body" style="padding: 20px 40px;">
                            <div>
                                <ul style="list-style-type: disclosure-closed">
                                    <li>
                                        <a>Complete the enrolment form</a>
                                    </li>
                                    <li>
                                        <a>Copy of your passport – personal details page</a>
                                    </li>
                                    <li>
                                        <a>Copy of visa page from your passport (if applicable)</a>
                                    </li>
                                    <li>
                                        <a>Copies of highest achieved education (see relevant course for academic requirements)</a>
                                    </li>
                                    <li>
                                        <a>Certificate of your English proficiency (see relevant course for English level requirements)</a>
                                    </li>
                                    <li>
                                        <a>Proof of payment of enrolment fees</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="features-area default-padding bottom-less">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <a href="https://appform.nortwest.edu.au/">
                        <img src="assets/img/click%20to%20enroll.png" style="width: 100%; border-radius: 10px" />
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="course-details-area default-padding general_info">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>General Information & Course Information</h2>

                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Start Course Info -->
                <div class="col-md-12">


                    <div class="course-meta">
                        <div>
                            <h4>Delivery and Assessment</h4>
                            <p>
                                All courses are delivered and assessed by Nortwest. Courses are delivered in a classroom environment set up as a simulated workplace. Trainers use various delivery methods (e.g., case studies, discussions, practical exercises, demonstrations, and role plays). Learners are provided with training, resources, and materials including. Emphasis is made to reflect real work situations to develop employability skills required for the qualifications. Overseas students are required to meet their visa requirements. Students have access to 15 face-to-face contact hours plus 5 hours of assigned online distance learning tasks and satisfactory academic progress for each study period. Hours for attendance are recorded upon completing weekly tasks.
   
                            </p>

                            <h4>Qualifications to be Issued</h4>
                            <p>
                                To obtain a qualification, students must be deemed “Competent” in all assessments in all units. Students successfully completing all assessment requirements will be awarded a qualification, e.g., the Certificate IV in Business. Students completing only part of a qualification will be issued a Statement of Attainment indicating units of competency they completed.
   
                            </p>

                            <h4>Our Facilities</h4>
                            <p>
                                Nortwest provides modern facilities and qualified staff. We run small classes with a friendly but professional atmosphere and provide support and guidance to our students through their studies and leisure. Our computer labs are equipped with Mac and PC computers and industry-endorsed software and resources. Students have access to computer labs with high-speed internet connections for their research and self-study. Teachers use computers and overhead projectors for delivery.
   
                            </p>

                            <h4>Learning and Library Resources</h4>
                            <p>
                                Learning and library resources are available from our online system, or hard copies can be obtained from reception upon request.
   
                            </p>

                            <h4>Student Support Services</h4>
                            <p>
                                Student support services are located at all Nortwest campuses. These services are accessible during normal business hours and help students adjust to studying and living in Australia. Our services also help students achieve satisfactory course progress. Please visit the student support services page for more information.
   
                            </p>

                            <h4>Complaints and Appeals</h4>
                            <p>
                                Any student has a right to take further action under Australian Consumer Protection Law if not satisfied with the internal complaint and appeal process. Further information on Policies, Procedures, and Forms can be viewed here.
   
                            </p>

                            <h4>Student Orientation</h4>
                            <p>
                                Orientation is conducted before course commencement. The purpose of the orientation is to fully inform new students of college life aspects and provide an introduction to rules and regulations concerning studying at Nortwest and information about living in Australia.
   
                            </p>

                            <h4>Recognition of Prior Learning (RPL) & Current Competencies (RCC)</h4>
                            <p>
                                Students may receive credit for their previous knowledge and skills through recognition of prior learning (RPL/RCC) upon successful application. Please contact us for more information.
   
                            </p>

                            <h4>National Recognition / Credit Transfer</h4>
                            <p>
                                A student who has successfully completed units from another course at another RTO in Australia may be given credit towards their studies at Nortwest upon providing a Statement of Attainment from a previous provider.
   
                            </p>

                            <h4>ESOS Framework for Overseas Students</h4>
                            <p>
                                The Education Services for Overseas Students (ESOS) Framework regulates the education of overseas students studying in Australia. The ESOS Framework sets guidelines and minimum standards to protect students and Australia’s reputation for providing quality education and support services. The ESOS Framework also ensures tuition and financial assurance. Contact us for more information about the ESOS Framework or visit the website.
   
                            </p>

                            <h4>Costs of Living in Australia</h4>
                            <p>
                                We anticipate that an overseas student will require approximately AU$18,600 for living expenses each year, plus tuition fees. If you have an adult dependant living with you, you will need an extra AU$5,000 per year. If you have dependent children, you will need approximately AU$3,000 per child. Overseas students bringing their dependants may be liable for schooling fees for their school-aged dependants. Contact DIBP for more information at www.immi.gov.au.
   
                            </p>

                            <h4>Anti-discrimination</h4>
                            <p>
                                Nortwest is committed to providing a fair and equitable environment for its students, staff, and visitors. Any discrimination or harassment of staff, students, or visitors based on sex, pregnancy, race, color, nationality, ethnic or ethno-religious background, marital status, physical, intellectual or psychiatric disability, sexuality, or age will not be tolerated.
   
                            </p>

                            <h4>Access and Equity</h4>
                            <p>
                                Nortwest provides equal access to training and delivery services for local and international students. We conduct flexible training to meet specific needs of individual students where possible. The student enrollment form requires students to indicate any special needs for the course. Students with learning difficulties beyond our areas of expertise are referred to external specialist agencies. Student recruitment at Nortwest is carried out ethically and in accordance with Access and Equity principles.
   
                            </p>

                            <h4>Transfer Between Providers</h4>
                            <p>
                                Overseas students are restricted from transferring from their principal course of study for six months. This restriction also applies to any course(s) packaged with their principal course of study. Students can apply for a letter of release to enable them to transfer to another education provider. Nortwest will only provide a letter of release to students before the first six months of their principal course in special circumstances, as specified in the Transfer Between Providers Policy. Further information on Policies, Procedures, and Forms can be viewed here.
   
                            </p>

                            <h4>Notice of Withdrawal</h4>
                            <p>
                                If a student needs to withdraw, they must:
       
                                <ul style="list-style-type: auto; line-height: 23px; padding: 0px 25px; font-weight: 400; margin-bottom: 10px">
                                    <li>Apply in writing using the Withdrawal Form (available at Reception or online)</li>
                                    <li>Address it to the Admissions Manager</li>
                                    <li>State their name and student number</li>
                                    <li>State the program and date of commencement they wish to withdraw from</li>
                                    <li>State the reason for withdrawal</li>
                                    <li>Provide contact details</li>
                                </ul>


                            </p>
                            <p>Notices will not be effective until received and approved by the college. However, students have the right to take further action under Australia’s Consumer Protection Law and pursue other legal remedies.</p>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

