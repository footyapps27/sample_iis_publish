<%@ Page Title="Users" Language="C#" MasterPageFile="~/Pages/Users.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UsersHeadContent" runat="server">
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="../Content/users.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="UsersBodyContent" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <div class="hpanel">
                <div class="panel-body tabContentBody">
                    <div>
                        <div class="dropdown pull-left">
                            <asp:DropDownList ID="UserStatusFilter" runat="server" CssClass="form-control" Width="100%" AutoPostBack="True"
                                OnSelectedIndexChanged="Filter_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <!--To be added in future releases -->
                        <%-- <div class="dropdown pull-right">
                                <button class="btn btn-default btn-sm dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <i class="fa fa-bars" aria-hidden="true"></i>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li><a href="#"><i class="fa fa-download"></i>Import Users</a></li>
                                    <li><a href="#" data-toggle="modal" data-target="#eclaim-exportUsers"><i class="fa fa-upload"></i>Export Users</a></li>
                                </ul>
                            </div>--%>
                        <div class="dropdown pull-right btn-invite">
                            <button class="btn btn-success btn-sm dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                Invite Users
                                    <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="InviteUser.aspx">Single User</a></li>
                                <%--<li><a href="#">Multiple Users</a></li>--%>
                            </ul>
                        </div>
                        <br class="clear" />
                    </div>
                    <br class="clear" />
                    <br class="clear" />
                    <asp:HiddenField ID="SelectedMemberId" runat="server" />
                    <asp:GridView ID="UsersGridView" runat="server" CssClass="table table-responsive table-striped eclaim-user"
                        AutoGenerateColumns="False" ItemType="EClaims.Core.BO.Member" GridLines="None" DataKeyNames="Id"
                        EmptyDataText="No users found." OnRowCommand="GridView_RowCommand">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbHeader" runat="server" onclick="checkAll(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbCheck" runat="server" onclick="Check_Click(this)" data-id="<%#: Item.Id %>" data-code="<%#: Item.FullName %>"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lbEmployeeName" runat="server" Text="Employee Name" CommandName="Sort" CommandArgument="EmployeeName">
                                    </asp:LinkButton>
                                </HeaderTemplate>
                                <ItemStyle CssClass="col-sm-5"></ItemStyle>
                                <ItemTemplate>
                                    <div class="row" style="display: flex; align-items: center;">
                                        <div class="col-sm-2">
                                            <i class="pe-7s-user fa-4x"></i>
                                        </div>
                                        <div class="col-sm-10">
                                            <div>
                                                <asp:Label runat="server" Text='<%#: Item.FullName %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lbRole" runat="server" Text="Role" CommandName="Sort" CommandArgument="Role">
                                    </asp:LinkButton>
                                </HeaderTemplate>
                                <ItemStyle CssClass="col-sm-2"></ItemStyle>
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Label runat="server" Text='<%#: Item.Role.Name %>'></asp:Label>
                                        </div>
                                        <div class="col-sm-12">
                                            <asp:Label runat="server" CssClass='<%#: GetCssStyle(Item.Status) %>' Text='<%#: Item.Status.ToString() %>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lbApprover" runat="server" Text="Approving Officer" CommandName="Sort" CommandArgument="Approver">
                                    </asp:LinkButton>
                                </HeaderTemplate>
                                <ItemStyle CssClass="col-sm-4"></ItemStyle>
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Label runat="server" Text='<%#: Item.Approver?.FullName %>'></asp:Label>
                                        </div>
                                        <div class="col-sm-12">
                                            <asp:Label runat="server" Text='<%#: Item.Approver?.Email %>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemStyle CssClass="col-sm-1"></ItemStyle>
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="dropdown">
                                            <button class="btn btn-default btn-sm dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                                                <li>
                                                    <asp:LinkButton ID="EditUserLinkButton" runat="server" Text="Edit" OnClick="EditMember_Click"
                                                        data-id="<%#: Item.Id %>" OnClientClick="EditMember(this)">
                                                    </asp:LinkButton>
                                                </li>
                                                <!-- Updating user status currently disabled in BL -->
                                                <%--<li>
                                                        <asp:LinkButton ID="UpdateUserStatusLinkButton" runat="server" Text='<%#: GetEditMemberStatusText(Item.Status) %>' 
                                                            OnClick="UpdateUserStatus_OnClick" data-id="<%#: Item.Id %>" OnClientClick="EditMember(this)">
                                                        </asp:LinkButton>
                                                    </li>--%>
                                                <li>
                                                    <asp:LinkButton ID="DeleteUserLinkButton" runat="server" Text="Delete" OnClick="DeleteMember_OnClick"
                                                        data-name="<%#: Item.FullName %>" data-id="<%#: Item.Id %>"
                                                        OnClientClick="return ConfirmSingleMemberDeletion(this);">
                                                    </asp:LinkButton>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <hr />
                    <div>
                        <asp:LinkButton ID="btnDeleteMember" CssClass="btn btn-danger" runat="server"
                            OnClick="DeleteMember_OnClick" Text="Delete Users"
                            OnClientClick="return ConfirmMemberDeletion(this);"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../Scripts/GridViewCheckbox.js"></script>
    <script src="../Scripts/users.js"></script>
    <script>
        $(document).ready(function () {
            $("#userNavTab #users").addClass("active");
        });
    </script>
</asp:Content>
