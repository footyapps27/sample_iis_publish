//Sets the values of the selected row into the Edit Category modal popup.
function EditCategory(item) {
    var name = $(item).data("name").replace(/'/g, '');
    var accountcode = $(item).data("accountcode").replace(/'/g, '');
    var logo = $(item).data("logo");
    var isactive = $(item).data("isactive").replace(/'/g, '');
    var id = $(item).data("id").replace(/'/g, '');
    $('[id$=EditCategoryName]').val(name);
    $('[id$=EditAccountCode]').val(accountcode);
    $('[id$=EditCategoryLogo]').val(logo);
    $('[id$=EditIsActive').val(isactive);
    $('[id$=EditedCategoryId]').val(id);
}

//Ask the user for confirmation before deleting an item
function ConfirmCategorySelection(item, task) {
    var id = $(item).data("id").replace(/'/g, '');
    var name = $(item).data("name").replace(/'/g, '');
    $('[id$=SelectedCategoryId]').val(id);
    $('[id$=SelectedCategoryName]').val(name);
    var message = 'Are you sure you want to ' + task + ' category: ' + name + '?';
    if (task == 'delete')
    {
        return ConfirmItemDeletion(item, message);
    }
    else if (task == 'enable')
    {
        return ConfirmItemEnable(item, message);
    }
    else
    {
        return ConfirmItemDisable(item, message);
    }
}

//Add the Bootstrap error classes to the ValidationSummary div
$(document).ready(function () {
    $("[id$=ValidationSummaryNew]").addClass("alert alert-danger");
    $("[id$=ValidationSummaryEdit]").addClass("alert alert-danger");
});

function ConfirmCategoriesDeletion(sender) {
    var gridView = $('[id$=CategoryGridView]');
    var count = 0;
    var memberIds = '';
    var memberNames = '';

    gridView.find($("input[id*='cbCheck']:checked")).each(function () {
        if (count > 0) {
            memberIds += ",";
            memberNames += ", ";
        }
        memberIds += $(this).parent().data("id");
        memberNames += $(this).parent().data("code");
        count++;
    });

    if (count === 0) {
        ShowAlert("No categories selected.");
        return false;
    }
    $('[id$=SelectedCategoryId]').val(memberIds);
    var message = 'Are you sure you want to delete the following categories? <br />' + memberNames;
    return ConfirmItemDeletion(sender, message);
}