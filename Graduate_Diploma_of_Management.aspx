<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Graduate_Diploma_of_Management.aspx.cs" Inherits="Graduate_Diploma_of_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
   Graduate Diploma of Management (Learning)
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
        /* Apply Flexbox to the parent container to make items stretch equally */
        .fa-school{
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
                    <h1>Graduate Diploma of Management (Learning)</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Graduate Diploma of Management</li>
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
                        <h2>Graduate Diploma of Management (Learning)</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="event-items">
                        <!-- Single Item -->
                        <div class="item">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="Dimploma_of_Project_Management.aspx">Graduate Diploma of Management(Learning)</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>BSB80120</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 110315K</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                           This qualification reflects the roles of individuals who apply highly specialised knowledge and skills in the field of organisational learning and capability development. In these roles they are required to generate and evaluate complex ideas; and to initiate, design, and execute major learning and development functions within an organisation. Typically, they would have full responsibility and accountability for the personal output and work of others.

                                        </p>
                                        <p>
                                            This qualification may apply to leaders and managers in an organisation where learning is used to build organisational capability.
                                        </p>

                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 104</td>
                                                <td>Study weeks: 88</td>
                                                <td>Weeks of holidays: 16</td>
                                            </tr>
                                        </table>




                                        <div class="bottom">
                                            <a href="Dimploma_of_Project_Management.aspx" class="btn circle btn-dark border btn-sm">
                                                <i class="fas fa-eye">&nbsp</i>View Detail
                                            </a>
                                            <a href="#">
                                                <i class="fas fa-download">&nbsp</i>Download Flyer
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

               
            </div>
           

        
        </div>
    </div>
    <%--  --%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

