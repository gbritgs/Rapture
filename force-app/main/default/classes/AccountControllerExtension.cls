public with sharing class AccountControllerExtension {

    public List<Contact> listContact {get; set;}
    List<Contact> listContactToDelete {get; set;}
    public Account account {get; set;}

    public AccountControllerExtension(Apexpages.StandardController standardController) {
        this.listContact = new List<Contact>();
        this.listContactToDelete = new List<Contact>();
        this.account = standardController.getRecord() == null ? new Account() : (Account) standardController.getRecord();

        if(this.account != null) {
            this.listContact = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId =: this.account.Id];
        }
    }

    public PageReference addContact() {
        this.listContact.add(new Contact());

        return null;
    }

    public PageReference deleteContact() {
        string index = Apexpages.currentPage().getParameters().get('index');
        Contact con = this.listContact.remove(integer.valueOf(index));

        if(con.Id != null) {
            listContactToDelete.add(con);
        }
        return null;
    }

    public PageReference saveAccount() {
        upsert account;

        for(Contact contact : this.listContact) {
            contact.AccountId = account.Id;
        }

        upsert this.listContact;

        if(!listContactToDelete.isEmpty()) {
            delete this.listContactToDelete;
        }

        ApexPages.StandardController controller = new ApexPages.StandardController(account);

        return controller.view();
    }
}