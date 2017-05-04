trigger OppoProdDel on OpportunityLineItem (after delete) {
 Map<String,Set<String>> oliOptMap=new Map<String,Set<String>>();
 for(opportunityLineItem oli:Trigger.Old){
  if(oliOptMap!=null && oliOptMap.get(oli.opportunityId)!=null){
   oliOptMap.get(oli.OpportunityId).add(oli.PricebookEntry.Name);
  }
  else{
  oliOptMap.put(oli.opportunityId,new set<String>{oli.PricebookEntry.Name});
  }
 }
 
 List<Opportunity> oppList= new List<Opportunity>();
 for(Opportunity op:[select Id,products__c from Opportunity where Id in:oliOptMap.keyset()]){
     if(op.Products__c!=null && op.Products__c!=''){
         String prodStr='';
         System.debug('op.products : '+op.products__c);
         System.debug('oliOptMap : '+oliOptMap);
         for(String prd:op.Products__c.split(';')){
             System.debug('oliOptMap.get(op.Id) : '+oliOptMap.get(op.Id));
             if(oliOptMap!=null && !oliOptMap.get(op.Id).contains(prd)){
                 if(prodStr==''){
                     prodStr =prd;   
                 }else{
                     prodStr =prodStr+';'+ prd;   
                 }
             }    
         }
         Opportunity updOpp=new Opportunity(Id=op.Id);
         op.Products__c=prodStr;
         oppList.add(op);
     }
     
 }
 System.debug('oppList :'+oppList);
 update oppList;
}