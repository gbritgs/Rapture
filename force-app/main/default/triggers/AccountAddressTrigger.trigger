trigger AccountAddressTrigger on Account (before insert, before update) {

	List<Account> lst = new List<Account>();

	for(Account a : Trigger.new) {
		if(a.Match_Billing_Address__c == true) {
			a.ShippingPostalCode = a.BillingPostalCode;
			//lst.add(a);
		}
	}

	//update lst;
}