$(document).ready(function(){
    // Modal Load
    hideLoad()

    // Carregamento sem refresh
    /*
    $('a[href^="#"]').attr('data-linkdisable', true)

    $('a:not([data-linkdisable])').click(function(e){
        e.preventDefault()

        let url = this.href

        if(this.target == '_blank'){
            window.open(url, this.target)
            return
        }

        if(window.location.href != url && url){
            console.clear()

            try{
                window.history.pushState({
                    url: url
                }, url, url)

                setHtml(url)
            }catch(error){
                window.location.href = url
            }
        }
    })

    $(window).on('popstate', function(){
        setHtml(window.history.state.url)
        
        return true
    })
    */

    $('.btn-delete').click(function(){
        let route = $(this).data('route')
        
        if(route != undefined){
            $('.modal-form-delete').attr('action', route)
        }
    })

    // Tooltip
    // $('[title]').tooltip({
    //     delay: {
    //         show: 100, 
    //         hide: 0
    //     }
    // })

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
    $('.sortable').sortable({
        cancel: '.nosortable'
    })
    $('*').delegate('.sortable', 'load mousemove', function(){
        $(this).sortable({
            cancel: '.nosortable'
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

    // Busca de endereço por CEP
    $('.postal-code-search').change(function(){
        const postal_code = $(this).val().replace(/\D/ig, '')

        if(postal_code.length == 8){
            $.ajax({
                url: `https://viacep.com.br/ws/${postal_code}/json/`,
                method: 'GET',
                dataType: 'json',
                success: function(response){
                    if(!response.error){
                        $('input[name=street]').val(response.logradouro)
                        $('input[name=district]').val(response.bairro)
                        $('input[name=city]').val(response.localidade)
                        $('input[name=state]').val(response.uf)
                        $('input[name=complement]').val(response.complemento)

                        $('select[name=state]').find(`option[value=${response.uf}]`).attr('selected', true)
                    }
                }
            })
        }
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
        $(this).mask('999999999999999#')
        return false
    })

    $('.cvv-mask').mask('999')
    $('*').delegate('.cvv-mask', 'focus load', function(){
        $(this).mask('999#######')
        return false
    })

    $('.float-mask').mask('###.##0,00', {reverse: true})
    $('*').delegate('.float-mask', 'focus load', function(){
        $(this).mask('###.##0,00', {reverse: true})
        return false
    })
})

// Criar Gráfico
function createChart(type, title, container, name, data, color, categories){
    let options = {
        series: [{
            name: name,
            data: data
        }],
        title: {
            text: title,
            align: 'left'
        },
        chart: {
            height: 400,
            type: type
        },
        colors: [color],
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'smooth'
        },
        xaxis: {
            type: 'string',
            categories: categories
        }
    }

    let chart = new ApexCharts(window.document.querySelector(container), options);
    chart.render();
}

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

function setHtml(url){
    $.ajax({
        method: 'GET',
        url: url,
        beforeSend: function(){
            showLoad()
        },
        success: function(response){
            let parser = new DOMParser();
            let html = parser.parseFromString(response, 'text/html');

            $('head').html($(html).find('head').html())
            $('body').html($(html).find('body').html())
        },
        complete: function(){
            hideLoad()
        }
    })
}

window.showLoad = showLoad;
window.hideLoad = hideLoad;
window.setHtml = setHtml;
window.createChart = createChart;
window.createMessage = createMessage;