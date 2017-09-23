function ShowAlert(message) {
    bootbox.alert({
		message: message,
		title: "<center><i class='fa fa-bullhorn'></i>&nbsp; Justlogin says...</center>",
		backdrop: true,
		buttons: {
            'ok': {
                label: 'Okay',
                className: 'btn-default col-md-offset-5 col-md-2'
            }
        }
    });
}

function ConfirmItemDeletion(sender, message) {
    if ($(sender).attr("confirmed") === "true") { return true; }
    bootbox.confirm({
        message: message,
        title: "<center><i class='fa fa-bullhorn'></i>&nbsp; Justlogin says...</center>",
        buttons: {
            'cancel': {
                label: 'Cancel',
                className: 'btn-default col-md-offset-4 col-md-2'
            },
            'confirm': {
                label: 'Delete',
                className: 'btn-danger col-md-offset-4 col-md-2'
            }
        },
        callback: function (confirmed) {
            if (confirmed) {
                $(sender).attr("confirmed", confirmed);
                sender.click();
            }
        }
    });
    return false;
}

function ConfirmItemEnable(sender, message) {
    if ($(sender).attr("confirmed") === "true") { return true; }
    bootbox.confirm({
        message: message,
        title: "<center><i class='fa fa-bullhorn'></i>&nbsp; Justlogin says...</center>",
        buttons: {
            'cancel': {
                label: 'Cancel',
                className: 'btn-default col-md-offset-4 col-md-2'
            },
            'confirm': {
                label: 'Enable',
                className: 'btn-success col-md-offset-4 col-md-2'
            }
        },
        callback: function (confirmed) {
            if (confirmed) {
                $(sender).attr("confirmed", confirmed);
                sender.click();
            }
        }
    });
    return false;
}

function ConfirmItemDisable(sender, message) {
    if ($(sender).attr("confirmed") === "true") { return true; }
    bootbox.confirm({
        message: message,
        title: "<center><i class='fa fa-bullhorn'></i>&nbsp; Justlogin says...</center>",
        buttons: {
            'cancel': {
                label: 'Cancel',
                className: 'btn-default col-md-offset-4 col-md-2'
            },
            'confirm': {
                label: 'Disable',
                className: 'btn-disable col-md-offset-4 col-md-2'
            }
        },
        callback: function (confirmed) {
            if (confirmed) {
                $(sender).attr("confirmed", confirmed);
                sender.click();
            }
        }
    });
    return false;
}

/**
* Add the Bootstrap error classes to the ValidationSummary div(s). Based on following 2 assumptions:
* 1. All ValidationSummary controls must follow the id ValidationSummaryX, where X is the count.
* 2. No other control can have "ValidationSummary" in their id
*/
$(document).ready(function () {
    $("[id*=ValidationSummary]").addClass("alert alert-danger");
});

/**
 * Function to check if the input to a textbox is number or not.
 * @param {keyEvent} evt The key event that was input by the user.
 * @returns {boolean} true if the key pressed is a number, else false.
*/
function isInputNumeric(evt) {
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}