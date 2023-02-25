@isTest
private with sharing class LeadProcessorTest {
    @isTest
    private static void testBatchClass() {
        //Load test data
        List<Lead> leads = new List<Lead>();
        for(integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName='Teste', 
                Company='Salesforce'));
        }
        insert leads;

        //Perform test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        //Check results
        List<Lead> updated = [SELECT Id, Name FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updated.size(), 'ERROR');
    }
}