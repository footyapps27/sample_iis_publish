function Check_Click(objRef) {
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode.parentNode;

    //Get the reference of GridView
    var gridView = row.parentNode;

    //Get all input elements in Gridview
    var inputList = gridView.getElementsByTagName("input");
    var headerCheckBox;
    var checked;
    for (var i = 0; i < inputList.length; i++) {
        //The First element is the Header Checkbox
        headerCheckBox = inputList[0];

        //Based on all or none checkboxes
        //are checked check/uncheck Header Checkbox
        checked = true;
        if (inputList[i].type === "checkbox" && inputList[i] !== headerCheckBox && !inputList[i].disabled) {
            if (!inputList[i].checked) {
                checked = false;
                break;
            }
        }
    }
    headerCheckBox.checked = checked;

}

function checkAll(objRef) {
    var gridView = objRef.parentNode.parentNode.parentNode;
    var inputList = gridView.getElementsByTagName("input");
    var checked = objRef.checked;
    for (var i = 0; i < inputList.length; i++) {
        if (inputList[i].type === "checkbox" && objRef !== inputList[i] && !inputList[i].disabled) {
            if (checked) {
                inputList[i].checked = true;
            }
            else {
                inputList[i].checked = false;
            }
        }
    }
}