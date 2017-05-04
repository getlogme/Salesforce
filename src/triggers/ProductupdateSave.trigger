trigger ProductupdateSave on Opportunity (before insert,before update) {
Map<String,String> oppProdsMap=new Map<String,String>();
Map<String,List<OpportunityLineItem>> oppLineItemMap=new Map<String,List<OpportunityLineItem>>();
List<OpportunityLineItem> newOliList=new List<OpportunityLineItem>();
    for(Opportunity o: Trigger.new){
        oppProdsMap.put(o.Id,o.Products__c);
    }

    for(OpportunityLineItem op:[select id,OpportunityId,PricebookEntryId,PricebookEntry.Name,UnitPrice,testNameSpacema__Eligible_Lives__c from OpportunityLineItem where OpportunityId in:oppProdsMap.keyset()]){

        if(oppLineItemMap!=null && oppLineItemMap.get(op.OpportunityId)!=null){
            oppLineItemMap.get(op.OpportunityId).add(op);
        }else{
            List<OpportunityLineItem> oli=new List<OpportunityLineItem>();
            oli.add(op);
            oppLineItemMap.put(op.OpportunityId,oli);
        }
    }
    for(Opportunity o: Trigger.new){
      Set<String> selProdsSet=new Set<String>();
          if(o.products__c!=null){
              for(String selectedProduct:o.products__c.split(';')){
                  selProdsSet.add(selectedProduct);    
              }
          }
      
          for(OpportunityLineItem opLineItem:oppLineItemMap.get(o.Id)){
                System.debug('selProdsSet'+selProdsSet);
                System.debug('opLineItem.PricebookEntry.Name'+opLineItem.PricebookEntry.Name);
                System.debug('opLineItem.testNameSpacema__Eligible_Lives__c'+opLineItem.testNameSpacema__Eligible_Lives__c);
                System.debug('opLineItem.unitprice'+opLineItem.unitprice);
                if(selProdsSet!=null && selProdsSet.size()>0 && selProdsSet.contains(opLineItem.PricebookEntry.Name) && opLineItem.unitprice<=0.0 && (opLineItem.testNameSpacema__Eligible_Lives__c==null || opLineItem.testNameSpacema__Eligible_Lives__c<=0)){
                    System.debug('inside if');
                    o.addError('Unit Price and Eligible Lives are less than 0');
                }
          }
     
      
    }

}