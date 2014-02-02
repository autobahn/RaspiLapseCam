var redVal = 0;
var greenVal = 0;
var blueVal = 0;

$(function () {
    $("div.swatch-container").click(function() {
        $(this).addClass("selected");
        tmpURL = '/ledborg?red=' + redVal + '&green=' + greenVal + '&blue=' + blueVal;
        stripURL = stripTrailingSlash(tmpURL);
        loadUrl(stripURL);
    });
});

function loadUrl(newLocation) {
    $.get(newLocation);
    return false;
}

function stripTrailingSlash(str) {
    if(str.substr(-1) == '/') return str.substr(0, str.length - 1);
    return str;
}

function setRed(val) {
    for (i=0; i<=2; i++) {
        $("#red"+i).removeClass("selected");
    }
    $("#red"+val).addClass("selected");
    redVal = val;
};

function setGreen(val) {
    for (i=0; i<=2; i++) {
        $("#green"+i).removeClass("selected");
    }
    $("#green"+val).addClass("selected");
    greenVal = val;
}

function setBlue(val) {
    for (i=0; i<=2; i++) {
        $("#blue"+i).removeClass("selected");
    }
    $("#blue"+val).addClass("selected");
    blueVal = val;
}
