import { LightningElement, track } from 'lwc';

export default class AccountCreator extends LightningElement {

	@track selectedRecordId;

	handleValueSelected(event) {
		this.selectedRecordId = event.detail;
	}

	cpf;
	telefone;

	handleMaskCPF(event) {
		const x = event.target.value
			.replace(/\D+/g, '')
			.match(/(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})/);
		event.target.value =
			`${x[1]}` + (x[2] ? `.${x[2]}` : ``) + (x[3] ? `.${x[3]}` : ``) + (x[4] ? `-${x[4]}` : ``);
	}

	handleMaskTelefone(event) {
		const x = event.target.value
			.replace(/\D+/g, '')
			.match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
		event.target.value =
			!x[2] ? x[1] : `(${x[1]}) ${x[2]}` + (x[3] ? `-${x[3]}` : ``);
	}
}