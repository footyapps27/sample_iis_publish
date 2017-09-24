<%@ Page Title="Roles" Language="C#" MasterPageFile="~/Pages/Users.master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UsersHeadContent" runat="server">
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/helper.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UsersBodyContent" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-body tabContentBody">
                        <div class="clearfix">
                            <a href="NewRole.aspx" class="btn btn-success btn-sm pull-right">+ Add Role</a>
                        </div>
                        <br>
                        <div class="table-responsive">
                            <asp:HiddenField ID="SelectedRoleId" runat="server" />
                            <asp:HiddenField ID="SelectedView" runat="server" />
                            <asp:GridView ID="RolesGridView" runat="server" CssClass="table table-responsive table-striped"
                                AutoGenerateColumns="False" ItemType="EClaims.Core.BO.Role" GridLines="None" DataKeyNames="Id"
                                EmptyDataText="No roles found.">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="cbHeader" runat="server" onclick="checkAll(this);" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbCheck" Enabled='<%# !Item.IsDefault %>' runat="server" onclick="Check_Click(this)" data-id="<%#: Item.Id %>" data-code="<%#: Item.Name %>"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Role Name" DataField="Name">
                                        <ItemStyle CssClass="col-xs-2"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Description" DataField="Description">
                                        <ItemStyle CssClass="col-xs-6"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemStyle CssClass="col-xs-4 text-right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="EditRoleLinkButton" Visible='<%# !Item.IsDefault %>' runat="server" OnClick="EditRole_Click"
                                                data-id="<%#: Item.Id %>" OnClientClick="EditRole(this)" class="btn btn-xs btn-default">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>Edit
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="ViewRoleLinkButton" Visible='<%# Item.IsDefault %>' runat="server" OnClick="ViewRole_Click"
                                                data-id="<%#: Item.Id %>" OnClientClick="ViewRole(this)" class="btn btn-xs btn-default">
                                                <i class="fa fa-eye" aria-hidden="true"></i>View
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <hr />
                            <div>
                                <asp:LinkButton ID="btnDeleteMember" CssClass="btn btn-danger" runat="server"
                                    OnClick="DeleteRole_OnClick" Text="Delete Roles"
                                    OnClientClick="return ConfirmRoleDeletion(this);"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="../Scripts/GridViewCheckbox.js"></script>
    <script src="../Scripts/roles.js"></script>
    <script>
        $(document).ready(function () {
            $("#userNavTab #roles").addClass("active");
        });
    </script>
</asp:Content>
