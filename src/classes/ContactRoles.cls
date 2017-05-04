public class ContactRoles{
public Id conId{get;set;}
public ContactRoles(Apexpages.StandardController ctrl){
    Contact con=(Contact)ctrl.getRecord();
    conId=con.Id;
}
public List<AccountContactRole> getContactRoles(){
List<AccountContactRole> acRoles=[SELECT AccountId, ContactId, Id, CreatedById, CreatedDate, IsDeleted, LastModifiedById, LastModifiedDate, IsPrimary, Role, SystemModstamp FROM AccountContactRole where ContactId=:conId];
return acRoles; 
}
}