<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Bulk_agent_upload.aspx.cs" Inherits="Admin_Bulk_agent_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Agent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label>Upload Excel</label>
                    <asp:FileUpload ID="flu_file" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2">
                    <label>&nbsp;</label>
                    <br />
                    <asp:Button ID="btn_save" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="btn_save_Click" />

                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h4>Agents
                </h4>
                <%--<asp:Button ID="btn_remove" runat="server" Text="Remove All" CssClass="btn btn-primary" Style="position: absolute; right: 30px; top: 30px;" OnClick="btn_remove_Click" />--%>
                <%--   <asp:button id="btnAdd" runat="server" text="+ Add New" cssclass="btn btn-primary btn-sm btn_add"
                    style="position: absolute; right: 30px; top: 30px;" onclientclick="$('#modal_add').modal('show'); return false;" />--%>
            </div>
        </div>
        <br />
        <div class="card-body table-responsive">
            <asp:GridView ID="grid_show_student" AutoGenerateColumns="false" CssClass="table table-bordered search grid_header" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="SR No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Agency Name">
                        <ItemTemplate>
                            <%# Eval("agency_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="Business Name">
    <ItemTemplate>
        <%# 
            Eval("business_name") != null 
            ? (Eval("business_name").ToString().Length > 50 
                ? Eval("business_name").ToString().Substring(0, 50) + "..." 
                : Eval("business_name").ToString()) 
            : "" 
        %>
    </ItemTemplate>
</asp:TemplateField>

                    <asp:TemplateField HeaderText="Mobile Number">
                        <ItemTemplate>
                            <%# Eval("contact_number") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</asp:Content>

