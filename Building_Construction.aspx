<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Building_Construction.aspx.cs" Inherits="Building_Construction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Building & Construction
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
                    <h1>Building & Construction</h1>
                    <ul class="breadcrumb">
                        <li><a href="Default.aspx"><i class="fas fa-home"></i>Home</a></li>
                        <li class="active">Building & Construction</li>
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
                        <h2>Building & Construction</h2>
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
                                            <a href="Dimploma_of_Project_Management.aspx">Certificate lll in Wall & Floor Tiling</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>CPC31320</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 111616M</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification will help you become a trade qualified tiler and start your career in the booming construction industry. Learn to transform spaces in industrial, commercial and residential settings and get the practical skills to manage tiling projects from planning to completion. You will receive hands-on training from industry experienced teachers, train in excellent training facilities and gain practical experience on full scale projects.
                                        </p>
                                        <p>
                                            Much of wall and floor tiling work is straightforward, but it often requires skill and judgement. You must understand working drawings of buildings and be able to apply basic mathematics. Wall and floor tilers also do more complicated tiling work such as mosaics, curved walls and pools and spas. These jobs require training, ability and experience.
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
                                            <a href="#">Certificate III in Painting and Decorating</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>CPC30620</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 111615A</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification will help you learn a range of skills including how to handle painting and decorating tools, equipment and materials and match paint colours in a range of domestic and commercial settings. You’ll learn how to prepare surfaces and apply paint, wallpaper and other coatings to protect, maintain and decorate interior and exterior surfaces. Our industry-expert teachers will ensure you can work safely and effectively in a construction environment, including erecting and dismantling restricted-height scaffolding so you can work on elevated platforms
                                        </p>
                                        <p>
                                            Successful completion of this qualification allows you to apply to become a qualified painter and decorator and continue your career in the industry.
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
            <%--  --%>
            <div class="row default-padding" style="display: flex; flex-wrap: wrap;">
                <div class="col-md-6 d-flex align-items-stretch" style="display: flex; flex: 1 1 50%; box-sizing: border-box;">
                    <div class="event-items">

                        <div class="item">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="#">Diploma of Building and Construction (Building)</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>CPC50220</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 111617K</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification is designed to meet the needs of a building professional who coordinates the construction of a building, taking responsibility for the overall completion of the job, including selecting contractors, overseeing the work and its quality, and liaising with the client.
                                        </p>
                                        <p>
                                            The course provides you with the technical and management skills to become a builder and meet the needs of builders and managers of small to medium-sized building businesses. The qualification is also designed to meet the needs of individuals requiring a building industry license. Building contractor licensing varies between states and territories and additional elements may be required to attain this qualification.
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
                 <div class="col-md-6 d-flex align-items-stretch">
                    <div class="event-items" style="display: flex; flex-direction: column; height: 100%;">
                        <div class="item" style="display: flex; flex-direction: column; flex-grow: 1;">
                            <div class="col-md-12 info">
                                <div class="info-box">
                                    <div class="content">
                                        <h4>
                                            <a href="Dimploma_of_Project_Management.aspx">Certificate lll in Carpentry</a>
                                        </h4>
                                        <ul>
                                            <li><i class="fas fa-book"></i>CPC30220</li>
                                            <li><i class="fas fa-map-marked-alt"></i>CRICOS 111614B</li>
                                        </ul>
                                        <ul>
                                            <li><i class="fas fa-school"></i>Sydney CBD</li>
                                            <li><i class="fas fa-school"></i>Adelaide CBD</li>
                                            <li><i class="fas fa-school"></i>Melbourne CBD</li>
                                        </ul>
                                        <p>
                                            This qualification is designed to offer students the opportunity to further their skills and experience within the construction industry & provides a trade outcome in carpentry, covering work in residential and commercial applications.
                                            The construction industry strongly affirms that training and assessment leading to recognition of skills must be undertaken in a real or very closely simulated workplace environment and this qualification has all the core units of competency requirements that cover common skills for the construction industry, as well as a specialist field of work.
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

