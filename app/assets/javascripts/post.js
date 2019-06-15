//= require jquery3

$(function() {
    document.body.addEventListener('ajax:success', function(event) {
        $('#votes'+event.detail[0].post).html(event.detail[0].votes);
    })
})