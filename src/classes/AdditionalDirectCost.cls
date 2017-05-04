public class AdditionalDirectCost{
public List<SelectOption> coutries{get;set;}
public String selCoutry{get;set;}
public List<AdditionalInfo> ySummary{get;set;}
public String country{get;set;}


public AdditionalDirectCost()
{
    coutries=getCountriesList();
}
public List<SelectOption> getCountriesList()
{
    List<SelectOption> lstCountries=new List<SelectOption>();
    String iterationId= Apexpages.CurrentPage().getParameters().get('Id'); 
    List<testNameSpacema__VGE_PL_Country_Summary__c> lstSummary=[select id,testNameSpacema__VGE_Country__r.name from testNameSpacema__VGE_PL_Country_Summary__c where testNameSpacema__LookupVGEPLIterationAP__c =:iterationId OR testNameSpacema__LookupVGEPLIterationOpCo__c =:iterationId];
    /*System.debug(lstSummary);
    Set<Id> IdSet=new Set<Id>();
    for(testNameSpacema__VGE_PL_Country_Summary__c ts:lstSummary){
    IdSet.add(ts.testNameSpacema__VGE_Country__c);
    }
    List<testNameSpacema__PLCountry__c> lisCountry=[select name from testNameSpacema__PLCountry__c where id in :IdSet];*/
    
    for(testNameSpacema__VGE_PL_Country_Summary__c plc:lstSummary){
        lstCountries.add(new SelectOption(plc.id,plc.testNameSpacema__VGE_Country__r.name));
    }
    return lstCountries;
}

public PageReference connections()
{
    if(selCoutry!='Select Country'){
    
    //String conId=[select Id from testNameSpacema__PLCountry__c where name= :selCoutry].Id;
    List<testNameSpacema__VGE_PL_Country_Summary__c> listSummary=[select testNameSpacema__Bid_Years__c,testNameSpacema__VGE_Country__c,testNameSpacema__VGE_Country__r.name from testNameSpacema__VGE_PL_Country_Summary__c where id=:selCoutry];
    Integer bidYears=Integer.valueOf(listSummary.get(0).testNameSpacema__Bid_Years__c);
    country=listSummary.get(0).testNameSpacema__VGE_Country__r.name;
    
    List<testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c> ysummaryObj=[select id,name,testNameSpacema__Additional_Direct_Costs_Amount__c,testNameSpacema__Additional_Direct_Costs_Description__c,testNameSpacema__Year__c from testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c where testNameSpacema__Lookup_VGE_PL_Iteration_Country_Summary__r.testNameSpacema__VGE_Country__c=:selCoutry];
    System.debug('ysummaryObj === '+ysummaryObj);
    Map<Integer,testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c> mapYsummary=new Map<Integer,testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c>();
    
    for(testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c iys:ysummaryObj){
        mapYsummary.put(Integer.valueOf(iys.testNameSpacema__Year__c),iys);
    }
    ySummary=null;
    ySummary=new List<AdditionalInfo>();
    for(Integer i=0;i<bidYears;i++){
        AdditionalInfo con=new AdditionalInfo();
        con.year=i+1;
        if(mapYsummary!=null && mapYsummary.size()>0 && mapYsummary.get(i+1)!=null ){
            con.description=mapYsummary.get(i+1).testNameSpacema__Additional_Direct_Costs_Description__c;
            con.cost=mapYsummary.get(i+1).testNameSpacema__Additional_Direct_Costs_Amount__c;
            con.iysId=mapYsummary.get(i+1).Id;
        }
        ySummary.add(con); 
    }
    System.debug('ySummary === '+ySummary);
    }
    
    return null;
}

public PageReference save(){
    System.debug('ySummary in save method === '+ySummary);
    Set<Id> ids=new Set<Id>();
    Map<Id,AdditionalInfo> mapAddInfo=new Map<Id,AdditionalInfo>();
    for(AdditionalInfo ai:ySummary){
       ids.add(ai.iysId);
       mapAddInfo.put(ai.iysId,ai); 
    }
    List<testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c> ListYSummary=[select id,name,testNameSpacema__Additional_Direct_Costs_Amount__c,testNameSpacema__Additional_Direct_Costs_Description__c,testNameSpacema__Year__c from testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c where id=:ids];
    for(testNameSpacema__VGE_PL_Iteration_Yearly_Summary__c cObj:ListYSummary){
    cObj.testNameSpacema__Additional_Direct_Costs_Description__c=mapAddInfo.get(cObj.Id).description;
    cObj.testNameSpacema__Additional_Direct_Costs_Amount__c=mapAddInfo.get(cObj.Id).cost;
    }
    if(ListYSummary!=null){
        update ListYSummary;
    }
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.severity.CONFIRM, 'Saved Successfully');
    ApexPages.addMessage(myMsg);
    
    return null;
}
public PageReference cancel(){
return null;
}
class AdditionalInfo{
public Id iysId{get;set;}
public String description{get;set;}
public Double cost{get;set;}
public integer year{get;set;}
}
}