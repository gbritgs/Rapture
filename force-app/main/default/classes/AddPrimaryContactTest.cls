@isTest
public with sharing class AddPrimaryContactTest {
    @isTest
    public static void testQueueableClass() {
        //Load data
        List<Account> accounts = new List<Account>();

        for(integer i = 0; i < 100; i++) {
            Account acc = new Account(Name = 'Teste');
            if(i < 50) {
                acc.BillingState = 'NY';
            } else {
                acc.BillingState = 'CA';
            }
            accounts.add(acc);
        }

        insert accounts;

        Contact contact = new Contact(FirstName = 'Teste', LastName = 'Teste');
        insert contact;

        //Perform test
        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        //Check results
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(50, contacts.size(), 'ERROR');
    }
}