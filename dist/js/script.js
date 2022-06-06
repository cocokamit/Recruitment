function Confirm(msg) {
    var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")

    if (confirm("Are you sure to delete " + msg + "?")) 
        confirm_value.value = "Yes";
    else
        confirm_value.value = "No";

}