<%@ Page Title="View Exchange Rates" Language="C#" MasterPageFile="~/EClaims.master" AutoEventWireup="true" CodeBehind="ViewExchangeRates.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.ViewExchangeRates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="eClaimsHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="eClaimsBodyContent" runat="server">
    <div class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <h4>View Exchange Rates - <i>
                                    <asp:Label ID="LabelCurrencyCode" runat="server"></asp:Label></i></h4>
                                <hr />
                                <div class="clearfix">
                                    <a href="#" data-toggle="modal" data-target="#newExchangeRate" class="btn btn-success btn-sm pull-right">+ New Exchange Rate</a>
                                </div>
                                <asp:HiddenField ID="EditingExchangeRateId" runat="server" />
                                <asp:HiddenField ID="CurrencyId" runat="server" />
                                <div class="table-responsive">
                                    <asp:GridView ID="ExchangeRateGridView" runat="server" CssClass="table table-responsive table-striped eclaim-currency"
                                        AutoGenerateColumns="False" ItemType="EClaims.Core.BO.ExchangeRate" GridLines="None" DataKeyNames="Id"
                                        EmptyDataText="No exchange rates found.">
                                        <Columns>
                                            <asp:BoundField HeaderText="Exchange Rate" DataField="Value">
                                                <ItemStyle CssClass="col-xs-5"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="As of Date">
                                                <ItemStyle CssClass="col-xs-5"></ItemStyle>
                                                <ItemTemplate>
                                                    <span><%#: Item.Date.ToShortDateString() %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle CssClass="col-xs-2 text-right"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnDeleteExchangeRate" CssClass="btn btn-xs btn-danger" runat="server"
                                                        data-id="<%#: Item.Id %>" data-rate="<%#: Item.Value %>" data-date="<%#: Item.Date.ToShortDateString() %>" OnClick="DeleteExchangeRate_OnClick"
                                                        OnClientClick="return ConfirmExchangeRateDeletion(this);">
                                                        <i class="fa fa-times" aria-hidden="true"></i>Delete
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <hr />
                                <div>
                                    <asp:LinkButton ID="btnBack" CssClass="btn btn-default" runat="server" OnClick="Back_OnClick">Back</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- New exchange rate modal -->
    <div class="modal fade" id="newExchangeRate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button><h4>New Exchange Rate</h4>
                    <hr />
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ValidationGroup="NewExchangeRate" />
                        <div class="form-group">
                            <label for="">Date</label>
                            <asp:TextBox ID="DateTextBox" CssClass="form-control" placeholder="Enter date" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ControlToValidate="DateTextBox"
                                ErrorMessage="Date cannot be empty." Display="None" ValidationGroup="NewExchangeRate">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="">Exchange Rate (in SGD)</label>
                            <asp:TextBox ID="ValueTextBox" CssClass="form-control" placeholder="Enter value" runat="server" TextMode="Number" step=".01"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ControlToValidate="ValueTextBox"
                                ErrorMessage="Value cannot be empty." Display="None" ValidationGroup="NewExchangeRate">
                            </asp:RequiredFieldValidator>
                        </div>
                        <hr>
                        <asp:Button ID="btnAddNewExchangeRate" CssClass="btn btn-success btn-sm" runat="server" Text="Add" OnClick="AddNewExchangeRate_OnClick"
                            ValidationGroup="NewExchangeRate" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/currencies.js"></script>
</asp:Content>
