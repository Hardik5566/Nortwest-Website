<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Intake_master.aspx.cs" Inherits="Intake_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Intake Master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="page-breadcrumb d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3"><i class="bx bx-file">&nbsp</i>Intake Master</div>
    </div>
    <!-- Button -->
    <div class="col-12 d-flex justify-content-end">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" onclick="clearCourseForm();" data-bs-target="#courseModal">
            ADD Intake +
        </button>
    </div>
    <div class="row">
        <asp:ListView ID="lvCourses" runat="server" OnItemDataBound="lvCourses_ItemDataBound">
            <ItemTemplate>
                <div class="col-md-3 mb-3">
                    <div class="card shadow-sm h-100">
                        <div class="card-header">
                            <%# Eval("course_name") %>
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="grid_intake" CssClass="table" ShowHeader="false" OnRowCommand="grid_data_RowCommand" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <label><%# Eval("intake_date") %></label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <a href='Termbreak_master.aspx?intake_id=<%# Eval("intake_id") %>'>
                                                <%# Eval("termbreak_count") %> Break
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server"
                                                CommandArgument='<%# Eval("intake_id") %>'
                                                CommandName="btn_edit"
                                                CssClass="btn btn-link p-0">
                                                <i class="bi bi-pencil-square text-primary" style="font-size: 18px;"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server"
                                                OnClientClick="return confirm('Are you sure delete this subject?');"
                                                CommandArgument='<%# Eval("intake_id") %>'
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
            </ItemTemplate>

        </asp:ListView>

    </div>

    <div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="courseModalLabel">Add Intake</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <label for="ddl_programme" class="form-label">Course Name</label>
                            <asp:DropDownList ID="ddl_course"
                                runat="server"
                                CssClass="form-select">
                            </asp:DropDownList>

                            <span id="ddlError" class="text-danger small"></span>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="txt_intake_date" class="form-label">Intake Date</label>
                            <asp:TextBox ID="txt_intake_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_1" class="text-danger small"></span>
                        </div>


                        <%--                        <div class="col-md-4 mb-3">
                            <label for="txt_study_week" class="form-label">Study Week</label>
                            <asp:TextBox ID="txt_study_week" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_8" class="text-danger small"></span>
                        </div>--%>
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
            document.getElementById("<%= ddl_course.ClientID %>").selectedIndex = 0;

            // reset textboxes
            document.getElementById("<%= txt_intake_date.ClientID %>").value = "";

            // reset button text
            document.getElementById("<%= btnSaveCourse.ClientID %>").value = "Save";
        }

    </script>

    <script type="text/javascript">
        function validateCourseModal() {
            var isValid = true;
            var fields = [
                { id: "<%= ddl_course.ClientID %>", err: "ddlError", msg: "Please select a programme.", check: function (c) { return c.value !== "0"; } },
            { id: "<%= txt_intake_date.ClientID %>", err: "txt_1", msg: "Please enter Intake Date.", check: function (c) { return c.value.trim() !== ""; } },
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

