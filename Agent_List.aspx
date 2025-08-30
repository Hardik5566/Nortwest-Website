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
                                    <td>360 DEGREE AGENCY PTY LTD</td>
                                    <td>Suite 5, Level 21/133 Castlereagh Street, NSW 2000</td>
                                    <td>61434031979</td>
                                </tr>
                                <tr>
                                    <td>ACEA Global</td>
                                    <td>Suite 7.06 7/365, Little Collins St, Melbourne, VIC 3000</td>
                                    <td>61497811164</td>
                                </tr>
                                <tr>
                                    <td>Acha Parhlo Pty Ltd</td>
                                    <td>13 13, Yates Street, Mawson Lakes, SA 5000</td>
                                    <td>61450890490</td>
                                </tr>
                                <tr>
                                    <td>Active Study Australia</td>
                                    <td>2/32 Buckingham Drive, Wangara WA, Australia 6065</td>
                                    <td>61861026565</td>
                                </tr>
                                <tr>
                                    <td>Advance Migration & Education Pty Ltd/Advance Study Abroad</td>
                                    <td>Suite 6/443, Chapel Rd, Bankstown, Sydney, NSW 2200</td>
                                    <td>61492822999</td>
                                </tr>
                                <tr>
                                    <td>ADVISA PRO PTY LTD</td>
                                    <td>Suit 3,153 Haldon Street,Lakemba, NSW 2195</td>
                                    <td>61405363578</td>
                                </tr>
                                <tr>
                                    <td>Aggarwal Consultants PTY LTD</td>
                                    <td>40/517, Flinders Lane, Melbourne, VIC 3000</td>
                                    <td>61433582001</td>
                                </tr>
                                <tr>
                                    <td>Ali's Education and Migration Services/Khaled Ali</td>
                                    <td>199, Lakemba St, Sydney, NSW 2195</td>
                                    <td>61416170443</td>
                                </tr>
                                <tr>
                                    <td>Anand Education Services</td>
                                    <td>38A Flushcombe Road, Blacktown, NSW 2148</td>
                                    <td>61435266220</td>
                                </tr>
                                <tr>
                                    <td>Andino Education Group/A.C.N. 602 062 288 PTY LTD</td>
                                    <td>1116/228, A''Beckett Street, Melbourne, VIC 3000</td>
                                    <td>61450001270</td>
                                </tr>
                                <tr>
                                    <td>APISTUDENT PTY LTD</td>
                                    <td>Level 3, 60, York Street, Sydney, NSW 2000</td>
                                    <td>61435829897</td>
                                </tr>
                                <tr>
                                    <td>ASAP EDUCATION CONSULYANYCY</td>
                                    <td>Level 3, 257 Collins Street, Melbourne, VIC 3000</td>
                                    <td>61478006099</td>
                                </tr>
                                <tr>
                                    <td>Asia Pacific Education Consultants Pty Ltd/The Trustee for ASIA PACIFIC UNIT TRUST</td>
                                    <td>Level 7/278 Collins St, Melbourne VIC 3000</td>
                                    <td>61451017518</td>
                                </tr>
                                <tr>
                                    <td>Aum Global Education Services</td>
                                    <td>Level 6 , Suite 616/530 Little Collins Street, Melbourne VIC 3000</td>
                                    <td>61479055552</td>
                                </tr>
                                <tr>
                                    <td>AusGuide Group</td>
                                    <td>258A Victoria Street, Richmond, VIC 3121</td>
                                    <td>61399396979</td>
                                </tr>
                                <tr>
                                    <td>Aussie Asean Education & Immigration Services</td>
                                    <td>Level 8, Suite 813/365 Little Collins Street, Melbourne ,VIC 3000</td>
                                    <td>61433893717</td>
                                </tr>
                                <tr>
                                    <td>Aussie Immi Pathways</td>
                                    <td>Suite 15, Level 1/272 Leakes Road, Truganina, VIC 3029</td>
                                    <td>61416204677</td>
                                </tr>
                                <tr>
                                    <td>Aussie You Too</td>
                                    <td>21 Alma Street, Southport, QLD 4215</td>
                                    <td>61431196642</td>
                                </tr>
                                <tr>
                                    <td>Aussizz Group Pty Ltd</td>
                                    <td>Block Court, Level 1, 288/290 Collins Street, Melbourne VIC 3000</td>
                                    <td>61396023434</td>
                                </tr>
                                <tr>
                                    <td>Austral Consultants</td>
                                    <td>Unit 1104, Level 11, 167 Queen Street, Melbourne, VIC 3000</td>
                                    <td>61403229768</td>
                                </tr>
                                <tr>
                                    <td>AUSTRALIA EDUCATION GROUP</td>
                                    <td>Suite 1005, Level 10/55 Swanston Street, Melbourne, VIC 3000</td>
                                    <td>61451047645</td>
                                </tr>
                                <tr>
                                    <td>Australia study(Adl)</td>
                                    <td>1st Floor, Suite 92/515 Kent St, Sydney NSW 2000</td>
                                    <td>61404265014</td>
                                </tr>
                                <tr>
                                    <td>AUSTRALIAN EXPERT MIGRATION SERVICES PTY. LTD.</td>
                                    <td>Level 6,45 Grenfell Street, Adelaide SA 5000</td>
                                    <td>61424401241</td>
                                </tr>
                                <tr>
                                    <td>Australian Management & Education Services/AMES Group International</td>
                                    <td>Level 6, Suite 604/233, Castlereagh Street, Sydney, NSW 2000</td>
                                    <td>61292830769</td>
                                </tr>
                                <tr>
                                    <td>AVANTI EDUCATION AND MIGRATION PTY LTD</td>
                                    <td>Level 1, 123, Charlotte Street, Brisbane City, QLD 4000</td>
                                    <td>61412532844</td>
                                </tr>
                                <tr>
                                    <td>BANSAL EDUCATION GROUP PTY LTD</td>
                                    <td>1 Bald Hill Road, Pakenham, VIC 3810</td>
                                    <td>61432127302</td>
                                </tr>
                                <tr>
                                    <td>Be Ozzy/Be Ozzy International Pty Ltd</td>
                                    <td>Suite 404, Level 4, 83 York St, Sydney, NSW 2000</td>
                                    <td>61289374355</td>
                                </tr>
                                <tr>
                                    <td>BEST GLOBAL EDUCATION CONSULTANCY AUSTRALIA</td>
                                    <td>Suite 207, Level 2/65 Murray Street, Hobart TAS 7000</td>
                                    <td>61433989801</td>
                                </tr>
                                <tr>
                                    <td>Blue Studies International</td>
                                    <td>Level 4/287 Lonsdale Street, Melbourne, VIC 3000</td>
                                    <td>1300767881</td>
                                </tr>
                                <tr>
                                    <td>Bridge Blue Pty Ltd</td>
                                    <td>Suite 3 Level 2/137-139 Bathurst Street, Sydney NSW 2000</td>
                                    <td>61292690110</td>
                                </tr>
                                <tr>
                                    <td>CSE Australia Pty Ltd</td>
                                    <td>Level 3/1050 Hay Street, West Perth WA 6005</td>
                                    <td>61410887766</td>
                                </tr>
                                <tr>
                                    <td>Destiny Australia Pty. Ltd.</td>
                                    <td>1 Douglas Avenue, Chatswood NSW 2067</td>
                                    <td>61411872733</td>
                                </tr>
                                <tr>
                                    <td>Direction Australia</td>
                                    <td>Unit 272/398 - 408, Pitt Street, Haymarket, NSW 2000</td>
                                    <td>61425483210</td>
                                </tr>
                                <tr>
                                    <td>Discover Australia Agency</td>
                                    <td>Level 26/44 Market Street, Sydney, NSW 2000</td>
                                    <td>61414683215</td>
                                </tr>
                                <tr>
                                    <td>Dream Way Education & Travel Agency Pty Ltd</td>
                                    <td>162, Macquarie Street, Hobart, TAS 7000</td>
                                    <td>61413857919</td>
                                </tr>
                                <tr>
                                    <td>Dynamic Learning Partners Pty Ltd/Apply 4</td>
                                    <td>Suite 5-8 / 2 Auburn Road, Auburn, Sydney NSW 2144</td>
                                    <td>61287890100</td>
                                </tr>
                                <tr>
                                    <td>EDI GLOBAL EDUCATION GROUP PTY LTD</td>
                                    <td>Office 18 Level 3/27, Hunter Street, Parramatta, NSW 2150</td>
                                    <td>61451849993</td>
                                </tr>
                                <tr>
                                    <td>Education and Visa Agency</td>
                                    <td>9/281-287, Sussex Street, Sydney NSW 2000</td>
                                    <td>61404688993</td>
                                </tr>
                                <tr>
                                    <td>Educonnect Australia</td>
                                    <td>Suite 103/60 York Street, Sydney NSW 2000</td>
                                    <td>61430095540</td>
                                </tr>
                                <tr>
                                    <td>Eduvision Global Education & Visa Services/Eduvision Global</td>
                                    <td>Level 5, Suite 510,321 Pitt Street, Townhall</td>
                                    <td>61452439889</td>
                                </tr>
                                <tr>
                                    <td>EHub International</td>
                                    <td>Suite 2, Level 2, 22 Market Street, Sydney NSW 2000</td>
                                    <td>61272261393</td>
                                </tr>
                                <tr>
                                    <td>Elite AUS Migration and Education Consultancy</td>
                                    <td>Suite 6, Offices First, L1/ Toowong Village, 9 Sherwood Road, Toowong QLD 4066</td>
                                    <td>61403688068</td>
                                </tr>
                                <tr>
                                    <td>EMPIRE INTERNATIONAL INVESTMENT GROUP</td>
                                    <td>Level 17 A/241 Adelaide Street, Brisbane City, QLD 4000</td>
                                    <td>61416794567</td>
                                </tr>
                                <tr>
                                    <td>EstudienAustralia</td>
                                    <td>Suite 102, Level 1/22 Market Street, Sydney NSW 2000</td>
                                    <td>61280847247</td>
                                </tr>
                                <tr>
                                    <td>ET Education and Visa Services</td>
                                    <td>Suite 132-133, Level 3/10, Park Road, Hurstville NSW 2220</td>
                                    <td>61291717740</td>
                                </tr>
                                <tr>
                                    <td>Explora Education Council/Explora Education and Migration Pty Ltd</td>
                                    <td>167 Alfred Street, Fortitude Valley QLD 4006</td>
                                    <td>61413397666</td>
                                </tr>
                                <tr>
                                    <td>First One Education</td>
                                    <td>Shop 27-31, Town Hall Square, 464-480, Kent Street, Sydney NSW 2000</td>
                                    <td>61292670718</td>
                                </tr>
                                <tr>
                                    <td>Friends Education & Migration Consultants</td>
                                    <td>96 Harris Street, Harris Park NSW 2150</td>
                                    <td>61288108309</td>
                                </tr>
                                <tr>
                                    <td>Future Care Consultants</td>
                                    <td>502/55, Swanston Street, Melbourne, VIC 3000</td>
                                    <td>61469440460</td>
                                </tr>
                                <tr>
                                    <td>Gamba Migration</td>
                                    <td>Level 2/696 Bourke Street, Melbourne VIC 3000</td>
                                    <td>61413068828</td>
                                </tr>
                                <tr>
                                    <td>Global Alliance Education and Migration Consultant</td>
                                    <td>Suite 2 Level 7/38 Currie Street, Adelaide SA 5000 Australia</td>
                                    <td>61871117276</td>
                                </tr>
                                <tr>
                                    <td>Global Consult</td>
                                    <td>Suite 474 Level 4 311/315 Castlereagh Street, Haymarket, NSW 2000</td>
                                    <td>61289586749</td>
                                </tr>
                                <tr>
                                    <td>Global Vision Migration (SD SMAR PTY LTD)</td>
                                    <td>Suite 601 Level 6/365 Little Collins Street, Melbourne VIC 3000</td>
                                    <td>61491909888</td>
                                </tr>
                                <tr>
                                    <td>Globancy Pty Ltd</td>
                                    <td>Suite 14, Level 15/327 Pitt Street, Sydney, NSW 2000</td>
                                    <td>61280950535</td>
                                </tr>
                                <tr>
                                    <td>GO AHEAD STUDY</td>
                                    <td>24/2, Barramul Street, Bulimba, QLD 4171</td>
                                    <td>61492825611</td>
                                </tr>
                                <tr>
                                    <td>Go Study Australia Pty Ltd - Madrid</td>
                                    <td>Shop A, Ground Floor, 447, Kent St, Sydney NSW 2000, Australia</td>
                                    <td>61292830480</td>
                                </tr>
                                <tr>
                                    <td>Grace International Group Pty LTD</td>
                                    <td>Suite 1508, Level 15, 97-99 Bathurst Street, Sydney, NSW 2000</td>
                                    <td>61872257892</td>
                                </tr>
                                <tr>
                                    <td>Grow Study</td>
                                    <td>322, King William Street, Adelaide SA 5000</td>
                                    <td>61426708804</td>
                                </tr>
                                <tr>
                                    <td>GROWSMART EDUCATION</td>
                                    <td>Suite 7, Level 1, 12-20 Main Street, Blacktown, NSW 2148</td>
                                    <td>61288248026</td>
                                </tr>
                                <tr>
                                    <td>Hello Australia</td>
                                    <td>Suite 5, Level 4, 141 Queen Street, Brisbane Queensland 4000</td>
                                    <td>61730367180</td>
                                </tr>
                                <tr>
                                    <td>HOPE EDUCATION AND MIGRATION PTY LTD/JOAN GUZMAN URBINA - 75511400590</td>
                                    <td>Level 2, 18-20, Grenfell Street, Adelaide SA 5000</td>
                                    <td>61411826480</td>
                                </tr>
                                <tr>
                                    <td>Hub Education Pty Ltd</td>
                                    <td>Suite 602 97-99 Bathurst Street, Sydney, NSW 2000</td>
                                    <td>61292837738</td>
                                </tr>
                                <tr>
                                    <td>iCan Education Pty Ltd</td>
                                    <td>13/278 Sussex Street, Sydney, NSW 2000</td>
                                    <td>61402368987</td>
                                </tr>
                                <tr>
                                    <td>ICS International/INNOVATIVE CREATION SERVICES PTY LTD</td>
                                    <td>207/365 Little Collins Street, Melbourne VIC 3000</td>
                                    <td>61467487490</td>
                                </tr>
                                <tr>
                                    <td>IJUMP PROJECT PTY LTD</td>
                                    <td>152 Elizabeth Street, Melbourne, VIC 3000</td>
                                    <td>61451153394</td>
                                </tr>
                                <tr>
                                    <td>Infinite Education and Migration Services</td>
                                    <td>Level 2/313 Flinders Lane, Melbourne, VIC 3000</td>
                                    <td>61422360937</td>
                                </tr>
                                <tr>
                                    <td>Infinity Group Education</td>
                                    <td>Unit 24-026 Level 24/570 Bourke St, Melbourne, VIC 3000</td>
                                    <td>61423771601</td>
                                </tr>
                                <tr>
                                    <td>International Student Corner/ISC EDUCATION & VISAS SERVICES PTY LTD</td>
                                    <td>Level 24/570, Bourke Street, Melbourne VIC 3000</td>
                                    <td>61424398841</td>
                                </tr>
                                <tr>
                                    <td>International Student Educational - Migration Services (ISEMS)</td>
                                    <td>314, Church Steet, Parramatta, NSW 2150</td>
                                    <td>61481199800</td>
                                </tr>
                                <tr>
                                    <td>iWise Education Pty, Ltd</td>
                                    <td>203/365, Little Collins Street, Melbourne, VIC 3000</td>
                                    <td>61431156829</td>
                                </tr>
                                <tr>
                                    <td>Just Australia Pty Ltd</td>
                                    <td>c/o We Work, Level 4/152 Elizabeth Street, Melbourne, VIC 3000</td>
                                    <td>61455260015</td>
                                </tr>
                                <tr>
                                    <td>Kandel Consultant</td>
                                    <td>L10, 230 Collins Street, Melbourne, VIC 3000</td>
                                    <td>61366428664</td>
                                </tr>
                                <tr>
                                    <td>Kangaroland Group PTY LTD</td>
                                    <td>24/570 Bourke Street, Melbourne VIC 3000</td>
                                    <td>61420889896</td>
                                </tr>
                                <tr>
                                    <td>Kansal, Amit (Success Educational Consultants)</td>
                                    <td>251, Church St, Parramatta, NSW 2150</td>
                                    <td>61424872241</td>
                                </tr>
                                <tr>
                                    <td>KTM Consulting Group Pvt Ltd</td>
                                    <td>Suite 143 Level 3 416-418 Pitt Street, Haymarket, NSW 2000</td>
                                    <td>61280211000</td>
                                </tr>
                                <tr>
                                    <td>Latin Advisor</td>
                                    <td>Level 4/152, Elizabeth Street, Melbourne VIC 3000</td>
                                    <td>61423165193</td>
                                </tr>
                                <tr>
                                    <td>Let's Go Study Australia</td>
                                    <td>477, Kent Street, Sydney, NSW 2000</td>
                                    <td>61412801330</td>
                                </tr>
                                <tr>
                                    <td>Life Goals Consultants</td>
                                    <td>Level 14, 3 Parramatta Square, Parramatta NSW 2150 Australia
PO: Door 5 RNC Bldg 1, Park Ave Corner JP Laurel Ave, Bajada Davao City 8000, Philippines</td>
                                    <td>61480111370</td>
                                </tr>
                                <tr>
                                    <td>LINK AUSTRALIA TURISMO LTDA (LINK STUDY) SYDNEY</td>
                                    <td>Level 2, Suite 22/46 Cavill Avenue, Surfers Paradise, QLD 4217</td>
                                    <td>61420310551</td>
                                </tr>
                                <tr>
                                    <td>Link House</td>
                                    <td>Suite 05-109, Level 2/383 George St,reet Sydney, NSW 2000</td>
                                    <td>61405992281</td>
                                </tr>
                                <tr>
                                    <td>Lucky Education and Migration Services</td>
                                    <td>Suite 603, Level-06/309 Pitt St, Sydney NSW 2000</td>
                                    <td>61410341857</td>
                                </tr>
                                <tr>
                                    <td>MALHOTRA MIGRATION SOLUTIONS</td>
                                    <td>Level 4, 278 Collins Street, Melbourne VIC 3000</td>
                                    <td>61452157646</td>
                                </tr>
                                <tr>
                                    <td>Me Studies</td>
                                    <td>Office 338, Level 3/697 Collins St, Docklands VIC 3008</td>
                                    <td>61420835705</td>
                                </tr>
                                <tr>
                                    <td>Megacity Education and Visa Services</td>
                                    <td>162/81 Church St, Lidcombe, NSW 2141</td>
                                    <td>61406675899</td>
                                </tr>
                                <tr>
                                    <td>META Education and Career Success/LISANDRA DOS REIS</td>
                                    <td>20 Buchanan Drive, Woodforde, SA 5072</td>
                                    <td>61416271591</td>
                                </tr>
                                <tr>
                                    <td>METAustralia</td>
                                    <td>1C Ryder Street, Niddrie, VIC 3042</td>
                                    <td>61416520885</td>
                                </tr>
                                <tr>
                                    <td>MGM Australian Education - Melbourne (HO)</td>
                                    <td>697 Collins Street, Docklands, VIC 3008</td>
                                    <td>61430066588</td>
                                </tr>
                                <tr>
                                    <td>MIGRATION SERVICES T/A PACIFIC CENTRE</td>
                                    <td>Empire Mansions, 2/31 Belgrave Street, Manly, NSW 2095</td>
                                    <td>61416696020</td>
                                </tr>
                                <tr>
                                    <td>Monkey King Student Service Center</td>
                                    <td>Level 2/696 Bourke Street Melbourne, VIC 3000</td>
                                    <td>61466910656</td>
                                </tr>
                                <tr>
                                    <td>Multi-Edu Pty Ltd</td>
                                    <td>HUB Australia, F2/696 Bourke Street, Melbourne VIC 3000</td>
                                    <td>61882326669</td>
                                </tr>
                                <tr>
                                    <td>MUVU S.A.S.</td>
                                    <td>Level 11, 580 Collins Street, Melbourne, VIC 3000</td>
                                    <td>61432888320</td>
                                </tr>
                                <tr>
                                    <td>MY GREENLIGHT PTY LTD</td>
                                    <td>144A, Bruce Street, Brighton-Le-Sands, NSW 2216</td>
                                    <td>61434814019</td>
                                </tr>
                                <tr>
                                    <td>Myway Education Agency/J GALLO REYES & K.Y MORENO CONGO</td>
                                    <td>18, Hindmarsh Terrace, Lightsview, SA 5085</td>
                                    <td>61466988771</td>
                                </tr>
                                <tr>
                                    <td>Navigators Overseas Solutions Pvt. Ltd</td>
                                    <td>Unit 3/162, Hilton Street, Glenroy, VIC 3046</td>
                                    <td>61424669699</td>
                                </tr>
                                <tr>
                                    <td>New Edge Consultancy Services</td>
                                    <td>Level 17 Suite 29/327 Pitt Street, Sydney, NSW 2000</td>
                                    <td>1300515163</td>
                                </tr>
                                <tr>
                                    <td>Nexco Consultants</td>
                                    <td>99 Wigram Street, Harris Park, NSW 2150</td>
                                    <td>61449532002</td>
                                </tr>
                                <tr>
                                    <td>Next Step Student Agency</td>
                                    <td>11 York Street, Sydney NSW 2000</td>
                                    <td>61414434576</td>
                                </tr>
                                <tr>
                                    <td>Nextperience Pty Ltd</td>
                                    <td>Suite 5 level 1, 70 Light Square, Adelaide, SA 5000</td>
                                    <td>61424340961</td>
                                </tr>
                                <tr>
                                    <td>Nomadas Experience Agency</td>
                                    <td class="addr">Unit 1001 level 10/46 Market St, Sydney NSW 2000</td>
                                    <td>61483902019</td>
                                </tr>
                                <tr>
                                    <td>Nova Educare Pty Ltd</td>
                                    <td class="addr">Unit 921/2 Lachlan Street, Waterloo, NSW 2017
PO Address: 8 Renwick Street, Redfern, NSW 2016</td>
                                    <td>61414344046</td>
                                </tr>
                                <tr>
                                    <td>Oceania Consultants Pty Ltd</td>
                                    <td class="addr">Kentbridge House, suite 703 level 7/491 Kent Street, Sydney, NSW 2000</td>
                                    <td>61430911912</td>
                                </tr>
                                <tr>
                                    <td>Open For Australia/OPEN 4 &amp; CO PTY LTD</td>
                                    <td class="addr">Unit D, 5 Jubilee Avenue, Warriewood, NSW 2102</td>
                                    <td>61430797389</td>
                                </tr>
                                <tr>
                                    <td>Open Wings Study PTY LTD</td>
                                    <td class="addr">7 York Street, Hamilton QLD 4007</td>
                                    <td>61450911852</td>
                                </tr>
                                <tr>
                                    <td>OzTrip Services</td>
                                    <td class="addr">Suite 4 Level 9/99, York Street, Sydney, NSW 2000</td>
                                    <td>1300069874</td>
                                </tr>
                                <tr>
                                    <td>Ozzie Way</td>
                                    <td class="addr">Level 22/120 Spencer Street, Melbourne, VIC 3000</td>
                                    <td>61413186709</td>
                                </tr>
                                <tr>
                                    <td>PAYALJOT KAUR/Oxford Migration Group</td>
                                    <td class="addr">12, Brunswick Drive, Truganina, VIC 3029</td>
                                    <td>61410063450</td>
                                </tr>
                                <tr>
                                    <td>Promise Services</td>
                                    <td class="addr">Suite 1/114-116 Main Street, Blacktown NSW 2148</td>
                                    <td>61286644541</td>
                                </tr>
                                <tr>
                                    <td>Quackstudy</td>
                                    <td class="addr">Level 8, Suite 812, 368 Sussex Street, Haymarket, Sydney, NSW 2000</td>
                                    <td>61435909798</td>
                                </tr>
                                <tr>
                                    <td>Qualified Career Consultancy/MD ISLAM</td>
                                    <td class="addr">Level 1, 457, Elizabeth St, Surry Hills, NSW 2010</td>
                                    <td>61432785485</td>
                                </tr>
                                <tr>
                                    <td>Right &amp; Associates Pty Ltd/SANUBABU PTY LTD</td>
                                    <td class="addr">Suite 1 Level 6/68 Grenfell Street, Adelaide, SA 5000</td>
                                    <td>61870814153</td>
                                </tr>
                                <tr>
                                    <td>RK Education and Visa Services PTY LTD</td>
                                    <td class="addr">Suite 3.07, Level 3/365 Little Collins Street, Melbourne, VIC 3000</td>
                                    <td>61452235601</td>
                                </tr>
                                <tr>
                                    <td>Routes Overseas Consultants</td>
                                    <td class="addr">Phalia Rd, Behind Attock Petroleum (Al Jannat Petrol Pump) Mandi Bahauddin, Punjab 50400 Pakistan</td>
                                    <td>92546506062</td>
                                </tr>
                                <tr>
                                    <td>Royal International Migration Consultants Pty Ltd</td>
                                    <td class="addr">87 Wigram Street, Harris Park, NSW 2150</td>
                                    <td>61288108348</td>
                                </tr>
                                <tr>
                                    <td>RS Migration Services</td>
                                    <td class="addr">83 Station Street Fairfield Heights, NSW 2165</td>
                                    <td>61466616463</td>
                                </tr>
                                <tr>
                                    <td>S GERMAINE &amp; L.E LOPEZ CORAL / New Life Australia Student Services</td>
                                    <td class="addr">Level 22/120 Spencer Street, Melbourne VIC 3000</td>
                                    <td>61435881142</td>
                                </tr>
                                <tr>
                                    <td>S7 INTERCAMBIO / S7 STUDY AUSTRALIA BRASIL PTY LTD</td>
                                    <td class="addr">13/72 Dutton St, Coolangatta, QLD 4225</td>
                                    <td>61424070808</td>
                                </tr>
                                <tr>
                                    <td>Sanguine Migration &amp; Education Consulting Pty Ltd</td>
                                    <td class="addr">Level 27, Rialto South Tower, 525, Collins Street, Melbourne, VIC 3000</td>
                                    <td>61452213991</td>
                                </tr>
                                <tr>
                                    <td>Sayra Migration &amp; Education Group / SMG</td>
                                    <td class="addr">Road Tower, Suite 109/1 Queens Road, St. Kilda, Melbourne VIC 3004</td>
                                    <td>61469337251</td>
                                </tr>
                                <tr>
                                    <td>Sin Limites Education Agency</td>
                                    <td class="addr">Tower 4, Level 17/727 Collins Street, VIC 3008
PO: 21 Deaki Avenue, Altona North, VIC 3025</td>
                                    <td>61423661112</td>
                                </tr>
                                <tr>
                                    <td>SIS Consulting Pty Ltd / Australia Online</td>
                                    <td class="addr">187 Thomas Street, Haymarket, NSW 2000</td>
                                    <td>61413829546</td>
                                </tr>
                                <tr>
                                    <td>Sky Consultants / SKY IMMIGRATION CONSULTANTS PTY LTD</td>
                                    <td class="addr">969-971 Canterbury Rd, Lakemba NSW 2195</td>
                                    <td>61426179366</td>
                                </tr>
                                <tr>
                                    <td>Smart Education Pty Ltd</td>
                                    <td class="addr">Level 3, 478 George Street, Sydney, NSW 2000</td>
                                    <td>61283152152</td>
                                </tr>
                                <tr>
                                    <td>Star Education Consultancy Alliance</td>
                                    <td class="addr">Suite 714, 368 Sussex Street, Sydney, NSW 2000</td>
                                    <td>61466673888</td>
                                </tr>
                                <tr>
                                    <td>Step Abroad Education &amp; Visa Specialist</td>
                                    <td class="addr">216, 368 Sussex Street, Pacific Trade Centre, Sydney NSW 2000</td>
                                    <td>61452414569</td>
                                </tr>
                                <tr>
                                    <td>Student Easy Pty Ltd</td>
                                    <td class="addr">Level 9 Suite 912, 250 Pitt Street, Sydney, NSW 2000</td>
                                    <td>61422684613</td>
                                </tr>
                                <tr>
                                    <td>Study &amp; Migration Hub / MUHAMMAD ASIM RIAZ</td>
                                    <td class="addr">2A Scott Street, Hawthorn VIC 3122</td>
                                    <td>6141551171</td>
                                </tr>
                                <tr>
                                    <td>Study Connection Australia</td>
                                    <td class="addr">1304, Level 13/307 Pitt Street, Sydney, NSW 2000</td>
                                    <td>61481355270</td>
                                </tr>
                                <tr>
                                    <td>Study Hut Consultants Pty Ltd</td>
                                    <td class="addr">301/101 Overton Road, Williams Landing, VIC 3027</td>
                                    <td>61406020273</td>
                                </tr>
                                <tr>
                                    <td>Study Project Company SAC</td>
                                    <td class="addr">AV Larco 880, Lima, Miraflores 15074, Peru</td>
                                    <td>51950201910</td>
                                </tr>
                                <tr>
                                    <td>Study World Global / Manish Gupta</td>
                                    <td class="addr">123 Fifth Ave, Austral NSW 2179</td>
                                    <td>61482050999</td>
                                </tr>
                                <tr>
                                    <td>Studygate Australia Pty. Ltd.</td>
                                    <td class="addr">PO Box 2013, Hornsby 1635, NSW</td>
                                    <td>61401209817</td>
                                </tr>
                                <tr>
                                    <td>StudyLink Group Pty Ltd</td>
                                    <td class="addr">Level 45/680 George Street, Sydney, NSW 2000</td>
                                    <td>61401686051</td>
                                </tr>
                                <tr>
                                    <td>TAYRONA (TAE) AUSTRALIAN EDUCATION Sydney / Tayrona Consulting</td>
                                    <td class="addr">8/89-97 Jones Street, Ultimo, NSW 2007</td>
                                    <td>61455356339</td>
                                </tr>
                                <tr>
                                    <td>The Old Man Migration And Education</td>
                                    <td class="addr">Unit 5, 55-57 Serrell Street, Malvern East, VIC 3145</td>
                                    <td>61402692296</td>
                                </tr>
                                <tr>
                                    <td>The Trustee for Lyallpur Family Trust / Paragon Education Group Pty Ltd</td>
                                    <td class="addr">29 Morden Court Nunawading, VIC 3131</td>
                                    <td>61416815096</td>
                                </tr>
                                <tr>
                                    <td>Tilsav Migration and Education Pty Ltd</td>
                                    <td class="addr">21 Junonia Way, Wyndham Vale, Victoria 3024</td>
                                    <td>61452270171</td>
                                </tr>
                                <tr>
                                    <td>Trip Study Pty Ltd</td>
                                    <td class="addr">Level 10, Suite 2/155 Castlereagh Street, Sydney, NSW 2000</td>
                                    <td>61292679017</td>
                                </tr>
                                <tr>
                                    <td>UNIKEY GLOBAL PTY LTD.</td>
                                    <td class="addr">1603/530 Little Collins Street, Melbourne, VIC 3000</td>
                                    <td>61433169794</td>
                                </tr>
                                <tr>
                                    <td>Unlimited study Advisors trading as EXPLORA EDUCATION ADVISORS</td>
                                    <td class="addr">Suite 1 Level 1 115 Pitt Street, Sydney, NSW 2000</td>
                                    <td>61404712946</td>
                                </tr>
                                <tr>
                                    <td>Upright Migration Consultants / UMEC PTY LTD</td>
                                    <td class="addr">Suit 407, Level 4, 2 Queen Street, Melbourne, VIC 3000</td>
                                    <td>61432982061</td>
                                </tr>
                                <tr>
                                    <td>VEGA Education Consultans Pty Ltd</td>
                                    <td class="addr">Suite 8, Level 15/330 Collins Street, Melbourne, VIC 3000</td>
                                    <td>61476930079</td>
                                </tr>
                                <tr>
                                    <td>VETA Education Consultancy</td>
                                    <td class="addr">6 Cuthbert Street, Sydney, NSW 2000</td>
                                    <td>61292991458</td>
                                </tr>
                                <tr>
                                    <td>Visa Alliance Pty Ltd</td>
                                    <td class="addr">Suite 1101B, Level 11/309 Pitt Street, Sydney, NSW 2000</td>
                                    <td>61289570827</td>
                                </tr>
                                <tr>
                                    <td>Visa Junction Melbourne</td>
                                    <td class="addr">536 Morris Road, Truganina VIC 3029</td>
                                    <td>61432676982</td>
                                </tr>
                                <tr>
                                    <td>VISAPROSTUDY PTY LTD</td>
                                    <td class="addr">Level 24/570 Bourke Street, VIC 3000</td>
                                    <td>61415726371</td>
                                </tr>
                                <tr>
                                    <td>Vision Consultants</td>
                                    <td class="addr">Level 5/1 Elizabeth Street, Melbourne, VIC 3000</td>
                                    <td>61399390545</td>
                                </tr>
                                <tr>
                                    <td>We Link Education</td>
                                    <td class="addr">Suite 21/Level 7/575 Bourke St, Melbourne VIC 3000</td>
                                    <td>61430271193</td>
                                </tr>
                                <tr>
                                    <td>Western Overseas Study Abroad Pvt. Ltd. / WESTERN OVERSEAS STUDY &amp; IMMIGRATION PTY LTD</td>
                                    <td class="addr">Level 1, Suite 102/2 Queen St, Melbourne, VIC 3000</td>
                                    <td>61430439035</td>
                                </tr>
                                <tr>
                                    <td>Will World Australia Pty Ltd</td>
                                    <td class="addr">803/530 Little Collins Street, Exchange Tower, Melbourne VIC 3008</td>
                                    <td>61411889353</td>
                                </tr>
                                <tr>
                                    <td>Winzoy Group / Winzoy Legal</td>
                                    <td class="addr">Suite 10/71A Macquarie St, Parramatta, NSW 2150</td>
                                    <td>61424687577</td>
                                </tr>
                                <tr>
                                    <td>Yale migration and education consultants pty ltd</td>
                                    <td class="addr">Brisbane Club Tower, Level 12/241 Adelaide Street, Brisbane City, QLD 4000</td>
                                    <td>61405268738</td>
                                </tr>
                                <tr>
                                    <td>Yes Education Australia</td>
                                    <td class="addr">Suite 13.02, Level 13/99 York Street, Sydney, NSW 2000</td>
                                    <td>61430543042</td>
                                </tr>
                                <tr>
                                    <td>Yes Study Australia Pty Ltd</td>
                                    <td class="addr">Suite 26/Level 17/327 Pitt St, Sydney NSW 2000</td>
                                    <td>61405569917</td>
                                </tr>
                                <tr>
                                    <td>ZEN Migration &amp; Education Services</td>
                                    <td class="addr">Level 8/99 Queen Street, Melbourne VIC 3000</td>
                                    <td>61399391375</td>
                                </tr>
                                <tr>
                                    <td>ELITE IMMIGRATION</td>
                                    <td class="addr">L21 207 Kent St. Sydney NSW 2000</td>
                                    <td>61426256239</td>
                                </tr>
                                <tr>
                                    <td>OECC</td>
                                    <td class="addr">Suite 204, Level 2, 227 Collins Street, Melbourne VIC 3000</td>
                                    <td>61481313570</td>
                                </tr>
                                <tr>
                                    <td>SAS MIGRATION GROUP</td>
                                    <td class="addr">D7/88-98 Marsden St, Parramatta, NSW 2150</td>
                                    <td>61451485409</td>
                                </tr>
                                <tr>
                                    <td>STERLING MIGRATION &amp; EDUCATION CONSULTANTS PTY LTD</td>
                                    <td class="addr">Sky City Suite 107, Level 1, 20 A Lexington Drive Bella Vista NSW 2153</td>
                                    <td>61452267557</td>
                                </tr>
                                <tr>
                                    <td>AUSTRALAND EDUCATION</td>
                                    <td class="addr">Unit 805 43 Belmore Street Burwood NSW 2134</td>
                                    <td>61452182958</td>
                                </tr>
                                <tr>
                                    <td>Mind Abroad</td>
                                    <td class="addr">Level 2/105 Victoria St, Fitzroy, VIC 3065</td>
                                    <td>61416680226</td>
                                </tr>
                                <tr>
                                    <td>Triaje Group</td>
                                    <td class="addr">U1110/8 Hallenstain St Footscray VIC 3011</td>
                                    <td>61423087147</td>
                                </tr>
                                <tr>
                                    <td>Divinity Education</td>
                                    <td class="addr">Level 27 101 Collins St Melbourne VIC</td>
                                    <td>61416007816</td>
                                </tr>
                                <tr>
                                    <td>Werelocate</td>
                                    <td class="addr">Suite 513, Level 5, 115 Pitt Street NSW 2000</td>
                                    <td>61405504204</td>
                                </tr>
                                <tr>
                                    <td>TARGET VISA MIGRATION PTY LTD</td>
                                    <td class="addr">Level 2, 90 King William Street, 500</td>
                                    <td>61449996665</td>
                                </tr>
                                <tr>
                                    <td>TRAVEL &amp; TRAVEL PTY LIMITED TA Tora Tora Agency</td>
                                    <td class="addr">Suite 106, 309 Pitt Street Sydney NSW 2000</td>
                                    <td>61292863774</td>
                                </tr>
                                <tr>
                                    <td>Global Studies</td>
                                    <td class="addr">AV. Juan de Arona 755, Work Town Building, Lima 15046, Peru</td>
                                    <td>51933022956</td>
                                </tr>
                                <tr>
                                    <td>Baykara Faith Guray (Baykarra Education and Career Training - BEACT)</td>
                                    <td class="addr">L45, 680 Gorge Street Sydney NSW 2000 Aus</td>
                                    <td>61420710344</td>
                                </tr>
                                <tr>
                                    <td>Care Education</td>
                                    <td class="addr">359, Docklands Drive, Docklands VIC 3008</td>
                                    <td>61413424817</td>
                                </tr>
                                <tr>
                                    <td>One U Education</td>
                                    <td class="addr">Suite 633, 380 Bourke Street, Melbourne 3000, Aus</td>
                                    <td>61451021230</td>
                                </tr>
                                <tr>
                                    <td>World Class Consultants</td>
                                    <td class="addr">Suite 693/585 Little Collins Street, Melbourne VIC 3000</td>
                                    <td>61458655695</td>
                                </tr>
                                <tr>
                                    <td>StudyCo Pty Ltd</td>
                                    <td class="addr">Ground Floor, 333 Collins St, Melbourne VIC 3000</td>
                                    <td>61468440780</td>
                                </tr>
                                <tr>
                                    <td>PFEC</td>
                                    <td class="addr">Level 11, 50 Queen Street, Melbourne VIC, 3000 Aus</td>
                                    <td>61283784282</td>
                                </tr>
                                <tr>
                                    <td>Study First Group</td>
                                    <td class="addr">Level 22/120 Spencer St, Melbourne VIC</td>
                                    <td>61490763935</td>
                                </tr>
                                <tr>
                                    <td>I World Education Pty Ltd</td>
                                    <td class="addr">Suite 702, Level 7, 280 Pitt Street Sydney 2000 AUS</td>
                                    <td>61292839353</td>
                                </tr>
                                <tr>
                                    <td>Overseas Study and Migration Services</td>
                                    <td class="addr">Suite 503, Level 5, 2 Queen Street, Melbourne 3000</td>
                                    <td>61435732227</td>
                                </tr>
                                <tr>
                                    <td>Davesar Consultants</td>
                                    <td class="addr">288, F-7, Aare Wali Gali, Kashmir Avenue, Batala Road, Amritsar, Punjab 143001</td>
                                    <td>1832275456</td>
                                </tr>
                                <tr>
                                    <td>Trading name : EDUMOVE AGENCY — OLD NAME: OZZIELAND DREAM PTY LTD</td>
                                    <td class="addr">107/440 Burwood Rd, Belmore NSW 2192</td>
                                    <td>61426167343</td>
                                </tr>
                                <tr>
                                    <td>FCG PTY LTD TA Ferguson Education Group</td>
                                    <td class="addr">5/232 Robina town Center Drive, Robina, QLD, 4226</td>
                                    <td>61452018561</td>
                                </tr>
                                <tr>
                                    <td>Yes Education Australia Sydney Pty Ltd</td>
                                    <td class="addr">Suite 13.02, Level 13, 99 York Street, Sydney NSW 2000</td>
                                    <td>61430543042</td>
                                </tr>
                                <tr>
                                    <td>RSG IMMIGRATION</td>
                                    <td class="addr">1/33 May Road, Lalor VIC 3075, Aus</td>
                                    <td>61452299777</td>
                                </tr>
                                <tr>
                                    <td>JOURNEY GROUP (Education &amp; Migration Services)</td>
                                    <td class="addr">Suite 104, Level 1, 365 Little Collins Street, Melbourne VIC</td>
                                    <td>61429993244</td>
                                </tr>
                                <tr>
                                    <td>Australia Student Recruitment</td>
                                    <td class="addr">Suite 2, Ground Floor 3 Alison Street, Surfers Paradise QLD 4217. Aus</td>
                                    <td>61411444635</td>
                                </tr>
                                <tr>
                                    <td>Global Select Education and Migration Services</td>
                                    <td class="addr">Suite 2, Level 10, 90 King William St, Adelaide, SA 5000</td>
                                    <td>61870815229</td>
                                </tr>
                                <tr>
                                    <td>Edutoung.com</td>
                                    <td class="addr">Suite 3 Level 1 233 Albert St, Brisbane QLD Aus</td>
                                    <td>61433584417</td>
                                </tr>
                                <tr>
                                    <td>Kwatra Consulting</td>
                                    <td class="addr">Tower 4, 727 Collins St., Docklands, VIC 3008, Aus</td>
                                    <td>61478959000</td>
                                </tr>
                                <tr>
                                    <td>KALRA, TEJINDER</td>
                                    <td class="addr">Level 8, 699 Collins Street, Docklands, VIC 3008</td>
                                    <td>61414266896</td>
                                </tr>
                                <tr>
                                    <td>AIMS EDUCATION AND CAREER CONSULTANTS</td>
                                    <td class="addr">115 Edith Street Tarneit VIC 3029</td>
                                    <td>61415161891</td>
                                </tr>
                                <tr>
                                    <td>Visa Application Australia</td>
                                    <td class="addr">15/19-21 Clifford St, Surfers Paradise QLD 4217 AUS</td>
                                    <td>61410878810</td>
                                </tr>
                                <tr>
                                    <td>Escalar Services</td>
                                    <td class="addr">PO Box 101 Waverley NSW 2024</td>
                                    <td>61404083995</td>
                                </tr>
                                <tr>
                                    <td>OZ STUDY &amp; MIGRATION PTY. LTD.</td>
                                    <td class="addr">Suite 5, Level 6, 276 Flinders St Melbourne VIC 3000</td>
                                    <td>61413078268</td>
                                </tr>
                                <tr>
                                    <td>AKBAR, MD KASIB</td>
                                    <td class="addr">Suite 4, Level 10 365 Little Collins Street Melbourne 3000 VIC</td>
                                    <td>61439944686</td>
                                </tr>
                                <tr>
                                    <td>Migration Crop</td>
                                    <td class="addr">92A Adderley Street, Auburn, NSW 2144</td>
                                    <td>61422184918</td>
                                </tr>
                                <tr>
                                    <td>SOFT SAFE PTY LTD / BURAQ CAREER SERVICES</td>
                                    <td class="addr">Principal Place: 1/190 Ryrie Street Geelong 3220 VIC Registered office: 2/9-11 Helms Street Newcomb 3219 VIC</td>
                                    <td>61401418234</td>
                                </tr>
                                <tr>
                                    <td>Avec Global Group Pty Ltd</td>
                                    <td class="addr">Unit 3, 380 Clayton Road, Clayton VIC 3168 AUS</td>
                                    <td>61432301842</td>
                                </tr>
                                <tr>
                                    <td>I LINK AUSTRALIA PTY LTD</td>
                                    <td class="addr">Principal Place: 2001 20/68 Pitt St, Sydney NSW 2000</td>
                                    <td>61450813001</td>
                                </tr>
                                <tr>
                                    <td>COMPASS EDUCATION AND MIGRATION PTY LTD</td>
                                    <td class="addr">3602, 680 George Street, Sydney 2000</td>
                                    <td>61292831227</td>
                                </tr>
                                <tr>
                                    <td>ORBIS ADVISORS</td>
                                    <td class="addr">Principal Place of business: Level 5, 171 Collins Street, Melbourne VIC 3000 AUSPostal address: B24 Devi Court, Dr Perreau Street, Port-Lois, 11327, Mauritius</td>
                                    <td>61484077000</td>
                                </tr>
                                <tr>
                                    <td>BASYA PTY. LTD.</td>
                                    <td class="addr">Suite 715, 343 Little Collins Street, Melbourne VIC 3000, Australia</td>
                                    <td>61432297317</td>
                                </tr>
                                <tr>
                                    <td>The Trustee for Nationwide Consulting Family Trust (Nationwide Migration and Education)</td>
                                    <td class="addr">Level 5, 320 Adelaide St, Brisbane QLD Aus 4000</td>
                                    <td>61737265183</td>
                                </tr>
                                <tr>
                                    <td>Edutravel International</td>
                                    <td class="addr">Level 22, 120 Spencer St Melbourne VIC 3000</td>
                                    <td>61442720083</td>
                                </tr>
                                <tr>
                                    <td>MANCHESTER UNITED GROUP PTY LTD Trading as Uniway Australia</td>
                                    <td class="addr">U 2,23 Toongabbie Road, Toongabbie, NSW 2146</td>
                                    <td>61423239505</td>
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

