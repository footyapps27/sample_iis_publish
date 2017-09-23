function ConfirmMemberDeletion(sender) {
    var gridView = $('[id$=UsersGridView]');
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
        ShowAlert("No users selected.");
        return false;
    }
	$('[id$=SelectedMemberId]').val(memberIds);
    var message = 'Are you sure you want to delete the following members? <br />' + memberNames;
    return ConfirmItemDeletion(sender, message);
}

function ConfirmSingleMemberDeletion(sender) {
	var name = $(sender).data("name");
	var id = $(sender).data("id");
	$('[id$=SelectedMemberId]').val(id);
	var message = 'Are you sure you want to delete the following members? <br />' + name;
	return ConfirmItemDeletion(sender, message);
}

function EditMember(sender) {
    var id = $(sender).data("id");
    $('[id$=SelectedMemberId]').val(id);
}

function EnableForwardTo(sender, skip)
{
    var forwardToRoles = $('[id$=ForwardToRoles]').val();
    var forwardToRolesArray = forwardToRoles.split(',');

    var dropdownRolesVal = $('[id$=DropDownListRoles] option:selected').val();

    var approverCriterion = $('[id$=TextBoxForwardToCriterion]').closest('tr');
    var dropdownForward = $('[id$=DropDownListForwardTo]').closest('tr');
    
    if (jQuery.inArray(dropdownRolesVal, forwardToRolesArray) != -1)
    {
        dropdownForward.show();
        approverCriterion.show();
        // Add Member from Approver and Forward To Dropdown
        DropdownApproverOptions(true, skip);
    }
    else
    {
        dropdownForward.hide();
        approverCriterion.hide();
        // Remove Member from Approver and Forward To Dropdown
        DropdownApproverOptions(false, skip);
        // Update Cri
        ApproversCriterion(sender);
        ForwardToCriterion(sender);
    }
}

function DropdownApproverOptions(add, skip)
{
    if (skip)
        return;

    if ($('[id$=UpdatedMemberId]').length == 0)
        return;

    var memberId = $('[id$=UpdatedMemberId]').val();
    var memberName = $('[id$=TextBoxFullName]').val();

    var approverOption = '<option value="' + memberId + '">' + memberName + '</option>';

    if (add)
    {
        $('[id$=DropDownListApprovers]').append(approverOption);
        $('[id$=DropDownListForwardTo]').append(approverOption);
    }
    else
    {
        $('[id$=DropDownListApprovers] option[value=' + memberId + ']').remove();
        $('[id$=DropDownListForwardTo] option[value=' + memberId + ']').remove();
    }
}

function ApproversCriterion(sender) {
    var approverCriterionId = $('[id$=TextBoxApproverCriterion]');
    var dropdownApproverIndex = $('[id$=DropDownListApprovers] option:selected').index();
    
    if (dropdownApproverIndex == 0)
    {
        approverCriterionId.prop('disabled', true);
        approverCriterionId.removeAttr('value');
        approverCriterionId.attr('placeholder', '0.0')
    }
    else
    {
        approverCriterionId.prop('disabled', false);
    }
}

function ForwardToCriterion(sender) {
    var forwardToCriterionId = $('[id$=TextBoxForwardToCriterion]');
    var forwardToApproverIndex = $('[id$=DropDownListForwardTo] option:selected').index();

    if (forwardToApproverIndex == 0) {
        forwardToCriterionId.prop('disabled', true);
        forwardToCriterionId.removeAttr('value');
        forwardToCriterionId.attr('placeholder', '0.0')
    }
    else {
        forwardToCriterionId.prop('disabled', false);
    }
}