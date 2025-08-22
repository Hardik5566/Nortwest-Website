<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Project_Management.aspx.cs" Inherits="Project_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Project Managment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .event-area .event-items .item .info-box .content {
            padding-left: 0px;
            margin-left: 0px;
            position: relative;
            z-index: 1;
        }

            .event-area .event-items .item .info-box .content::after {
                width: 0px;
            }

        .fa-school {
            color: #ffb606 !important;
            margin-right: 5px !important;
            font-size: 12px !important;
            position: relative !important;
            top: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="breadcrumb-area shadow dark bg-fixed text-center text-light" style="background-image: url(assets/img/courses_banner.png);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h1>Project Managment</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Project Managment</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="event-area default-padding">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2><%--Project Management--%><asp:Label ID="lbl_programme" Style="color: #002147" runat="server" Text=""></asp:Label></h2>
                    </div>
                </div>
            </div>
            <div class="row" style="display: flex; flex-wrap: wrap;">

                <asp:ListView ID="list_course" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 d-flex align-items-stretch" style="margin-top: 25px;">
                            <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
                                <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                                    <div class="col-md-12 info">
                                        <div class="info-box">
                                            <div class="content">
                                                <h4>
                                                    <a href="#"><%# Eval("course_name") %></a>
                                                </h4>
                                                <ul>
                                                    <li><i class="fas fa-book"></i><%# Eval("course_code") %></li>
                                                    <li><i class="fas fa-map-marked-alt"></i>CRICOS : <%# Eval("cricos_code") %></li>
                                                </ul>
                                                <ul>
                                                    <li><i class="fas fa-school"></i>Sydney CBD</li>
                                                    <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                                    <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                                </ul>
                                                <p>
                                                    <%# Eval("description") %>
                                                </p>
                                                <table class="table tbl_course_duration">
                                                    <tr class="row">
                                                        <td>Total weeks:  <%# Eval("total_week") %></td>
                                                        <td>Study weeks:  <%# Eval("study_week") %></td>
                                                        <td>Weeks of holidays:  <%# Eval("weeks_holiday") %></td>
                                                    </tr>
                                                </table>
                                                <div class="bottom">
                                                    <a href='<%# string.IsNullOrEmpty(Eval("flyer").ToString()) ? "#" : ResolveUrl("~/Admin/assets/Flyer/" + Eval("flyer")) %>'
                                                        <%# string.IsNullOrEmpty(Eval("flyer").ToString()) ? "onclick=\"return false;\"" : "download" %>>
                                                        <i class="fas fa-download"></i>&nbsp;Download Flyer
                                                    </a>


                                                    <%-- <a href="#" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-eye">&nbsp</i>View Detail
                                            </a>
                                            <a href="#">
                                                <i class="fas fa-download">&nbsp</i>Download Flyer
                                            </a>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

