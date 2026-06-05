<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" CodeFile="Student_Orientation_Access.aspx.cs" Inherits="Student_Orientation_Access" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Student Orientation Process
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        :root {
            --oa-brand: #c62828;
            --oa-ink: #0f172a;
            --oa-muted: #64748b;
        }

        .oa-card {
            background: #fff;
            border-radius: 10px;
            border: 1px solid #e7e7e7;
            padding: 16px;
            margin-bottom: 15px;
        }

            .oa-card:last-child {
                margin-bottom: 0;
            }

        .oa-card-title {
            margin: 0 0 6px;
            font-size: 14px;
            font-weight: 700;
            color: var(--oa-ink);
        }

        .oa-title-icon {
            color: var(--oa-brand);
            margin-right: 8px;
        }

        .oa-welcome-card,
        .oa-closing-card {
            border-left: 4px solid var(--oa-brand);
        }

        .oa-main-title {
            margin: 0 0 12px;
            font-size: 20px;
            font-weight: 800;
            line-height: 1.3;
            color: var(--oa-ink);
        }

        .oa-copy p {
            margin: 0 0 10px;
            color: #334155;
            font-size: 13px;
            line-height: 1.65;
        }

            .oa-copy p:last-child {
                margin-bottom: 0;
            }

        .oa-steps-heading {
            margin: 0 0 14px;
            font-size: 13.5px;
            font-weight: 700;
            line-height: 1.5;
            color: var(--oa-ink);
        }

        .oa-form-desc {
            margin: 0;
            font-size: 12.8px;
            line-height: 1.5;
            color: var(--oa-muted);
        }

        .oa-form-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .oa-form-left {
            min-width: 0;
            flex: 1;
        }

        .oa-step-badge {
            display: inline-flex;
            align-items: center;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .2px;
            color: rgba(15, 23, 42, .70);
            background: rgba(15, 23, 42, .06);
            border: 1px solid rgba(15, 23, 42, .10);
            padding: 4px 8px;
            border-radius: 999px;
            margin-bottom: 8px;
        }

        .oa-arrow-btn {
            flex: 0 0 auto;
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none !important;
            background: var(--oa-brand);
            border: 1px solid var(--oa-brand);
            color: #fff !important;
        }

            .oa-arrow-btn:hover,
            .oa-arrow-btn:focus {
                background: #b71c1c;
                border-color: #b71c1c;
                color: #fff !important;
            }

        .oa-page .breadcrumb-area h1 {
            font-size: 26px;
        }

        .oa-content-wrap {
            width: 100%;
            max-width: 820px;
            margin: 0 auto;
        }

        .oa-cards {
            margin-top: 20px;
        }

        .oa-step-card {
            transition: box-shadow .2s ease, border-color .2s ease;
        }

            .oa-step-card:hover {
                border-color: rgba(198, 40, 40, .25);
                box-shadow: 0 8px 22px rgba(15, 23, 42, .08);
            }

        .oa-arrow-btn .oa-btn-text {
            display: none;
        }

        @media (min-width: 576px) {
            .oa-page .breadcrumb-area h1 {
                font-size: 32px;
            }

            .oa-main-title {
                font-size: 24px;
            }

            .oa-copy p,
            .oa-steps-heading {
                font-size: 14px;
            }

            .oa-card {
                padding: 18px 20px;
            }

            .oa-card-title {
                font-size: 15px;
            }

            .oa-form-desc {
                font-size: 13.5px;
            }
        }

        @media (min-width: 768px) {
            .oa-page .blog-area.default-padding {
                padding-top: 70px;
                padding-bottom: 70px;
            }

            .oa-page .breadcrumb-area h1 {
                font-size: 36px;
            }

            .oa-main-title {
                font-size: 28px;
                margin-bottom: 14px;
            }

            .oa-copy p {
                font-size: 15px;
                line-height: 1.7;
            }

            .oa-steps-heading {
                font-size: 16px;
                margin-bottom: 18px;
            }

            .oa-card {
                padding: 22px 24px;
                border-radius: 12px;
                margin-bottom: 18px;
            }

            .oa-card-title {
                font-size: 16px;
            }

            .oa-form-desc {
                font-size: 14px;
            }

            .oa-step-badge {
                font-size: 12px;
                padding: 5px 10px;
            }

            .oa-arrow-btn {
                width: auto;
                min-width: 48px;
                height: 48px;
                padding: 0 16px;
                gap: 8px;
                border-radius: 10px;
            }

                .oa-arrow-btn .oa-btn-text {
                    display: inline;
                    font-size: 13px;
                    font-weight: 600;
                }
        }

        .breadcrumb-area {
            padding: 60px 0;
        }

        .pb-3 {
            padding-bottom: 20px;
        }

        @media (min-width: 992px) {
            .oa-content-wrap {
                max-width: 860px;
            }

            .oa-cards {
                margin-top: 28px;
            }
        }

        @media (max-width: 420px) {
            .oa-form-row {
                gap: 10px;
            }

            .oa-arrow-btn {
                width: 40px;
                height: 40px;
            }

            .oa-main-title {
                font-size: 18px;
            }
        }

        @media only screen and (max-width: 767px) {
            .breadcrumb-area {
                padding: 44px 0;
            }
        }

        .oa-expired-wrap {
            max-width: 640px;
            margin: 0 auto;
            padding: 50px 16px 70px;
        }

        .oa-expired-card {
            background: #fff;
            border: 1px solid #e7e7e7;
            border-left: 4px solid #c62828;
            border-radius: 12px;
            padding: 28px 24px;
            text-align: center;
            box-shadow: 0 8px 24px rgba(15, 23, 42, .06);
        }

        .oa-expired-card h2 {
            margin: 0 0 10px;
            font-size: 22px;
            font-weight: 800;
            color: #0f172a;
        }

        .oa-expired-card p {
            margin: 0 0 12px;
            color: #64748b;
            font-size: 14px;
            line-height: 1.65;
        }

        .oa-expired-card a {
            color: #c62828;
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <asp:Panel ID="pnlExpired" runat="server" Visible="false">
        <div class="oa-expired-wrap">
            <div class="oa-expired-card">
                <h2><i class="fas fa-link-slash" style="color:#c62828;margin-right:8px;"></i>Invalid link</h2>
                <p><asp:Literal ID="litExpiredMessage" runat="server" /></p>
                <p>Please contact the college for a new orientation QR code, or email <a href="mailto:sso@nortwest.edu.au">sso@nortwest.edu.au</a>.</p>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlOrientation" runat="server" Visible="false">
    <div class="oa-page">
        <div class="breadcrumb-area shadow dark bg-fixed text-center text-light"
            style="background-image: url(https://cod.edu/_resources/img/900x600/continuing-ed-english-language-900x600.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <h1>Student Orientation</h1>

                    </div>
                </div>
            </div>
        </div>

        <div class="blog-area bg-gray">
            <div class="container pb-3">


                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                        <div class="oa-content-wrap">
                            <div class="oa-cards">
                                <div class="oa-card oa-welcome-card">
                                    <h2 class="oa-main-title">Welcome to Nortwest College!</h2>
                                    <div class="oa-copy">
                                        <p>We hope you are filled with excitement for the journey ahead on this incredible adventure of learning and growth.</p>
                                        <p>Below you will find the portal to complete your orientation. These resources will help familiarize you with our campus, programs and support services, ensuring a smooth transition into college life.</p>
                                    </div>
                                </div>

                                <p class="oa-steps-heading">Please find the steps to complete the documents below:</p>

                                <div class="oa-card oa-step-card">
                                    <div class="oa-form-row">
                                        <div class="oa-form-left">
                                            <div class="oa-step-badge">Step 1</div>
                                            <div class="oa-card-title"><i class="fas fa-id-card oa-title-icon"></i>USI Form</div>
                                            <p class="oa-form-desc">Create your Unique Student Identifier (USI). Required before you submit forms.</p>
                                        </div>
                                        <a class="oa-arrow-btn" target="_blank" href="https://www.usi.gov.au/students/get-a-usi" aria-label="Open USI link">
                                            <span class="oa-btn-text">Open</span>
                                            <i class="fas fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="oa-card oa-step-card">
                                    <div class="oa-form-row">
                                        <div class="oa-form-left">
                                            <div class="oa-step-badge">Step 2</div>
                                            <div class="oa-card-title"><i class="fas fa-file-alt oa-title-icon"></i>Orientation Form</div>
                                            <p class="oa-form-desc">Complete the VET student orientation form carefully and submit it.</p>
                                        </div>
                                        <a class="oa-arrow-btn" href="new_vet_orientation_form.aspx" aria-label="Open orientation form">
                                            <span class="oa-btn-text">Open</span>
                                            <i class="fas fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="oa-card oa-step-card">
                                    <div class="oa-form-row">
                                        <div class="oa-form-left">
                                            <div class="oa-step-badge">Step 3</div>
                                            <div class="oa-card-title"><i class="fas fa-pen oa-title-icon"></i>Course Entry Interview Form</div>
                                            <p class="oa-form-desc">Fill in the course entry interview form as part of the enrolment process.</p>
                                        </div>
                                        <a class="oa-arrow-btn" href="course_entry_form.aspx" aria-label="Open course entry form">
                                            <span class="oa-btn-text">Open</span>
                                            <i class="fas fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="oa-card oa-step-card">
                                    <div class="oa-form-row">
                                        <div class="oa-form-left">
                                            <div class="oa-step-badge">Step 4</div>
                                            <div class="oa-card-title"><i class="fas fa-cloud-upload-alt oa-title-icon"></i>Upload Document</div>
                                            <p class="oa-form-desc">Upload supporting documents like passport, visa, offer letter, and others.</p>
                                        </div>
                                        <a class="oa-arrow-btn" href="Student_Request_Forms.aspx" aria-label="Upload supporting documents">
                                            <span class="oa-btn-text">Open</span>
                                            <i class="fas fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="oa-card oa-step-card">
                                    <div class="oa-form-row">
                                        <div class="oa-form-left">
                                            <div class="oa-step-badge">Step 5</div>
                                            <div class="oa-card-title"><i class="fas fa-clipboard-check oa-title-icon"></i>LLN Test</div>
                                            <p class="oa-form-desc">Complete the Language, Literacy and Numeracy (LLN) test online.</p>
                                        </div>
                                        <a class="oa-arrow-btn" href="lln-test" aria-label="Open LLN test">
                                            <span class="oa-btn-text">Open</span>
                                            <i class="fas fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="oa-card oa-closing-card">
                                    <div class="oa-copy">
                                        <p>Should you have any questions or need assistance, please do not hesitate to contact us. We are here to support you every step of the way. Email <a href="mailto:sso@nortwest.edu.au">sso@nortwest.edu.au</a>.</p>
                                        <p>Once again, welcome to the community! We can't wait to see all that you will achieve during your time here.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

