public class AccountProcessor {
    @future
    public static void countContacts(List<Id> listIds) {
        List<Account> acctToUpdate = [SELECT Name, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :listIds];
        for (Account acc : acctToUpdate) {
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }
        update acctToUpdate;
    }
}