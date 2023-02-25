public with sharing class AccountHandler {

    integer nbAccounts = 1;

    public static void insertAccount(integer nbAccounts) {
        List<Account> addAccounts = new List<Account>();

        while(nbAccounts <= 3) {
            Account location = new Account();
            location.name = 'Acme Inc ' + nbAccounts;
            location.AccountNumber = 'A000' + nbAccounts;
            addAccounts.add(location);
            nbAccounts ++;
        }

        insert addAccounts;
    }
}