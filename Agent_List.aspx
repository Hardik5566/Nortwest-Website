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
                        <table class="table bottom-0">
                            <thead>
                                <tr>

                                    <th>Agency</th>
                                    <th>Business Address</th>
                                    <th>Business Phone</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <td>Advisapro Migration & Education Services</td>
                                    <td>Suit 3, 153 Haldon Street</td>
                                    <td>+61 405 363 578</td>
                                </tr>
                                <tr>
                                    <td>Asia Pacific Group</td>
                                    <td>Level 1, 210 Clarance Street</td>
                                    <td>+61 292 645 296</td>
                                </tr>
                                <tr>
                                    <td>Aussie Asean Education</td>
                                    <td>Suite 1101, Level 100/338</td>
                                    <td>+61 468 685 460</td>
                                </tr>
                                <tr>
                                    <td>Aussizz Group Pty Ltd</td>
                                    <td>Level 2, 24 Hunter St</td>
                                    <td>+61 291 528 585</td>
                                </tr>
                                <tr>
                                    <td>Aussy Education Group Pty., Ltd.</td>
                                    <td>Level 5, Suite 522/368 Sussex St</td>
                                    <td>+61 450 058 009</td>
                                </tr>
                                <tr>
                                    <td>Australia Online (SIS Consulting Pty Ltd)</td>
                                    <td>Suite 301, Level 3, 39 Liverpool Street</td>
                                    <td>+61 290 030 466</td>
                                </tr>
                                <tr>
                                    <td>Australia Studycare</td>
                                    <td>Ground Floor, 810 George St.</td>
                                    <td>+61 292 810 070</td>
                                </tr>
                                <tr>

                                    <td>Australian International Education and Qualification Group Pty Ltd (AIEQ)</td>
                                    <td>Level 1, 239 Church Street</td>
                                    <td>+61 488 016 866</td>
                                </tr>
                                <tr>

                                    <td>Bridge Blue Pty Ltd</td>
                                    <td>Suite 801A, Level 8, 276 Pitt Street</td>
                                    <td>+61 292 690 110</td>
                                </tr>
                                <tr>

                                    <td>CESE Australia Pty Ltd (Sydney – Australia)</td>
                                    <td>93 Audley Street, Petersham</td>
                                    <td>+61 295 723 008</td>
                                </tr>
                                <tr>
                                    <td>Direction Australia</td>
                                    <td>Suite 272, Level 2, 398-408 Pitt Street</td>
                                    <td>+61 292 612 615</td>
                                </tr>
                                <tr>
                                    <td>Education and Migration Services Australia</td>
                                    <td>Cra. 19C No. 86 – 30 Of. 402 Edificio Dinamarca</td>
                                    <td>+57 310 894 2190</td>
                                </tr>
                                <tr>

                                    <td>Ehub International</td>
                                    <td>Suite 2, Level 2, 22 Market Street</td>
                                    <td>+61 272 261 393</td>
                                </tr>
                                <tr>

                                    <td>FIRST ONE EDUCATION PTY LTD</td>
                                    <td>605/276 Pitt Street</td>
                                    <td>+61 292 670 718</td>
                                </tr>
                                <tr>

                                    <td>International Student Educational Migration Services (ISEMS)</td>
                                    <td>314 Church Street</td>
                                    <td>+61 298 939 990</td>
                                </tr>
                                <tr>

                                    <td>IWISE EDUCATION PTY LTD</td>
                                    <td>126 Manningham Road</td>
                                    <td>+61 431 156 829</td>
                                </tr>
                                <tr>

                                    <td>Link Austalia Turismo Ltd</td>
                                    <td>Suite 1304, Level 13, 50 Cavill Avenue</td>
                                    <td>+61 420 310 551</td>
                                </tr>
                                <tr>

                                    <td>Link House</td>
                                    <td>Office 202, Level 2, 127 York St</td>
                                    <td>+61 405 992 281</td>
                                </tr>
                                <tr>

                                    <td>Link2World</td>
                                    <td>Suite 108, Level 1, 83 York Street</td>
                                    <td>+61 289 374 355</td>
                                </tr>
                                <tr>

                                    <td>Navigate Visa and Education</td>
                                    <td>Suite 412, Level 4, 368 Sussex Street</td>
                                    <td>+61 416 755 699</td>
                                </tr>
                                <tr>

                                    <td>New Edge Consultancy Pty Ltd</td>
                                    <td>Suite 4, Level 8, 99 York St</td>
                                    <td>–</td>
                                </tr>
                                <tr>

                                    <td>Oceania Education and Visa Services</td>
                                    <td>Suite 703, Level 7, 491 Kent Street</td>
                                    <td>+61 414 395 143</td>
                                </tr>
                                <tr>

                                    <td>Overseas Study and Migration</td>
                                    <td>10, Wreath Drive</td>
                                    <td>+61 477 779 933</td>
                                </tr>
                                <tr>

                                    <td>Pacific Center</td>
                                    <td>2/2 Pittwater Road</td>
                                    <td>+61 416 696 020</td>
                                </tr>
                                <tr>

                                    <td>Prime Foreign Education Consultant (PFEC)</td>
                                    <td>Suite 808, L 8, 97-99 Bathurst Street</td>
                                    <td>+61 283 784 282</td>
                                </tr>
                                <tr>

                                    <td>RK Education and Visa Services PTY LTD</td>
                                    <td>31 Warrenwood AVE</td>
                                    <td>+61 452 235 601</td>
                                </tr>
                                <tr>

                                    <td>ROYAL INTERNATIONAL MIGRATION CONSULTANTS PTY LTD</td>
                                    <td>87 Wigram Street</td>
                                    <td>+61 288 108 348</td>
                                </tr>
                                <tr>

                                    <td>Themigration.com.au (Aussie Migration & Education Services Pty Ltd)</td>
                                    <td>Office 2, 16 Kendall</td>
                                    <td>+61 449 550 100</td>
                                </tr>
                                <tr>

                                    <td>Vantage Consultants Melbourne</td>
                                    <td>Level 3, 313 Flinders Lane</td>
                                    <td>+61 396 420 138</td>
                                </tr>
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

