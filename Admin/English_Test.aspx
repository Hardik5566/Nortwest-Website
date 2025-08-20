<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="English_Test.aspx.cs" Inherits="English_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    English Test
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="assets/css/Chosen.min.css" rel="stylesheet" />
    <script src="assets/css/chosen.jquery.min.js"></script>
    <link href="assets/css/Small_Checkbox.css" rel="stylesheet" />

    <style>
        .ddl_sp .chosen-container a {
            height: 37px !important;
            padding: 0.375rem 0.75rem;
        }

        .grid_data td {
            font-size: 13px !important;
        }
    </style>
    <style>
        @media print {
            /*body {
                visibility: hidden;
            }*/

            .invoice {
                font-size: 11px !important;
            }

            .print_div {
                visibility: visible;
                position: absolute;
                left: 0;
                top: 0;
            }
        }

        .tbl_item {
            width: 100%;
            font-size: 11px !important;
        }

            .tbl_item tr td {
                padding-top: 3px;
                padding-bottom: 3px;
            }

            .tbl_item tr:first-child td {
                border-bottom: 1px dashed gray;
                font-weight: bold;
            }

            .tbl_item tr:last-child td {
                border-bottom: 1px dashed gray;
            }

            .tbl_item tr td:last-child {
                text-align: right;
            }

        .menu_ul li {
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="messagealert" id="alert_container">
    </div>
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bx bx-file">&nbsp</i>English Test</div>
    </div>
    <div class="card">
        <div class="card-header py-3">
            <div class="row g-3">
                <div class="col-lg-3 col-md-6 me-auto">
                    <div class="ms-auto position-relative">
                        <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-search"></i></div>
                        <asp:TextBox ID="txt_search" class="form-control ps-5 searchInput" placeholder="Search..." runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="col-lg-5 col-12 col-md-7">
                    <div class="input-group">
                        <asp:TextBox ID="txt_from_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txt_to_date" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        <asp:Button ID="btn_search" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btn_search_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <asp:GridView ID="grid_form" runat="server" OnRowCommand="grid_sales_RowCommand" AutoGenerateColumns="false" CssClass="table tbl_bottem_boder align-middle mb-0 grid_data">
                <Columns>
                    <asp:TemplateField HeaderText="Sr">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Student ID">
                        <ItemTemplate>
                            <label>
                                <%# Eval("std_id_number") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Student Name">
                        <ItemTemplate>
                            <label>
                                <%# Eval("f_name") +" " + Eval("l_name").ToString() %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date of Birth">
                        <ItemTemplate>
                            <label>
                                <%# Eval("date_of_birth") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <label>
                                <%# Eval("email") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nationality">
                        <ItemTemplate>
                            <label>
                                <%# Eval("nationality") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                     
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <label>
                                <%# Eval("date") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-3 fs-6">
                                <asp:LinkButton CommandName="btn_pdf" CommandArgument='<%# Eval("ept_form_id") %>' runat="server" CssClass="text-primary" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Form" aria-label="Views">
                                        <i class="bi bi-file-earmark-pdf"></i>
                                </asp:LinkButton>

<%--                                <asp:LinkButton CommandName="btn_delete" CommandArgument='<%# Eval("id") %>' runat="server" CssClass="text-danger" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Delete" aria-label="Views" OnClientClick="return confirm('Are you sure delete this form ?');">
                                        <i class="bi bi-trash-fill"></i>
                                </asp:LinkButton>--%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('.chosenSelect').chosen({
                width: '100%'
            });

            // Input field for search
            var $searchInput = $('#<%= txt_search.ClientID%>');

            // Gridview table
            var $gridview = $('#<%= grid_form.ClientID%>');

            // Attach an event listener to the input field
            $searchInput.on('input', function () {
                var searchText = $(this).val().toLowerCase();

                // Loop through each row in the tbody
                $gridview.find('tbody tr').each(function () {
                    var $row = $(this);

                    // Loop through each cell in the row
                    $row.find('td').each(function () {
                        var cellText = $(this).text().toLowerCase();

                        // Check if the cell text contains the search text
                        if (cellText.includes(searchText)) {
                            // Show the row if a match is found
                            $row.show();
                            return false; // Break out of the inner loop
                        } else {
                            // Hide the row if no match is found
                            $row.hide();
                        }
                    });
                });
            });

        });
    </script>

    <%--<script>
        function printDiv(divId) {
            var printContents = document.getElementById(divId).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
    </script>--%>

</asp:Content>

