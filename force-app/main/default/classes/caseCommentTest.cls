public class caseCommentTest {
    
    public static void changePriority(List<CaseComment> caso) {
        
        string comment;
        id caseParent;
        
        for(CaseComment cs :caso) {
            comment = cs.CommentBody;
            caseParent = cs.ParentId;
        }
        
        List<Case> originCase = new List<Case>();
        originCase = [SELECT Id, CaseNumber, Description
                      FROM Case 
                      WHERE Id =:caseParent];
        
        originCase[0].Description = comment;
        
        update originCase;
    }

    public static void Test() {
        List<Contact> contatos = [SELECT FirstName, LastName, 
                                  Email //teste
                                  FROM Contact 
                                  WHERE FirstName = 'Rose' //teste
                                 ];
        system.debug(contatos);
    }
}