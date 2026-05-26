<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Student_Support_Service.aspx.cs" Inherits="Student_Support_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Student Support Service
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Student Support Services – Nortwest College</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    
    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --navy: #002147;
            --teal: #33897c; /* Prit bhai's requested color */
            --teal-dark: #276b61;
            --teal-light: #e6f2f0;
            --bg: #f8f9fa;
            --white: #ffffff;
            --border: #eaedf1;
            --text: #4a5568;
            --heading: #2d3748;
            --muted: #718096;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.05), 0 1px 3px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05);
            --radius: 8px;
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--bg);
            color: var(--text);
            font-size: 15px;
            line-height: 1.7;
            -webkit-font-smoothing: antialiased;
        }

        h1, h2, h3, h4, h5, h6 {
            color: var(--heading);
            margin-bottom: 0;
        }

        a {
            transition: var(--transition);
        }

        /* MAIN GRID */
        .main-area {
            max-width: 1400px;
            margin: 0 auto;
            padding: 60px 30px;
            display: grid;
            grid-template-columns: 1fr 320px;
            gap: 40px;
            align-items: start;
        }

        /* SECTION CARDS */
        .sections {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .s-card {
            background: var(--white);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: var(--transition);
            border: 1px solid var(--border);
        }

        .s-card:hover {
            box-shadow: var(--shadow-hover);
            transform: translateY(-3px);
        }

        .s-card-header {
            background: var(--teal);
            padding: 10px 17px;
            display: flex;
            align-items: center;
            gap: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .s-card-header .icon {
            width: 45px;
            height: 45px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .s-card-header .icon i {
            color: var(--white);
            font-size: 18px;
        }

        .s-card-header h3 {
            color: var(--white);
            font-size: 18px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .s-card-body {
            padding: 30px 25px;
        }

        .s-card-body p {
            margin-bottom: 16px;
        }

        .s-card-body ul {
            padding-left: 0;
            list-style: none;
            margin-bottom: 20px;
        }

        .s-card-body ul li {
            padding: 8px 0 8px 28px;
            position: relative;
            border-bottom: 1px dashed var(--border);
        }

        .s-card-body ul li:last-child {
            border-bottom: none;
        }

        .s-card-body ul li::before {
            content: '\f105';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: 5px;
            top: 10px;
            color: var(--teal);
            font-size: 14px;
        }
        
        .s-card-body ol {
            padding-left: 20px;
            margin-bottom: 20px;
        }
        
        .s-card-body ol li {
            padding: 6px 0;
            color: var(--text);
        }

        .s-card-body a {
            color: var(--teal);
            font-weight: 600;
            text-decoration: none;
        }

        .s-card-body a:hover {
            color: var(--navy);
            text-decoration: underline;
        }

        /* NOTE BOX */
        .note-box {
            background: #fff8e6;
            border-left: 4px solid #f0ad4e;
            padding: 15px 20px;
            border-radius: 4px;
            font-size: 14px;
            color: #7a5c10;
            margin-top: 20px;
            display: flex;
            gap: 12px;
            align-items: flex-start;
        }

        /* EMERGENCY TABLE */
        .em-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            border-radius: var(--radius);
            overflow: hidden;
            border: 1px solid var(--border);
        }

        .em-table thead th {
            background: var(--navy);
            color: var(--white);
            padding: 14px 20px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
        }

        .em-table tbody td {
            padding: 14px 20px;
            border-bottom: 1px solid var(--border);
            vertical-align: middle;
        }

        .em-table tbody tr:hover td {
            background: var(--bg);
        }

        .badge-000 {
            display: inline-block;
            background: #e53e3e;
            color: var(--white);
            font-size: 13px;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 4px;
            letter-spacing: 1px;
            box-shadow: 0 2px 4px rgba(229, 62, 62, 0.3);
        }

        /* LINK GRID */
        .link-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .link-tile {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 18px;
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            text-decoration: none !important;
            color: var(--heading) !important;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        }

        .link-tile i {
            color: var(--teal);
            font-size: 16px;
            background: var(--teal-light);
            padding: 8px;
            border-radius: 50%;
            transition: var(--transition);
        }

        .link-tile:hover {
            border-color: var(--teal);
            background: var(--teal-light);
            color: var(--teal) !important;
            transform: translateY(-2px);
        }

        .link-tile:hover i {
            background: var(--teal);
            color: var(--white);
        }

        /* CTA BTN */
        .cta-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
            padding: 14px 32px;
            background: var(--teal);
            color: var(--white) !important;
            font-weight: 600;
            font-size: 15px;
            border-radius: 50px;
            text-decoration: none !important;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 10px rgba(51, 137, 124, 0.3);
        }

        .cta-btn:hover {
            background: var(--navy);
            box-shadow: 0 6px 15px rgba(0, 33, 71, 0.4);
            transform: translateY(-2px);
        }

        /* SIDEBAR */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 25px;
            position: sticky;
            top: 30px;
        }

        .sb-card {
            background: var(--white);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            border: 1px solid var(--border);
            overflow: hidden;
        }

        .sb-head {
            background: #33897c;
            color: var(--white);
            padding: 13px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 15px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .sb-head.teal {
            background: var(--teal);
        }

        .sb-body {
            padding: 20px;
        }

        .contact-info-item {
            display: flex;
            gap: 15px;
            padding: 12px 0;
            border-bottom: 1px solid var(--border);
            align-items: center;
        }

        .contact-info-item:last-child {
            border-bottom: none;
        }

        .ci-ico {
            width: 40px;
            height: 40px;
            background: var(--teal-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .ci-ico i {
            color: var(--teal);
            font-size: 16px;
        }

        .ci-text .ci-lbl {
            font-size: 12px;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: block;
        }

        .ci-text .ci-val, .ci-text a {
            font-size: 14px;
            font-weight: 600;
            color: var(--heading);
            text-decoration: none;
        }

        .ci-text a:hover {
            color: var(--teal);
        }

        /* HOURS */
        .hours-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px dashed var(--border);
            font-size: 14px;
        }

        .hours-row:last-child {
            border-bottom: none;
        }

        .hours-row .day { color: var(--muted); }
        .hours-row .time { font-weight: 600; color: var(--heading); }
        .hours-row .time.closed { color: #e53e3e; font-weight: 500; }

        /* QUICK LINKS */
        .ql-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid var(--border);
            text-decoration: none !important;
            color: var(--text) !important;
            font-weight: 500;
        }
        
        .ql-item:last-child {
            border-bottom: none;
        }

        .ql-item:hover { color: var(--teal) !important; padding-left: 5px; }
        
        .ql-item .ql-left i {
            color: var(--teal);
            width: 25px;
        }

        .sos-number {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            background: #fff5f5;
            color: #e53e3e !important;
            font-size: 32px;
            font-weight: 700;
            border-radius: var(--radius);
            padding: 20px;
            letter-spacing: 2px;
            text-decoration: none !important;
            border: 1px dashed #e53e3e;
            margin: 15px 0;
        }

        .sos-number:hover {
            background: #e53e3e;
            color: var(--white) !important;
        }

        /* RESPONSIVE */
        @media(max-width: 992px) {
            .main-area {
                grid-template-columns: 1fr;
            }
            .sidebar {
                position: static;
            }
        }

        @media(max-width: 768px) {
            .em-table, .em-table tbody, .em-table tr, .em-table td, .em-table th { display: block; }
            .em-table thead { display: none; }
            .em-table tbody tr { margin-bottom: 15px; border: 1px solid var(--border); border-radius: var(--radius); }
            .em-table tbody td { text-align: right; padding-left: 50%; position: relative; }
            .em-table tbody td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                width: 45%;
                padding-right: 10px;
                text-align: left;
                font-weight: 600;
                color: var(--heading);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    
    <div class="form breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Student Support Service</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Student Support Service</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="main-area">
        <div class="sections">
            
            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-graduation-cap"></i></div>
                    <h3>Student Support Services</h3>
                </div>
                <div class="s-card-body">
                    <p>At Nortwest College we are committed to supporting students throughout their learning journey in Australia. Our Student Support Services team can assist students with academic support, wellbeing, course progress, attendance, adjustment to life in Australia, and referrals to external support services.</p>
                    
                    <h4 style="margin: 25px 0 15px; font-weight: 600; color: var(--navy);">Contact Student Support</h4>
                    <ul style="margin-bottom: 0;">
                        <li><i class="fas fa-envelope" style="color: var(--teal); width: 25px;"></i> <strong>Email:</strong> <a href="mailto:sso@nortwest.edu.au">sso@nortwest.edu.au</a></li>
                        <li><i class="fas fa-phone-alt" style="color: var(--teal); width: 25px;"></i> <strong>Phone:</strong>-</li>
                        <li><i class="fas fa-map-marker-alt" style="color: var(--teal); width: 25px;"></i> <strong>Campus:</strong>-</li>
                        <li><i class="fas fa-clock" style="color: var(--teal); width: 25px;"></i> <strong>Hours:</strong> Monday to Friday, 9:00 am – 8:00 pm</li>
                        <li><i class="fas fa-moon" style="color: var(--teal); width: 25px;"></i> <strong>After-hours emergency contact:</strong> emergency contact number for each campus</li>
                        <li style="border-bottom: none;"><i class="fas fa-wpforms" style="color: var(--teal); width: 25px;"></i> <strong>Support form:</strong> <a href="https://nortwest.edu.au/Student_Request_Forms.aspx" target="_blank">Student Request Forms</a></li>
                    </ul>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-book-reader"></i></div>
                    <h3>Academic and Course Support</h3>
                </div>
                <div class="s-card-body">
                    <p>Students can access support to help with:</p>
                    <ul>
                        <li>Understanding assessments</li>
                        <li>Course content and learning materials</li>
                        <li>Study planning</li>
                        <li>Course progress</li>
                        <li>Attendance requirements</li>
                        <li>Catch-up support, where available</li>
                        <li>Referrals for additional learning assistance</li>
                    </ul>
                    <p style="margin-top: 15px; margin-bottom: 0; font-weight: 500;">Students who are having difficulty with their studies should contact their Trainer or Student Support Services as soon as possible.</p>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-language"></i></div>
                    <h3>Language, Literacy, Numeracy and Digital Support</h3>
                </div>
                <div class="s-card-body">
                    <p>Students who need help with English language, reading, writing, numeracy or digital skills may request additional support.</p>
                    <p style="font-weight: 500;">Support may include:</p>
                    <ul>
                        <li>Help understanding learning materials</li>
                        <li>Assessment writing support</li>
                        <li>Numeracy support</li>
                        <li>Digital learning support</li>
                        <li>Learning Management System assistance</li>
                        <li>Referral to external services, where required</li>
                    </ul>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-heart"></i></div>
                    <h3>Wellbeing and Personal Support</h3>
                </div>
                <div class="s-card-body">
                    <p>Student Support Services can assist students who are experiencing personal, emotional, health, financial, family or study-related difficulties.</p>
                    <p style="font-weight: 500;">Support may include:</p>
                    <ul>
                        <li>Confidential guidance</li>
                        <li>Support planning</li>
                        <li>Referral to external wellbeing services</li>
                        <li>Help accessing health, legal or community services</li>
                        <li>Assistance with issues affecting study progress</li>
                    </ul>
                    <div class="note-box">
                        <i class="fas fa-exclamation-triangle" style="margin-top: 3px;"></i>
                        <div>The college does not provide emergency medical or crisis counselling services. In an emergency, call <strong>000</strong>.</div>
                    </div>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-phone-volume"></i></div>
                    <h3>Emergency and External Support Contacts</h3>
                </div>
                <div class="s-card-body" style="padding: 15px 25px 30px;">
                    <div style="overflow-x: auto;">
                        <table class="em-table">
                            <thead>
                                <tr>
                                    <th>Service</th>
                                    <th>Contact</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-label="Service"><strong>Emergency Services</strong></td>
                                    <td data-label="Contact">Call <span class="badge-000">000</span> for police, fire or ambulance</td>
                                </tr>
                                <tr>
                                    <td data-label="Service">Lifeline</td>
                                    <td data-label="Contact">Call <a href="tel:131114">13 11 14</a> or visit <a href="https://www.lifeline.org.au/" target="_blank">Lifeline</a></td>
                                </tr>
                                <tr>
                                    <td data-label="Service">Beyond Blue</td>
                                    <td data-label="Contact">Call <a href="tel:1300224636">1300 22 4636</a> or visit <a href="https://www.beyondblue.org.au/" target="_blank">Beyond Blue</a></td>
                                </tr>
                                <tr>
                                    <td data-label="Service">healthdirect</td>
                                    <td data-label="Contact">Call <a href="tel:1800022222">1800 022 222</a> or visit <a href="https://www.healthdirect.gov.au/" target="_blank">healthdirect</a></td>
                                </tr>
                                <tr>
                                    <td data-label="Service">1800RESPECT</td>
                                    <td data-label="Contact">Call <a href="tel:1800737732">1800 737 732</a> or visit <a href="https://www.1800respect.org.au/" target="_blank">1800RESPECT</a></td>
                                </tr>
                                <tr>
                                    <td data-label="Service">TIS National</td>
                                    <td data-label="Contact">Call <a href="tel:131450">131 450</a> or visit <a href="https://www.tisnational.gov.au/" target="_blank">TIS National</a></td>
                                </tr>
                                <tr>
                                    <td data-label="Service">Legal Aid NSW</td>
                                    <td data-label="Contact">Visit <a href="https://www.legalaid.nsw.gov.au/" target="_blank">Legal Aid NSW</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-briefcase"></i></div>
                    <h3>Working in Australia</h3>
                </div>
                <div class="s-card-body">
                    <p>International students have workplace rights in Australia. Students should understand their pay, working conditions, leave entitlements and workplace protections.</p>
                    
                    <p style="font-weight: 500; margin-bottom: 5px;">Useful links:</p>
                    <div class="link-grid" style="margin-top: 10px; margin-bottom: 20px;">
                        <a class="link-tile" href="https://www.fairwork.gov.au/find-help-for/visa-holders-and-migrants/international-students" target="_blank">
                            <i class="fas fa-external-link-alt"></i> Fair Work Ombudsman – International Students
                        </a>
                        <a class="link-tile" href="https://www.fairwork.gov.au/employment-conditions/for-young-workers-and-students" target="_blank">
                            <i class="fas fa-external-link-alt"></i> Fair Work Ombudsman – Young Workers and Students
                        </a>
                        <a class="link-tile" href="https://www.study.sydney/work-rights" target="_blank">
                            <i class="fas fa-external-link-alt"></i> Study NSW – Work Rights
                        </a>
                    </div>
                    
                    <p style="margin-bottom: 0;">The Fair Work Ombudsman provides official information about workplace rights and minimum employment conditions for international students. (<a href="https://www.fairwork.gov.au/" target="_blank">Fair Work Ombudsman</a>)</p>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-user-cog"></i></div>
                    <h3>Administration Support</h3>
                </div>
                <div class="s-card-body">
                    <p>Student Administration can assist with:</p>
                    <ul>
                        <li>Enrolment enquiries</li>
                        <li>Timetables</li>
                        <li>Fees</li>
                        <li>Updating contact details</li>
                        <li>Attendance enquiries</li>
                        <li>Course progress enquiries</li>
                        <li>Leave, deferral or withdrawal requests</li>
                        <li>Certificates and statements of attainment</li>
                    </ul>
                    <div style="margin-top: 20px; padding-top: 15px; border-top: 1px solid var(--border);">
                        <h4 style="font-size: 16px; margin-bottom: 10px;">Contact Student Support Team:</h4>
                        <p style="margin-bottom: 5px;"><strong>Email:</strong> <a href="mailto:sso@nortwest.edu.au">sso@nortwest.edu.au</a></p>
                        <p style="margin-bottom: 0;"><strong>Phone:</strong>-</p>
                    </div>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-balance-scale"></i></div>
                    <h3>Complaints and Appeals</h3>
                </div>
                <div class="s-card-body">
                    <p>Students have the right to raise a complaint or appeal a decision. Complaints and appeals are handled fairly, confidentially and in accordance with college policies.</p>
                    <p style="font-weight: 500;">Students can raise concerns about:</p>
                    <ul>
                        <li>Training or assessment</li>
                        <li>Course progress decisions</li>
                        <li>Attendance matters</li>
                        <li>Fees or refunds</li>
                        <li>Student support services</li>
                        <li>Staff or student conduct</li>
                    </ul>
                    
                    <p style="font-weight: 500; margin-bottom: 5px; margin-top: 20px;">Useful internal links:</p>
                    <div class="link-grid" style="margin-top: 10px;">
                        <a class="link-tile" href="https://nortwest.edu.au/Policy.aspx" target="_blank">
                            <i class="fas fa-file-alt"></i> Complaints and Appeals Policy
                        </a>
                        <a class="link-tile" href="https://nortwest.edu.au/complaint_and_feedback_form.aspx" target="_blank">
                            <i class="fas fa-file-signature"></i> Complaints and Appeals Form
                        </a>
                        <a class="link-tile" href="https://nortwest.edu.au/downloads.aspx" target="_blank">
                            <i class="fas fa-book"></i> Student Handbook
                        </a>
                    </div>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-shield-alt"></i></div>
                    <h3>Tuition Protection Service</h3>
                </div>
                <div class="s-card-body">
                    <p>The Tuition Protection Service may assist international students if their provider is unable to deliver their course. This may include help to continue studies with another provider or receive a refund where applicable. (<a href="https://www.education.gov.au/" target="_blank">Department of Education</a>)</p>
                    
                    <p style="font-weight: 500; margin-bottom: 5px; margin-top: 15px;">Useful link:</p>
                    <a class="link-tile" href="https://tps.gov.au/" target="_blank" style="display: inline-flex; width: auto;">
                        <i class="fas fa-external-link-alt"></i> Tuition Protection Service
                    </a>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-user-shield"></i></div>
                    <h3>Privacy and Confidentiality</h3>
                </div>
                <div class="s-card-body">
                    <p>Information shared with Student Support Services will be treated confidentially where possible. The college may need to disclose information where required by law, where there is a serious risk to health or safety, or where disclosure is necessary to provide appropriate support.</p>
                    
                    <p style="font-weight: 500; margin-bottom: 5px; margin-top: 15px;">Useful internal link:</p>
                    <a class="link-tile" href="https://nortwest.edu.au/Policy.aspx" target="_blank" style="display: inline-flex; width: auto;">
                        <i class="fas fa-link"></i> Privacy Policy
                    </a>
                </div>
            </div>

            <div class="s-card">
                <div class="s-card-header">
                    <div class="icon"><i class="fas fa-hands-helping"></i></div>
                    <h3>How to Request Support</h3>
                </div>
                <div class="s-card-body">
                    <p>Students can request support by:</p>
                    <ol>
                        <li>Speaking with their Trainer</li>
                        <li>Contacting Student Support Services</li>
                        <li>Visiting the Student Services Office</li>
                        <li>Completing the Student Support Request Form</li>
                        <li>Emailing <a href="mailto:support@nortwest.edu.au">support@nortwest.edu.au</a></li>
                    </ol>
                    
                    <div style="margin-top: 25px; text-align: center;">
                        <a href="https://nortwest.edu.au/Student_Request_Forms.aspx" class="cta-btn" target="_blank">
                            <i class="fas fa-paper-plane"></i> Student Request Forms
                        </a>
                    </div>
                </div>
            </div>

        </div>

        <div class="sidebar">
            <div class="sb-card">
                <div class="sb-head"><i class="fas fa-headset"></i> Contact Support</div>
                <div class="sb-body">
                    <div class="contact-info-item">
                        <div class="ci-ico"><i class="fas fa-envelope"></i></div>
                        <div class="ci-text">
                            <span class="ci-lbl">Email</span>
                            <a style="color:black !important" href="mailto:sso@nortwest.edu.au">sso@nortwest.edu.au</a>
                        </div>
                    </div>
                    <div class="contact-info-item">
                        <div class="ci-ico"><i class="fas fa-clock"></i></div>
                        <div class="ci-text">
                            <span class="ci-lbl">Hours</span>
                            <span class="ci-val">Mon–Fri, 9:00 am – 8:00 pm</span>
                        </div>
                    </div>
                    <div class="contact-info-item">
                        <div class="ci-ico"><i class="fas fa-phone-alt"></i></div>
                        <div class="ci-text">
                            <span class="ci-lbl">Phone</span>
                            <a href="https://nortwest.edu.au/Contact_Us.aspx" target="_blank">View Campus Numbers</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="sb-card">
                <div class="sb-head teal"><i class="fas fa-link"></i> Quick Links</div>
                <div class="sb-body" style="padding: 10px 20px;">
                    <a class="ql-item" href="https://nortwest.edu.au/Student_Request_Forms.aspx" target="_blank">
                        <span class="ql-left"><i class="fas fa-wpforms"></i> Request Forms</span>
                        <i class="fas fa-angle-right"></i>
                    </a>
                    <a class="ql-item" href="https://nortwest.edu.au/Policy.aspx" target="_blank">
                        <span class="ql-left"><i class="fas fa-file-alt"></i> Policies</span>
                        <i class="fas fa-angle-right"></i>
                    </a>
                    <a class="ql-item" href="https://nortwest.edu.au/downloads.aspx" target="_blank">
                        <span class="ql-left"><i class="fas fa-book"></i> Student Handbook</span>
                        <i class="fas fa-angle-right"></i>
                    </a>
                    <a class="ql-item" href="https://tps.gov.au/" target="_blank">
                        <span class="ql-left"><i class="fas fa-shield-alt"></i> Tuition Protection</span>
                        <i class="fas fa-angle-right"></i>
                    </a>
                </div>
            </div>

            <div class="sb-card sos-block">
                <div class="sb-head"><i class="fas fa-exclamation-triangle"></i> Emergency</div>
                <div class="sb-body" style="text-align: center;">
                    <p style="font-size: 14px; margin-bottom: 5px;">Life-threatening emergencies:</p>
                    <a href="tel:000" class="sos-number"><i class="fas fa-phone"></i> 000</a>
                    <span style="font-size: 13px; color: var(--muted);">Police · Fire · Ambulance</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>