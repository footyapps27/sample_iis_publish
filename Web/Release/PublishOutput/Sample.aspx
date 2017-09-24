
<%@ Page Title="Temp Dashboard" Language="C#" MasterPageFile="~/EClaims.master" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="eClaimsHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="eClaimsBodyContent" runat="server">
    <div class="content">
        <div class="row">
            <div class="col-xs-12">
                <h2>Shortcuts</h2>
                <ul>
                    <li><a href="Pages/Currencies.aspx">Currencies</a></li>
                    <li><a href="Pages/Categories.aspx">Categories</a></li>
                    <li><a href="Pages/Users.aspx">Users</a></li>
                    <li><a href="Pages/Roles.aspx">Roles</a></li>
                    <li><a href="/Pages/ExpensePreferences.aspx">Expense Preference</a></li>
                    <li><a href="/Pages/ReportPreferences.aspx">Report Preference</a></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
