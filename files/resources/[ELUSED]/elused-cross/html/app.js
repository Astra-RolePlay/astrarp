window.addEventListener("message", function(event) {
    var v = event.data
    var datos = v.data
    
    switch (v.action) {
        case 'openMenu':
            $('.container').fadeIn(100)
        break;


        case 'Load': 
            $('.cuerpocontainer').append(`
                <div class="itemscontainer">
                <h1>${v.label}</h1>
                    <div class="alignImg">
                    <img class="${v.valor}-img" src="${v.imagenes}" alt="">
                    </div>
                    <div class="alignItems">
                    <a class="${v.valor}-click" href="#">Select Crosshair</a>
                    </div>
                </div>
            `)

            $(`.${v.valor}-click`).click(function(){
               var imagen = $(`.${v.valor}-img`)
               var sourceimg = imagen[0].src
               $('.crosshair img').attr('src', sourceimg)
               localStorage.setItem('elused-crossImg', sourceimg)
               CloseAll()
            })
        break;
    }
});


$(function(){
    $('.yarrak').click(function(){
        $.post('https://elused-cross2/yarramiyedeniz', JSON.stringify({}));
        CloseAll()
    })
    $('.salir').click(function(){
        CloseAll()
    })
    $('.matar').click(function(){
        $('.crosshair img').attr('src', '')
        localStorage.setItem('elused-crossImg', '')
        CloseAll()
    })
})


function CloseAll() {
    $('.container').fadeOut(100)
    $.post('https://elused-cross/exit', JSON.stringify({}));
}

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});

function LoadCrosshair() {
    var srcimgpe = localStorage.getItem('elused-crossImg')
    $('.crosshair img').attr('src', srcimgpe || '')
}


window.addEventListener('load', () => {
    $.post('https://elused-cross/loadData', JSON.stringify({}));
    LoadCrosshair()
});