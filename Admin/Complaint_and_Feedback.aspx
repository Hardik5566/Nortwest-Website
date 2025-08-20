<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Complaint_and_Feedback.aspx.cs" Inherits="Complaint_and_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
   Complaint and Feedback
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
        <div class="breadcrumb-title pe-3"><i class="bx bx-file">&nbsp</i>Complaint and Feedback</div>
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
                                <%# Eval("student_no") %>
                            </label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <label>
                                <%# Eval("student_last_name") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Given Name">
                        <ItemTemplate>
                            <label>
                                <%# Eval("student_given_name") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Full Name">
                        <ItemTemplate>
                            <label>
                                <%# Eval("student_full_name ") %>
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
                    <asp:TemplateField HeaderText="Contact No">
                        <ItemTemplate>
                            <label>
                                <%# Eval("country_code") + Eval("contact_no").ToString() %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street Address">
                        <ItemTemplate>
                            <label>
                                <%# Eval("street_address") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Addressline 2">
                        <ItemTemplate>
                            <label>
                                <%# Eval("street_address_line_2") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <label>
                                <%# Eval("country") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <label>
                                <%# Eval("state_region") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <label>
                                <%# Eval("city") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Zipcode">
                        <ItemTemplate>
                            <label>
                                <%# Eval("zip") %>
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

