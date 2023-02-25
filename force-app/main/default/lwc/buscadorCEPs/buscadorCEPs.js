import { LightningElement } from 'lwc';
import handleCallout from "@salesforce/apex/ViaCepWebService.handleCallout";

export default class BuscadorCEPs extends LightningElement {
    cep;

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
                console.log('Resultado: ' + result);
            })
            .catch(error => {
                this.error = error;
                console.log('Erro: ' + this.error);
            })
    }
}