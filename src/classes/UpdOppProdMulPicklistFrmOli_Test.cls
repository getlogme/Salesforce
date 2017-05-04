@isTest

Private class UpdOppProdMulPicklistFrmOli_Test{
  static testMethod void Testclass(){  
       
    
    
// Schedule the job
    UpdOppProdMulPicklistFrmOli    obj1 = new UpdOppProdMulPicklistFrmOli('select Id,Products__c from opportunity limit 100');
     
   //  obj1.query='SELECT Id, otc_contact_id__c, Default_Deliver_To_OTC_Contact_Id__c, Parent_OTC_Contact_Id__c, Needs_Parent_OTC_Contact_Update__C FROM OTC_Contact__c WHERE Needs_Parent_OTC_Contact_Update__C=\' ' + TRUE + '\'  LIMIT=200';
    ID batchprocessid = Database.executeBatch(obj1);
   // OrderTransactionUpdate obj = new OrderTransactionUpdate();
  //  database.executebatch(obj);
  SchUpdOppProdMulPicklistFrmOli   p = new SchUpdOppProdMulPicklistFrmOli();        
   String sch = '0 0 8 13 2 ?';        
  system.schedule('Schedule Test', sch, p);
  
 
   }

 }