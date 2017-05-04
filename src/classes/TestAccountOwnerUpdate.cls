@isTest
private class TestAccountOwnerUpdate  {
    public static testMethod void testUnitTest() {
        
        Date myDate = Date.today();
        List<RecordType> recType =[select id from RecordType where name in ('Developer','Developer/Dealer') and sObjecttype = 'Account' limit 1];
        //RecordType recType = [select r.Id From RecordType r where Name in  ('Developer','Developer/Dealer') and SObjectType = 'Account'];        
        Account accRecord = new Account(Name = 'Test Account',  Status__c = 'Active');
        insert accRecord;
        testNameSpacema__Liason_Type__c ltDealer=new testNameSpacema__Liason_Type__c(Name='Primary Liason',testNameSpacema__Liason_For__c='Dealer');
        testNameSpacema__Liason_Type__c ltDev=new testNameSpacema__Liason_Type__c(Name='Primary Liason',testNameSpacema__Liason_For__c='Developer');       
        insert ltDealer;
        insert ltDev;
        testNameSpacema__MPS_User__c mpsu1=new testNameSpacema__MPS_User__c(testNameSpacema__FName__c='test1',testNameSpacema__LName__c ='Testln1',testNameSpacema__UserID__c='5677');
        testNameSpacema__MPS_User__c mpsu2=new testNameSpacema__MPS_User__c(testNameSpacema__FName__c='test2',testNameSpacema__LName__c ='Testln2',testNameSpacema__UserID__c='5679');
        insert mpsu1;
        insert mpsu2;
        List<testNameSpacema__Liaison__c> lstliasons=new List<testNameSpacema__Liaison__c>();
        testNameSpacema__Liaison__c l1=new testNameSpacema__Liaison__c(testNameSpacema__Account__c=accRecord.Id,testNameSpacema__LiasonID__c=ltDealer.Id,testNameSpacema__UserID__c=mpsu1.Id);
        testNameSpacema__Liaison__c l2=new testNameSpacema__Liaison__c(testNameSpacema__Account__c=accRecord.Id,testNameSpacema__LiasonID__c=ltDev.Id,testNameSpacema__UserID__c=mpsu2.Id);
        lstliasons.add(l1);
        lstliasons.add(l2);
        insert lstliasons;
        
        AccountOwnerUpdate batchAccounts = new AccountOwnerUpdate();
        Id batchInstanceId = Database.executeBatch(batchAccounts);
          
        
    }
    
   static testmethod void testScheduleAccountOwnerUpdateBatch() {
   
        List<RecordType> recType =[select id from RecordType where name in ('Developer','Developer/Dealer') and sObjecttype = 'Account' limit 1];
        Date myDate = Date.today();
      Account accRecord = new Account(Name = 'Test Account', Status__c = 'Active');
      insert accRecord ;

   // Schedule the test job  
    
      String sch = '0 0 0 3 9 ? 2022';
      System.debug('sch = ' + sch);
      String jobId = System.schedule('testScheduledDeveloper',sch,
         new ScheduleAccountOwnerUpdateBatch());
   // Get the information from the CronTrigger API object  
    

      CronTrigger ct = [SELECT id, CronExpression, TimesTriggered, 
         NextFireTime
         FROM CronTrigger WHERE id = :jobId];

   // Verify the expressions are the same  
    
      

   // Verify the job has not run  
    
      System.assertEquals(0, ct.TimesTriggered);

   // Verify the next time the job will run  
    
      System.assertEquals('2022-09-03 00:00:00', 
         String.valueOf(ct.NextFireTime));

  

   
}
}