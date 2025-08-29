<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Policy.aspx.cs" Inherits="Policy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Policies & Procedures
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <%-- <style>
        ul li a {
            color: white !important;
        }

        .title h4 {
            color: white;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Policies & Procedures</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Policies & Procedures</li>
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
                        <h2>Policies & Procedures</h2>

                    </div>

                </div>

            </div>
        </div>


        <div class="blog-area single full-blog right-sidebar full-blog">
            <div class="container">
                <div class="row">
                    <div class="blog-items">
                        <!-- Start Sidebar -->
                        <div class="sidebar col-md-12">
                            <div class="row">
                                <aside>
                                    <div class="sidebar-item category" style="background-color: #44887c">
                                       <%-- <div class="title">
                                            <h4>Policies & Procedures list</h4>
                                        </div>--%>
                                        <div class="sidebar-info">
                                            <ul>
                                                <asp:ListView ID="list_policies" runat="server">
                                                    <ItemTemplate>
                                                        <div class="col-md-6" style="padding: 8px">
                                                            <li>
                                                                <a href='<%# "admin/assets/Policies/" + Eval("policies_file") %>'
                                                                    target="_blank"
                                                                    style="color: #fff; font-weight: 500; text-decoration: none;">
                                                                    <i class="fa fa-file-pdf-o" style="color: #fff; margin-right: 6px;"></i>
                                                                    <%# Eval("policies_name") %>
                                                                </a>
                                                            </li>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </ul>
                                        </div>
                                    </div>
                                </aside>
                            </div>
                        </div>
                        <!-- End Sidebar -->
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

