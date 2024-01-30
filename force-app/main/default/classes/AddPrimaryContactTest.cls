@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> acc1 = new List<Account>();
        List<Account> acc2 = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account a = new Account(Name='Test ' +i, BillingState='NY');
            Account ac = new Account(Name='Lopes ' +i, BillingState='CA');
            acc1.add(a);
            acc2.add(ac);
        }
        insert acc1;
        insert acc2;
        Contact con = new Contact(LastName='Teste');
        insert con;
    }
    static testmethod void testQueueable() {
        Contact c = [SELECT Name FROM Contact LIMIT 1][0];
        AddPrimaryContact AddPC = new AddPrimaryContact(c, 'NY');
        Test.startTest();
        System.enqueueJob(AddPC);
        Test.stopTest();
        System.assertEquals(1, [SELECT Name FROM Account WHERE BillingState='NY' LIMIT 1][0].Contacts.size());
    }
}