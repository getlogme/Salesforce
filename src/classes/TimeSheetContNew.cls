public class TimeSheetContNew{
 private final testNameSpacema__Time_Sheet__c listObj;
 public testNameSpacema__Time_Sheet__c listObj1{get;set;}
 public String listId{get;set;}
 public String picklist{get;set;}
 public List <SelectOption> PickInfo{get;set;}
public TimeSheetContNew(){
List<SelectOption> optionList = new List<SelectOption>(); 
    optionList .add(new SelectOption('--None--','--None--'));
    optionList .add(new SelectOption('A','A'));
    optionList .add(new SelectOption('B','B'));
    optionList .add(new SelectOption('C','C'));
   PickInfo =optionList ;
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



}