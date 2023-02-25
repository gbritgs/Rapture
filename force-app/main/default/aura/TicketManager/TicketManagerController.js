({
    init: function (component, event, helper) {
        let aeroportoOrigem = 'a004W00000fDXmVQAW';
        let aeroportoDestino = 'a004W00000fDXmTQAW';
        let dataPartida = '2021-01-10';
        let dataRetorno = '2021-01-15';

        helper.loadVoos(component, aeroportoOrigem, aeroportoDestino, dataPartida, dataRetorno);
    }
})