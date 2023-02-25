public with sharing class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext ctx) {
        //System.debug('Context ' + ctx.getTriggerId()); //Returns the ID of the CronTrigger scheduled

        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];

        for(Lead l : leads) {
            l.LeadSource = 'Dreamforce';
        }

        update leads;
    }
}