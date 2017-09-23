function ConfirmRoleDeletion(sender) {
    var gridView = $('[id$=RolesGridView]');
    var count = 0;
    var roleIds = '';
    var roleNames = '';

    gridView.find($("input[id*='cbCheck']:checked")).each(function () {
        if (count > 0) {
            roleIds += ",";
            roleNames += ", ";
        }
        roleIds += $(this).parent().data("id");
        roleNames += $(this).parent().data("code");
        count++;
    });

    if (count === 0) {
        ShowAlert("No roles selected.");
        return false;
    }
    $('[id$=SelectedRoleId]').val(roleIds);
    var message = 'Are you sure you want to delete the following roles? <br />' + roleNames;
    return ConfirmItemDeletion(sender, message);
}

function ViewRole(sender) {
    $('[id$=SelectedView]').val(true);
    EditRole(sender);
}

function EditRole(sender) {
    var id = $(sender).data("id");
    $('[id$=SelectedRoleId]').val(id);
}

function SaveRole(sender) {
    var count = 0;
    var accessPrivileges = '';

    var expenseReportGridView = $('[id$=ExpenseReportGridView]');
    //var advancePaymentGridView = $('[id$=AdvancePaymentGridView]');
    var settingsGridView = $('[id$=SettingsGridView]');

    accessPrivileges = AddToAccessPrivileges(expenseReportGridView, accessPrivileges);
    //accessPrivelieages = AddToAccessPrivileges(advancePaymentGridView, accessPrivelieages);
    accessPrivileges = AddToAccessPrivileges(settingsGridView, accessPrivileges);

    $('[id$=SelectedAccessPrivileges]').val(accessPrivileges);
}

function AddToAccessPrivileges(gridView, accessPrivelieages) {
    gridView.find($("input[id*='cbCheck']")).each(function () {
        if (accessPrivelieages !== "") {
            accessPrivelieages += ",";
        }
        apChecked = $(this).prop("checked");
        apId = $(this).parent().data("id");
        apName = $(this).parent().data("code");

        accessPrivelieages += apId + ":" + apName + ":" + apChecked;
    });
    return accessPrivelieages
}

function EnableAutoCheck(sender) {
    var expenseReportGridView = $('[id$=ExpenseReportGridView]');

    var input = $('[id$=ExpenseReportGridView]').find($("input[id*='cbCheck']"));

    var viewAll = '';
    input.each(function () {
        if ($(this).parent("span").data("code") == "ViewAllCompanyReports") {
            viewAll = $(this);
        }
    }); 
    var approverAll = expenseReportGridView.find($("input[data-code='ApproveAllCompanyReports']"))
    approverAll.click(function ()
    {
        viewAll.prop("checked", true);
    })
}
