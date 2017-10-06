<%@ Page Title="Currencies" Language="C#" MasterPageFile="~/Pages/Settings.master" AutoEventWireup="true" CodeBehind="Currencies.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.Currencies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SettingsHeadContent" runat="server">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SettingsBodyContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="hpanel">
                <div class="panel-body tabContentBody">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="clearfix">
                                <a href="#" data-toggle="modal" data-target="#newCurrency" class="btn btn-success btn-sm pull-right">+ New Currency</a>
                            </div>
                            <asp:HiddenField ID="SelectedCurrencyId" runat="server" />
                            <asp:HiddenField ID="SelectedCurrencyCode" runat="server" />
                            <div class="table-responsive">
                                <asp:GridView ID="CurrencyGridView" runat="server" CssClass="table table-responsive table-striped eclaim-currency"
                                    AutoGenerateColumns="False" ItemType="EClaims.Core.BO.Currency" GridLines="None" DataKeyNames="Id"
                                    EmptyDataText="No currencies found." OnRowDataBound="CurrencyGridView_OnRowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="Currency" DataField="Code">
                                            <ItemStyle CssClass="col-xs-4"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Symbol" DataField="Symbol">
                                            <HeaderStyle CssClass="text-center"></HeaderStyle>
                                            <ItemStyle CssClass="text-center col-xs-2"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Exchange Rate" DataField="ActiveExchangeRate.Value">
                                            <HeaderStyle CssClass="text-center"></HeaderStyle>
                                            <ItemStyle CssClass="text-center col-xs-2"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="As of Date">
                                            <ItemStyle CssClass="col-xs-2"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server"><%#: Item.ActiveExchangeRate?.Date.ToShortDateString() %></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemStyle CssClass="col-xs-2 text-right"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ViewExchangeRatesHyperLink" runat="server" CssClass="btn btn-xs btn-default"
                                                    OnClick="ViewExchangeRatesHyperLink_OnClick" data-id="<%#: Item.Id %>" data-code="<%#: Item.Code %>" OnClientClick="ViewExchangeRates(this)">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>View Exchange Rates                                                    
                                                </asp:LinkButton>
                                                <a href="#" class="btn btn-xs btn-default" data-id="'<%#: Item.Id %>'" data-code="'<%#: Item.Code %>'" data-format="'<%#: Item.Format %>'" data-symbol="'<%#: Item.Symbol %>'" data-decimalplaces="'<%#: Item.DecimalPlaces %>'" data-toggle="modal" data-target="#editCurrency" onclick="EditCurrency(this);">
                                                    <i class="fa fa-pencil" aria-hidden="true"></i>Edit
                                                </a>
                                                <asp:LinkButton ID="btnDeleteCurrency" CssClass="btn btn-xs btn-danger" runat="server"
                                                    data-id="<%#: Item.Id %>" data-code="<%#: Item.Code %>" OnClick="DeleteCurrency_OnClick"
                                                    OnClientClick="return ConfirmCurrencyDeletion(this);">
                                                    <i class="fa fa-times" aria-hidden="true"></i>Delete
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit currency modal -->
    <div class="modal fade" id="editCurrency" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button><h4>Edit Currency</h4>
                    <hr>
                    <div>
                        <div class="form-group">
                            <label for="">Currency Code</label>
                            <asp:TextBox ID="EditedCurrencyCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="">Currency Symbol</label>
                            <asp:TextBox ID="EditedCurrencySymbol" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="">Decimal Places</label>
                            <asp:DropDownList ID="EditedCurrencyDecimalPlaces" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="">Format</label>
                            <asp:DropDownList ID="EditedCurrencyFormats" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                        <hr>
                        <asp:Button ID="btnUpdateCurrency" CssClass="btn btn-success btn-sm" runat="server" Text="Save changes" OnClick="UpdateCurrency_OnClick" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="EditedCurrencyId" runat="server" />
    <!-- New currency modal -->
    <div class="modal fade" id="newCurrency" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button><h4>New Currency</h4>
                    <hr />
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ValidationGroup="NewCurrency" />
                        <div class="form-group">
                            <label for="">Currency Code</label>
                            <asp:DropDownList ID="DefaultCurrenciesDropDownList" CssClass="form-control selectpicker" runat="server"
                                data-none-selected-text="Please select a value" data-live-search="true" onchange="UpdateCurrencyCode(this)">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ControlToValidate="DefaultCurrenciesDropDownList"
                                ErrorMessage="Currency Code cannot be empty." Display="None" ValidationGroup="NewCurrency">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="">Currency Symbol</label>
                            <asp:TextBox ID="CurrencySymbolTextBox" CssClass="form-control" placeholder="Enter currency symbol" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ControlToValidate="CurrencySymbolTextBox"
                                ErrorMessage="Currency Symbol cannot be empty." Display="None" ValidationGroup="NewCurrency">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="">Decimal Places</label>
                            <asp:DropDownList ID="SupportedDecimalPlacesDropDownList" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="">Format</label>
                            <asp:DropDownList ID="SupportedCurrencyFormatsDropDownList" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                        <hr>
                        <asp:Button ID="btnAddNewCurrency" CssClass="btn btn-success btn-sm" runat="server" Text="Save changes" OnClick="AddNewCurrency_OnClick"
                            ValidationGroup="NewCurrency" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="../Scripts/currencies.js"></script>
    <script>
        $(document).ready(function () {
            $("#settingsNavTab #currencies").addClass("active");
        });
    </script>
</asp:Content>
