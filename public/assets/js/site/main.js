$(document).ready(function(){
    // Inicia floater
    $('#floater').modal('show')

    // $('a').click(function(){
    //     event.preventDefault()

    //     const element = this

    //     if(element.href){
    //         $.ajax({
    //             url: window.location.origin + '/lgpd',
    //             method: 'POST',
    //             data: {
    //                 url_current: window.location.href,
    //                 url_next: element.href
    //             },
    //             complete: function(){
    //                 if(element.target == '_blank'){
    //                     window.open(element.href, '_blank')
    //                 }else{
    //                     window.location.href = element.href
    //                 }
    //             }
    //         })
    //     }
    // })

    // LGPD
    $('.lgpd-close').click(function(e){
        e.preventDefault()

        $('.lgpd-container').remove()
    })

    $('.lgpd-accept').click(function(e){
        e.preventDefault()

        $('.lgpd-container').remove()

        let date = new Date()

        // Cria o cookie
        window.document.cookie = 'cookieaccept=1; expires=' + (new Date(date.getFullYear() + 1, date.getMonth(), date.getDate())).toGMTString() + '; path=/';
    })

    // Adicionar ao carrinho
    $('.add-to-cart-btn-ajax[data-url]').click(function(e){
        e.preventDefault()

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
                getAllItemsCart();
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
    $('.add-favorite-btn-ajax[data-url]').click(function(e){
        e.preventDefault()

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
    $('form[data-container]').submit(function(e){
        e.preventDefault()

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

    // Formulário para finalizar um pedido
    $('#form-request').submit(function(){
        $(this).find('input[name=postal_code]').val($('#postal_code').val())
        $(this).find('input[name=freight]').val($('input[type=radio][name=freight]:checked').val())
        $(this).find('input[name=code]').val($('#code').val())
    })

    // Select de endereços
    $('#select-address').change(function(){
        let data = $(this).find(':selected').data() 
        
        if(data.addressid != undefined){
            $('#form-request').find('input[name=address_id]').val(data.addressid)
        }
    })

    function getAllItemsCart() {
        $.ajax({
            method: 'GET',
            url: '/carrinho/dropdown',
            success: function(respose){
                $('.dropdown').replaceWith(respose)
            },
            error: function(respose){
                createMessage('Ocorreu um erro ao tentar atualizar os itens do carrinho')
            },
        })
    }
})