public class AddPrimaryContact implements Queueable {
    private Contact c;
    private String stateSearch;
    public AddPrimaryContact(Contact ctt, String state) {
        this.c = ctt;
        this.stateSearch = state; 
    }
    public void execute(QueueableContext context) {
        List<Account> acc = [SELECT Name FROM Account WHERE BillingState=:stateSearch LIMIT 200];
        List<Contact> listC = new List<Contact>();
        for (Account a : acc) {
            Contact con = c.clone(false, false, false, false);
            con.AccountId = a.id;
            listC.add(con);
        }
        insert listC;
    }
}