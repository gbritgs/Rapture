import { LightningElement } from 'lwc';
import handleCallout from "@salesforce/apex/ViaCepWebService.handleCallout";

export default class BuscadorCEPs extends LightningElement {
    cep;
    cidadeUF;
    erroCEP = false;
    obj = {};

    handleInput(event) {
		const x = event.target.value
			.replace(/\D+/g, '')
			.match(/(\d{0,5})(\d{0,3})/);
		event.target.value =
			`${x[1]}` + (x[2] ? `-${x[2]}` : ``);

        this.cep = event.target.value;

        if(this.cep.length == 9) {
            this.handleCallout();
        }
	}

    handleCallout() {
        handleCallout({ cep: this.cep })
            .then(result => {
                if(result.erro == 'true') {
                    this.erroCEP = true;
                } else {
                    this.handleFields(result);
                }
            })
            .catch(error => {
                console.log('Erro: ' + error);
            })
    }

    clearFields() {
        this.template.querySelectorAll('lightning-input').forEach(element => {
            element.value = null;
        });

        // you can also reset one by one by id
        // this.template.querySelector('lightning-input[data-id="form"]').value = null; 
    }

    handleFields(result) {
        this.erroCEP = false;
        this.obj = result;
        this.cidadeUF = result.localidade + '/' + result.uf;
    }
}