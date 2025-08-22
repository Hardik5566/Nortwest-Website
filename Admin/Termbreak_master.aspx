<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Termbreak_master.aspx.cs" Inherits="Termbreak_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    TermBreak Master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bx bx-file">&nbsp</i>TermBreak Master</div>
    </div>
    <!-- Button -->
    <div class="col-12 d-flex justify-content-end">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" onclick="clearCourseForm();" data-bs-target="#courseModal">
            ADD TermBreak +
        </button>
    </div>
    <div class="card-body mt-lg-4">
        <div class="table-responsive">
            <asp:GridView ID="grid_data" runat="server" AutoGenerateColumns="false" OnRowCommand="grid_data_RowCommand" CssClass="table tbl_bottem_boder align-middle mb-0 grid_data text-center">

                <Columns>
                    <asp:TemplateField HeaderText="Sr">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Intake Date">
                        <ItemTemplate>
                            <label>
                                <%-- <%# Eval("course_name").ToString().Length > 20 ? Eval("course_name").ToString().Substring(0,20) + "..." : Eval("course_name") %>--%>
                                <%# Eval("intake_date") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Starat Date">
                        <ItemTemplate>
                            <label>
                                <%# Eval("term_break_start") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <label>
                                <%# Eval("term_break_end") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server"
                                CommandArgument='<%# Eval("termbreak_id") %>'
                                CommandName="btn_edit"
                                CssClass="btn btn-link p-0">
    <i class="bi bi-pencil-square text-primary" style="font-size: 18px;"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server"
                                OnClientClick="return confirm('Are you sure delete this subject?');"
                                CommandArgument='<%# Eval("termbreak_id") %>'
                                CommandName="btn_delete" CssClass="btn btn-link p-0">
                                 <i class="bi bi-trash text-danger" style="font-size: 18px;"></i>
                            </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="courseModalLabel">Add TermBreak</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div class="col-md-12 mb-3">
                            <label for="ddl_programme" class="form-label">Programme Name</label>
                            <asp:DropDownList ID="ddl_course"
                                runat="server"
                                CssClass="form-select" DataValueField="intake_id" DataTextField="intake_date">
                            </asp:DropDownList>

                            <span id="ddlError" class="text-danger small"></span>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="txt_intake_date" class="form-label">Intake Date</label>
                            <asp:TextBox ID="txt_break_startdate" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_1" class="text-danger small"></span>
                        </div>
                         <div class="col-md-6 mb-3">
                            <label for="txt_break_enddate" class="form-label">Intake Date</label>
                            <asp:TextBox ID="txt_break_enddate" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_2" class="text-danger small"></span>
                        </div>

                      
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="clearCourseForm();">Close</button>
                    <asp:Button ID="btnSaveCourse" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btn_save_Click" OnClientClick="return validateCourseModal();" />
                </div>
            </div>
        </div>
    </div>
    <script>
        function clearCourseForm() {
            // reset dropdown
           
            // reset textboxes
            document.getElementById("<%= txt_break_startdate.ClientID %>").value = "";
            document.getElementById("<%= txt_break_enddate.ClientID %>").value = "";
            // reset button text
            document.getElementById("<%= btnSaveCourse.ClientID %>").value = "Save";
        }

    </script>

    <script type="text/javascript">
        function validateCourseModal() {
            var isValid = true;
            var fields = [
                { id: "<%= ddl_course.ClientID %>", err: "ddlError", msg: "Please select a Intake.", check: function (c) { return c.value !== "0"; } },
            { id: "<%= txt_break_startdate.ClientID %>", err: "txt_1", msg: "Please enter Start Date.", check: function (c) { return c.value.trim() !== ""; } },
             { id: "<%= txt_break_enddate.ClientID %>", err: "txt_2", msg: "Please enter End Date.", check: function (c) { return c.value.trim() !== ""; } },
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

