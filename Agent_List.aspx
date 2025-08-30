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
                            Under the new requirements of the Education Services for Overseas Students (ESOS) legislation, Nortwest college must now publish a list of Education Agents acting on its behalf. The list of Education Agents is also published in other materials as prescribed in the legislation.
                        </p>
                    </div>
                </div>
                <div class="agent-image">
                    <a href="Agent_Application.aspx">
                        <img src="assets/img/agent1.jpg" alt="Agent Banner" />
                    </a>
                </div>

                <div>

                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Agency</th>
                                    <th>Business Name</th>
                                    <th>Contact</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="list_agent" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("agency_name") %></td>
                                            <td><%# Eval("business_name") %></td>
                                            <td><%# Eval("contact_number") %></td>
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

