<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Agent_List.aspx.cs" Inherits="Agent_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Agent List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .table th {
            background: #33897c;
            color: white;
        }

        td {
            font-size: 12px !important;
        }

        .agent-image {
            margin-bottom: 60px;
        }

            .agent-image img {
                border-radius: 10px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Agent List</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Agent List</li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

    <div class="category-area default-padding">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Agents</h2>
                        <p>
                            Nortwest works with approved education agents who are formally authorised to represent the College and support prospective international students with accurate and ethical information about our courses and services. Nortwest actively monitors the performance and conduct of its education agents to ensure compliance with the ESOS Act, National Code, and the College’s policies. Approved education agents may receive commissions from the College for successful student enrolments in accordance with written agreements and applicable legislation.
                        </p>
                    </div>
                </div>
                <div class="agent-image">
                    <a href="Agent_app_form.aspx">
                        <img src="assets/img/agent1.jpg" alt="Agent Banner" />
                    </a>
                </div>

                <div>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Agency</th>
                                    
                                    <th>Business Suburb</th>
                                    <th>Business Country</th>
                                    <th>Email</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="list_agent" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("agency_name") %></td>
                                             
                                            <td><%# Eval("business_suburb") %></td>
                                            <td><%# Eval("business_country") %></td>
                                    <td><%# Eval("email") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

