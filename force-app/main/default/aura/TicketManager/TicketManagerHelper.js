({
    loadVoos: function (component, aeroportoOrigem, aeroportoDestino, dataPartida, dataRetorno) {
        let action = component.get('c.getVoos');

        action.setParam('aeroportoOrigem', aeroportoOrigem);
        action.setParam('aeroportoDestino', aeroportoDestino);
        action.setParam('dataPartida', dataPartida);
        action.setParam('dataRetorno', dataRetorno);

        action.setCallback(this, function (result) {
            let state = result.getState();

            if (state == 'SUCCESS') {
                component.set('v.voos', result.getReturnValue());
            } else if (state == 'ERROR') {
                window.console.error(result.getError());
            }
        });

        $A.enqueueAction(action);
    }
})