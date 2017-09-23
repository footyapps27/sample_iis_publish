// Page Load
$(document).ready(function () {
    $("#settingsNavTab #expensePreferences").addClass("active");
    $('[data-toggle="tooltip"]').tooltip({ 'placement': 'top' });
    var tooltip = $('[id$=tooltipForWarnUsersForExpiryDate]');
    $('[id$=cbEnableExpenseExpiryPeriod]')[0].checked ? tooltip.hide() : tooltip.show();
});

// Actions
function cbEnableExpenseExpiryPeriod_OnCheckedChanged(checkBox) {
    var textBox = $('[id$=txtExpenseExpiryPeriod]');
    textBox.prop("disabled", !checkBox.checked);
    textBox.val(0); // Default value
    $('[id$=cbWarnUsersForExpiryDate]').prop("disabled", !checkBox.checked);
    var tooltip = $('[id$=tooltipForWarnUsersForExpiryDate]');
    checkBox.checked ? tooltip.hide() : tooltip.show();
}

// Validation
function isExpenseExpiryPeriodValid(oSrc, args) {
    args.IsValid = true;
    var cbExpenseExpiryPeriod = $('[id$=cbEnableExpenseExpiryPeriod]')[0];
    if (cbExpenseExpiryPeriod.checked) {
        args.IsValid = args.Value > 0;
    }
}