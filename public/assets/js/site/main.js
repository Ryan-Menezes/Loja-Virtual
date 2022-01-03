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
})