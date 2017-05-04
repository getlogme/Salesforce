global class UpdOppProdMulPicklistFrmOli implements Database.Batchable<sObject>{

   global final String Query;
   

   global UpdOppProdMulPicklistFrmOli(String q) {

      Query=q;
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Opportunity> scope){
     Map<String,Opportunity> opMap=new Map<String,Opportunity>();
     Map<String,String> opOliMap=new Map<String,String>();
     for(Opportunity op : scope){
         opMap.put(op.Id,op); 
     }
     for(OpportunityLineItem oli:[select opportunityId,pricebookentry.name from OpportunityLineItem where opportunityId in:opMap.keyset()]){
         if( opOliMap!=null &&  opOliMap.get(oli.opportunityId)!=null){
          opOliMap.put(oli.opportunityId,opOliMap.get(oli.opportunityId)+';'+oli.pricebookentry.name);   
         }else{
             opOliMap.put(oli.opportunityId,oli.pricebookentry.name);
         }
     }
     for(Opportunity op : scope){
         if( opOliMap!=null &&  opOliMap.get(op.Id)!=null){
             op.put('Products__c',opOliMap.get(op.Id));
         } 
     }
     update scope;
    }

   global void finish(Database.BatchableContext BC){
   }
}