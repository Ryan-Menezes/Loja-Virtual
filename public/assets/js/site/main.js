$(document).ready(function(){
    $('.btn-delete').click(function(){
        let route = $(this).data('route')
        
        if(route != undefined){
            $('.modal-form-delete').attr('action', route)
        }
    })

    // Tooltip
    $('[title]').tooltip({
        delay: {
            show: 100, 
            hide: 0
        }
    })

    // Configurações do form validade
    $('*').delegate('.form-validate', 'load focus blur', function(){
        $(this).validate({
            errorElement: 'span',
            messages: {
                required: 'Este campo é obrigatório',
                email: 'Por favor entre com um email válido'
            }
        })

        return false
    })

    // Configurações para ordenar elementos
    $('.sortable').sortable()
    $('*').delegate('.sortable', 'load mousemove', function(){
        $(this).sortable()
    })

    // Configuração para o container de checkbox
    // $('.container-check div').buttonset()

    // Configuração para o container de tabs
    $('.tabs').tabs()
    $('*').delegate('.tabs', 'load mousemove', function(){
        $(this).tabs()
    })

    // Configuração para o container de accordion
    $('.accordion').accordion({
        heightStyle: 'content',
        collapsible: true
    })
    $('*').delegate('.accordion', 'load mousemove', function(){
        $(this).accordion({
            heightStyle: 'content',
            collapsible: true
        })
    })

    // Inicia floater
    $('#floater').modal('show')

    // Adicionar ao carrinho
    $('.add-to-cart-btn-ajax').click(function(){
        event.preventDefault()

        let element = this
        let data = $(this).data()
        let html = $(this).html()

        $.ajax({
            method: 'POST',
            url: data.url,
            dataType: 'json',
            beforeSend: function(){
                $(element).empty()
                $(element).addClass('load')
            },
            success: function(respose){
                createMessage(respose.message)
            },
            error: function(respose){
                createMessage('Produto não adicionado ao carrinho, Ocorreu um erro no processo!')
            },
            complete: function(){
                $(element).html(html)
                $(element).removeClass('load')
            }
        })
    })
})

// Função que cria uma mensage
function createMessage(text){
    $('.warning-message').remove()

    let message = $('<div />').addClass('warning-message').text(text)

    message.click(function(){
        $(this).remove()
    })

    setTimeout(function(){
        message.remove()
    }, 4000)

    $('body').append(message)
}