public with sharing class cargaDadosExcelController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, TargetCountry__c FROM Account WHERE CreatedDate > =:Date.TODAY()];
    }

    @AuraEnabled
	public static void insertdata(Id idContentDocument){
		if(idContentDocument != null) {
            ContentVersion objVersion = [SELECT Id, VersionData FROM ContentVersion WHERE ContentDocumentId =:idContentDocument];
            list<String> lstCSVLines = objVersion.VersionData.toString().split('\n');
            list<String> csvRowData = new list<String>();
				
			List<Account> lstAdd = new List<Account>();
				
			for(Integer i = 1; i < lstCSVLines.size(); i++){
				Account acc = new Account() ;
				string[] csvRecordData = lstCSVLines[i].split(';');
				acc.Name = csvRecordData[0] ;             
				acc.TargetCountry__c = csvRecordData[1];
																							   
				lstAdd.add(acc);   
			}
				
			if(!lstAdd.isEmpty()) {
				insert lstAdd;
			}
	    }
   }
}