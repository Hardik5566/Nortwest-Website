<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Orientation_Master.master" AutoEventWireup="true" CodeFile="Orientation_List.aspx.cs" Inherits="Admin_Orientation_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" />

    <style>
        .dashboard-container {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
            color: #1e293b;
            background-color: #f8fafc;
            padding: 20px;
        }

        .page-title-section {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
        }

        .page-title-icon {
            background-color: #fef3c7;
            color: #d97706;
            padding: 10px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .page-title-text {
            font-size: 22px;
            font-weight: 700;
            color: #0f172a;
            margin: 0;
        }

        .filter-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 16px 24px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.02);
        }

        .filter-panel {
            display: flex;
            align-items: center;
            gap: 16px;
            width: 100%;
        }

        .search-wrapper {
            position: relative;
            flex: 2;
            min-width: 250px;
        }

            .search-wrapper svg {
                position: absolute;
                left: 14px;
                top: 50%;
                transform: translateY(-50%);
                color: #94a3b8;
                width: 18px;
                height: 18px;
            }

        .ui-input, .ui-select {
            width: 100%;
            height: 44px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            color: #475569;
            background-color: #ffffff;
            outline: none;
            transition: border-color 0.15s ease;
        }

        .ui-input {
            padding: 0 14px 0 42px;
        }

        .ui-select {
            padding: 0 36px 0 14px;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%2364748b' stroke-width='2'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M19 9l-7 7-7-7'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 14px center;
            background-size: 16px;
            flex: 1;
            min-width: 160px;
        }

        .dropdown-status-width {
            min-width: 260px;
        }

        .ui-input:focus, .ui-select:focus {
            border-color: #cbd5e1;
        }

        .date-range-container {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .date-picker-input {
            height: 44px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            color: #475569;
            padding: 0 12px;
            background-color: #ffffff;
        }

        .date-separator {
            color: #94a3b8;
            font-size: 14px;
        }

        .table-card {
            background: #ffffff;
            border: 1px solid #edf2f7;
            border-radius: 12px;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.05);
            padding: 16px;
        }

        table.dataTable {
            border-collapse: collapse !important;
            border-spacing: 0 !important;
            width: 100% !important;
            margin: 15px 0 !important;
            border: none !important;
        }

            table.dataTable thead th {
                font-size: 13px !important;
                font-weight: 600 !important;
                color: #475569 !important;
                background-color: #ffffff !important;
                border-bottom: 1px solid #d4dfd7 !important;
                padding: 16px 20px !important;
                text-align: left !important;
            }

            table.dataTable tbody td {
                font-size: 13px !important;
                color: #334155 !important;
                background-color: #ffffff !important;
                border-bottom: 1px solid #d4dfd7 !important;
                padding: 16px 20px !important;
                vertical-align: middle !important;
            }

            table.dataTable tbody tr:hover td {
                background-color: #f8fafc !important;
            }

        /* ── PDF Download Button ── */
        .pdf-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background-color: #fff7ed;
            color: #ea0c0ccc;
            border: 1px solid #feaaaae0;
            border-radius: 7px;
            padding: 5px 11px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.15s ease, border-color 0.15s ease, transform 0.1s ease;
            margin-bottom:6px;
        }

            .pdf-btn:hover {
                background-color: #ffedd5;
                border-color: #fb923c;
                transform: translateY(-1px);
                color: #c2410c;
                text-decoration: none;
            }

            .pdf-btn svg {
                width: 15px;
                height: 15px;
                flex-shrink: 0;
            }

        /* ── Pending (disabled) Badge ── */
        .pending-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background-color: #fffbeb;
            color: #b45309;
            border: 1px solid #fde68a;
            border-radius: 7px;
            padding: 5px 11px;
            font-size: 12px;
            font-weight: 600;
            cursor: not-allowed;
            opacity: 0.75;
        }

            .pending-badge svg {
                width: 15px;
                height: 15px;
                flex-shrink: 0;
            }

        .col-sr {
            width: 70px !important;
            color: #94a3b8 !important;
            text-align: center !important;
        }

        .col-action {
            width: 60px !important;
            text-align: center !important;
        }

        .dataTables_wrapper .dataTables_length select {
            border: 1px solid #e2e8f0 !important;
            border-radius: 6px !important;
            padding: 4px 8px !important;
            margin: 0 4px !important;
            color: #334155 !important;
        }

        .dataTables_wrapper .dataTables_info {
            color: #64748b !important;
            font-size: 13px !important;
            padding-top: 14px !important;
        }

        .dataTables_wrapper .dataTables_paginate {
            padding-top: 14px !important;
        }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                min-width: 32px !important;
                height: 32px !important;
                padding: 0 8px !important;
                font-size: 13px !important;
                font-weight: 500 !important;
                border-radius: 6px !important;
                border: 1px solid #e2e8f0 !important;
                background: #ffffff !important;
                color: #64748b !important;
                margin-left: 4px !important;
                transition: all 0.15s ease;
            }

                .dataTables_wrapper .dataTables_paginate .paginate_button.current,
                .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
                    background: #f1f5f9 !important;
                    color: #1e293b !important;
                    border-color: #e2e8f0 !important;
                }

                .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
                    background: #f1f5f9 !important;
                    color: #1e293b !important;
                    border-color: #cbd5e1 !important;
                }

                .dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
                .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover {
                    opacity: 0.4 !important;
                    cursor: not-allowed !important;
                    background: #ffffff !important;
                    color: #94a3b8 !important;
                }

        .dataTables_wrapper .dataTables_length,
        .dataTables_wrapper .dataTables_filter,
        .dataTables_wrapper .dataTables_info,
        .dataTables_wrapper .dataTables_processing,
        .dataTables_wrapper .dataTables_paginate {
            padding: 15px !important;
        }

        .usi-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background-color: #eff6ff;
            color: #007bff;
            border: 1px solid #bfdbfe;
            border-radius: 6px;
            padding: 4px 10px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 0.3px;
        }

        .no-usi-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background-color: #f8fafc;
            color: #94a3b8;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 4px 10px;
            font-size: 12px;
            font-weight: 500;
        }

        .document-count-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 28px;
            height: 26px;
            padding: 0 10px;
            background-color: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.2px;
        }

        .no-document-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 28px;
            height: 26px;
            padding: 0 10px;
            background-color: #f8fafc;
            color: #94a3b8;
            border: 1px solid #e2e8f0;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 600;
        }

        .document-count-link {
            border: 1px solid #a7f3d0;
            text-decoration: none !important;
            cursor: pointer;
            transition: background-color 0.15s ease, transform 0.1s ease;
        }

            .document-count-link:hover {
                background-color: #d1fae5 !important;
                transform: translateY(-1px);
                color: #047857 !important;
            }

        .stu-doc-modal .modal-content {
            border: 0;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.18);
        }

        .stu-doc-modal .modal-header {
            background: linear-gradient(135deg, #0f766e 0%, #115e59 100%);
            color: #fff;
            border: 0;
            padding: 18px 22px;
        }

        .stu-doc-modal .modal-title {
            font-size: 18px;
            font-weight: 700;
            margin: 0;
        }

        .stu-doc-modal-subtitle {
            margin: 4px 0 0;
            font-size: 12.5px;
            color: rgba(255, 255, 255, 0.85);
        }

        .stu-doc-modal .modal-body {
            padding: 18px 22px;
            background: #f8fafc;
            max-height: 420px;
            overflow-y: auto;
        }

        .stu-doc-modal .modal-footer {
            border-top: 1px solid #e2e8f0;
            background: #fff;
            padding: 14px 22px;
        }

        .stu-doc-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .stu-doc-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            padding: 12px 14px;
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            transition: border-color 0.15s ease, box-shadow 0.15s ease;
        }

            .stu-doc-item:hover {
                border-color: #99f6e4;
                box-shadow: 0 6px 16px rgba(15, 118, 110, 0.08);
            }

        .stu-doc-item-left {
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 0;
            flex: 1;
        }

        .stu-doc-file-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 18px;
        }

            .stu-doc-file-icon.pdf {
                background: #fef2f2;
                color: #dc2626;
            }

            .stu-doc-file-icon.image {
                background: #eff6ff;
                color: #2563eb;
            }

            .stu-doc-file-icon.other {
                background: #f1f5f9;
                color: #64748b;
            }

        .stu-doc-file-name {
            margin: 0;
            font-size: 13px;
            font-weight: 600;
            color: #1e293b;
            word-break: break-all;
        }

        .stu-doc-download-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 7px 12px;
            border-radius: 8px;
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none;
            white-space: nowrap;
            transition: background-color 0.15s ease;
        }

            .stu-doc-download-btn:hover {
                background: #d1fae5;
                color: #065f46;
            }

        .stu-doc-empty {
            text-align: center;
            padding: 28px 16px;
            color: #64748b;
            font-size: 14px;
        }

        .js-doc-badge {
            display: inline-flex;
        }

        .sol-page-loader {
            position: fixed;
            inset: 0;
            z-index: 99999;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, rgba(248, 250, 252, 0.97) 0%, rgba(241, 245, 249, 0.97) 100%);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            transition: opacity 0.45s ease, visibility 0.45s ease;
        }

            .sol-page-loader.sol-loader-hide {
                opacity: 0;
                visibility: hidden;
                pointer-events: none;
            }

        .sol-loader-card {
            width: min(92vw, 380px);
            padding: 36px 32px 30px;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            box-shadow: 0 24px 60px rgba(15, 23, 42, 0.12);
            text-align: center;
            animation: sol-loader-card-in 0.5s ease;
        }

        @keyframes sol-loader-card-in {
            from {
                opacity: 0;
                transform: translateY(14px) scale(0.98);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .sol-loader-icon-wrap {
            position: relative;
            width: 88px;
            height: 88px;
            margin: 0 auto 22px;
        }

        .sol-loader-ring {
            position: absolute;
            inset: 0;
            border-radius: 50%;
            border: 3px solid transparent;
            border-top-color: #0f766e;
            border-right-color: #14b8a6;
            animation: sol-loader-spin 1.1s linear infinite;
        }

        .sol-loader-ring-2 {
            inset: 10px;
            border-top-color: #d97706;
            border-right-color: #fbbf24;
            animation: sol-loader-spin 1.6s linear infinite reverse;
        }

        .sol-loader-icon {
            position: absolute;
            inset: 22px;
            border-radius: 14px;
            background: linear-gradient(135deg, #fef3c7 0%, #fff7ed 100%);
            color: #d97706;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 20px rgba(217, 119, 6, 0.15);
        }

            .sol-loader-icon svg {
                width: 26px;
                height: 26px;
            }

        .sol-loader-title {
            margin: 0 0 6px;
            font-size: 17px;
            font-weight: 700;
            color: #0f172a;
            letter-spacing: -0.2px;
        }

        .sol-loader-subtitle {
            margin: 0 0 22px;
            font-size: 13px;
            color: #64748b;
            line-height: 1.5;
        }

        .sol-loader-bar {
            height: 5px;
            background: #f1f5f9;
            border-radius: 999px;
            overflow: hidden;
            position: relative;
        }

        .sol-loader-bar-fill {
            position: absolute;
            top: 0;
            left: -40%;
            width: 40%;
            height: 100%;
            border-radius: 999px;
            background: linear-gradient(90deg, #0f766e 0%, #14b8a6 50%, #d97706 100%);
            animation: sol-loader-bar-slide 1.4s ease-in-out infinite;
        }

        .sol-loader-dots {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 16px;
        }

            .sol-loader-dots span {
                width: 7px;
                height: 7px;
                border-radius: 50%;
                background: #cbd5e1;
                animation: sol-loader-dot-bounce 1.2s ease-in-out infinite;
            }

                .sol-loader-dots span:nth-child(2) {
                    animation-delay: 0.15s;
                }

                .sol-loader-dots span:nth-child(3) {
                    animation-delay: 0.3s;
                }

        @keyframes sol-loader-spin {
            to {
                transform: rotate(360deg);
            }
        }

        @keyframes sol-loader-bar-slide {
            0% {
                left: -40%;
            }

            100% {
                left: 100%;
            }
        }

        @keyframes sol-loader-dot-bounce {
            0%, 80%, 100% {
                transform: translateY(0);
                background: #cbd5e1;
            }

            40% {
                transform: translateY(-5px);
                background: #0f766e;
            }
        }
        .date{
            color:#999999
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">

    <div id="pageLoader" class="sol-page-loader">
        <div class="sol-loader-card">
            <div class="sol-loader-icon-wrap">
                <div class="sol-loader-ring"></div>
                <div class="sol-loader-ring sol-loader-ring-2"></div>
                <div class="sol-loader-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M4.5 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM14.25 8.625a3.375 3.375 0 1 1 6.75 0 3.375 3.375 0 0 1-6.75 0ZM1.5 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM17.25 19.128l-.001.144a2.25 2.25 0 0 1-.233.96 14.434 14.434 0 0 0 5.234-1.103.75.75 0 0 0 .425-.666a5.625 5.625 0 0 0-8.25-4.965 7.46 7.46 0 0 1 2.825 5.63Z" />
                    </svg>
                </div>
            </div>
            <p class="sol-loader-title">Loading...</p>
            <%--            <p class="sol-loader-subtitle">Please wait while we prepare your orientation dashboard</p>--%>
            <%--<div class="sol-loader-bar">
                <div class="sol-loader-bar-fill"></div>
            </div>
            <div class="sol-loader-dots">
                <span></span>
                <span></span>
                <span></span>
            </div>--%>
        </div>
    </div>

    <div class="page-title-section">
        <div class="page-title-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" style="width: 22px; height: 22px;">
                <path d="M4.5 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM14.25 8.625a3.375 3.375 0 1 1 6.75 0 3.375 3.375 0 0 1-6.75 0ZM1.5 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM17.25 19.128l-.001.144a2.25 2.25 0 0 1-.233.96 14.434 14.434 0 0 0 5.234-1.103.75.75 0 0 0 .425-.666a5.625 5.625 0 0 0-8.25-4.965 7.46 7.46 0 0 1 2.825 5.63Z" />
            </svg>
        </div>
        <h2 class="page-title-text">Student Orientation Data</h2>
    </div>

    <div class="filter-card">
        <div class="filter-panel">
            <div class="search-wrapper">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
                <asp:TextBox ID="txt_search" class="ui-input" placeholder="Search students..." runat="server"></asp:TextBox>
            </div>

            <%--  <select id="ddl_status" class="ui-select dropdown-status-width">
                <option value="all">All Statuses</option>
                <option value="enrollment_filled">Student Enrollment Form (Filled)</option>
                <option value="course_filled">Course Entry Form (Filled)</option>
                <option value="lln_filled">LLN Test (Filled)</option>
            </select>

            <div class="date-range-container">
                <asp:TextBox ID="txt_from_date" CssClass="date-picker-input" TextMode="Date" placeholder="dd-mm-yyyy" runat="server"></asp:TextBox>
                <span class="date-separator">to</span>
                <asp:TextBox ID="txt_to_date" CssClass="date-picker-input" TextMode="Date" placeholder="dd-mm-yyyy" runat="server"></asp:TextBox>
            </div>--%>
        </div>
    </div>

    <div class="table-card">
        <div class="table-responsive">
            <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="false"
                CssClass="grid_data" GridLines="None" OnRowCommand="grid_data_RowCommand">
                <Columns>

                    <asp:TemplateField HeaderText="Sr No.">
                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="col-sr" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student ID">
                        <ItemTemplate>
                            <span style="font-weight: 600; color: #0f172a;"><%# Eval("student_id_no") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Name">
                        <ItemTemplate>
                            <div style="font-weight: 500; color: #1e293b;"><%# Eval("student_full_name") %></div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <span style="color: #64748b;"><%# Eval("email") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="USI Number">
                        <ItemTemplate>
                            <%# Convert.ToString(Eval("usi_no")) != ""
            ? "<span class='usi-badge'>" +
              "<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2' style='width:13px;height:13px;vertical-align:middle;'>" +
              "<path stroke-linecap='round' stroke-linejoin='round' d='M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z' /></svg> " +
              Eval("usi_no") + "</span>"
            : "<span class='no-usi-badge'>" +
              "<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2' style='width:13px;height:13px;vertical-align:middle;'>" +
              "<path stroke-linecap='round' stroke-linejoin='round' d='M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636' /></svg> Not Assigned</span>" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Enrollment Form Status --%>
                    <asp:TemplateField HeaderText="Orientation Form">
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                CommandArgument='<%# Eval("enrolment_id") %>'
                                CommandName="btn_enrolment"
                                CssClass='<%# Convert.ToInt32(Eval("enrollment_status")) == 1 ? "pdf-btn" : "pending-badge" %>'
                                Enabled='<%# Convert.ToInt32(Eval("enrollment_status")) == 1 %>'
                                ToolTip='<%# Convert.ToInt32(Eval("enrollment_status")) == 1 ? "Download PDF" : "Not submitted yet" %>'>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" style="width:15px;height:15px;vertical-align:middle;">
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m.75 12l3 3m0 0l3-3m-3 3v-6m-1.5-9H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
            </svg>
                            </asp:LinkButton>
                            <br />
                            <span class="date"><%# Eval("orientation_date") %></span>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>

                    <%-- Course Entry Form Status --%>
                    <asp:TemplateField HeaderText="Course Entry Form">
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                CommandArgument='<%# Eval("course_entry_id") %>'
                                CommandName="btn_courseentry"
                                CssClass='<%# Convert.ToInt32(Eval("course_entry_status")) == 1 ? "pdf-btn" : "pending-badge" %>'
                                Enabled='<%# Convert.ToInt32(Eval("course_entry_status")) == 1 %>'
                                ToolTip='<%# Convert.ToInt32(Eval("course_entry_status")) == 1 ? "Download PDF" : "Not submitted yet" %>'>
            <%# Convert.ToInt32(Eval("course_entry_status")) == 1
                ? "<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2' style='width:15px;height:15px;vertical-align:middle;'><path stroke-linecap='round' stroke-linejoin='round' d='M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m.75 12l3 3m0 0l3-3m-3 3v-6m-1.5-9H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z' /></svg>"
                : "<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2' style='width:15px;height:15px;vertical-align:middle;'><path stroke-linecap='round' stroke-linejoin='round' d='M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z' /></svg>" %>
                            </asp:LinkButton>
                            <br />
                            <span class="date"><%# Eval("course_entry_date") %></span>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>

                    <%-- LLN Test Status --%>
                    <asp:TemplateField HeaderText="LLN Test">
                        <ItemTemplate>
                            <%# Convert.ToInt32(Eval("lln_status")) == 1
            ? "<a href='https://nortwest.llnexam.com/pdf_download_std_id.aspx?rid=" + Eval("exam_id") + "&std_id=" + Eval("student_id_no") + "' target='_blank' class='pdf-btn' data-status='1' title='Download LLN PDF'>" +
              "<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2' style='width:15px;height:15px;vertical-align:middle;'>" +
              "<path stroke-linecap='round' stroke-linejoin='round' d='M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m.75 12l3 3m0 0l3-3m-3 3v-6m-1.5-9H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z' /></svg> " +
              Eval("result") + "</a>"
            : "<span class='pending-badge' data-status='0' title='Not submitted yet'>" +
              "<svg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2' style='width:15px;height:15px;vertical-align:middle;'>" +
              "<path stroke-linecap='round' stroke-linejoin='round' d='M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z' /></svg> </span>" %>
                            <br />
                            <span class="date"><%# Eval("lln_date") %></span>

                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Document">
                        <ItemTemplate>
                            <%# (string.IsNullOrEmpty(Convert.ToString(Eval("document_count"))) || Convert.ToInt32(Eval("document_count")) == 0)
            ? "<span class='no-document-badge' title='No documents uploaded'>0</span>"
            : "<span class='document-count-badge document-count-link js-doc-badge' data-doc-id='" + Eval("doc_id") + "' title='View uploaded documents'>" + Eval("document_count") + " Doc</span>" %>
                        </ItemTemplate>
                        <HeaderStyle CssClass="text-center" />
                        <ItemStyle CssClass="text-center" />
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="modal fade stu-doc-modal" id="studentDocModal" tabindex="-1" aria-labelledby="studentDocModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div>
                        <h5 class="modal-title" id="studentDocModalLabel">Student Documents</h5>
                        <p class="stu-doc-modal-subtitle" id="stuDocStudentInfo"></p>
                    </div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="stuDocLoading" class="stu-doc-empty" style="display: none;">Loading documents...</div>
                    <div id="stuDocEmpty" class="stu-doc-empty" style="display: none;">No documents found for this student.</div>
                    <div id="stuDocList" class="stu-doc-list"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        var solPageReady = { windowLoaded: false, tableReady: false };

        function hidePageLoader() {
            if (!solPageReady.windowLoaded || !solPageReady.tableReady) return;
            var $loader = $('#pageLoader');
            $loader.addClass('sol-loader-hide');
            setTimeout(function () { $loader.remove(); }, 480);
        }

        $(window).on('load', function () {
            solPageReady.windowLoaded = true;
            hidePageLoader();
        });

        $(document).ready(function () {
            var $table = $('#<%= grid_data.ClientID %>');

            if ($table.find('tbody').length > 0 && $table.find('th').length > 0) {

                var $header = $table.find('tr:first-child').wrap('<thead/>').parent();
                $table.prepend($header);

                var dTable = $table.DataTable({
                    "paging": true,
                    "pageLength": 10,
                    "lengthMenu": [5, 10, 25, 50],
                    "ordering": false,
                    "info": true,
                    "dom": 'lrtip',
                    "language": {
                        "paginate": {
                            "previous": "‹",
                            "next": "›"
                        }
                    }
                });

                // Text Search Filter
                $('#<%= txt_search.ClientID %>').on('input', function () {
                    dTable.search($(this).val()).draw();
                });

                // Dropdown Status Filter
                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
                    var selectedFilter = $('#ddl_status').val();
                    if (selectedFilter === 'all') return true;

                    var $row = $(dTable.row(dataIndex).node());

                    if (selectedFilter === 'enrollment_filled') {
                        return $row.find('td:nth-child(5) [data-status]').attr('data-status') === '1';
                    }
                    if (selectedFilter === 'course_filled') {
                        return $row.find('td:nth-child(6) [data-status]').attr('data-status') === '1';
                    }
                    if (selectedFilter === 'lln_filled') {
                        return $row.find('td:nth-child(7) [data-status]').attr('data-status') === '1';
                    }

                    return true;
                });

                $('#ddl_status').on('change', function () {
                    dTable.draw();
                });
            }

            $(document).on('click', '.js-doc-badge', function () {
                openStudentDocModal($(this).data('doc-id'));
            });

            solPageReady.tableReady = true;
            hidePageLoader();
        });

        function escapeHtml(value) {
            return String(value || '')
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;')
                .replace(/'/g, '&#39;');
        }

        function openStudentDocModal(docId) {
            var $list = $('#stuDocList');
            var $loading = $('#stuDocLoading');
            var $empty = $('#stuDocEmpty');

            $list.empty();
            $empty.hide().text('No documents found for this student.');
            $loading.show();
            $('#stuDocStudentInfo').text('');

            var docModal = bootstrap.Modal.getOrCreateInstance(document.getElementById('studentDocModal'));
            docModal.show();

            $.ajax({
                type: 'POST',
                url: 'Student_Orientation_List.aspx/GetStudentDocuments',
                data: JSON.stringify({ docId: String(docId) }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    $loading.hide();
                    var data = response.d;

                    if (!data || !data.success) {
                        $empty.text(data && data.message ? data.message : 'Unable to load documents.').show();
                        return;
                    }

                    $('#stuDocStudentInfo').text('Student ID: ' + (data.studentId || ''));

                    if (!data.files || !data.files.length) {
                        $empty.show();
                        return;
                    }

                    var html = '';
                    data.files.forEach(function (file) {
                        html += '<div class="stu-doc-item">' +
                            '<div class="stu-doc-item-left">' +
                            '<span class="stu-doc-file-icon ' + escapeHtml(file.fileIconClass) + '">' +
                            '<i class="bi ' + escapeHtml(file.fileIcon) + '"></i></span>' +
                            '<p class="stu-doc-file-name">' + escapeHtml(file.fileName) + '</p>' +
                            '</div>' +
                            '<a href="' + escapeHtml(file.downloadUrl) + '" class="stu-doc-download-btn" target="_blank" download="' + escapeHtml(file.fileName) + '">' +
                            '<i class="bi bi-download"></i> Download</a>' +
                            '</div>';
                    });

                    $list.html(html);
                },
                error: function () {
                    $loading.hide();
                    $empty.text('Unable to load documents. Please try again.').show();
                }
            });
        }
    </script>
</asp:Content>
