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
    $('*').delegate('.form-validate', 'focus load', function(){
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
    $('*').delegate('.textarea-editor-btn[data-type]', 'click', function(){
        let data = $(this).data()
        let element = $(this).parent().siblings('textarea')
        let types = {
            bold:           '<strong>Texto Aqui</strong>',
            italic:         '<em>Texto Aqui</em>',
            underline:      '<u>Texto Aqui</u>',
            link:           '<a href="Link de Redirecionamento" target="_blank" title="Titulo do Link" rel="nofollow">Texto Aqui</a>',
            blockquote:     '<blockquote>Texto Aqui</blockquote>',
        }

        if(types[data.type] !== undefined){
            element.val(element.val() + types[data.type])
        }

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
            let input = $('input[type="hidden"][name="images-notice-remove"]')

            $(this).parents('.content-group').remove()

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

    // Configurações para requisição ajax
    $('*').delegate('[data-urlajax]', 'click', function(){
        let data = $(this).data()

        $.ajax({
            method: 'POST',
            url: data.urlajax,
            data: data
        })
        .done(function(result){
            $('.content-notice').append(result)
        })
        .fail(function(){
            alert('FALHA DE REQUISIÇÃO!')
        })

        return false
    })

    // Configurações para ordenar elementos do conteúdo de uma notícia
    $('.content-notice').sortable()

    // Configuração para o container de checkbox
    // $('.container-check div').buttonset()
})