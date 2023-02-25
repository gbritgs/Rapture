trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

	List<Task> lst = new List<Task>();

	for(Opportunity o : Trigger.new) {
		if(o.StageName == 'Closed Won') {
			lst.add(new Task(
				Subject = 'Follow Up Test Task', 
				WhatId = o.Id));
		}
	}

	if(lst.size() > 0) {        
        insert lst;        
    }   
}