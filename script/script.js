function kita(elem) {
    document.getElementById(elem).style.display = "inline";
}

function popmodal(dis) {
    document.getElementById("overlay").style.display = dis;
    document.getElementById("popuppanel").style.display = dis;
}

function Confirm(elem, msg) {
    if (elem.getAttribute("title") != 'approved') {
        var confirm_value = document.getElementById("content_TextBox1")
        if (confirm("Are you sure to delete this?")) {
            confirm_value.value = "Yes";
        }
        else {
            confirm_value.value = "No";
        }
    }
}
