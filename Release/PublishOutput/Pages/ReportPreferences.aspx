<%@ Page Title="Report Preferences" Language="C#" MasterPageFile="~/Pages/Settings.master" AutoEventWireup="true" CodeBehind="ReportPreferences.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.ReportPreferences" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SettingsHeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SettingsBodyContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="hpanel">
                <div class="panel-body tabContentBody">
                    <div class="row">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" ValidationGroup="SaveReportPreference"/>
                        <div class="col-lg-12">
                            <span>Auto-generate expense report number
                                    <div class="tooltip-demo" style="display: inline-block">
                                        <a class="" data-toggle="tooltip" data-placement="top" title="System generated IDs for the expense reports." data-original-title="">
                                            <i class="fa fa-question-circle text-muted" style="font-size: 16px; margin-left: 5px"></i>
                                        </a>
                                    </div>
                            </span>
                            <br>
                            <br>
                            <div class="form-group">
                                <span class="text-danger">Prefix </span>
                                <asp:TextBox ID="txtReportNumberPrefix" CssClass="form-control" PlaceHolder="ER-"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtReportNumberPrefix" 
                                    Display="None" ErrorMessage="Please enter report prefix" ValidationGroup="SaveReportPreference" runat="server">
                                </asp:RequiredFieldValidator>
                            </div>
                            &nbsp;&nbsp;&nbsp;
                                    <div class="form-group">
                                        <span class="text-danger">Start with </span>
                                        <asp:TextBox ID="txtReportNumberSuffix" CssClass="form-control" PlaceHolder="00001"  runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtReportNumberSuffix" 
                                                                    Display="None" ErrorMessage="Please enter report suffix" ValidationGroup="SaveReportPreference" runat="server">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server" ErrorMessage="Please enter a positive non-decimal value for report suffix." 
                                            ControlToValidate="txtReportNumberSuffix" ValueToCompare="0"
                                            ValidationGroup="SaveReportPreference"
                                             Operator="GreaterThan" Type="Integer">
                                        </asp:CompareValidator>
                                    </div>
                            <hr>
                            <h4 class="text-light">PDF options</h4>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox ID="cbIncludeSignatureLineInPdfReport" runat="server" />
                                            Include signature line in PDF reports</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox ID="cbIncludeReceiptsInPdfReport" runat="server" />
                                            Include receipts in PDF reports</label>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox ID="cbShowReportHistoryInPdf" runat="server" />
                                            Show Report History in PDF</label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <p>Default Template</p>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                            Standard &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <a href="#" class="text-success"><i class="fa fa-file-pdf-o"></i>sample</a>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                            Group by Category &nbsp;&nbsp;&nbsp;
                                        </label>
                                        <a href="#" class="text-success"><i class="fa fa-file-pdf-o"></i>sample</a>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <h4 class="text-light">On expense report submission</h4>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbNotifyApproverViaEmailWhenReportsAreSubmitted" runat="server" />
                                    Notify approver via email when reports are submitted</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbAttachReportAsPdfToNotificationEmail" runat="server" />
                                    Attach report as a PDF file to the notification email</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbCopySubmittedInEmail" runat="server" />
                                    Copy the submitter in the email</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbReceiveCopyOfReport" runat="server" />
                                    Receive a copy of the report</label>
                                <div class="tooltip-demo" style="display: inline-block">
                                    <a class="" data-toggle="tooltip" data-placement="top" title="" data-original-title="This email address will be copied whenever a report is submitted">
                                        <i class="fa fa-question-circle text-muted" style="font-size: 16px; margin-left: 5px"></i>
                                    </a>
                                </div>
                            </div>
                            <hr>
                            <h4 class="text-light">Approval Preference</h4>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbAllowApproversToApproveTheirOwnReports" runat="server" />
                                    Allow approvers to approve their own reports</label>
                            </div>
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="cbMakeReportsDueForApprovalWithin" onclick="cbMakeReportsDueForApprovalWithin_OnCheckedChanged(this)" runat="server" />
                                        Make reports due for approval within
                                    </label>
                                </div>
                                &nbsp;
                                <asp:TextBox ID="txtReportApprovalDayLimit" Placeholder="0" CssClass="form-control" Enabled="False" OnKeyPress="return isInputNumeric();" runat="server"></asp:TextBox>
                                <asp:CustomValidator runat="server" ControlToValidate = "txtReportApprovalDayLimit"
                                                     ErrorMessage = "Approval Day Limit: You must enter a value greater than 0."
                                                     Display="None"
                                                     ClientValidationFunction="isReportApprovalDayLimitValid"
                                                     OnServerValidate="IsReportApprovalDayLimitValid"
                                                     ValidationGroup="SaveReportPreference">
                                    
                                </asp:CustomValidator>
                                of submission
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbNotifyApproverWhenSubmittedReportsAreNearingDueDate" runat="server" />
                                    Notify approver when submitted reports are nearing their due dates
                                </label>
                                <div id="tooltipFoNotifyApproverWhenSubmittedReportIsNearingDueDate" class="tooltip-demo" style="display: inline-block;" >
                                    <a data-toggle="tooltip" data-placement="top" title="To access this option, enable the make reports due for approval." data-original-title="">
                                        <i class="fa fa-question-circle text-muted" style="font-size: 16px; margin-left: 5px"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbReceiveACopyOfReportUponItsApproval" runat="server" />
                                    Receive a copy of the report upon its approval</label>
                            </div>
                            <hr>
                            <h4 class="text-light">Send notifications when</h4>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbNotifyWhenReportsAreApprovedOrRejected" runat="server" />
                                    Expense reports are approved or rejected</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbNotifyWhenReportsAreMarkedReimbursed" runat="server" />
                                    Expense reports are marked as reimbursed</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbNotifyWhenCommentsAreAddedToReports" runat="server" />
                                    Comments are added to expense reports</label>
                            </div>
                            <hr>
                            <h4 class="text-light">Report Fields Customization</h4>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="table-responsive">
                                        <asp:GridView ID="ReportPreferenceGridView" runat="server" CssClass="table table-striped"
                                            AutoGenerateColumns="False" ItemType="EClaims.Core.BO.ReportPreferenceCustomField" GridLines="None" DataKeyNames="Id"
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
                            <asp:Button ID="btn_Save" CssClass="btn btn-success w-xs" ValidationGroup="SaveReportPreference" OnClick="btn_Save_OnClick" Text="Save" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/reportPreferences.js"></script>
</asp:Content>
