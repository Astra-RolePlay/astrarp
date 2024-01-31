let currentpage = null
$(document).on('click', '.bar-play', function(e){
    e.preventDefault();

    // if (this.id == "klasik") {
    //     return
    // } else if (this.id == "cilginparti") {
    //     return
    // } else if (this.id == "ekstrem") {
    //     return
    // } else if (this.id == "cift") {
    //     return
    // } else if (this.id == "parti") {
    //     return
    // } else if (this.id == "cilgin") {
    //     return
    // } else if (this.id == "karisik") {
    //     return
    // }
    
    currentpage = this.id
    $(".bar-main").hide()
    $(".question-menu").show()
    $(".main-wrapper").hide()
})

$(document).on('click', '.button', function(e){
    e.preventDefault();
    $(".bar-main").show()
    $(".question-menu").hide()
    $(".main-wrapper").hide()
    $.post("https://ed-truthordare/select", JSON.stringify({label: currentpage, select: this.id}));
})

$(document).on('click', '.close', function(e){
    $(".bar-main").show()
    $(".question-menu").hide()
    $(".main-wrapper").hide()
    $("body").hide(200)
    $.post("https://ed-truthordare/close");

})

addEventListener("message", function(event){
    let item = event.data;
    if(item.type == "txt") {
        $(".question-screen").fadeIn()
        $(".question").html(item.html)
        setTimeout(function(){
            $(".question-screen").fadeOut()
        }, 5000)
    } else if (item.type == "open") {
        $("body").fadeIn()
        $(".main-wrapper").fadeIn()
        $(".question-screen").hide()
    }
});
