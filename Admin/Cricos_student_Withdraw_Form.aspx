<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Cricos_student_Withdraw_Form.aspx.cs" Inherits="Cricos_student_Withdraw_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Cricos Student Withdraw
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

        .grid_data th {
            font-size: 12px !important;
        }

        .tbl_bottem_boder td {
            font-size: 12px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bx bx-file">&nbsp</i>Cricos Student Withdraw</div>
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
            <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="false" CssClass="table tbl_bottem_boder align-middle mb-0 grid_data">
                <Columns>
                    <asp:TemplateField HeaderText="Sr">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Id">
                        <ItemTemplate>
                            <label>
                                <%# Eval("student_id") %>
                            </label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <label>
                                <%# Eval("first_name") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <label>
                                <%# Eval("last_name") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Withdraw Date">
                        <ItemTemplate>
                            <label>
                                <%# Eval("withdraw_date") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Current Course">
                        <ItemTemplate>
                            <label>
                                <%# Eval("current_course") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Subsequent Course">
                        <ItemTemplate>
                            <label>
                                <%# Eval("subsequent_course") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reason For Withdrawal">
                        <ItemTemplate>
                            <label>
                                <%# Eval("reason_for_withdrawal") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sign. Date">
                        <ItemTemplate>
                            <label>
                                <%# Eval("sign_date") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Signature">
                        <ItemTemplate>
                            <label>
                                <a href=' <%# "/assets/img/sign" + Eval("student_signature") %>' download>Download</a>
                            </label> 
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
            var $gridview = $('#<%= grid_data.ClientID%>');

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
</asp:Content>

