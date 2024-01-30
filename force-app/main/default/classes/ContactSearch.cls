public class ContactSearch {
    public static Contact[] searchForContact(String lastN, String postalCode) {
        Contact[] listOfContacts = [SELECT Name FROM Contact WHERE LastName=:lastN AND MailingPostalCode=:postalCode];
        return listOfContacts;
    }
}