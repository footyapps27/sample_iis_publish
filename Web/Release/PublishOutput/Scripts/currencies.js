//The currency symbol value needs to be auto-populated based on the currency selection.
//This method takes the first 3 characters of the currency code and sets it as the selection.
function UpdateCurrencyCode(item) {
    var selectedValue = $(item).val();
	var code = selectedValue.substring(0, 3);
	$('[id$=CurrencySymbolTextBox]').val(code);
}

//Sets the values of the selected row into the Edit Currency modal popup.
//Only Format and DecimalPlaces may be edited.
function EditCurrency(item) {
    var code = $(item).data("code").replace(/'/g, '');
    var symbol = $(item).data("symbol").replace(/'/g, '');
    var format = $(item).data("format").replace(/'/g, '');
    var decimalPlaces = $(item).data("decimalplaces").replace(/'/g, '');
    var id = $(item).data("id").replace(/'/g, '');
	$('[id$=EditedCurrencyCode]').val(code);
    $('[id$=EditedCurrencySymbol]').val(symbol);
    $('[id$=EditedCurrencyFormats]').val(format);
    $('[id$=EditedCurrencyDecimalPlaces]').val(decimalPlaces);
    $('[id$=EditedCurrencyId]').val(id);
    $('[id$=EditedCurrencyCode]').attr('readonly', 'readonly');
    $('[id$=EditedCurrencySymbol]').attr('readonly', 'readonly');
}

//Ask the user for confirmation before deleting an item
function ConfirmCurrencyDeletion(item) {
	//The below replace method is required to remove all quotes('). This was required as the
	//retrieved values were boxed in quotes. Can be removed if not required anymore.
    var id = $(item).data("id").replace(/'/g, '');
    var code = $(item).data("code").replace(/'/g, '');
    $('[id$=EditedCurrencyId]').val(id);
	var message = 'Are you sure you want to delete currency: ' + code + '?';
    return ConfirmItemDeletion(item, message);
}

function ViewExchangeRates(sender) {
    var id = $(sender).data("id");
    var code = $(sender).data("code");
    $('[id$=SelectedCurrencyId]').val(id);
    $('[id$=SelectedCurrencyCode]').val(code);
}

//Ask the user for confirmation before deleting an item
function ConfirmExchangeRateDeletion(item) {
    //The below replace method is required to remove all quotes('). This was required as the
    //retrieved values were boxed in quotes. Can be removed if not required anymore.
    var id = $(item).data("id").replace(/'/g, '');
    var rate = $(item).data("rate");
    var date = $(item).data("date").replace(/'/g, '');
    $('[id$=EditingExchangeRateId]').val(id);
	var message = 'Are you sure you want to delete the following exchange rate? <br /><br />Value: ' + rate + '<br />Date: ' + date;
    return ConfirmItemDeletion(item, message);
}