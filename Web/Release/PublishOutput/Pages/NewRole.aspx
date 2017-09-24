<%@ Page Title="Add Role" Language="C#" MasterPageFile="~/EClaims.master" AutoEventWireup="true" CodeBehind="NewRole.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.NewRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="eClaimsHeadContent" runat="server">
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/helper.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="eClaimsBodyContent" runat="server">
    <div class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <h4>New Role</h4>
                                <hr />
                                <div class="row">
                                    <div class="col-xs-12">
                                        <i class="pe-7s-role fa-4x"></i>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12" style="margin-bottom: 10px">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ValidationGroup="SaveRole" />
                                    </div>
                                </div>

                                <table class="table table-striped eclaim-role">
                                    <tr>
                                        <td width="250">Name</td>
                                        <td>
                                            <asp:TextBox ID="TextBoxRoleName" CssClass="form-control input-sm" placeholder="Enter name here" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ControlToValidate="TextBoxRoleName"
                                                                        ErrorMessage="Role Name cannot be empty." Display="None" ValidationGroup="SaveRole">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="250">Description</td>
                                        <td>
                                            <asp:TextBox ID="TextBoxDescription" CssClass="form-control input-sm" placeholder="Enter description" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True" ControlToValidate="TextBoxDescription"
                                                                        ErrorMessage="Role Description cannot be empty." Display="None" ValidationGroup="SaveRole">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <asp:HiddenField ID="SelectedAccessPrivileges" runat="server" />
                                </table>
                                <asp:GridView ID="ExpenseReportGridView" runat="server" CssClass="table table-responsive table-striped eclaim-role"
                                              AutoGenerateColumns="False" ItemType="JustLoginWebsiteBoilerplate.Pages.AccessPrivilegeView" GridLines="None" 
                                              DataKeyNames="Id" EmptyDataText="No roles found." OnRowDataBound="ExpenseReportGridView_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="EXPENSE REPORT" DataField="Name">
                                            <ItemStyle CssClass="col-xs-4"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbCheck" Enabled="<%# Item.Enabled %>" runat="server" data-id="<%#: Guid.Empty %>" data-code="<%#: Item.EnumName %>"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <%--<asp:GridView ID="AdvancePaymentGridView" runat="server" CssClass="table table-responsive table-striped eclaim-role"
                                              AutoGenerateColumns="False" ItemType="JustLoginWebsiteBoilerplate.Pages.AccessPrivilegeView" GridLines="None" 
                                              DataKeyNames="Id" EmptyDataText="No roles found." OnRowDataBound="AdvancePaymentGridView_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="ADVANCE PAYMENT" DataField="Name">
                                            <ItemStyle CssClass="col-xs-4"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbCheck" Enabled="<%# Item.Enabled %>" runat="server" onclick="Check_Click(this)" data-id="<%#: Guid.Empty %>" data-code="<%#: Item.EnumName %>"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>--%>
                                <asp:GridView ID="SettingsGridView" runat="server" CssClass="table table-responsive table-striped eclaim-role"
                                              AutoGenerateColumns="False" ItemType="JustLoginWebsiteBoilerplate.Pages.AccessPrivilegeView" GridLines="None" 
                                              DataKeyNames="Id" EmptyDataText="No settings found." OnRowDataBound="SettingsGridView_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="SETTINGS" DataField="Name" >
                                            <ItemStyle CssClass="col-xs-4"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="cbHeader" runat="server" onclick="checkAll(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbCheck" Enabled="<%# Item.Enabled %>" runat="server" onclick="Check_Click(this)" data-id="<%#: Guid.Empty %>" data-code="<%#: Item.EnumName %>"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <hr>
                                <div>
                                    <asp:Button ID="btnNewRole" CssClass="btn btn-success" runat="server" Text="Save" OnClick="NewRole_OnClick"
                                                OnClientClick="SaveRole(this);" ValidationGroup="SaveRole"/>
                                    &nbsp;
                                    <a href="Roles.aspx" class="btn btn-default">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/GridViewCheckbox.js"></script>
    <script src="../Scripts/roles.js"></script>
</asp:Content>
