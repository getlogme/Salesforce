public class TimeSheetCont{
 private final testNameSpacema__Time_Sheet__c listObj;
 public testNameSpacema__Time_Sheet__c listObj1{get;set;}
 public String listId{get;set;}
 public String picklist{get;set;}
public TimeSheetCont(ApexPages.StandardController ctlr){
  listObj=(testNameSpacema__Time_Sheet__c)ctlr.getRecord();
  listId=listObj.id;
  listObj1=[SELECT id, testNameSpacema__picklist__c from testNameSpacema__Time_Sheet__c WHERE id =: listId];
  picklist=listObj1.testNameSpacema__picklist__c;

  system.debug('=====listId===='+listId);
  system.debug('=====picklist===='+picklist);
}
public PageReference navPage(){
PageReference pageRef=null;
if(picklist!=null && picklist!='' && picklist.equalsIgnoreCase('A')){
     Apexpages.currentPage().getParameters().put('id',listId);
     pageRef= new PageReference('/apex/AView?id='+listId);
}else if(picklist!=null && picklist!='' && picklist.equalsIgnoreCase('B')){
    pageRef= new PageReference('/apex/BView?id='+listId);
    
}else if(picklist!=null && picklist!='' && picklist.equalsIgnoreCase('C')){
    pageRef= new PageReference('/apex/CView');
    
}
pageRef.setredirect(false);
return pageRef;
}

public PageReference conti(){
PageReference pageRef=null;
if(picklist!=null && picklist!='' && picklist.equalsIgnoreCase('A')){
     pageRef= new PageReference('/apex/TimeSheetA');
}else if(picklist!=null && picklist!='' && picklist.equalsIgnoreCase('B')){
    pageRef= new PageReference('/apex/TimeSheetB');
    
}else if(picklist!=null && picklist!='' && picklist.equalsIgnoreCase('C')){
    pageRef= new PageReference('/apex/TimeSheetC');
    
}
pageRef.setredirect(false);
return pageRef;
}


}