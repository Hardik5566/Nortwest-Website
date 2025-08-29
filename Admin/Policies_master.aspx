<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Policies_master.aspx.cs" Inherits="Policies_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Policy Master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="row align-items-center mb-3" style="margin: 0;">
        <!-- Left: Course Master -->
        <div class="col-6 d-flex align-items-center">
            <div class="breadcrumb-title pe-3">
                <i class="bx bx-file" style="font-size: 20px; vertical-align: middle; margin-right: 5px;"></i>
                Policy Master
            </div>
        </div>

        <!-- Right: Add Course button -->
        <div class="col-6 d-flex justify-content-end">
            <button type="button" class="btn btn-primary"
                style="font-weight: 500; padding: 6px 18px; border-radius: 8px;"
                data-bs-toggle="modal"
                onclick="clearCourseForm();"
                data-bs-target="#courseModal">
                + Add Policy
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
                        <asp:TemplateField HeaderText="Policy">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("policies_name") %>
                                </label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="File">
                            <ItemTemplate>
                                <label>
                                    <a href='<%# "assets/Policies/" + Eval("policies_file") %>'
                                        target="_blank">
                                        <%# Eval("policies_file") %>
                                    </a>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    CommandArgument='<%# Eval("policies_id") %>'
                                    CommandName="btn_edit"
                                    CssClass="btn btn-link p-0">
    <i class="bi bi-pencil-square text-primary" style="font-size: 18px;"></i>
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server"
                                    OnClientClick="return confirm('Are you sure delete this subject?');"
                                    CommandArgument='<%# Eval("policies_id") %>'
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
                    <h5 class="modal-title" id="courseModalLabel">Add Policy</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="txt_policies" class="form-label">Policy Name</label>
                            <asp:TextBox ID="txt_policies" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_1" class="text-danger small"></span>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="upd_flyer" class="form-label">Policy Document</label>
                            <asp:FileUpload ID="upd_policies" CssClass="form-control" runat="server" />
                            <span id="txt_5" class="text-danger small"></span>
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

            document.getElementById("<%= txt_policies.ClientID %>").value = "";


            // reset file upload (special case)
            document.getElementById("<%= upd_policies.ClientID %>").value = "";

            // reset button text
            document.getElementById("<%= btnSaveCourse.ClientID %>").value = "Save";
        }

    </script>
    <script type="text/javascript">
        function validateCourseModal() {
            var isValid = true;
            var fields = [

            { id: "<%= txt_policies.ClientID %>", err: "txt_1", msg: "Please enter Policy name.", check: function (c) { return c.value.trim() !== ""; } },
          
          <%--  { id: "<%= upd_flyer.ClientID %>", err: "txt_5", msg: "Please upload flyer.", check: function (c) { return c.value.trim() !== ""; } },--%>

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

