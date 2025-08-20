<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cookery_and_Hospitality.aspx.cs" Inherits="Cookery_and_Hospitality" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Cookery and Hospitality
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
                    <h1>Cookery and Hospitality</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Cookery and Hospitality</li>
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
                        <h2>Cookery and Hospitality</h2>
                    </div>
                </div>
            </div>
            <div class="row" style="display: flex; flex-wrap: wrap;">
                <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
                    <div class="event-items">
                        <!-- Single Item -->
                        <div class="item">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="Dimploma_of_Project_Management.aspx">Certificate III In Commercial Cookery</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>SIT30821</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 110972K</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of cooks who use a wide range of well-developed cookery skills and sound knowledge of kitchen operations to prepare food and menu items. Using discretion and judgement, they work with some independence and under limited supervision using plans, policies and procedures to guide work activities. Completion of this qualification contributes to recognition as a trade cook.
                                        </p>

                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 66</td>
                                                <td>Study weeks: 55</td>
                                                <td>Weeks of holidays: 11</td>
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
   <div class="col-md-6 d-flex align-items-stretch">
                    <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
                        <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="#">Certificate IV in Kitchen Management</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>SIT40521</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 110973J</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of chefs and cooks who have a supervisory or team leading role in the kitchen. They operate independently or with limited guidance from others and use discretion to solve non-routine problems.
                                        </p>
                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 92</td>
                                                <td>Study weeks: 77</td>
                                                <td>Weeks of holidays: 15</td>
                                            </tr>
                                        </table>
                                        <div class="bottom">
                                            <a href="#" class="btn circle btn-dark border btn-sm">
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

            <%--  --%>
           <div class="row default-padding" style="display: flex; flex-wrap: wrap;">
                <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
                    <div class="event-items">
                        <!-- Single Item -->
                        <div class="item">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="Dimploma_of_Project_Management.aspx">Diploma of Hospitality Management</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>SIT50422</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 110974H</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification reflects the role of highly skilled senior operators who use a broad range of hospitality skills combined with managerial skills and sound knowledge of industry to coordinate hospitality operations. They operate independently, have responsibility for others and make a range of operational business decisions.
                                            This qualification provides a pathway to work in any hospitality industry sector as a departmental or small business manager. The diversity of employers includes restaurants, hotels, motels, catering operations, clubs, pubs, cafes, and coffee shops. This qualification allows for multiskilling and for specialisation in accommodation services, cookery, food and beverage and gaming.

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

                  <div class="col-md-6 d-flex align-items-stretch">
                    <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
                        <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="#">Advanced Diploma of Hospitality Management</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>SIT60322</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 110975G</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p class="mid">
                                            This qualification reflects the role of highly skilled senior managers who use a broad range of hospitality skills combined with specialised managerial skills and substantial knowledge of industry to coordinate hospitality operations. They operate with significant autonomy and are responsible for making strategic business management decisions.

                                        </p>
                                        <table class="table tbl_course_duration">
                                            <tr class="row">
                                                <td>Total weeks: 104</td>
                                                <td>Study weeks: 88</td>
                                                <td>Weeks of holidays: 16</td>
                                            </tr>
                                        </table>
                                        <div class="bottom">
                                            <a href="#" class="btn circle btn-dark border btn-sm">
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

