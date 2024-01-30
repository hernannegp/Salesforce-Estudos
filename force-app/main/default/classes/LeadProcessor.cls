public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Name FROM Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> leadsToUpdate = new List<Lead>();
        for (Lead ld : records) {
            ld.LeadSource = 'Dreamforce';
            leadsToUpdate.add(ld);
        }
        update leadsToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Finish!!!');
    }
}