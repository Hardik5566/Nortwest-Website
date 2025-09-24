<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Form_list.aspx.cs" Inherits="Admin_Form_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Form List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Grid container: equal row heights using grid-auto-rows */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 15px;
            margin-top: 20px;
            grid-auto-rows: 1fr; /* ensures each row's cells are same height */
            align-items: stretch;
        }

            /* Make anchor fill the grid cell so cards stretch */
            .dashboard-container > a {
                display: block;
                height: 100%;
                text-decoration: none;
                color: inherit;
            }

        /* Card */
        .dashboard-card {
            background: #fff;
            border-radius: 10px;
            padding: 18px 15px;
            border: 1px solid #e6e6e6;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
            transition: transform 0.18s ease, box-shadow 0.18s ease;
            text-align: center;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            /* make card occupy full height of grid cell and layout vertically */
            height: 100%;
            display: flex;
            flex-direction: column;
        }

            .dashboard-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0,0,0,0.10);
            }

        .card-top {
            /* top content stays at top */
        }

        .card-bottom {
            /* pushes value to bottom of card */
            margin-top: auto;
        }

        .card-icon {
            font-size: 28px;
            color: #0d6efd;
            margin-bottom: 10px;
            text-shadow: none !important;
        }

        /* IMPORTANT: remove any text-shadow coming from global CSS */
        .dashboard-card,
        .dashboard-card * {
            text-shadow: none !important;
            -webkit-text-shadow: none !important; /* just in case */
        }

        .card-title {
            font-size: 15px;
            font-weight: 500;
            color: #333;
            margin-bottom: 6px;
            text-shadow: none !important;
        }

        .card-value {
            font-size: 22px;
            font-weight: 500;
            color: #0d6efd;
            text-shadow: none !important;
        }

        /* Slight responsive tweaks */
        @media (max-width: 420px) {
            .dashboard-card {
                padding: 14px 10px;
            }

            .card-title {
                font-size: 14px;
            }

            .card-value {
                font-size: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="dashboard-container">

        <!-- Student Request -->
        <a href="Student_Request.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-user-graduate"></i></div>
                    <div class="card-title">Student Request</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_student_request" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Deferment -->
        <a href="Application_For_Deferment.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-calendar-times"></i></div>
                    <div class="card-title">Deferment / Suspension of Studies</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_deferemetn" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Change Course -->
        <a href="Change_Course.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-exchange-alt"></i></div>
                    <div class="card-title">Change of a Course</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_change_course" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Cancellation -->
        <a href="Cancellation_Form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-times-circle"></i></div>
                    <div class="card-title">Cancellation</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_cancel" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Special Leave -->
        <a href="Special_Leave_Request.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-plane-departure"></i></div>
                    <div class="card-title">Special Leave Request</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_special_leave" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Credit Card Authorization -->
        <a href="Credit_Card_auth.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-credit-card"></i></div>
                    <div class="card-title">Credit Card Authorisation</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_credit_card_auth" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Student Details -->
        <a href="Student_Details_Form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-id-card"></i></div>
                    <div class="card-title">Student Details</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_student_detail" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Credit Transfer -->
        <a href="Credit_Transfer_Application.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-university"></i></div>
                    <div class="card-title">Credit Transfer Application</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_credit" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Reassessment -->
        <a href="Application_For_Reassesment.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-file-signature"></i></div>
                    <div class="card-title">Application for Reassessment</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_reassesment_application" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Appeal -->
        <a href="Appeal_Form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-balance-scale"></i></div>
                    <div class="card-title">Appeal</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_appeal" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Complaint -->
        <a href="Complaint_and_Feedback.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-exclamation-triangle"></i></div>
                    <div class="card-title">Complaint & Feedback</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_complaint" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- Change of Campus -->
        <a href="Change_of_Campus.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-building"></i></div>
                    <div class="card-title">Change of Campus</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_campus_change" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- CRICOS Withdraw -->
        <a href="Cricos_student_Withdraw_Form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-sign-out-alt"></i></div>
                    <div class="card-title">CRICOS Student Withdrawal</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_cricos_withdraw" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <%--        <a href="Cricos_student_Withdraw_Form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-sign-out-alt"></i></div>
                    <div class="card-title">LLN Test</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lln_test" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>--%>

        <!-- Refund -->
        <a href="Refund.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-hand-holding-usd"></i></div>
                    <div class="card-title">Refund</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_refund" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- GTE -->
        <a href="GTE.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-file-alt"></i></div>
                    <div class="card-title">GTE</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_GTE" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- EPT -->
        <a href="English_Test.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-pencil-alt"></i></div>
                    <div class="card-title">English Test (EPT)</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_ept" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- ELICOS -->
        <a href="New_Elicos_Orientation.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-book-reader"></i></div>
                    <div class="card-title">ELICOS</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_elicos" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>

        <!-- VET -->
        <a href="New_Vet_Orientation.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">VET</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_total_vet" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="release_request_form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">Release Request Form</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_relese" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="qualification_issuance__form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">Qualification Issuance Form</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_qualification" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="GST_form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">GST Form</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_gst" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="course_entry_form.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">Course Entry Interview Form</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_course_entry" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="Agent_application.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">Agent Application Form</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_agent_app" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="Contact_us.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">Contact Us Form</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="lbl_contact" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <%--  <a href="New_Vet_Orientation.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">Installment Payment Agreement</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>
        <a href="New_Vet_Orientation.aspx">
            <div class="dashboard-card">
                <div class="card-top">
                    <div class="card-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                    <div class="card-title">LLN</div>
                </div>
                <div class="card-bottom">
                    <div class="card-value">
                        <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </a>--%>
    </div>
</asp:Content>
