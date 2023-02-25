public with sharing class AccountPDFController {
    ID accountID;

    public AccountPDFController() {
        this.accountID = ApexPages.currentPage().getParameters().get('Id');
    }

    public Account getCurrentAccount() {
        return [SELECT Name, Website, Phone FROM Account WHERE ID =: this.accountID];
    }

    public List<String> getContactsInformation() {
        List<String> contactsInformation = new List<String>();
        String infoTemplate = 'Name: {0} {1} | Email: {2}';
        for(Contact con : [SELECT FirstName, LastName, Email FROM Contact WHERE AccountID =: this.accountID]) {
            contactsInformation.add(String.format(infoTemplate, new List<Object>{con.FirstName, con.LastName, con.Email}));
        }
        return contactsInformation;
    }
}