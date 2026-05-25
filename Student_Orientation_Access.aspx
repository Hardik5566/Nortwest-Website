<%@ Page Title="" Language="C#" MasterPageFile="~/FormMaster.master" AutoEventWireup="true" %>

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

        .oa-card.oa-instructions-card {
            border-left: 4px solid var(--oa-brand);
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

        .oa-instructions-list {
            margin: 0;
            padding-left: 18px;
            color: #334155;
            font-size: 13px;
            line-height: 1.65;
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

        .oa-cards {
            margin-top: 20px;
        }

        .oa-desktop-block {
            display: none;
        }

        /* Mobile-first page, hide it on desktop */
        @media (min-width: 992px) {
            .oa-mobile-only {
                display: none !important;
            }

            .oa-desktop-block {
                display: block;
                padding: 60px 0;
            }

            .oa-desktop-block .panel {
                max-width: 560px;
                margin: 0 auto;
                background: #fff;
                border-radius: 14px;
                border: 1px solid rgba(15, 23, 42, .08);
                padding: 22px;
                text-align: center;
                box-shadow: 0 10px 30px rgba(15, 23, 42, .08);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="oa-mobile-only">
        <div class="breadcrumb-area shadow dark bg-fixed text-center text-light"
            style="background-image: url(https://cod.edu/_resources/img/900x600/continuing-ed-english-language-900x600.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <h1>Student Orientation Process</h1>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="blog-area default-padding bg-gray">
            <div class="container">
              

                <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-xs-12">
                        <div class="oa-cards">
                            <div class="oa-card oa-instructions-card">
                                <div class="oa-card-title"><i class="fas fa-info-circle oa-title-icon"></i>Instructions</div>
                                <ul class="oa-instructions-list">
                                    <li>Complete all steps in order (Step 1 to Step 4).</li>
                                    <li>Keep your <strong>passport</strong>, <strong>visa</strong>, and other supporting documents ready.</li>
                                    <li>Use the same details as on your enrolment/offer letter.</li>
                                    <li>Upload clear photos/scans (readable, not blurred).</li>
                                    <li>Do not submit the same form multiple times.</li>
                                    <li>If you need help, email <a href="mailto:sso@nortwest.edu.au">sso@nortwest.edu.au</a>.</li>
                                </ul>
                            </div>

                            <div class="oa-card">
                                <div class="oa-form-row">
                                    <div class="oa-form-left">
                                        <div class="oa-step-badge">Step 1</div>
                                        <div class="oa-card-title"><i class="fas fa-id-card oa-title-icon"></i>USI Link</div>
                                        <p class="oa-form-desc">Create your Unique Student Identifier (USI). Required before you submit forms.</p>
                                    </div>
                                    <a class="oa-arrow-btn" target="_blank" href="https://www.usi.gov.au/students/get-a-usi" aria-label="Open USI link">
                                        <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="oa-card">
                                <div class="oa-form-row">
                                    <div class="oa-form-left">
                                        <div class="oa-step-badge">Step 2</div>
                                        <div class="oa-card-title"><i class="fas fa-file-alt oa-title-icon"></i>Orientation Form (VET)</div>
                                        <p class="oa-form-desc">Complete the VET student orientation form carefully and submit it.</p>
                                    </div>
                                    <a class="oa-arrow-btn" href="new_vet_orientation_form.aspx" aria-label="Open orientation form">
                                        <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="oa-card">
                                <div class="oa-form-row">
                                    <div class="oa-form-left">
                                        <div class="oa-step-badge">Step 3</div>
                                        <div class="oa-card-title"><i class="fas fa-pen oa-title-icon"></i>Course Entry Form</div>
                                        <p class="oa-form-desc">Fill the course entry interview form as part of the enrolment process.</p>
                                    </div>
                                    <a class="oa-arrow-btn" href="course_entry_form.aspx" aria-label="Open course entry form">
                                        <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="oa-card">
                                <div class="oa-form-row">
                                    <div class="oa-form-left">
                                        <div class="oa-step-badge">Step 4</div>
                                        <div class="oa-card-title"><i class="fas fa-cloud-upload-alt oa-title-icon"></i>Upload Document</div>
                                        <p class="oa-form-desc">Upload supporting documents like passport, visa, offer letter, and others.</p>
                                    </div>
                                    <a class="oa-arrow-btn" href="Student_Request_Forms.aspx" aria-label="Upload supporting documents">
                                        <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="oa-desktop-block">
        <div class="container">
            <div class="panel">
                <h3 style="margin-top: 0; font-weight: 800; color: #0f172a;">Mobile View Only</h3>
                <p style="color: #64748b; margin-bottom: 18px;">
                    This Orientation Access Page is designed for mobile screens. Please open it on your phone or reduce the browser width.
                </p>
                <a class="btn btn-theme effect btn-sm" href="Student_Forms.aspx">
                    Go to Student Forms
                </a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

