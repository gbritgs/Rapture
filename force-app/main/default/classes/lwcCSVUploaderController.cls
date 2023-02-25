public class lwcCSVUploaderController {
    
    @AuraEnabled
    public static list<Contact> readCSVFile(Id idContentDocument){
        list<Contact> lstAccsToInsert = new list<Contact>();
        system.debug('1: ');
        if(idContentDocument != null) {
            system.debug('2: ');
            // getting File Data based on document id 
            ContentVersion objVersion = [SELECT Id, VersionData FROM ContentVersion WHERE ContentDocumentId =:idContentDocument];
            // split the file data
            list<String> lstCSVLines = objVersion.VersionData.toString().split('\n');
            system.debug('3: ');
            for(Integer i = 1; i < lstCSVLines.size(); i++){
                Contact objAcc = new Contact();
                list<String> csvRowData = lstCSVLines[i].split(',');
                System.debug('csvRowData====> '+csvRowData);
                objAcc.LastName = csvRowData[0]; // accName
                lstAccsToInsert.add(objAcc);
            }

            try{    
                if(!lstAccsToInsert.isEmpty()) {
                    insert lstAccsToInsert;
                }
            }
            catch (Exception ex) {
                throw new AuraHandledException(ex.getMessage());
            } 
        }
        return lstAccsToInsert;    
    }
}