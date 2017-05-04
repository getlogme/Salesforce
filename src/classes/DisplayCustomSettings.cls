public class DisplayCustomSettings{
public List<testNameSpacema__FundingCycleInfo__c> lstFundingInfo{get;set;}
public DisplayCustomSettings(){
    lstFundingInfo=testNameSpacema__FundingCycleInfo__c.getAll().values();
    
    }

}