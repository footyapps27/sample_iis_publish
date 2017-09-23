$(document).ready(function () {
    $("#settingsNavTab #reportPreferences").addClass("active");
    $('[data-toggle="tooltip"]').tooltip({ 'placement': 'top' });
    var tooltip = $('[id$=tooltipFoNotifyApproverWhenSubmittedReportIsNearingDueDate]');
    $('[id$=cbMakeReportsDueForApprovalWithin]')[0].checked ? tooltip.hide() : tooltip.show();
});

// Actions
function cbMakeReportsDueForApprovalWithin_OnCheckedChanged(checkBox) {
    var textBox = $('[id$=txtReportApprovalDayLimit]');
    textBox.prop("disabled", !checkBox.checked);
    textBox.val(0); // Default value
    $('[id$=cbNotifyApproverWhenSubmittedReportsAreNearingDueDate]').prop("disabled", !checkBox.checked);
    var tooltip = $('[id$=tooltipFoNotifyApproverWhenSubmittedReportIsNearingDueDate]');
    checkBox.checked ? tooltip.hide() : tooltip.show();
}

// Validation
function isReportApprovalDayLimitValid(oSrc, args) {
    args.IsValid = true;
    var cbExpenseExpiryPeriod = $('[id$=cbMakeReportsDueForApprovalWithin]')[0];
    if (cbExpenseExpiryPeriod.checked) {
        args.IsValid = args.Value > 0;
    }
}