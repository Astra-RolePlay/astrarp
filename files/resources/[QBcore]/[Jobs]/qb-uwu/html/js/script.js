$(document).on('click', '.accept-button', function(e) {
    e.preventDefault();
    var PriceAmount = $(".text-input-price").val();
    var NoteAmount = $(".text-input-note").val();
    $.post('https://qb-uwu/Click', JSON.stringify({}))
    if (PriceAmount != '' && PriceAmount != undefined && NoteAmount != '' && NoteAmount != undefined) {
        $.post('https://qb-uwu/AddPrice', JSON.stringify({Price: PriceAmount, Note: NoteAmount}))
        $.post('https://qb-uwu/CloseNui', JSON.stringify({}))
        $(".main-container").animate({"top": "-30vh"}, 250, function() {
            $(".text-input-price").val('');
            $(".text-input-note").val('');
            $('.main-container').css("display", "none");
        }) 
    } else {
        $.post('https://qb-uwu/ErrorClick', JSON.stringify({}))
    }
});

$(document).on('click', '.cancel-button', function(e) {
    e.preventDefault();
    $.post('https://qb-uwu/Click', JSON.stringify({}))
    $.post('https://qb-uwu/CloseNui', JSON.stringify({}))
    $(".main-container").animate({"top": "-30vh"}, 250, function() {
        $('.main-container').css("display", "none");
    }) 
});

OpenRegister = function() {
    $('.main-container').css("display", "block");
    $('.payment-container').hide()
    $('.menu-items-container').show()
    $('.main-container').animate({"top": "30vh"}, 350)
}

// Payment \\

$(document).on('click', '.close-button', function(e) {
    e.preventDefault();
    $.post('https://qb-uwu/Click', JSON.stringify({}))
    $.post('https://qb-uwu/CloseNui', JSON.stringify({}))
    $(".main-container").animate({"top": "-30vh"}, 250, function() {
        $('.items').html('');
        $('.main-container').css("display", "none");
    }) 
});

$(document).on('click', '.payment', function(e) {
    e.preventDefault();
    var Price = $(this).data('price')
    var Note = $(this).data('note')
    var NumberId = $(this).data('id')
    $.post('https://qb-uwu/Click', JSON.stringify({}))
    if (NumberId != null && Note!= null && Price != null) {
        $.post('https://qb-uwu/PayReceipt', JSON.stringify({Price: Price, Note: Note, Id: NumberId}))
        $.post('https://qb-uwu/CloseNui', JSON.stringify({}))
        $(".main-container").animate({"top": "-30vh"}, 250, function() {
            $('.items').html('');
            $('.main-container').css("display", "none");
        }) 
    } else {
        $.post('https://qb-uwu/ErrorClick', JSON.stringify({}))
    }
});

SetupPayments = function(data) {
    for (const [key, value] of Object.entries(data)) {
        if (value != undefined && value != null) {
            var CurrentId = key
            var AddOption = '<div class="payment" data-price='+value['Price']+' data-note="'+value['Note']+'" data-id='+CurrentId+'><p>Price: $'+value['Price']+' <br> Note: '+value['Note']+'</p></div>'
            $('.items').append(AddOption);
        }
    }
}

OpenPayment = function() {
    $('.main-container').css("display", "block");
    $('.menu-items-container').hide()
    $('.payment-container').show()
    $('.main-container').animate({"top": "30vh"}, 350)
}

window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "OpenRegister":
            OpenRegister();
        break;
        case "OpenPayment":
            SetupPayments(event.data.payments);
            OpenPayment();
        break;
    }
});