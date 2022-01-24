$(document).ready(function(){
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

    // Modal Help
    $('.modal-form-multiple[data-container]').submit(function(){
        let container = $(this).data().container
        let data = new FormData(this)
        let values = []

        for(let value of data.values()){
            values.push(value)
        }

        $(container).text($(container).text() + values.join(';') + '\n')
        $('.modal').hide()
        $(this).trigger('reset')
    })

    // Products Related
    $('#search_product_related').keyup(function(){
        const search = $(this).val()
        const data = $(this).data()

        $.ajax({
            url: data.action,
            method: 'POST',
            data: {
                search: search
            },
            beforeSend: function(){
                $('.products_related_list').html('<div class="load"></div>')
            },
            success: function(response){
                $('.products_related_list').html(response)
            },
            error: function(response){
                console.log(response)
            }
        })
    })

    $('*').delegate('[data-productid]', 'click', function(){
        const data = $(this).data()

        $('.products_related_selected')
                .append(`<li class="list-group-item d-flex justify-content-between align-items-center">
                            <input type="hidden" name="products_related[]" value="${data.productid}" />
                            <p class="m-0 p-0">${data.title}</p>
                            <span class="badge btn btn-danger btn-sm rounded-pill" data-removeid="${data.productid}">&times;</span>
                         </li>`)

        return false
    })

    $('*').delegate('[data-removeid]', 'click', function(){
        const data = $(this).data()

        $(this).parent().remove()

        return false
    })
})