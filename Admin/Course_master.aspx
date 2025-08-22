<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Course_master.aspx.cs" Inherits="Admin_Course_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Course Master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="row align-items-center mb-3" style="margin: 0;">
        <!-- Left: Course Master -->
        <div class="col-6 d-flex align-items-center">
            <div class="breadcrumb-title pe-3">
                <i class="bx bx-file" style="font-size: 20px; vertical-align: middle; margin-right: 5px;"></i>
                Course Master
            </div>
        </div>

        <!-- Right: Add Course button -->
        <div class="col-6 d-flex justify-content-end">
            <button type="button" class="btn btn-primary"
                style="font-weight: 500; padding: 6px 18px; border-radius: 8px;"
                data-bs-toggle="modal"
                onclick="clearCourseForm();"
                data-bs-target="#courseModal">
                + Add Course
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

                        <asp:TemplateField HeaderText="Programme">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("programme") %>
                                </label>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Name">
                            <ItemTemplate>
                                <label>
                                    <%-- <%# Eval("course_name").ToString().Length > 20 ? Eval("course_name").ToString().Substring(0,20) + "..." : Eval("course_name") %>--%>
                                    <%# Eval("course_name") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Code">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("course_code") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cricos Code">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("cricos_code") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("description").ToString().Length > 40 ? Eval("description").ToString().Substring(0,50) + "..." : Eval("description") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField HeaderText="Flyer">
                        <ItemTemplate>
                            <label>
                                <%# Eval("flyer") %>
                            </label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Total Week">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("total_week") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Study Week">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("study_week") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Weeks Holiday">
                            <ItemTemplate>
                                <label>
                                    <%# Eval("weeks_holiday") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    CommandArgument='<%# Eval("course_id") %>'
                                    CommandName="btn_edit"
                                    CssClass="btn btn-link p-0">
    <i class="bi bi-pencil-square text-primary" style="font-size: 18px;"></i>
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server"
                                    OnClientClick="return confirm('Are you sure delete this subject?');"
                                    CommandArgument='<%# Eval("course_id") %>'
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
                    <h5 class="modal-title" id="courseModalLabel">Add Course</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <label for="ddl_programme" class="form-label">Programme</label>
                            <asp:DropDownList ID="ddl_programme" CssClass="form-select" runat="server">
                                <asp:ListItem Text="Project Management" Value="Project Management"></asp:ListItem>
                                <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                                <asp:ListItem Text="Leadership & Management" Value="Leadership & Management"></asp:ListItem>
                                <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                <asp:ListItem Text="Information Technology" Value="Information Technology"></asp:ListItem>
                                <asp:ListItem Text="Graduate Diploma of Management" Value="Graduate Diploma of Management"></asp:ListItem>
                                <asp:ListItem Text="Cookery & Hospitality" Value="Cookery & Hospitality"></asp:ListItem>
                                <asp:ListItem Text="Building & Construction" Value="Building & Construction"></asp:ListItem>
                            </asp:DropDownList>
                            <span id="ddlError" class="text-danger small"></span>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="txt_course_name" class="form-label">Course Name</label>
                            <asp:TextBox ID="txt_course_name" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_1" class="text-danger small"></span>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="txt_course_code" class="form-label">Course Code</label>
                            <asp:TextBox ID="txt_course_code" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_2" class="text-danger small"></span>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="txt_cricos_code" class="form-label">Cricos Code</label>
                            <asp:TextBox ID="txt_cricos_code" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_3" class="text-danger small"></span>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="upd_flyer" class="form-label">Flyer</label>
                            <asp:FileUpload ID="upd_flyer" CssClass="form-control" runat="server" />
                            <span id="txt_5" class="text-danger small"></span>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label for="txt_description" class="form-label">Description</label>
                            <asp:TextBox ID="txt_description" TextMode="MultiLine" Rows="2" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_4" class="text-danger small"></span>
                        </div>



                        <div class="col-md-4 mb-3">
                            <label for="txt_total_week" class="form-label">Total Week</label>
                            <asp:TextBox ID="txt_total_week" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_6" class="text-danger small"></span>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="txt_study_week" class="form-label">Study Week</label>
                            <asp:TextBox ID="txt_study_week" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_8" class="text-danger small"></span>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="txt_weeks_holiday" class="form-label">Weeks Holiday</label>
                            <asp:TextBox ID="txt_weeks_holiday" CssClass="form-control" runat="server"></asp:TextBox>
                            <span id="txt_7" class="text-danger small"></span>
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
            document.getElementById("<%= ddl_programme.ClientID %>").selectedIndex = 0;

            // reset textboxes
            document.getElementById("<%= txt_course_name.ClientID %>").value = "";
            document.getElementById("<%= txt_course_code.ClientID %>").value = "";
            document.getElementById("<%= txt_cricos_code.ClientID %>").value = "";
            document.getElementById("<%= txt_description.ClientID %>").value = "";
            document.getElementById("<%= txt_total_week.ClientID %>").value = "";
            document.getElementById("<%= txt_weeks_holiday.ClientID %>").value = "";
            document.getElementById("<%= txt_study_week.ClientID %>").value = "";

            // reset file upload (special case)
            document.getElementById("<%= upd_flyer.ClientID %>").value = "";

            // reset button text
            document.getElementById("<%= btnSaveCourse.ClientID %>").value = "Save";
        }

    </script>
    <script type="text/javascript">
        function validateCourseModal() {
            var isValid = true;
            var fields = [
                { id: "<%= ddl_programme.ClientID %>", err: "ddlError", msg: "Please select a programme.", check: function (c) { return c.value !== "0"; } },
            { id: "<%= txt_course_name.ClientID %>", err: "txt_1", msg: "Please enter course name.", check: function (c) { return c.value.trim() !== ""; } },
           <%-- { id: "<%= txt_course_code.ClientID %>", err: "txt_2", msg: "Please enter course code.", check: function (c) { return c.value.trim() !== ""; } },--%>
            { id: "<%= txt_cricos_code.ClientID %>", err: "txt_3", msg: "Please enter cricos code.", check: function (c) { return c.value.trim() !== ""; } },
            { id: "<%= txt_description.ClientID %>", err: "txt_4", msg: "Please enter description.", check: function (c) { return c.value.trim() !== ""; } },
          <%--  { id: "<%= upd_flyer.ClientID %>", err: "txt_5", msg: "Please upload flyer.", check: function (c) { return c.value.trim() !== ""; } },--%>
            { id: "<%= txt_total_week.ClientID %>", err: "txt_6", msg: "Enter valid total week.", check: function (c) { return c.value.trim() !== "" && !isNaN(c.value); } },
            { id: "<%= txt_weeks_holiday.ClientID %>", err: "txt_7", msg: "Enter valid weeks holiday.", check: function (c) { return c.value.trim() !== "" && !isNaN(c.value); } },
            { id: "<%= txt_study_week.ClientID %>", err: "txt_8", msg: "Enter valid study week.", check: function (c) { return c.value.trim() !== "" && !isNaN(c.value); } }
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

