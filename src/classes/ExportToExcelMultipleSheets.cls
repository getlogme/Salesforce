public with sharing class ExportToExcelMultipleSheets {
public List<testNameSpacema__Master_Object__c> masterList{get;set;}
public List<testNameSpacema__Detail_Object__c> detailsList{get;set;}
public String xlsHeader {
 get {
 String strHeader = '';
 strHeader += '<?xml version="1.0"?>';
 strHeader += '<?mso-application progid="Excel.Sheet"?>';
 return strHeader;
 }
 }
public ExportToExcelMultipleSheets(Apexpages.StandardController ctrl){
    masterList= [select id, name from testNameSpacema__Master_Object__c where Id=:ctrl.getRecord().Id];
    detailsList= [Select id, name from testNameSpacema__Detail_Object__c where testNameSpacema__Master_Object__c=:ctrl.getRecord().Id];
}
 
public ExportToExcelMultipleSheets(){
 //String masterId=Apexpages.currentpage().getparameters().get('id');
 //System.debug('masterId : '+masterId);
 //masterList= [select id, name from testNameSpacema__Master_Object__c where Id=:masterId];
 //detailsList= [Select id, name from testNameSpacema__Detail_Object__c where testNameSpacema__Master_Object__c=:masterId];
 
}

 
}