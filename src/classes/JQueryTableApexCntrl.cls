global with sharing class  JQueryTableApexCntrl{
 @RemoteAction
 global static Account[] searchAccounts(String accountName) {
    // Search accounts for the account name passed from Javascript
    System.debug('before ==> '+accountName);
    accountName = accountName.replaceAll('[*]', '%');
    System.debug('after ==> '+accountName);
    return [select id, name, phone, type, numberofemployees from
             Account where name like :accountName ];
  }  
     
 @RemoteAction
 global static boolean updateAccount(String accountId, String phoneNum) {
   // update account for the accountId and phone-number passed from Javascript
   update new Account(Id = accountId, Phone = phoneNum);     
   return true;
 }
}