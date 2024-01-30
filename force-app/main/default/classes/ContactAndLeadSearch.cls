public class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(String name) {
        Contact setup1 = new Contact(LastName='Smith');
        insert setup1;
        Lead setup2 = new Lead(LastName='Smith', Company='Ficticia', Status='New');
        insert setup2;
        
        List<List< sObject>> contactsAndLeads = [FIND :name IN NAME FIELDS RETURNING Contact(LastName), Lead(LastName)];
        return contactsAndLeads;
    }
}