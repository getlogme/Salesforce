@isTest
private class AccountOwnerUpdateTest{
static testmethod void mytest(){
Account acc=new Account();
acc.name='Test Acc';
insert acc;
testNameSpacema__Liason_Type__c lt=new testNameSpacema__Liason_Type__c();
lt.name=Constants.PRIMARYLIAISON;
lt.testNameSpacema__Liason_For__c=Constants.DEVELOPER;
lt.testNameSpacema__LiasonID__c='002';
insert lt;
testNameSpacema__Liason_Type__c lt1=new testNameSpacema__Liason_Type__c();
lt1.name=Constants.PRIMARYLIAISON;
lt1.testNameSpacema__Liason_For__c=Constants.DEALER;
lt1.testNameSpacema__LiasonID__c='003';
insert lt1;
testNameSpacema__MPS_User__c mpsUser=new testNameSpacema__MPS_User__c();
mpsUser.testNameSpacema__LName__c='Test last name';
mpsUser.testNameSpacema__UserID__c='234';
insert mpsUser;

testNameSpacema__MPS_User__c mpsUser1=new testNameSpacema__MPS_User__c();
mpsUser1.testNameSpacema__LName__c='Test last name';
mpsUser1.testNameSpacema__UserID__c='235';
insert mpsUser1;

List<testNameSpacema__Liaison__c> lstList=new List<testNameSpacema__Liaison__c>();
testNameSpacema__Liaison__c li=new testNameSpacema__Liaison__c();
li.Account__c=acc.Id;
li.testNameSpacema__LiasonID__c=lt.Id;
li.testNameSpacema__UserID__c=mpsUser.Id;
lstList.add(li);
testNameSpacema__Liaison__c li1=new testNameSpacema__Liaison__c();
li1.Account__c=acc.Id;
li1.testNameSpacema__LiasonID__c=lt1.Id;
li1.testNameSpacema__UserID__c=mpsUser1.Id;
lstList.add(li1);
insert lstList;
}
}