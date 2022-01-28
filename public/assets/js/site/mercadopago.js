let mp

function setPublicKey(public_key){
    mp = new MercadoPago(public_key, {
        locale: 'pt-BR'
    })
}

async function getIdentificationTypes(){
    return await mp.getIdentificationTypes()
}

async function getPaymentMethods(cardNumber){
    if(cardNumber.length >= 6){
        return await mp.getPaymentMethods({
            bin: cardNumber
        })
    }
}

async function getIssuers(paymentMethodId, cardNumber){
    if(cardNumber.length >= 6){
        await mp.getIssuers({
            paymentMethodId: paymentMethodId, 
            bin: cardNumber
        })
    }
}

async function getInstallments(amount, cardNumber){
    if(cardNumber.length >= 6){
        return await mp.getInstallments({
            amount: String(amount),
            locale: 'pt-BR',
            bin: cardNumber,
            processingMode: 'aggregator'
        })
    }
}

async function getCardToken(cardNumber, name, cvv, expirationMonth, expirationYear, documentType, document){
    if(cardNumber.length == 16){
        return await mp.createCardToken({
            cardNumber: cardNumber,
            cardholderName: name,
            cardExpirationMonth: expirationMonth,
            cardExpirationYear: '20' + expirationYear,
            securityCode: cvv,
            identificationType: documentType,
            identificationNumber: document,
        })
    }

}