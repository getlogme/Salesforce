public class TimeSheetContView{
    public PageReference edit() {
        system.debug('-----pickValVE----'+pickValVE);
        system.debug('-----recId----'+recId);
        listObj1=[select id,testNameSpacema__picklist__c,testNameSpacema__B1__c,testNameSpacema__B2__c,testNameSpacema__B3__c,testNameSpacema__B4__c,testNameSpacema__A1__c,testNameSpacema__A2__c,testNameSpacema__A3__c,testNameSpacema__A4__c from testNameSpacema__Time_Sheet__c where id=:recId];


        PageReference pageRef=null;
if(pickValVE!=null && pickValVE!='' && pickValVE.equalsIgnoreCase('A')){
     pageRef= new PageReference('/apex/AEdit');
}else if(pickValVE!=null && pickValVE!='' && pickValVE.equalsIgnoreCase('B')){
    pageRef= new PageReference('/apex/BEdit');
    
}else if(pickValVE!=null && pickValVE!='' && pickValVE.equalsIgnoreCase('C')){
    pageRef= new PageReference('/apex/CEdit');
    
}
pageRef.setredirect(false);
return pageRef;
}

 private final testNameSpacema__Time_Sheet__c listObj;
 public testNameSpacema__Time_Sheet__c listObj1{get;set;}
 public String listId{get;set;}
 public String picklist{get;set;}
 public List <SelectOption> PickInfo{get;set;}
 public String pickValVE{get;set;} 
 public String recId{get;set;}
public TimeSheetContView(){
system.debug('-----Madhu-View ---'+Apexpages.currentPage().getparameters().get('id'));
listId=Apexpages.currentPage().getparameters().get('id');
listObj1=[select id,testNameSpacema__picklist__c,testNameSpacema__B1__c,testNameSpacema__B2__c,testNameSpacema__B3__c,testNameSpacema__B4__c,testNameSpacema__A1__c,testNameSpacema__A2__c,testNameSpacema__A3__c,testNameSpacema__A4__c from testNameSpacema__Time_Sheet__c where id=:listId];


}

public PageReference conti(){
system.debug('-----Madhu----'+listId);
PageReference pageRef=null;
if(listId!=null && listId!='' && listId.equalsIgnoreCase('A')){
     pageRef= new PageReference('/apex/TimeSheetA');
}else if(listId!=null && listId!='' && listId.equalsIgnoreCase('B')){
    pageRef= new PageReference('/apex/TimeSheetB');
    
}else if(listId!=null && listId!='' && listId.equalsIgnoreCase('C')){
    pageRef= new PageReference('/apex/TimeSheetC');
    
}
pageRef.setredirect(false);
return pageRef;
}

public PageReference cancel(){
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

public PageReference adminView(){
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