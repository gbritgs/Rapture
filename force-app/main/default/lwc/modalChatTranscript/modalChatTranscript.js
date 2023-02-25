import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = ['LiveChatTranscript.Status'];

export default class ModalChatTranscript extends LightningElement {
    @api recordId;
    account;
    lastModifiedDate;
    isModalOpen = false;
    testeDisabled = false;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord({ error, data }) {
        if (error) {
            console.log('error: ' + this.recordId);
        } else if (data) {
            this.account = data;
            let modifiedDate = this.account.lastModifiedDate;
            let status = this.account.fields.Status.value;
            if (!this.lastModifiedDate) {
                this.lastModifiedDate = this.account.lastModifiedDate;
            }
            if (modifiedDate != this.lastModifiedDate && status == 'Completed') {
                this.isModalOpen = true;
            }
        }
    }

    bbb() {
        this.testeDisabled = true;
    }

    closeModal() {
        this.isModalOpen = false;
    }
}