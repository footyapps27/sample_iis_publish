<%@ Page Title="Invite User" Language="C#" MasterPageFile="~/EClaims.master" AutoEventWireup="true" CodeBehind="InviteUser.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.InviteUser" %>

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
                                <h4>Invite User</h4>
                                <hr />
                                <div class="row">
                                    <div class="col-xs-12">
                                        <i class="pe-7s-user fa-4x"></i>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12" style="margin-bottom: 10px">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ValidationGroup="InviteUser" />
                                    </div>
                                </div>

                                <table class="table table-striped eclaim-user">
                                    <tr>
                                        <td width="250">Name</td>
                                        <td>
                                            <asp:TextBox ID="TextBoxFullName" CssClass="form-control input-sm" placeholder="Enter name here" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ControlToValidate="TextBoxFullName"
                                                ErrorMessage="Name cannot be empty." Display="None" ValidationGroup="InviteUser">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="250">Role</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListRoles" CssClass="form-control input-sm" runat="server" DataTextField="Name" DataValueField="Id"></asp:DropDownList>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="250">Email</td>
                                        <td>
                                            <asp:TextBox ID="TextBoxEmail" CssClass="form-control input-sm" type="email" placeholder="Enter email here" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ControlToValidate="TextBoxEmail"
                                                                        ErrorMessage="Email cannot be empty." Display="None" ValidationGroup="InviteUser">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td width="250">Approver</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListApprovers" CssClass="form-control input-sm" runat="server" DataTextField="FullName" DataValueField="Id"></asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <hr>
                                <div>
                                    <asp:Button ID="btnAddMember" CssClass="btn btn-success" runat="server" Text="Save" OnClick="AddMember_OnClick"
                                                ValidationGroup="InviteUser"/>
                                    &nbsp;
                                    <a href="Users.aspx" class="btn btn-default">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
