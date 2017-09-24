<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/EClaims.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="eClaimsHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="eClaimsBodyContent" runat="server">
    <div class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="text-center">Welcome, <asp:Literal ID="Literal1" runat="server"></asp:Literal></h3>
                                <br/>
                                <p>Let us help you get started. Use the navigation to peruse the following features in the MECS web application.</p>
                                <ul>
                                    <li>Users</li>
                                    <li>Roles</li>
                                    <li>Currencies</li>
                                    <li>Categories</li>
                                    <li>Expense Preferences</li>
                                    <li>Report Preferences</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
