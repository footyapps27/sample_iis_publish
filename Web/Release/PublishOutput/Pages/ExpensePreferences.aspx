<%@ Page Title="Expense Preferences" Language="C#" MasterPageFile="~/Pages/Settings.master" AutoEventWireup="true" CodeBehind="ExpensePreferences.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.ExpensePreferences" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SettingsHeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SettingsBodyContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="hpanel">
                <div class="panel-body tabContentBody">
                    <div class="row">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ValidationGroup="SaveExpensePreference"/>
                        <div class="col-lg-12">
                            <h4 class="text-light">Base Currency</h4>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbEnableAutomatedCurrencyConversion" runat="server" />
                                    Enable automated currency conversion 
                                </label>
                                <div class="tooltip-demo" style="display: inline-block">
                                    <a class="" data-toggle="tooltip" data-placement="top" title="To access this option, enable the expense the expiry option." data-original-title="">
                                        <i class="fa fa-question-circle text-muted" style="font-size: 16px; margin-left: 5px"></i>
                                    </a>
                                </div>
                            </div>
                            <hr>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbMakeExpensesReimbursableByDefault" runat="server" />
                                    Make expenses reimbursable by default 
                                </label>
                            </div>
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="cbEnableExpenseExpiryPeriod" onclick="cbEnableExpenseExpiryPeriod_OnCheckedChanged(this)" runat="server" />Expense expiry period
                                    </label>
                                    <div class="tooltip-demo" style="display: inline-block">
                                        <a class="" data-toggle="tooltip" data-placement="top" title="An expense that is not approved within the specified expiry period is marked Expired. It will be considered a policy violation." data-original-title="">
                                            <i class="fa fa-question-circle text-muted" style="font-size: 16px; margin-left: 5px"></i>
                                        </a>
                                    </div>
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txtExpenseExpiryPeriod" Placeholder="0" CssClass="form-control" Enabled="False" OnKeyPress="return isInputNumeric();" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ControlToValidate="txtExpenseExpiryPeriod" runat="server" 
                                            ErrorMessage="Only Numbers allowed" ValidationExpression="\d+">
                                        </asp:RegularExpressionValidator>
                                <asp:CustomValidator runat="server" ControlToValidate = "txtExpenseExpiryPeriod"
                                                     ErrorMessage = "Expense Expiry Period: You must enter a value greater than 0."
                                                     Display="None"
                                                     ClientValidationFunction="isExpenseExpiryPeriodValid"
                                                     OnServerValidate="IsExpenseExpiryPeriodValid"
                                                     ValidationGroup="SaveExpensePreference">
                                    
                                </asp:CustomValidator>
                            </div>
                            <hr>
                            <h4 class="text-light">Notifications</h4>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbWarnUsersForExpiryDate" Enabled="False" runat="server" />
                                    Warn users when an expense created by them nears its expiry date</label>
                                <div id="tooltipForWarnUsersForExpiryDate" class="tooltip-demo" style="display: inline-block;" >
                                    <a data-toggle="tooltip" data-placement="top" title="To access this option, enable the expense the expiry option." data-original-title="">
                                        <i class="fa fa-question-circle text-muted" style="font-size: 16px; margin-left: 5px"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="cbSendRemindersForUnreportedExpenses" runat="server" />
                                        Send reminders for unreported expenses.
                                    </label>
                                </div>
                                <asp:DropDownList ID="ddlReminderForUnreportedExpense" CssClass="form-control" runat="server" />
                            </div>
                            <hr>
                            <h4 class="text-light">Card Statements</h4>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbPermitUsersToEditAmountInPersonalCardExpense" runat="server" />
                                    Permit users to edit the amount in personal card expenses</label>
                            </div>
                            <hr>
                            <h4 class="text-light">Expense Fields Customization</h4>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="table-responsive">
                                        <asp:GridView ID="ExpensePreferenceGridView" runat="server" CssClass="table table-striped"
                                            AutoGenerateColumns="False" ItemType="EClaims.Core.BO.ExpensePreferenceCustomField" GridLines="None" DataKeyNames="Id"
                                            EmptyDataText="No fields found.">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ENABLE">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbEnabled" CssClass="col-xs-4" Checked='<%# Eval("IsEnabled") %>' runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="FIELD" DataField="Name">
                                                    <ItemStyle CssClass="col-xs-4"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="MANDATORY">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbMandatory" CssClass="col-xs-4" Checked='<%# Eval("IsMandatory") %>' runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SHOW IN PDF">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbShowInPdf" CssClass="col-xs-4" Checked='<%# Eval("IsShownInPDF") %>' runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <asp:Button ID="btn_Save" CssClass="btn btn-success w-xs" ValidationGroup="SaveExpensePreference" OnClick="btn_Save_OnClick" Text="Save" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/expensePreferences.js"></script>
</asp:Content>
