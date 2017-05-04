public with sharing class twinBoxMultiSelectList_Ctlr {
// Selectoptions for picklist
public List<SelectOption> contactOptions {get;set;}
// User selection from UI
public List<Id> selectedContactIds {get;set;}
 
// Used to show select contacts
public transient List<Contact> selectedContacts {get;set;}
public twinBoxMultiSelectList_Ctlr() {
contactOptions = new List<SelectOption>();
Contact[] contacts = [Select Id, Name from Contact];
for (Contact c : contacts) {
contactOptions.add(new SelectOption(c.Id, c.Name));
}
}
 
public void onContactSelection() {
if (selectedContactIds != null && !selectedContactIds.isEmpty()) {
selectedContacts = [Select Id, Name from Contact where Id IN :selectedContactIds];
}
}
}