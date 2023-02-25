@isTest
public with sharing class DailyLeadProcessorTest {

    private static string CRON_EXP = '0 0 0 ? * * *'; //Midnight in CRON

    @isTest
    public static void testSchedulableClass() {
        //Load test data
        List<Lead> leads = new List<Lead>();

        for(integer i = 0; i < 200; i++) {
            if(i < 100) {
                leads.add(new Lead(
                    LastName = 'Connock',
                    Company = 'Salesforce'
                ));
            } else {
                leads.add(new Lead(
                    LastName = 'Connock',
                    Company = 'Salesforce',
                    LeadSource = 'Other'
                ));
            }
        }
        
        insert leads;

        //Perform test
        Test.startTest();
        string jobId = System.schedule('jobName', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
    }
}