public class TaskExtention{
public Datetime logDateTime{get;set;}
public String tempDate{get;set;}
public String comments{get;set;}
public List<SelectOption> nameOptions{get;set;}
public String conorLead{get;set;}
public String selAccId{get;set;}
public Task t;
public List<SelectOption> contacts{get;set;}
public List<Contact> relContacts{get;set;}
public String contactName{get;set;}
public String selCon{get;set;}
public TaskExtention(Apexpages.StandardController ctrl){
nameOptions=new List<SelectOption>();
    nameOptions.add(new SelectOption('Contact','Contact'));
    nameOptions.add(new SelectOption('Lead','Lead'));
    t=(Task)ctrl.getRecord();
    System.debug('selAccId == '+t.WhatId);
    selAccId=t.WhatId;
    contacts=new List<SelectOption>();
    List<Contact> lstconts=[select Id,name from Contact where AccountId=:selAccId];
    for(Contact con: lstconts){
       contacts.add(new SelectOption(con.Id,con.name)); 
    }
}

public PageReference testAction(){
System.debug('selAccId in testAction == '+t.WhatId);
contacts=new List<SelectOption>();
    List<Contact> lstconts=[select Id,name from Contact where AccountId=:t.WhatId];
    for(Contact con: lstconts){
       contacts.add(new SelectOption(con.Id,con.name)); 
    }
return null;
}

public boolean displayPopup {get; set;}     
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;   
        System.debug('show popup'); 
        relContacts=[select Id,name from Contact where AccountId=:t.WhatId];
    }

public PageReference continue1(){

//String url='/00T/e?title=Call&what_id='+t.whatId+'&followup=1&tsk5=Call&retURL=%2F00190000002rsbW&RecordType=012900000003H9w&ent=Task&who_id='+t.whoId;
String url='/00T/e?title=Call&what_id='+t.whatId+'&followup=1&tsk5=Call&ent=Task&who_id='+t.whoId;
return new PageReference(url);
}

public void selContact(){
 contactName=Apexpages.currentPage().getParameters().get('conName');
 t.whoId=Apexpages.currentPage().getParameters().get('conId');
 displayPopup = false;
}

}