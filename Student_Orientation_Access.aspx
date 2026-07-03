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
            color: #44877c;
            margin-right: 8px;
        }

        .oa-welcome-card,
        .oa-closing-card {
            border-left: 4px solid #44877c;
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
            background: #44877c;
            border: 1px solid #44877c;
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

        /* Upload modal */
        .oa-upload-modal .modal-dialog {
            max-width: 520px;
            margin: 20px auto;
        }

        .oa-upload-modal .modal-content {
            border: 0;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(15, 23, 42, .18);
        }

        .oa-upload-modal .modal-header {
            background: linear-gradient(135deg, #44877c 0%, #356b62 100%);
            border: 0;
            padding: 20px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

            .oa-upload-modal .modal-header .close {
                color: #fff;
                opacity: .9;
                font-size: 26px;
                font-weight: 300;
                margin: 0;
                text-shadow: none;
            }

                .oa-upload-modal .modal-header .close:hover {
                    opacity: 1;
                }

        .oa-upload-modal-title-wrap {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .oa-upload-modal-icon {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: rgba(255, 255, 255, .18);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-size: 18px;
        }

        .oa-upload-modal .modal-title {
            margin: 0;
            color: #fff;
            font-size: 18px;
            font-weight: 700;
            line-height: 1.3;
        }

        .oa-upload-modal-subtitle {
            margin: 2px 0 0;
            color: rgba(255, 255, 255, .85);
            font-size: 12.5px;
            font-weight: 400;
        }

        .oa-upload-modal .modal-body {
            padding: 24px;
            background: #f8fafc;
        }

        .oa-upload-modal .modal-footer {
            border-top: 1px solid #e2e8f0;
            padding: 16px 24px;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 10px;
        }

        .oa-field-label {
            display: block;
            margin: 0 0 8px;
            font-size: 13px;
            font-weight: 700;
            color: var(--oa-ink);
        }

            .oa-field-label span {
                color: #c62828;
                margin-left: 2px;
            }

        .oa-field-input {
            width: 100%;
            height: 44px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 14px;
            color: var(--oa-ink);
            background: #fff;
            transition: border-color .2s ease, box-shadow .2s ease;
        }

            .oa-field-input:focus {
                outline: none;
                border-color: #44877c;
                box-shadow: 0 0 0 3px rgba(68, 135, 124, .15);
            }

        .oa-field-hint {
            margin: 6px 0 0;
            font-size: 12px;
            color: var(--oa-muted);
        }

        .oa-field-error {
            display: none;
            margin-top: 6px;
            font-size: 12px;
            color: #c62828;
            font-weight: 600;
        }

            .oa-field-error.is-visible {
                display: block;
            }

        .oa-upload-zone {
            margin-top: 18px;
            border: 2px dashed #cbd5e1;
            border-radius: 12px;
            background: #fff;
            padding: 28px 18px;
            text-align: center;
            cursor: pointer;
            transition: border-color .2s ease, background .2s ease, box-shadow .2s ease;
        }

            .oa-upload-zone:hover,
            .oa-upload-zone.is-dragover {
                border-color: #44877c;
                background: rgba(68, 135, 124, .04);
                box-shadow: 0 8px 20px rgba(68, 135, 124, .08);
            }

            .oa-upload-zone.has-file {
                border-style: solid;
                border-color: rgba(68, 135, 124, .45);
                background: rgba(68, 135, 124, .06);
            }

        .oa-upload-zone-icon {
            width: 52px;
            height: 52px;
            margin: 0 auto 12px;
            border-radius: 50%;
            background: rgba(68, 135, 124, .12);
            color: #44877c;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }

        .oa-upload-zone-title {
            margin: 0 0 6px;
            font-size: 14px;
            font-weight: 700;
            color: var(--oa-ink);
        }

        .oa-upload-zone-desc {
            margin: 0;
            font-size: 12.5px;
            color: var(--oa-muted);
            line-height: 1.5;
        }

        .oa-upload-files-list {
            display: none;
            margin-top: 12px;
            text-align: left;
        }

            .oa-upload-files-list.is-visible {
                display: block;
            }

        .oa-upload-files-count {
            margin: 0 0 8px;
            font-size: 12px;
            font-weight: 700;
            color: #44877c;
        }

        .oa-upload-file-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            padding: 10px 12px;
            border-radius: 8px;
            background: #fff;
            border: 1px solid #e2e8f0;
            margin-bottom: 8px;
        }

            .oa-upload-file-item:last-child {
                margin-bottom: 0;
            }

        .oa-upload-file-info {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
            flex: 1;
        }

        .oa-upload-file-icon {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            background: rgba(68, 135, 124, .12);
            color: #44877c;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 14px;
        }

        .oa-upload-file-meta {
            min-width: 0;
        }

        .oa-upload-file-name-text {
            margin: 0;
            font-size: 12.5px;
            font-weight: 600;
            color: #334155;
            word-break: break-all;
        }

        .oa-upload-file-size {
            margin: 2px 0 0;
            font-size: 11.5px;
            color: var(--oa-muted);
        }

        .oa-upload-file-remove {
            width: 30px;
            height: 30px;
            border: 0;
            border-radius: 8px;
            background: rgba(198, 40, 40, .08);
            color: #c62828;
            cursor: pointer;
            flex-shrink: 0;
            transition: background .2s ease;
        }

            .oa-upload-file-remove:hover {
                background: rgba(198, 40, 40, .16);
            }

        .oa-btn-cancel {
            min-width: 96px;
            height: 40px;
            border-radius: 10px;
            border: 1px solid #cbd5e1;
            background: #fff;
            color: #475569;
            font-size: 13px;
            font-weight: 600;
        }

            .oa-btn-cancel:hover {
                background: #f8fafc;
                border-color: #94a3b8;
            }

        .oa-btn-submit {
            min-width: 120px;
            height: 40px;
            border-radius: 10px;
            border: 1px solid #44877c;
            background: #44877c;
            color: #fff;
            font-size: 13px;
            font-weight: 600;
            transition: background .2s ease, border-color .2s ease;
        }

            .oa-btn-submit:hover {
                background: #356b62;
                border-color: #356b62;
                color: #fff;
            }

        .oa-arrow-btn.oa-modal-trigger {
            border: 0;
            cursor: pointer;
        }

        @media (max-width: 575px) {
            .oa-upload-modal .modal-body,
            .oa-upload-modal .modal-footer,
            .oa-upload-modal .modal-header {
                padding-left: 16px;
                padding-right: 16px;
            }

            .oa-upload-modal .modal-title {
                font-size: 16px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <asp:Panel ID="pnlExpired" runat="server" Visible="false">
        <div class="oa-expired-wrap">
            <div class="oa-expired-card">
                <h2><i class="fas fa-link-slash" style="color: #c62828; margin-right: 8px;"></i>Invalid link</h2>
                <p>
                    <asp:Literal ID="litExpiredMessage" runat="server" />
                </p>
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
                                                <div class="oa-card-title"><i class="fas fa-clipboard-check oa-title-icon"></i>LLN Test</div>
                                                <p class="oa-form-desc">Complete the Language, Literacy and Numeracy (LLN) test online.</p>
                                            </div>
                                            <a class="oa-arrow-btn" href="lln-test" aria-label="Open LLN test">
                                                <span class="oa-btn-text">Open</span>
                                                <i class="fas fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>

                                    
                                    <div class="oa-card oa-step-card">
                                        <div class="oa-form-row">
                                            <div class="oa-form-left">
                                                <div class="oa-step-badge">Step 5</div>
                                                <div class="oa-card-title"><i class="fas fa-cloud-upload-alt oa-title-icon"></i>Upload Document</div>
                                                <p class="oa-form-desc">Upload supporting documents like passport, visa, offer letter, and others.</p>
                                            </div>
                                            <button type="button" class="oa-arrow-btn oa-modal-trigger" data-toggle="modal" data-target="#uploadDocModal" aria-label="Upload supporting documents">
                                                <span class="oa-btn-text">Open</span>
                                                <i class="fas fa-arrow-right"></i>
                                            </button>
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

    <div class="modal fade oa-upload-modal" id="uploadDocModal" tabindex="-1" role="dialog" aria-labelledby="uploadDocModalTitle">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="oa-upload-modal-title-wrap">
                        <span class="oa-upload-modal-icon"><i class="fas fa-cloud-upload-alt"></i></span>
                        <div>
                            <h4 class="modal-title" id="uploadDocModalTitle">Upload Document</h4>
                            <p class="oa-upload-modal-subtitle">Upload Supporting documents</p>
                        </div>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="oa-upload-field">
                        <label class="oa-field-label" for="<%= txt_std_id.ClientID %>">Student ID<span>*</span></label>
                        <asp:TextBox runat="server" ID="txt_std_id" CssClass="oa-field-input" placeholder="Enter your student ID" autocomplete="off" />
                        <p class="oa-field-hint">Use the student ID provided in your offer letter or enrolment email.</p>
                        <span id="studentIdError" class="oa-field-error">Please enter your student ID.</span>
                    </div>

                    <div class="oa-upload-field">
                        <label class="oa-field-label" for="<%= fuDocument.ClientID %>">Upload Documents<span>*</span></label>
                        <div id="uploadDropZone" class="oa-upload-zone" role="button" tabindex="0" aria-label="Choose files to upload">
                            <div class="oa-upload-zone-icon"><i class="fas fa-file-upload"></i></div>
                            <p class="oa-upload-zone-title">Drag &amp; drop your documents here</p>
                            <p class="oa-upload-zone-desc">or click to browse — PDF, JPG, PNG (max 5 MB each, multiple files allowed)</p>
                        </div>
                        <div id="selectedFilesList" class="oa-upload-files-list"></div>
                        <asp:FileUpload ID="fuDocument" runat="server" AllowMultiple="true" CssClass="oa-file-input-hidden" Style="display: none;" accept=".pdf,.jpg,.jpeg,.png,application/pdf,image/jpeg,image/png" />
                        <span id="fileUploadError" class="oa-field-error">Please select at least one document to upload.</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="oa-btn-cancel" data-dismiss="modal">Cancel</button>
                    <asp:Button Text="Upload" OnClientClick='return validateUploadModal();' class="oa-btn-submit" ID="btnUploadSubmit" OnClick="btnUploadSubmit_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
    <script>
        (function () {
            var dropZone = document.getElementById('uploadDropZone');
            var fileInput = document.getElementById('<%= fuDocument.ClientID %>');
            var filesListBox = document.getElementById('selectedFilesList');
            var selectedFiles = [];

            if (!dropZone || !fileInput || !filesListBox) {
                return;
            }

            function formatFileSize(bytes) {
                if (bytes < 1024) {
                    return bytes + ' B';
                }

                if (bytes < 1024 * 1024) {
                    return (bytes / 1024).toFixed(1) + ' KB';
                }

                return (bytes / 1024 / 1024).toFixed(2) + ' MB';
            }

            function getFileKey(file) {
                return file.name + '|' + file.size + '|' + file.lastModified;
            }

            function validateSelectedFile(file) {
                if (!file) {
                    return { valid: false, message: 'Invalid file.' };
                }

                var allowedTypes = ['application/pdf', 'image/jpeg', 'image/jpg', 'image/png'];
                var maxSizeMb = 5;
                var sizeMb = file.size / 1024 / 1024;

                if (allowedTypes.indexOf(file.type) === -1) {
                    return { valid: false, message: '"' + file.name + '" is not allowed. Only PDF, JPG, and PNG files are supported.' };
                }

                if (sizeMb > maxSizeMb) {
                    return { valid: false, message: '"' + file.name + '" exceeds 5 MB limit.' };
                }

                return { valid: true, message: '' };
            }

            function syncFileInput() {
                if (typeof DataTransfer === 'undefined') {
                    return;
                }

                var dataTransfer = new DataTransfer();
                selectedFiles.forEach(function (file) {
                    dataTransfer.items.add(file);
                });
                fileInput.files = dataTransfer.files;
            }

            function renderSelectedFiles() {
                if (!selectedFiles.length) {
                    dropZone.classList.remove('has-file');
                    filesListBox.classList.remove('is-visible');
                    filesListBox.innerHTML = '';
                    return;
                }

                dropZone.classList.add('has-file');
                filesListBox.classList.add('is-visible');

                var html = '<p class="oa-upload-files-count">' + selectedFiles.length + ' document' + (selectedFiles.length > 1 ? 's' : '') + ' selected</p>';

                selectedFiles.forEach(function (file, index) {
                    html += '<div class="oa-upload-file-item">' +
                        '<div class="oa-upload-file-info">' +
                        '<span class="oa-upload-file-icon"><i class="fas fa-file-alt"></i></span>' +
                        '<div class="oa-upload-file-meta">' +
                        '<p class="oa-upload-file-name-text">' + file.name + '</p>' +
                        '<p class="oa-upload-file-size">' + formatFileSize(file.size) + '</p>' +
                        '</div></div>' +
                        '<button type="button" class="oa-upload-file-remove" data-index="' + index + '" aria-label="Remove ' + file.name + '">' +
                        '<i class="fas fa-times"></i></button></div>';
                });

                filesListBox.innerHTML = html;

                var removeButtons = filesListBox.querySelectorAll('.oa-upload-file-remove');
                removeButtons.forEach(function (button) {
                    button.addEventListener('click', function (e) {
                        e.preventDefault();
                        e.stopPropagation();
                        removeFile(parseInt(button.getAttribute('data-index'), 10));
                    });
                });
            }

            function addFiles(fileList) {
                if (!fileList || !fileList.length) {
                    return;
                }

                var addedCount = 0;
                var errors = [];
                var existingKeys = {};

                selectedFiles.forEach(function (file) {
                    existingKeys[getFileKey(file)] = true;
                });

                for (var i = 0; i < fileList.length; i++) {
                    var file = fileList[i];
                    var validation = validateSelectedFile(file);

                    if (!validation.valid) {
                        errors.push(validation.message);
                        continue;
                    }

                    var fileKey = getFileKey(file);
                    if (existingKeys[fileKey]) {
                        continue;
                    }

                    existingKeys[fileKey] = true;
                    selectedFiles.push(file);
                    addedCount++;
                }

                if (errors.length) {
                    alert(errors.join('\n'));
                }

                if (addedCount > 0) {
                    syncFileInput();
                    renderSelectedFiles();
                    document.getElementById('fileUploadError').classList.remove('is-visible');
                }
            }

            function removeFile(index) {
                if (index < 0 || index >= selectedFiles.length) {
                    return;
                }

                selectedFiles.splice(index, 1);
                syncFileInput();
                renderSelectedFiles();
            }

            function resetUploadFiles() {
                selectedFiles = [];
                fileInput.value = '';
                renderSelectedFiles();
            }

            dropZone.addEventListener('click', function () {
                fileInput.click();
            });

            dropZone.addEventListener('keydown', function (e) {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    fileInput.click();
                }
            });

            fileInput.addEventListener('change', function () {
                addFiles(fileInput.files);
                syncFileInput();
            });

            ['dragenter', 'dragover'].forEach(function (eventName) {
                dropZone.addEventListener(eventName, function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    dropZone.classList.add('is-dragover');
                });
            });

            ['dragleave', 'drop'].forEach(function (eventName) {
                dropZone.addEventListener(eventName, function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    dropZone.classList.remove('is-dragover');
                });
            });

            dropZone.addEventListener('drop', function (e) {
                addFiles(e.dataTransfer.files);
            });

            $('#uploadDocModal').on('hidden.bs.modal', function () {
                document.getElementById('<%= txt_std_id.ClientID %>').value = '';
                resetUploadFiles();
                document.getElementById('studentIdError').classList.remove('is-visible');
                document.getElementById('fileUploadError').classList.remove('is-visible');
            });

            window.validateUploadModal = function () {
                syncFileInput();

                var studentId = document.getElementById('<%= txt_std_id.ClientID %>').value.trim();
                var hasFiles = selectedFiles.length > 0 || (fileInput.files && fileInput.files.length > 0);
                var isValid = true;

                if (!studentId) {
                    document.getElementById('studentIdError').classList.add('is-visible');
                    isValid = false;
                } else {
                    document.getElementById('studentIdError').classList.remove('is-visible');
                }

                if (!hasFiles) {
                    document.getElementById('fileUploadError').classList.add('is-visible');
                    isValid = false;
                } else {
                    document.getElementById('fileUploadError').classList.remove('is-visible');
                }

                return isValid;
            };
        })();
    </script>
</asp:Content>

