@isTest
public class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> leadsToInsert = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead newLead = new Lead(LastName='teste ' + i, Company='Ficticia');
            leadsToInsert.add(newLead);
        }
        insert leadsToInsert;
    }
    @isTest 
    static void test() {
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Database.executeBatch(LP);
        Test.stopTest();
        List<Lead> updatedLeads = [SELECT Name, LeadSource FROM Lead];
        System.assertEquals('Dreamforce', updatedLeads[0].LeadSource);
        System.assertEquals(200, updatedLeads.size());
    }
}