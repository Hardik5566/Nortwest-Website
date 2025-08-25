<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="public_holidays_master.aspx.cs" Inherits="public_holidays_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Holiday Master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="row align-items-center mb-3" style="margin: 0;">
        <!-- Left: Course Master -->
        <div class="col-6 d-flex align-items-center">
            <div class="breadcrumb-title pe-3">
                <i class="bx bx-file" style="font-size: 20px; vertical-align: middle; margin-right: 5px;"></i>
                Holiday Master
            </div>
        </div>

        <!-- Right: Add Course button -->
        <div class="col-6 d-flex justify-content-end">
            <button type="button" class="btn btn-primary"
                style="font-weight: 500; padding: 6px 18px; border-radius: 8px;"
                data-bs-toggle="modal"
                onclick="clearCourseForm();"
                data-bs-target="#courseModal">
                + Add Holiday
            </button>
        </div>
    </div>

    <!-- Button -->
    <div class="card">

        <div class="card-body mt-lg-4">
            <div class="table-responsive">
                <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="false" OnRowCommand="grid_data_RowCommand" CssClass="table tbl_bottem_boder align-middle mb-0 grid_data">

                    <Columns>
                        <asp:TemplateField HeaderText="Sr">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Holiday">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("holiday_name") %>
                                </label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <label>
                                    <%-- <%# Eval("course_name").ToString().Length > 20 ? Eval("course_name").ToString().Substring(0,20) + "..." : Eval("course_name") %>--%>
                                    <%# Eval("holiday_date") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    CommandArgument='<%# Eval("holiday_id") %>'
                                    CommandName="btn_edit"
                                    CssClass="btn btn-link p-0">
                                     <i class="bi bi-pencil-square text-primary" style="font-size: 18px;"></i>
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server"
                                    OnClientClick="return confirm('Are you sure delete this Holiday?');"
                                    CommandArgument='<%# Eval("holiday_id") %>'
                                    CommandName="btn_delete" CssClass="btn btn-link p-0">
                                    <i class="bi bi-trash text-danger" style="font-size: 18px;"></i>
                                </asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="courseModalLabel">Add Holiday</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">



                        <div class="col-md-12 mb-3">
                            <label for="txt_holiday_name" class="form-label">Holiday</label>
                            <asp:TextBox ID="txt_holiday_name" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_1" class="text-danger small"></span>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label for="txt_holiday_date" class="form-label">Date</label>
                            <asp:TextBox ID="txt_holiday_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_2" class="text-danger small"></span>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="clearCourseForm();" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnSaveCourse" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btn_save_Click" OnClientClick="return validateCourseModal();" />
                </div>
            </div>
        </div>
    </div>
    <script>
        function clearCourseForm() {
            // reset dropdown

            // reset textboxes
            document.getElementById("<%= txt_holiday_name.ClientID %>").value = "";
            document.getElementById("<%= txt_holiday_date.ClientID %>").value = "";

            // reset button text
            document.getElementById("<%= btnSaveCourse.ClientID %>").value = "Save";
        }

    </script>
    <script type="text/javascript">
        function validateCourseModal() {
            var isValid = true;
            var fields = [

            { id: "<%= txt_holiday_name.ClientID %>", err: "txt_1", msg: "Please enter Holiday", check: function (c) { return c.value.trim() !== ""; } },
           { id: "<%= txt_holiday_date.ClientID %>", err: "txt_2", msg: "Please enter Day.", check: function (c) { return c.value.trim() !== ""; } },

            ];
            fields.forEach(function (f) {
                var c = document.getElementById(f.id);
                var e = document.getElementById(f.err);
                e.innerHTML = "";
                c.classList.remove("is-invalid");
                if (!f.check(c)) {
                    e.innerHTML = f.msg;
                    c.classList.add("is-invalid");
                    isValid = false;
                }
            });
            return isValid;
        }
    </script>
</asp:Content>

