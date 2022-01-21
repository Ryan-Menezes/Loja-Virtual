function setSessionId(session_id){
    PagSeguroDirectPayment.setSessionId(session_id)
}

function getPaymentMethods(amount, success, error, complete){
    PagSeguroDirectPayment.getPaymentMethods({
        amount: amount,
        success: success,
        error: error,
        complete: complete
    })
}

function getSenderHash(callback){
    PagSeguroDirectPayment.onSenderHashReady(callback)
}

function getBrand(cardBin, success, error, complete){
    if(cardBin.length >= 6){
        PagSeguroDirectPayment.getBrand({
            cardBin: cardBin,
            success: success,
            error: error,
            complete: complete
        })
    }
}

function getInstallments(amount, maxInstallmentNoInterest, brand, success, error, complete){
    PagSeguroDirectPayment.getInstallments({
        amount: amount,
        maxInstallmentNoInterest: maxInstallmentNoInterest,
        brand: brand,
        success: success,
        error: error,
        complete: complete
    })
}

function getCardToken(cardNumber, brand, cvv, expirationMonth, expirationYear, success, error, complete){
    PagSeguroDirectPayment.createCardToken({
        cardNumber: cardNumber,
        brand: brand,
        cvv: cvv,
        expirationMonth: expirationMonth,
        expirationYear: expirationYear,
        success: success,
        error: error,
        complete: complete
    });
}