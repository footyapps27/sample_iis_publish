<%@ Page Title="Error" Language="C#" MasterPageFile="~/Peripheral.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PeripheralHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PeripheralBodyContent" runat="server">
    <div class="bg bg-login-wp">
        <br class="clearfix">
        <div class="sticky-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                        <br />
                        <%--session time-out alert--%>
                        <%--<div class="alert alert-danger alert-dismissible session-timeout" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Oops!</strong> You have been logged out due to inactivity.
                        </div>--%>
                        <%--invalid login alert--%>
                        <%--<div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Uh-oh!</strong> Unable to log you in.
                        </div>--%>
                        <%--end login alert--%>
                        <div class="headers login-form-bg">
                            <div class="logo-wp">
                                <a href="index.html">
                                    <img src="Images/logo-login-wp.png" alt="JustLogin logo" width="150">
                                </a>
                            </div>
                            <h3>Unhandled exception error page.</h3>
                            <br>
                        </div>
                        <span class="login-copyright">Copyright © 2016 JustLogin Pte Ltd  All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
