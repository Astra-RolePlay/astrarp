var kisi = "asdas"

window.addEventListener("message", function (event) {
    if (event.data.display) {
        $('#question-header').html(event.data.isim + " ile bağlanmayı kabul ediyor musun?");
        kisi = event.data.kimlik;
        $('.question-menu').css('display', 'block');
    } else {
        $('.question-menu').css('display', 'none');
    }
});

$(document).on('click', '#accept', function(e){
    e.preventDefault();

    $.post('https://ed-heardring/accept', JSON.stringify({
        forring : kisi,
    }));
});

$(document).on('click', '#denice', function(e){
    e.preventDefault();

    $.post('https://ed-heardring/denied', JSON.stringify({
        forring : kisi,
    }));
});