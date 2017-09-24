<%@ Page Title="Welcome to JustLogin" Async="true" Language="C#" MasterPageFile="~/Peripheral.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Login" %>


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
                            <h3>Login to your account.</h3>
                            <div role="form" class="trial login-bg-form login-wp">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txtCompany" CssClass="form-control" placeholder="Company" runat="server" />
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="Username" runat="server" />
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                   <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server" />
                                </div>
                                <asp:Button ID="btn_Submit" CssClass="btn btn-grn btn-block" Text="SUBMIT" OnClick="btn_Submit_Click"  runat="server"/>
                                <a href="login-wp-forgotpw.html" class="forgot-password forgot-wp">I forgot my password.</a>
                                <br class="clearfix">
                            </div>
                            <br>
                        </div>
                        <span class="login-copyright">Copyright © 2016 JustLogin Pte Ltd  All Rights Reserved.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br class="clearfix">
</asp:Content>

