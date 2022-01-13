$(document).ready(function(){
    // Modal Load
    hideLoad()

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

    // LGPD
    $('.lgpd-close').click(function(){
        event.preventDefault()

        $('.lgpd-container').remove()
    })

    $('.lgpd-accept').click(function(){
        event.preventDefault()

        $('.lgpd-container').remove()

        let date = new Date()

        // Cria o cookie
        window.document.cookie = 'cookieaccept=1; expires=' + (new Date(date.getFullYear() + 1, date.getMonth(), date.getDate())).toGMTString() + '; path=/';
    })

    // Adicionar ao carrinho
    $('.add-to-cart-btn-ajax[data-url]').click(function(){
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

    // Adicionar aos favoritos
    $('.add-favorite-btn-ajax[data-url]').click(function(){
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
                createMessage('Produto não adicionado aos favoritos, Ocorreu um erro no processo!')
            },
            complete: function(){
                $(element).html(html)
                $(element).removeClass('load')
            }
        })
    })

    // Carregar frete
    $('form[data-container]').submit(function(){
        event.preventDefault()

        let element = this
        let container = $(element).data().container
        $(container).empty()

        $.ajax({
            method: element.method,
            url: element.action,
            data: $(element).serialize(),
            beforeSend: function(){
                $(container).html($('<div/>').addClass('load'))
            },
            success: function(respose){
                $(container).html(respose)
            },
            error: function(respose){
                createMessage('Ocorreu um erro ao tentar executar o formulário')
            },
            complete: function(){
                $(container).find('.load').remove()
            }
        })
    })

    // Formulário de busca
    $('.select-url').change(function(){
        let data = $(this).find(':selected').data()

        $(this).parents('form').attr('action', data.url)
    })

    // Masked input
    $('.phone-mask').mask('(99)9999-9999')
    $('*').delegate('.phone-mask', 'focus load', function(){
        $(this).mask('(99)9999-9999')
        return false
    })

    $('.cell-mask').mask('(99)99999-9999')
    $('*').delegate('.cell-mask', 'focus load', function(){
        $(this).mask('(99)99999-9999')
        return false
    })

    $('.cpf-mask').mask('999.999.999-99')
    $('*').delegate('.cpf-mask', 'focus load', function(){
        $(this).mask('999.999.999-99')
        return false
    })

    $('.cnpj-mask').mask('99.999.999/9999-99')
    $('*').delegate('.cnpj-mask', 'focus load', function(){
        $(this).mask('99.999.999/9999-99')
        return false
    })

    $('.cep-mask').mask('99999-999')
    $('*').delegate('.cep-mask', 'focus load', function(){
        $(this).mask('99999-999')
        return false
    })

    $('.credit-number-mask').mask('9999 9999 9999 9999')
    $('*').delegate('.credit-number-mask', 'focus load', function(){
        $(this).mask('9999 9999 9999 9999')
        return false
    })

    $('.cvv-mask').mask('999')
    $('*').delegate('.cvv-mask', 'focus load', function(){
        $(this).mask('999')
        return false
    })

    $('.float-mask').mask('###.##0,00', {reverse: true})
    $('*').delegate('.float-mask', 'focus load', function(){
        $(this).mask('###.##0,00', {reverse: true})
        return false
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

function showLoad(message = 'Aguarde, Carregando...'){
    $('.modal-load .message').text(message)
    $('.modal-load').show()
}

function hideLoad(){
    $('.modal-load').hide()
}