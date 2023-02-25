/* eslint-disable no-undef */
/* eslint-disable no-unused-vars */
import { LightningElement, api, track, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import insertdata from '@salesforce/apex/cargaDadosExcelController.insertdata';
import getAccounts from '@salesforce/apex/cargaDadosExcelController.getAccounts';

const COLS = [
	{ label: 'Name', fieldName: 'Name' },
	{ label: 'Target Country', fieldName: 'TargetCountry__c' }
];

export default class CargaDadosExcel extends LightningElement {
	columns = COLS;

	get acceptedFormats() {
		return ['.csv'];
	}

	@wire(getAccounts)
	acc;

	handleUploadFinished(event) {
		const uploadedFiles = event.detail.files;
		insertdata({ idContentDocument: uploadedFiles[0].documentId })
			.then(result => {
				this.dispatchEvent(
					new ShowToastEvent({
						message: 'Contas adicionadas com sucesso',
						variant: 'success',
						mode: 'sticky'
					}),
				);
				return refreshApex(this.acc);
			})
			.catch(error => {
				// CODE
			});
	}

	exportToCSV() {
		let columnHeader = ["Name", "Target Country"];
		let jsonKeys = ["Name", "TargetCountry__c"];
		var jsonRecordsData = this.acc.data;
		let csvIterativeData;
		let csvSeperator;
		let newLineCharacter;
		csvSeperator = ";";
		newLineCharacter = "\n";
		csvIterativeData = "";
		csvIterativeData += columnHeader.join(csvSeperator);
		csvIterativeData += newLineCharacter;
		for (let i = 0; i < jsonRecordsData.length; i++) {
			let counter = 0;
			for (let iteratorObj in jsonKeys) {
				let dataKey = jsonKeys[iteratorObj];
				if (counter > 0) {
					csvIterativeData += csvSeperator;
				}
				if (jsonRecordsData[i][dataKey] !== null && jsonRecordsData[i][dataKey] !== undefined) {
					csvIterativeData += jsonRecordsData[i][dataKey];
				}
				counter++;
			}
			csvIterativeData += newLineCharacter;
		}

		let downloadElement = document.createElement('a');
		downloadElement.href = 'data:text/csv;charset=utf-8,%EF%BB%BF' + encodeURI(csvIterativeData);
		downloadElement.target = '_self';
		downloadElement.download = 'Report.csv';
		document.body.appendChild(downloadElement);
		downloadElement.click();
	}
}