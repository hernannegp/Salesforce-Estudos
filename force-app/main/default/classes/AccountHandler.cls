public class AccountHandler {
    public static Account insertNewAccount(String acctName) {
        try {
            Account acct = new Account(Name=acctName);
            insert acct;
            return acct;
        } catch(DmlException err) {
            System.debug('A DML exception has occurred: ' + err.getMessage());
            return null;
        }
    }
}