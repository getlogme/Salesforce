@istest
private class TestContactRoles{
static testMethod void myTest(){
Contact con=new Contact();
con.firstName='Test';
con.lastName='Test1';
insert con;
Apexpages.StandardController contr=new Apexpages.StandardController(con);
ContactRoles cr=new ContactRoles(contr);
cr.getContactRoles();
}
}