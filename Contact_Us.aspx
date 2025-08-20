<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact_Us.aspx.cs" Inherits="Contact_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .info h4{
            font-size:17px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="banner-area inc-form bg-gradient slider-less text-light">
        <div class="container">
            <div class="row">
                <div class="double-items">
                    <div class="col-md-7 info">
                        <h2 class="wow fadeInLeft">We're here to assist you! Get in touch with us for any enquiries, support, or feedback. We're happy to help!</h2>
                    </div>
                    <div class="col-md-5 reg-form">
                        <div class="con_form">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>We're here to help with any enquiries or support!</h4>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Name" type="text">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <%--<input class="form-control" placeholder="Message" type="text">--%>
                                        <asp:TextBox ID="TextBox1" Rows="5" runat="server" CssClass="form-control" placeholder="Message" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit">
                                        Rigister Now
                                   
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="popular-courses-area weekly-top-items bottom-less" style="padding-top: 50px; padding-bottom: 50px">
        <div class="container">
            <div class="row">
                <div class="site-heading text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>Campus Location & Contact Details</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="top-course-items">

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.5517833144386!2d151.2059123!3d-33.875440399999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12afbf1dc3af69%3A0x9bc3f1f9ef1f4f11!2sNortwest%20College!5e0!3m2!1sen!2sin!4v1740402248535!5m2!1sen!2sin" style="border: 0; width: 100%; height: 250px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="#">George Street Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 449 955 272
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>sso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>GEORGE STREET CAMPUS Level 2, 531 George Street, Sydney, NSW 2000, Australia.
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.5517833144386!2d151.2059123!3d-33.875440399999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12afbf1dc3af69%3A0x9bc3f1f9ef1f4f11!2sNortwest%20College!5e0!3m2!1sen!2sin!4v1740402248535!5m2!1sen!2sin" style="border: 0; width: 100%; height: 250px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="#">York Street Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="tel:+61 469 738 090">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 469 738 090
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>englishsso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>Level 2, The Grace Hotel Building, 77 York Street, Sydney, NSW 2000, Australia.
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3271.3002969892473!2d138.59961232650915!3d-34.92400492448515!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ab0ced693478bfb%3A0xc5535aea4c408e49!2s1%202%2F68%20Grenfell%20St%2C%20Adelaide%20SA%205000%2C%20Australia!5e0!3m2!1sen!2sin!4v1740402950605!5m2!1sen!2sin" style="border: 0; width: 100%; height: 250px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="adelaide_campus.aspx">Adelaide Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="tel: +61 492 938 782">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 492 938 782
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="#">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>sso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>Suite 1, Level 2, 66-68 Grenfell Street, Adelaide, SA 5000, Australia.
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6 equal-height">
                        <div class="item">
                            <div class="thumb">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.14271096932!2d144.9664999766274!3d-37.810126133831396!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642c92c70b903%3A0x1a52b8f482d3e7ff!2s9%2F108%20Lonsdale%20St%2C%20Melbourne%20VIC%203000%2C%20Australia!5e0!3m2!1sen!2sin!4v1740403701997!5m2!1sen!2sin" style="border: 0; width: 100%; height: 250px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="info campus_info">
                                <h4>
                                    <a href="#">Melbourne Campus</a>
                                </h4>

                                <p style="font-size: 13px">
                                    <a href="tel:+61 426 254 486">
                                        <i class="fas fa-mobile">&nbsp&nbsp</i>+61 426 254 486
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="mailto:sso@nortwest.edu.au">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>sso@nortwest.edu.au
                                    </a>
                                </p>
                                <p style="font-size: 13px">
                                    <a href="mailto:sso@nortwest.edu.au">
                                        <i class="fas fa-envelope">&nbsp&nbsp</i>englishsso@nortwest.edu.au
                                    </a>
                                </p>

                                <p style="font-size: 13px">

                                    <a href="#">
                                        <i class="fas fa-map">&nbsp&nbsp</i>Level 9, 108 Lonsdale st, Melbourne VIC
                                    </a>
                                </p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="jqury" runat="Server">
</asp:Content>

