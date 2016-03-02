/*
name:           Get Icon
apps:           Safari, Chrome
description:    Shows an icon for the current page. Requires jQuery.
parameters:
compile:        false
*/
function $sorted(selector, attrName) {
    return $($(selector).toArray().sort(function(a, b) {
        var aVal = parseInt(a.getAttribute(attrName));
        var bVal = parseInt(b.getAttribute(attrName));
        return aVal - bVal;
    }));
}

var icons = $sorted('link[rel=apple-touch-icon]', 'sizes').last();
if (icons.length === 0) {
    icons = $sorted('link[rel=apple-touch-icon-precomposed]', 'sizes').last();
}
if (icons.filter('[href]').length > 0) {
    window.location = icons.attr('href');
} else {
    $('img').each(function(i, e) {
        $(e)
            .css('border', '2px dashed lime')
            .css('cursor', 'pointer')
            .hover(function() {
                $(this).css('border', '2px dashed magenta');
            }, function(e) {
                $(this).css('border', '2px dashed lime');
            })
            .click(function(e) {
                e.preventDefault();
                window.location = $(this).attr('src');
            });
    });
}
