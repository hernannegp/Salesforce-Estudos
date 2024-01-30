@isTest
private class AccountProcessorTest {
    @isTest
    public static void TestNumberOfContacts() {
        Account acc = new Account(Name='teste');
        insert acc;
        List<Contact> ctts = new List<Contact>();
        for (Integer i = 0; i < 2; i++) {
            Contact ctt = new Contact(LastName='teste ' + i, AccountId=acc.Id);
            ctts.add(ctt);
        }
        insert ctts;
        List<Id> listId = new List<Id>();
        listId.add(acc.Id);
        Test.startTest();
            AccountProcessor.countContacts(listId);
        Test.stopTest();
        List<Account> listAcc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id =:acc.Id];
        System.assertEquals(2, listAcc[0].Number_of_Contacts__c);
    }
}