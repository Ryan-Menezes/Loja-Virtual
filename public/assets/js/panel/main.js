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

    // Configurações do menu
    if(localStorage.menuOpen !== undefined && localStorage.menuOpen == 'false'){
        $('.content').addClass('close-menu')
    }

    $('.open-menu').click(function(){
        if($('.content').hasClass('close-menu')){
            $('.content').removeClass('close-menu')
            localStorage.menuOpen = true
        }else{
            $('.content').addClass('close-menu')
            localStorage.menuOpen = false
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

    // Configurações do textarea
    $('.textarea-editor').trumbowyg({
        btns: [
            ['viewHTML'],
            ['undo', 'redo'],
            ['formatting'],
            ['strong', 'em', 'del'],
            ['superscript', 'subscript'],
            ['link'],
            ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
            ['unorderedList', 'orderedList'],
            ['horizontalRule'],
            ['removeformat']
        ],
        lang: 'pt-br'
    })
    $('*').delegate('.textarea-editor', 'load mousemove', function(){
        $(this).trumbowyg({
            btns: [
                ['viewHTML'],
                ['undo', 'redo'],
                ['formatting'],
                ['strong', 'em', 'del'],
                ['superscript', 'subscript'],
                ['link'],
                ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
                ['unorderedList', 'orderedList'],
                ['horizontalRule'],
                ['removeformat']
            ],
            lang: 'pt-br'
        })

        return false
    })

    // Configurações da imagem
    $('*').delegate('.image-upload', 'change', function(){
        let input = $(this)
        let file = input.prop('files')[0]
        let content = $(`label[for=${input.attr('id')}] img[data-default]`)
        let data = content.data()
        let reader = new FileReader()

        reader.onloadend = function(){
            content.attr('src', this.result)
        }

        if(file){
            reader.readAsDataURL(file)
        }else{
            content.attr('src', data.default)
        }

        return false
    })

    // Configurações do youtube player
    $('*').delegate('.youtube-url-video', 'change', function(){
        let input = $(this)
        let player = input.parents('.content-group').find('label iframe')
        let url = input.val()

        if(url.trim().length > 0){
            // let videoCode = url.split('/[\/=]/i')
            let videoCode = url.split('=')
            videoCode = videoCode[videoCode.length - 1]

            player.attr('src', `https://www.youtube.com/embed/${videoCode}`)
            player.show()
        }

        return false
    })

    // Configurações de remoção de um elemento
    $('*').delegate('.btn-remove-element', 'click', function(){
        if(confirm('Deseja realmente remover este elemento?')){
            let data = $(this).data()
            let input = $('input[type="hidden"][name="images-remove"]')

            $(this).parents('.content-group:first').remove()

            if(data.remove != undefined && data.remove.length > 0){
                if(input.val().length == 0){
                    input.val(data.remove)
                }else{
                    input.val(`${input.val()},${data.remove}`)
                }
            } 
        }

        return false
    })

    // Configurações de duplicação de um elemento
    $('*').delegate('.btn-duplicate-element', 'click', function(){
        let clone = $(this).parents('.content-group:first').clone()

        $(this).parents('.content-group:first').after(clone)

        return false
    })

    // Configurações para requisição ajax
    $('*').delegate('[data-urlajax]', 'click', function(){
        let data = $(this).data()

        $.ajax({
            method: 'POST',
            url: data.urlajax,
            data: data
        })
        .done(function(result){
            if(data.container !== undefined){
                $(data.container).append(result)
            }else{
                $('.content-elements').append(result)
            }
        })
        .fail(function(){
            alert('FALHA DE REQUISIÇÃO!')
        })

        return false
    })

    // Configurações para ordenar elementos
    $('.sortable').sortable({
        cancel: ".nosortable"
    })
    $('*').delegate('.sortable', 'load mousemove', function(){
        $(this).sortable({
            cancel: ".nosortable"
        })
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
})