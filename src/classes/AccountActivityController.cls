public with sharing class AccountActivityController {
    
    Account selectedAccount{get;set;}
    public AccountActivityController (ApexPages.StandardController stdController){
        selectedAccount = (Account) stdController.getRecord();
        System.debug('selectedAccount = '+selectedAccount.Id);
    }
    
    public List<Task> getCurrentActivityHistory(){
        List<Task> historyActivityList = [Select t.testNameSpacema__TempDate__c,t.Description,t.Subject,t.ActivityDate,t.testNameSpacema__LogDateTime__c ,t.Status From Task t 
                                          where t.Status = 'Completed' and  t.AccountId = :selectedAccount.Id];
        
        for(Task tt:historyActivityList){
           DateTime dt=tt.ActivityDate;
           if(dt!=null){
               tt.testNameSpacema__TempDate__c=dt.format('MMM dd yyyy hh:mm:ss'); 
               }
        }
        
        return historyActivityList;
    }

}